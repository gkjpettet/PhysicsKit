#tag Class
Protected Class SliceTests
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
		  
		  Var e As Slice = New Slice(1.0, MathsKit.ToRadians(50))
		  Var t As PKTransform = New PKTransform
		  Var p As PKVector2 = New PKVector2(0.5, -0.3)
		  
		  // Shouldn't be inside.
		  Assert.IsTrue(Not e.Contains(p, t))
		  
		  // Move it a bit.
		  t.Translate(-0.25, 0.0)
		  
		  // Should be inside.
		  Assert.IsTrue(e.Contains(p, t))
		  
		  Call p.Set(0.75, 0.0)
		  // Should be on the edge.
		  Assert.IsTrue(e.Contains(p, t))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateAABBTest()
		  ///
		  ' Tests the generate PKAABB.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Slice = New Slice(1.0, MathsKit.ToRadians(50))
		  
		  // Using an identity transform.
		  Var aabb As PKAABB = e.CreateAABB(IDENTITY)
		  Assert.AreEqual( 0.000, aabb.getMinX, 1.0e-3)
		  Assert.AreEqual(-0.422, aabb.getMinY, 1.0e-3)
		  Assert.AreEqual( 1.000, aabb.getMaxX, 1.0e-3)
		  Assert.AreEqual( 0.422, aabb.getMaxY, 1.0e-3)
		  
		  // Try using the default method.
		  Var aabb2 As PKAABB = e.CreateAABB
		  Assert.AreEqual(aabb.getMinX, aabb2.getMinX)
		  Assert.AreEqual(aabb.getMinY, aabb2.getMinY)
		  Assert.AreEqual(aabb.getMaxX, aabb2.getMaxX)
		  Assert.AreEqual(aabb.getMaxY, aabb2.getMaxY)
		  
		  // Test using a rotation and translation matrix.
		  Var tx As PKTransform = New PKTransform
		  tx.Rotate(MathsKit.ToRadians(30.0))
		  tx.Translate(1.0, 2.0)
		  
		  aabb = e.CreateAABB(tx)
		  Assert.AreEqual( 1.000, aabb.getMinX, 1.0e-3)
		  Assert.AreEqual( 2.000, aabb.getMinY, 1.0e-3)
		  Assert.AreEqual( 1.996, aabb.getMaxX, 1.0e-3)
		  Assert.AreEqual( 2.819, aabb.getMaxY, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeRadiusTest()
		  ///
		  ' Tests a negative radius.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var s As Slice = New Slice(-1.0, MathsKit.ToRadians(50))
		    #Pragma Unused s
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as negative radius passed.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeThetaTest()
		  ///
		  ' Tetss a negative theta.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var s As Slice = New Slice(1.0, -MathsKit.ToRadians(50))
		    #Pragma Unused s
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as negative theta passed.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSuccessTest()
		  ///
		  ' Tests the constructor.
		  ///
		  
		  Using PhysicsKit
		  
		  Var slice As Slice = New Slice(1.0, MathsKit.ToRadians(50))
		  
		  // The circle centre should be the origin.
		  Assert.AreEqual(0.000, slice.GetCircleCenter.x, 1.0e-3)
		  Assert.AreEqual(0.000, slice.GetCircleCenter.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroRadiusTest()
		  ///
		  ' Tetss a zero radius.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var s As Slice = New Slice(0.0, MathsKit.ToRadians(50))
		    #Pragma Unused s
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as zero radius passed.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroThetaTest()
		  ///
		  ' Tetss a zero theta.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var s As Slice = New Slice(1.0, 0)
		    #Pragma Unused s
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as zero theta passed.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAxesTest()
		  ///
		  ' Tests the GetAxes method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Slice = New Slice(1.0, MathsKit.ToRadians(50))
		  
		  // Should be two axes + number of foci.
		  Var foci() As PKVector2 = Array(New PKVector2(2.0, -0.5), New PKVector2(1.0, 3.0))
		  Var axes() As PKVector2 = e.GetAxes(foci, IDENTITY)
		  Assert.AreEqual(4, axes.Count)
		  
		  // Make sure we get back the right axes.
		  axes = e.GetAxes(Nil, IDENTITY)
		  Assert.AreEqual(-0.422, axes(0).x, 1.0e-3)
		  Assert.AreEqual( 0.906, axes(0).y, 1.0e-3)
		  Assert.AreEqual(-0.422, axes(1).x, 1.0e-3)
		  Assert.AreEqual(-0.906, axes(1).y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFarthestTest()
		  ///
		  ' Tests the farthest methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Slice = New Slice(1.0, MathsKit.ToRadians(50))
		  Var t As PKTransform = New PKTransform
		  Var x As PKVector2 = New PKVector2(1.0, 0.0)
		  Var y As PKVector2 = New PKVector2(0.0, 1.0)
		  
		  // Try some translation.
		  t.Translate(1.0, 0.5)
		  
		  Var p As PKVector2 = e.GetFarthestPoint(x, t)
		  Assert.AreEqual( 2.000, p.x, 1.0e-3)
		  Assert.AreEqual( 0.500, p.y, 1.0e-3)
		  
		  // Try some rotation.
		  t.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  p = e.GetFarthestPoint(y, t)
		  Assert.AreEqual( 1.573, p.x, 1.0e-3)
		  Assert.AreEqual( 1.319, p.y, 1.0e-3)
		  
		  // Try some local rotation.
		  e.Translate(1.0, 0.5)
		  e.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  p = e.GetFarthestPoint(y, IDENTITY)
		  Assert.AreEqual( 1.573, p.x, 1.0e-3)
		  Assert.AreEqual( 1.319, p.y, 1.0e-3)
		  
		  t.Identity
		  t.Translate(0.0, 1.0)
		  p = e.GetFarthestPoint(y, t)
		  Assert.AreEqual( 1.573, p.x, 1.0e-3)
		  Assert.AreEqual( 2.319, p.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFociTest()
		  ///
		  ' Tests the GetFoci method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Slice = New Slice(1.0, MathsKit.ToRadians(50))
		  Var foci() As PKVector2 = e.GetFoci(IDENTITY)
		  
		  // Should be two foci.
		  Assert.AreEqual(1, foci.Count)
		  
		  // Make sure the foci are correct.
		  Assert.AreEqual( 0.000, foci(0).x, 1.0e-3)
		  Assert.AreEqual( 0.000, foci(0).y, 1.0e-3)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProjectTest()
		  ///
		  ' Tests the Project method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Slice = New Slice(1.0, MathsKit.ToRadians(50))
		  Var t As PKTransform = New PKTransform
		  Var x As PKVector2 = New PKVector2(1.0, 0.0)
		  Var y As PKVector2 = New PKVector2(0.0, 1.0)
		  
		  // Try some translation.
		  t.Translate(1.0, 0.5)
		  
		  Var i As Interval = e.Project(x, t)
		  Assert.AreEqual(1.000, i.Min, 1.0e-3)
		  Assert.AreEqual(2.000, i.Max, 1.0e-3)
		  
		  // Try some rotation.
		  t.Rotate(MathsKit.ToRadians(30), t.GetTransformed(e.GetCenter))
		  
		  i = e.Project(y, t)
		  Assert.AreEqual(0.177, i.Min, 1.0e-3)
		  Assert.AreEqual(0.996, i.Max, 1.0e-3)
		  
		  // Try some local rotation.
		  e.Translate(1.0, 0.5)
		  e.RotateAboutCenter(MathsKit.ToRadians(30))
		  
		  i = e.Project(y, IDENTITY)
		  Assert.AreEqual(0.177, i.Min, 1.0e-3)
		  Assert.AreEqual(0.996, i.Max, 1.0e-3)
		  
		  t.Identity
		  t.Translate(0.0, 1.0)
		  i = e.Project(y, t)
		  Assert.AreEqual(1.177, i.Min, 1.0e-3)
		  Assert.AreEqual(1.996, i.Max, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateTest()
		  ///
		  ' Tests the Rotate method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Slice = New Slice(1.0, MathsKit.ToRadians(50))
		  // Note: The centre is not at the origin.
		  
		  // Rotate about centre.
		  e.Translate(1.0, 1.0)
		  e.RotateAboutCenter(MathsKit.ToRadians(30))
		  Assert.AreEqual(1.645, e.center.x, 1.0e-3)
		  Assert.AreEqual(1.000, e.center.y, 1.0e-3)
		  
		  // Rotate about the origin.
		  e.Rotate(MathsKit.ToRadians(90))
		  Assert.AreEqual(-1.000, e.center.x, 1.0e-3)
		  Assert.AreEqual( 1.645, e.center.y, 1.0e-3)
		  e.Translate(e.GetCenter.GetNegative)
		  
		  // Should move the centre.
		  e.Rotate(MathsKit.ToRadians(90), 1.0, -1.0)
		  Assert.AreEqual( 0.000, e.center.x, 1.0e-3)
		  Assert.AreEqual(-2.000, e.center.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SliceRadiusTest()
		  ///
		  ' Verifies the output of the GetRadius and GetSliceRadius methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Slice = New Slice(1.0, MathsKit.ToRadians(50))
		  Assert.AreEqual(1.000, e.GetSliceRadius, 1.0e-3)
		  Assert.IsFalse(Abs(1.0 - e.GetRadius) < Epsilon.E)
		  Assert.IsFalse(Abs(e.GetSliceRadius - e.GetRadius) < Epsilon.E)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateTest()
		  ///
		  ' Tests the Translate methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var e As Slice = New Slice(1.0, MathsKit.ToRadians(50))
		  
		  e.Translate(1.0, -0.5)
		  
		  Assert.AreEqual(1.645, e.center.x, 1.0e-3)
		  Assert.AreEqual(-0.500, e.center.y, 1.0e-3)
		  
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
