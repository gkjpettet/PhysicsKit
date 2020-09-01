#tag Class
Protected Class CircleTests
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


	#tag Method, Flags = &h0
		Sub ContainsMethodTest()
		  ///
		  ' Tests the contains method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var c As Circle = New Circle(2.0)
		  Var t As Transform = New Transform
		  Var p As PKVector2 = New PKVector2(2.0, 4.0)
		  
		  // Shouldn't be in the circle.
		  Assert.IsTrue(Not c.Contains(p, t))
		  
		  // Move the circle a bit.
		  t.Translate(2.0, 2.5)
		  
		  // Should be in the circle.
		  Assert.IsTrue(c.Contains(p, t))
		  
		  t.Translate(0.0, -0.5)
		  
		  // Should be on the edge.
		  Assert.IsTrue(c.Contains(p, t))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateAABBTest()
		  ///
		  ' Tests the generated PKAABB.
		  ///
		  
		  Using PhysicsKit
		  
		  Var IDENTITY As Transform = New Transform
		  
		  Var c As Circle = New Circle(1.2)
		  
		  // Using an identity transform.
		  Var aabb As PKAABB = c.CreateAABB(IDENTITY)
		  Assert.AreEqual(-1.2, aabb.GetMinX, 1.0e-3)
		  Assert.AreEqual(-1.2, aabb.GetMinY, 1.0e-3)
		  Assert.AreEqual( 1.2, aabb.GetMaxX, 1.0e-3)
		  Assert.AreEqual( 1.2, aabb.GetMaxY, 1.0e-3)
		  
		  // Try using the default method.
		  Var aabb2 As PKAABB = c.CreateAABB
		  Assert.AreEqual(aabb.GetMinX, aabb2.GetMinX)
		  Assert.AreEqual(aabb.GetMinY, aabb2.GetMinY)
		  Assert.AreEqual(aabb.GetMaxX, aabb2.GetMaxX)
		  Assert.AreEqual(aabb.GetMaxY, aabb2.GetMaxY)
		  
		  // Test using a rotation and translation matrix.
		  Var tx As Transform = New Transform
		  tx.Rotate(MathsKit.ToRadians(30.0))
		  tx.Translate(1.0, 2.0)
		  
		  aabb = c.CreateAABB(tx)
		  Assert.AreEqual(-0.2, aabb.GetMinX, 1.0e-3)
		  Assert.AreEqual( 0.8, aabb.GetMinY, 1.0e-3)
		  Assert.AreEqual( 2.2, aabb.GetMaxX, 1.0e-3)
		  Assert.AreEqual( 3.2, aabb.GetMaxY, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeRadiusTest()
		  ///
		  ' Tests a negative radius.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Using PhysicsKit
		  
		  Try
		    Var c As Circle = New Circle(-1.0)
		    #Pragma Unused c
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException with a negative radius.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSuccessTest()
		  ///
		  ' Tests the constructor.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Using PhysicsKit
		  
		  Try
		    Var c As Circle = New Circle(1.0)
		    Assert.IsNotNil(c.GetID)
		    Assert.AreEqual(0.0, c.Center.X)
		    Assert.AreEqual(0.0, c.Center.Y)
		    Assert.AreEqual(1.0, c.Radius)
		  Catch e As RuntimeException
		    Assert.Fail("Failed to construct a Circle.")
		    Return
		  End Try
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroRadiusTest()
		  ///
		  ' Tests a zero radius.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Using PhysicsKit
		  
		  Try
		    Var c As Circle = New Circle(0.0)
		    #Pragma Unused c
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException for a zero radius.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAxesTest()
		  ///
		  ' Tests the GetAxes method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var c As Circle = New Circle(1.5)
		  Var t As Transform = New Transform
		  
		  // A cicle has infinite axes so it should be Nil.
		  Var axes() As PKVector2 = c.GetAxes(Nil, t)
		  Assert.IsTrue(axes Is Nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFarthestTest()
		  ///
		  ' Tests the farthest methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var c As Circle = New Circle(1.5)
		  Var t As Transform = New Transform
		  Var y As PKVector2 = New PKVector2(0.0, -1.0)
		  
		  Var f As PointFeature = c.GetFarthestFeature(y, t)
		  Assert.AreEqual( 0.000, f.GetPoint.X, 1.0e-3)
		  Assert.AreEqual(-1.500, f.GetPoint.Y, 1.0e-3)
		  
		  Var p As PKVector2 = c.GetFarthestPoint(y, t)
		  Assert.AreEqual( 0.000, p.x, 1.0e-3)
		  Assert.AreEqual(-1.500, p.y, 1.0e-3)
		  
		  // Move the circle a bit.
		  t.Translate(0.0, -0.5)
		  
		  f = c.GetFarthestFeature(y.GetNegative, t)
		  Assert.AreEqual(0.000, f.GetPoint.X, 1.0e-3)
		  Assert.AreEqual(1.000, f.GetPoint.Y, 1.0e-3)
		  
		  p = c.GetFarthestPoint(y.GetNegative, t)
		  Assert.AreEqual(0.000, p.x, 1.0e-3)
		  Assert.AreEqual(1.000, p.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFociTest()
		  ///
		  ' Tests the GetFoci method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var c As Circle = New Circle(1.5)
		  Var t As Transform = New Transform
		  
		  // Should only return one.
		  Var foci() As PKVector2 = c.GetFoci(t)
		  Assert.IsTrue(foci.Count = 1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProjectTest()
		  ///
		  ' Tests the Project method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var c As Circle = New Circle(1.5)
		  Var t As Transform = New Transform
		  Var x As PKVector2 = New PKVector2(1.0, 0.0)
		  Var y As PKVector2 = New PKVector2(0.0, 1.0)
		  
		  t.Translate(1.0, 0.5)
		  
		  Var i As Interval = c.Project(x, t)
		  
		  Assert.AreEqual(-0.500, i.min, 1.0e-3)
		  Assert.AreEqual( 2.500, i.max, 1.0e-3)
		  
		  // Rotating about the centre shouldn't effect anything.
		  t.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  i = c.Project(y, t)
		  
		  Assert.AreEqual(-1.000, i.min, 1.0e-3)
		  Assert.AreEqual( 2.000, i.max, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateTest()
		  ///
		  ' Tests the rotate methods.
		  ///
		  
		  Using PhysicsKit
		  
		  // Centre is at 0,0.
		  Var c As Circle = New Circle(1.0)
		  
		  // Rotate about centre.
		  c.Translate(1.0, 1.0)
		  c.RotateAboutCenter(MathsKit.ToRadians(30))
		  Assert.AreEqual(1.000, c.Center.X, 1.0e-3)
		  Assert.AreEqual(1.000, c.Center.Y, 1.0e-3)
		  
		  // Rotate about the origin.
		  c.Rotate(MathsKit.ToRadians(90))
		  Assert.AreEqual(-1.000, c.Center.X, 1.0e-3)
		  Assert.AreEqual( 1.000, c.Center.Y, 1.0e-3)
		  c.Translate(c.GetCenter.getNegative)
		  
		  // Should move the centre.
		  c.Rotate(MathsKit.ToRadians(90), 1.0, -1.0)
		  Assert.AreEqual( 0.000, c.Center.X, 1.0e-3)
		  Assert.AreEqual(-2.000, c.Center.Y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateTest()
		  ///
		  ' Tests the Translate methods.
		  ///
		  
		  Using PhysicsKit
		  
		  // Centre is at 0,0.
		  Var c As Circle = New Circle(1.0)
		  
		  c.Translate(1.0, -0.5)
		  
		  Assert.AreEqual( 1.000, c.Center.X, 1.0e-3)
		  Assert.AreEqual(-0.500, c.Center.Y, 1.0e-3)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Prop1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Prop2 As Integer
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
