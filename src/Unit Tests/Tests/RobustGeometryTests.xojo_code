#tag Class
Protected Class RobustGeometryTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  Prop2 = Prop2 + 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TearDown()
		  Prop2 = Prop2 - 1
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(err As RuntimeException, methodName As Text) As Boolean
		  #pragma unused err
		  
		  Const kMethodName As Text = "UnhandledException"
		  
		  If methodName.Length >= kMethodName.Length And methodName.Left(kMethodName.Length) = kMethodName Then
		    Assert.Pass("Exception was handled")
		    Return True
		  End If
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21, Description = 48656C706572206D6574686F6420746F20636F6D7075746520746865206571756976616C656E74206F6620605365676D656E742E4765744C6F636174696F6E28566563746F72322C20566563746F72322C20566563746F723229602062757420776974682065786163742061726974686D657469632C207669612074686520757365206F6620426967446563696D616C2E
		Private Function GetLocationExact(point As PKVector2, linePoint1 As PKVector2, linePoint2 As PKVector2) As Double
		  ///
		  ' Helper method to compute the equivalent of `Segment.GetLocation(PKVector2, PKVector2, PKVector2)`
		  ' but with exact arithmetic, via the use of BigDecimal.
		  ' The result is returned as a Double which is an approximation of the computed value
		  ' but this is the best we can request given the requirements.
		  '
		  ' - Parameter point: The point.
		  ' - Parameter linePoint1: The first point of the line.
		  ' - Parameter linePoint2: The second point of the line.
		  '
		  ' - Returns: The approximation as a Double representation of the result.
		  ///
		  
		  #Pragma Warning "Should use BigDecimal"
		  
		  Using PhysicsKit
		  
		  Return Segment.GetLocation(point, linePoint1, linePoint2)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RandomisedTest2Test()
		  ///
		  ' Another randomised test but with uniform random points.
		  ' This will mostly trigger the short path in RobustGeometry.GetLocation(PKVector2, PKVector2, PKVector2)
		  ///
		  
		  // Constant seed so we always get the same sequence of randoms
		  System.Random.Seed = SEED
		  
		  For i As Integer = 0 to 999
		    // Generate three uniform random points pa, pb, pc
		    Var pa As PKVector2 = New PKVector2(System.Random.Number, System.Random.Number)
		    Var pb As PKVector2 = New PKVector2(System.Random.Number, System.Random.Number)
		    Var pc As PKVector2 = New PKVector2(System.Random.Number, System.Random.Number)
		    
		    Var exact As Double = GetLocationExact(pc, pa, pb)
		    Var robust As Double = RobustGeometry.GetLocation(pc, pa, pb)
		    
		    Assert.AreEqual(MathsKit.Signum(exact), MathsKit.Signum(robust))
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RandomisedTestTest()
		  ///
		  ' Randomised test to check almost colinear vectors.
		  ' Chose three random, almost colinear, points and then exhaustively check for all
		  ' floating point values near the tested point. This will trigger the most
		  ' complex paths in `RobustGeometry.GetLocation(PKVector2, PKVector2, PKVector2)`.
		  ///
		  
		  #Pragma Warning "Broken and failing"
		  
		  Using PhysicsKit
		  
		  // Constant seed so we always get the same sequence of randoms
		  System.Random.Seed = SEED
		  
		  Var iterations As Integer = 100
		  Var blockSize As Int32 = 10
		  
		  For i As Integer = 0 To iterations - 1
		    // Generate three colinear points pa, pb, pc
		    Var pa As PKVector2 = New PKVector2(System.Random.Number, System.Random.Number)
		    Var pb As PKVector2 = pa.Product(System.Random.Number)
		    Var pc As PKVector2 = pa.Product(System.Random.Number)
		    
		    // Loop to all directions.
		    For up As Integer = 0 To 4
		      Var xUp As Boolean = ((up Mod 2) = 0)
		      Var yUp As Boolean = ((up / 2) = 0)
		      
		      Var pcOffset As PKVector2 = pc.Copy
		      
		      // Test all adjacent floating point values in this quadrant.
		      For y As Integer = 0 To blockSize - 1
		        For x As Integer = 0 To blockSize - 1
		          Var exact As Double = GetLocationExact(pcOffset, pa, pb)
		          Var robust As Double = RobustGeometry.GetLocation(pcOffset, pa, pb)
		          
		          Assert.AreEqual(MathsKit.Signum(exact), MathsKit.Signum(robust))
		          
		          pcOffset.X = If(xUp, MathsKit.NextUp(pcOffset.X), MathsKit.NextDown(pcOffset.X))
		        Next x
		        
		        pcOffset.Y = If(yUp, MathsKit.NextUp(pcOffset.Y), MathsKit.NextDown(pcOffset.Y))
		      Next y
		    Next up
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 48656C706572206D6574686F6420746F20746573742074686520636F6E7665782068756C6C2067656E657261746F72732E
		Shared Function RobustPolygonContains(vertices() As PKVector2, point As PKVector2) As Boolean
		  ///
		  ' Helper method to test the convex hull generators.
		  '
		  ' Tests if `point` is contained in the convex polygon defined by `vertices`.
		  ' This points must be from a Polygon instance, validated through it's constructor.
		  ' Uses robust geometric predicates.
		  ' 
		  ' - Parameter vertices: A list of vertices in CW/CCW order that describe a convex polygon.
		  ' - Parameter point: The point to test.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  // Copied from Polygon.Contains but uses RobustGeometry.GetLocation instead.
		  
		  // Start from the pair (p1 = last, p2 = first) so there's no need to check 
		  // in the loop for wrap-around of the i + 1 vertice
		  Var size As Integer = vertices.Count
		  Var p1 As PKVector2 = vertices(size - 1)
		  Var p2 As PKVector2 = vertices(0)
		  
		  // Get the location of the point relative to the first two vertices.
		  Var last As Double = RobustGeometry.GetLocation(point, p1, p2)
		  
		  // Loop through the rest of the vertices.
		  Var iLimit As Integer = size - 2
		  For i As Integer = 0 To iLimit
		    // p1 is now p2
		    p1 = p2
		    // p2 is the next point.
		    p2 = vertices(i + 1)
		    // Check if they are equal (one of the vertices).
		    If point.Equals(p1) Or point.Equals(p2) Then Return True
		    
		    // Do side of line test.
		    Var location As Double = RobustGeometry.GetLocation(point, p1, p2)
		    
		    // Multiply the last location with this location if they are the same sign then 
		    // the opertation will yield a positive result:
		    // -x * -y = +xy, x * y = +xy, -x * y = -xy, x * -y = -xy
		    If last * location < 0 Then
		      // Reminder: (-0.0 < 0.0) evaluates to False and not True.
		      Return False
		    End If
		    
		    // Update the last location, but only if it's not zero.
		    // A location of zero indicates that the point lies ON the line
		    // through p1 and p2. We can ignore these values because the
		    // convexity requirement of the shape will ensure that if it's outside, a sign will change.
		    If Abs(location) > Epsilon.E Then last = location
		  Next i
		  
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Prop1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Prop2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SEED As Integer = 0
	#tag EndProperty


	#tag Using, Name = PhysicsKit
	#tag EndUsing


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotImplementedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StopTestOnFail"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
