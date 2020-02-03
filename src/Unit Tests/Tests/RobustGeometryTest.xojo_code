#tag Class
Protected Class RobustGeometryTest
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
		Private Function GetLocationExact(point As PhysicsKit.Vector2, linePoint1 As PhysicsKit.Vector2, linePoint2 As PhysicsKit.Vector2) As Double
		  ///
		  ' Helper method to compute the equivalent of `Segment.GetLocation(Vector2, Vector2, Vector2)`
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
		Sub RandomisedTestTest()
		  ///
		  ' Randomised test to check almost colinear vectors.
		  ' Chose three random, almost colinear, points and then exhaustively check for all
		  ' floating point values near the tested point. This will trigger the most
		  ' complex paths in `RobustGeometry.GetLocation(Vector2, Vector2, Vector2)`.
		  ///
		  
		  Using PhysicsKit
		  
		  // Constant seed so we always get the same sequence of randoms
		  System.Random.Seed = SEED
		  
		  Var iterations As Integer = 100
		  Var blockSize As Int32 = 10
		  
		  For i As Integer = 0 To iterations - 1
		    // Generate three colinear points pa, pb, pc
		    Var pa As Vector2 = New Vector2(System.Random.Number, System.Random.Number)
		    Var pb As Vector2 = pa.Product(System.Random.Number)
		    Var pc As Vector2 = pa.Product(System.Random.Number)
		    
		    // Loop to all directions.
		    For up As Integer = 0 To 4
		      Var xUp As Boolean = ((up Mod 2) = 0)
		      Var yUp As Boolean = ((up / 2) = 0)
		      
		      Var pcOffset As Vector2 = pc.Copy
		      
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


	#tag Property, Flags = &h21
		Private Prop1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Prop2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SEED As Integer = 0
	#tag EndProperty


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
