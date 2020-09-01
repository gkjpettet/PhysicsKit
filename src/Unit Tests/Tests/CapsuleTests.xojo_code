#tag Class
Protected Class CapsuleTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  Prop2 = Prop2 + 1
		  IDENTITY = New PKTransform
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
		Sub ContainsTest()
		  ///
		  ' Tests the Contains method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Capsule = New Capsule(2.0, 1.0)
		  Var t As PKTransform = New PKTransform
		  Var p As PKVector2 = New PKVector2(0.8, -0.45)
		  
		  // Shouldn't be inside.
		  Assert.IsTrue(Not e.Contains(p, t))
		  
		  // Move it a bit.
		  t.Translate(0.5, 0.0)
		  
		  // Should be inside.
		  Assert.IsTrue(e.Contains(p, t))
		  
		  Call p.Set(1.5, 0.0)
		  // Should be on the edge.
		  Assert.IsTrue(e.Contains(p, t))
		  
		  Call p.Set(0.75, 0.5)
		  // Should be on the edge.
		  Assert.IsTrue(e.Contains(p, t))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateAABBTest()
		  ///
		  ' Tests the generated PKAABB.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Capsule = New Capsule(1.0, 0.5)
		  
		  // Using an identity transform.
		  Var aabb As PKAABB = e.CreateAABB(IDENTITY)
		  Assert.AreEqual(-0.500, aabb.GetMinX, 1.0e-3)
		  Assert.AreEqual(-0.250, aabb.GetMinY, 1.0e-3)
		  Assert.AreEqual( 0.500, aabb.GetMaxX, 1.0e-3)
		  Assert.AreEqual( 0.250, aabb.GetMaxY, 1.0e-3)
		  
		  // Try using the default method.
		  Var aabb2 As PKAABB = e.CreateAABB
		  Assert.AreEqual(aabb.GetMinX, aabb2.GetMinX)
		  Assert.AreEqual(aabb.GetMinY, aabb2.GetMinY)
		  Assert.AreEqual(aabb.GetMaxX, aabb2.GetMaxX)
		  Assert.AreEqual(aabb.GetMaxY, aabb2.GetMaxY)
		  
		  // Test using a rotation and translation matrix.
		  Var tx As PKTransform = New PKTransform
		  tx.Rotate(MathsKit.ToRadians(30.0))
		  tx.Translate(1.0, 2.0)
		  
		  aabb = e.CreateAABB(tx)
		  Assert.AreEqual(0.533, aabb.GetMinX, 1.0e-3)
		  Assert.AreEqual(1.625, aabb.GetMinY, 1.0e-3)
		  Assert.AreEqual(1.466, aabb.GetMaxX, 1.0e-3)
		  Assert.AreEqual(2.375, aabb.GetMaxY, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeHeightTest()
		  ///
		  ' Tests a negative height.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var c As Capsule = New Capsule(1.0, -1.0)
		    #Pragma Unused c
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as negative height.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeWidthTest()
		  ///
		  ' Tests a negative width.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var c As Capsule = New Capsule(-1.0, 1.0)
		    #Pragma Unused c
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as negative width.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSuccessHorizontalTest()
		  ///
		  ' Tests the constructor.
		  //
		  
		  Using PhysicsKit
		  
		  Var cap As Capsule = New Capsule(2.0, 1.0)
		  Var x As PKVector2 = cap.LocalXAxis
		  Assert.AreEqual(1.000, x.x, 1.0e-3)
		  Assert.AreEqual(0.000, x.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSuccessVerticalTest()
		  ///
		  ' Tests the constructor.
		  ///
		  
		  Using PhysicsKit
		  
		  Var cap As Capsule = New Capsule(1.0, 2.0)
		  Var x As PKVector2 = cap.LocalXAxis
		  Assert.AreEqual(0.000, x.x, 1.0e-3)
		  Assert.AreEqual(1.000, x.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroHeightTest()
		  ///
		  ' Tests a zero height.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var c As Capsule = New Capsule(1.0, 0.0)
		    #Pragma Unused c
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as zero height.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroWidthTest()
		  ///
		  ' Tests a zero width.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var c As Capsule = New Capsule(0.0, 1.0)
		    #Pragma Unused c
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as zero width.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAxesTest()
		  ///
		  ' tests the GetAxes method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Capsule = New Capsule(1.0, 0.5)
		  
		  // Should be two axes + number of foci.
		  Var foci() As PKVector2 = Array(New PKVector2(2.0, -0.5), New PKVector2(1.0, 3.0))
		  Var axes() as PKVector2 = e.GetAxes(foci, IDENTITY)
		  Assert.AreEqual(4, axes.Count)
		  
		  // Make sure we get back the right axes.
		  axes = e.GetAxes(Nil, IDENTITY)
		  Assert.AreEqual(1.000, axes(0).x, 1.0e-3)
		  Assert.AreEqual(0.000, axes(0).y, 1.0e-3)
		  Assert.AreEqual(0.000, axes(1).x, 1.0e-3)
		  Assert.AreEqual(1.000, axes(1).y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFarthestTest()
		  ///
		  ' Tests the Farthest methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Capsule = New Capsule(2.0, 1.0)
		  Var t As PKTransform = New PKTransform
		  Var x As PKVector2 = New PKVector2(1.0, 0.0)
		  Var y As PKVector2 = New PKVector2(0.0, -1.0)
		  
		  // Try some translation.
		  t.Translate(1.0, 0.5)
		  
		  Var p As PKVector2 = e.GetFarthestPoint(x, t)
		  Assert.AreEqual( 2.000, p.x, 1.0e-3)
		  Assert.AreEqual( 0.500, p.y, 1.0e-3)
		  
		  // Try some rotation.
		  t.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  p = e.GetFarthestPoint(y, t)
		  Assert.AreEqual( 0.566, p.x, 1.0e-3)
		  Assert.AreEqual(-0.25, p.y, 1.0e-3)
		  
		  // Try some local rotation.
		  e.Translate(1.0, 0.5)
		  e.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  p = e.GetFarthestPoint(y, IDENTITY)
		  Assert.AreEqual( 0.566, p.x, 1.0e-3)
		  Assert.AreEqual(-0.25, p.y, 1.0e-3)
		  
		  t.Identity
		  t.Translate(0.0, 1.0)
		  p = e.GetFarthestPoint(y, t)
		  Assert.AreEqual( 0.566, p.x, 1.0e-3)
		  Assert.AreEqual( 0.75, p.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFociTest()
		  ///
		  ' Tests the GetFoci method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Capsule = New Capsule(1.0, 0.5)
		  Var foci() As PKVector2 = e.GetFoci(IDENTITY)
		  
		  // Should be two foci.
		  Assert.AreEqual(2, foci.Count)
		  
		  // Make sure the foci are correct.
		  Assert.AreEqual(-0.250, foci(0).x, 1.0e-3)
		  Assert.AreEqual( 0.000, foci(0).y, 1.0e-3)
		  Assert.AreEqual( 0.250, foci(1).x, 1.0e-3)
		  Assert.AreEqual( 0.000, foci(1).y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProjectTest()
		  ///
		  ' Tests the Project method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Capsule = New Capsule(2.0, 1.0)
		  Var t As PKTransform = New PKTransform
		  Var x As PKVector2 = New PKVector2(1.0, 0.0)
		  Var y As PKVector2 = New PKVector2(0.0, -1.0)
		  
		  // Try some translation.
		  t.Translate(1.0, 0.5)
		  
		  Var i As Interval = e.Project(x, t)
		  Assert.AreEqual( 0.000, i.min, 1.0e-3)
		  Assert.AreEqual( 2.000, i.max, 1.0e-3)
		  
		  // Try some rotation.
		  t.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  i = e.Project(y, t)
		  Assert.AreEqual(-1.25, i.min, 1.0e-3)
		  Assert.AreEqual( 0.25, i.max, 1.0e-3)
		  
		  // Try some local rotation.
		  e.Translate(1.0, 0.5)
		  e.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  i = e.Project(y, IDENTITY)
		  Assert.AreEqual(-1.25, i.min, 1.0e-3)
		  Assert.AreEqual( 0.25, i.max, 1.0e-3)
		  
		  t.Identity
		  t.Translate(0.0, 1.0)
		  i = e.Project(y, t)
		  Assert.AreEqual(-2.25, i.min, 1.0e-3)
		  Assert.AreEqual(-0.75, i.max, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateTest()
		  ///
		  ' Tests the Rotate methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Capsule = New Capsule(1.0, 0.5)
		  
		  // Rotate about the centre.
		  e.Translate(1.0, 1.0)
		  e.rotateAboutCenter(MathsKit.ToRadians(30))
		  Assert.AreEqual(1.000, e.Center.x, 1.0e-3)
		  Assert.AreEqual(1.000, e.Center.y, 1.0e-3)
		  
		  // Rotate about the origin.
		  e.Rotate(MathsKit.ToRadians(90))
		  Assert.AreEqual(-1.000, e.Center.x, 1.0e-3)
		  Assert.AreEqual( 1.000, e.Center.y, 1.0e-3)
		  e.translate(e.GetCenter.GetNegative)
		  
		  // Should move the centre.
		  e.Rotate(MathsKit.ToRadians(90), 1.0, -1.0)
		  Assert.AreEqual( 0.000, e.Center.x, 1.0e-3)
		  Assert.AreEqual(-2.000, e.Center.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateTest()
		  ///
		  ' Tests the Translate methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Capsule = New Capsule(1.0, 0.5)
		  
		  e.Translate(1.0, -0.5)
		  
		  Assert.AreEqual( 1.000, e.Center.x, 1.0e-3)
		  Assert.AreEqual(-0.500, e.Center.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private IDENTITY As PKTransform
	#tag EndProperty

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
