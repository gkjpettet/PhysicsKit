#tag Class
Protected Class Vector2Tests
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
		Sub AddTest()
		  ///
		  ' Tests the `Add` methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As PKVector2 = New PKVector2(1.0, 2.0)
		  Var v2 As PKVector2 = New PKVector2(-2.0, 1.0)
		  
		  Var v3 As PKVector2 = v1.Sum(v2)
		  Assert.AreEqual(-1.0, v3.x)
		  Assert.AreEqual( 3.0, v3.y)
		  
		  v3 = v1.Sum(3.0, -7.5)
		  Assert.AreEqual( 4.0, v3.x)
		  Assert.AreEqual(-5.5, v3.y)
		  
		  Call v1.Add(v2)
		  Assert.AreEqual(-1.0, v1.x)
		  Assert.AreEqual( 3.0, v1.y)
		  
		  Call v1.Add(-2.0, 1.0)
		  Assert.AreEqual(-3.0, v1.x)
		  Assert.AreEqual( 4.0, v1.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyTest()
		  ///
		  ' Tests the `Copy` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As PKVector2 = New PKVector2(1.0, 3.0)
		  Var vc As PKVector2 = v.Copy
		  
		  Assert.IsFalse(v = vc)
		  Assert.AreEqual(v.x, vc.x)
		  Assert.AreEqual(v.y, vc.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTest()
		  ///
		  ' Tests the `Create` methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As PKVector2 = New PKVector2
		  Assert.AreEqual(0.0, v1.x)
		  Assert.AreEqual(0.0, v1.y)
		  
		  Var v2 As PKVector2 = New PKVector2(1.0, 2.0)
		  Assert.AreEqual(1.0, v2.x)
		  Assert.AreEqual(2.0, v2.y)
		  
		  Var v3 As PKVector2 = New PKVector2(v2)
		  Assert.IsFalse(v3 = v2)
		  Assert.AreEqual(1.0, v3.x)
		  Assert.AreEqual(2.0, v3.y)
		  
		  Var v4 As PKVector2 = New PKVector2(0.0, 1.0, 2.0, 3.0)
		  Assert.AreEqual(2.0, v4.x)
		  Assert.AreEqual(2.0, v4.y)
		  
		  Var v5 As PKVector2 = New PKVector2(v2, v1)
		  Assert.AreEqual(-1.0, v5.x)
		  Assert.AreEqual(-2.0, v5.y)
		  
		  Var v6 As PKVector2 = PKVector2.Create(1.0, MathsKit.ToRadians(90))
		  Assert.AreEqual( 0.000, v6.x, 1.0e-3)
		  Assert.AreEqual( 1.000, v6.y, 1.0e-3)
		  
		  Var v7 As PKVector2 = New PKVector2(MathsKit.ToRadians(30.0))
		  Assert.AreEqual(1.000, v7.GetMagnitude, 1.0e-4)
		  Assert.AreEqual(30.000, MathsKit.ToDegrees(v7.GetDirection), 1.0e-4)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CrossTest()
		  ///
		  ' Test the `Cross` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As PKVector2 = New PKVector2(1.0, 1.0)
		  Var v2 As PKVector2 = New PKVector2(0.0, 1.0)
		  
		  Assert.AreEqual(0.0, v1.Cross(v1))
		  Assert.AreEqual(1.0, v1.Cross(v2))
		  Assert.AreEqual(-2.0, v1.Cross(v1.GetLeftHandOrthogonalVector))
		  
		  Assert.AreEqual(0.0, v1.Cross(1.0, 1.0))
		  Assert.AreEqual(1.0, v1.Cross(0.0, 1.0))
		  Assert.AreEqual(2.0, v1.Cross(-1.0, 1.0))
		  
		  Var r As PKVector2 = v1.Cross(3.0)
		  
		  Assert.AreEqual(-3.0, r.x)
		  Assert.AreEqual( 3.0, r.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DistanceTest()
		  ///
		  ' Tests the `Distance` methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As PKVector2 = New PKVector2
		  
		  Assert.AreEqual(4.000, v.DistanceSquared(2.0, 0.0), 1.0e-3)
		  Assert.AreEqual(5.000, v.DistanceSquared(2.0, -1.0), 1.0e-3)
		  Assert.AreEqual(2.000, v.Distance(2.0, 0.0), 1.0e-3)
		  Assert.AreEqual(5.000, v.Distance(3.0, 4.0), 1.0e-3)
		  
		  Assert.AreEqual(4.000, v.DistanceSquared(New PKVector2(2.0, 0.0)), 1.0e-3)
		  Assert.AreEqual(5.000, v.DistanceSquared(New PKVector2(2.0, -1.0)), 1.0e-3)
		  Assert.AreEqual(2.000, v.Distance(New PKVector2(2.0, 0.0)), 1.0e-3)
		  Assert.AreEqual(5.000, v.Distance(New PKVector2(3.0, 4.0)), 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DivideTest()
		  ///
		  ' Tests the `Divide` and `Quotient` methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As PKVector2 = New PKVector2(2.0, 1.0)
		  
		  Var r As PKVector2 = v1.Quotient(-2.0)
		  Assert.AreEqual(-1.0, r.x)
		  Assert.AreEqual(-0.5, r.y)
		  
		  Call v1.Divide(-2.0)
		  Assert.AreEqual(-1.0, r.x)
		  Assert.AreEqual(-0.5, r.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DotTest()
		  ///
		  ' Tests the `Dot` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As PKVector2 = New PKVector2(1.0, 1.0)
		  Var v2 As PKVector2 = New PKVector2(0.0, 1.0)
		  
		  Assert.AreEqual(1.0, v1.Dot(v2))
		  // Test a perpendicular vector.
		  Assert.AreEqual(0.0, v1.Dot(v1.GetLeftHandOrthogonalVector))
		  Assert.AreEqual(v1.GetMagnitudeSquared, v1.Dot(v1))
		  
		  Assert.AreEqual(1.0, v1.Dot(0.0, 1.0))
		  // Test a perpendicular vector.
		  Assert.AreEqual(0.0, v1.Dot(-1.0, 1.0))
		  Assert.AreEqual(2.0, v1.Dot(1.0, 1.0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EqualsTest()
		  ///
		  ' Tests the `Equals` methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As PKVector2 = New PKVector2(1.0, 2.0)
		  
		  Assert.IsTrue(v.Equals(v))
		  Assert.IsTrue(v.Equals(v.Copy))
		  Assert.IsTrue(v.Equals(New PKVector2(1.0, 2.0)))
		  Assert.IsTrue(v.Equals(1.0, 2.0))
		  
		  Assert.IsFalse(v.Equals(v.Copy.Set(2.0, 1.0)))
		  Assert.IsFalse(v.Equals(2.0, 2.0))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAngleBetweenTest()
		  ///
		  ' Tests the `GetAngleBetween` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As PKVector2 = New PKVector2(-1.0, 2.0)
		  Var v2 As PKVector2 = New PKVector2(-2.0, -1.0)
		  
		  // This should return in the range of -π,π.
		  Assert.IsTrue(MathsKit.PI >= Abs(v1.GetAngleBetween(v2)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetTest()
		  ///
		  ' tests the `Get` methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As PKVector2 = New PKVector2(3.0, 4.0)
		  
		  Var x As PKVector2 = v.GetXComponent
		  Var y As PKVector2 = v.GetYComponent
		  
		  Assert.AreEqual(3.0, x.x)
		  Assert.AreEqual(0.0, x.y)
		  Assert.AreEqual(0.0, y.x)
		  Assert.AreEqual(4.0, y.y)
		  
		  Assert.AreEqual(5.000, v.GetMagnitude, 1.0e-3)
		  Assert.AreEqual(25.000, v.GetMagnitudeSquared, 1.0e-3)
		  Assert.AreEqual(53.130, MathsKit.ToDegrees(v.GetDirection), 1.0e-3)
		  
		  Var v2 As PKVector2 = New PKVector2(-4.0, 3.0)
		  Assert.AreEqual(90.000, MathsKit.ToDegrees(v.GetAngleBetween(v2)), 1.0e-3)
		  
		  v2 = v.GetLeftHandOrthogonalVector
		  Assert.AreEqual( 4.0, v2.x)
		  Assert.AreEqual(-3.0, v2.y)
		  
		  v2 = v.GetRightHandOrthogonalVector
		  Assert.AreEqual(-4.0, v2.x)
		  Assert.AreEqual( 3.0, v2.y)
		  
		  v2 = v.GetNegative
		  Assert.AreEqual(-3.0, v2.x)
		  Assert.AreEqual(-4.0, v2.y)
		  
		  v2 = v.GetNormalised
		  Assert.AreEqual(0.600, v2.x, 1.0e-3)
		  Assert.AreEqual(0.800, v2.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsOrthogonalTest()
		  ///
		  ' Tests the `IsOrthogonal` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As PKVector2 = New PKVector2(1.0, 1.0)
		  Var v2 As PKVector2 = New PKVector2(0.0, 1.0)
		  
		  Assert.IsFalse(v1.IsOrthogonal(v2))
		  Assert.IsTrue(v1.IsOrthogonal(v1.GetLeftHandOrthogonalVector))
		  Assert.IsTrue(v1.IsOrthogonal(v1.GetRightHandOrthogonalVector))
		  Assert.IsFalse(v1.IsOrthogonal(v1))
		  
		  Assert.IsFalse(v1.IsOrthogonal(0.0, 1.0))
		  Assert.IsTrue(v1.IsOrthogonal(1.0, -1.0))
		  Assert.IsTrue(v1.IsOrthogonal(-1.0, 1.0))
		  Assert.IsFalse(v1.IsOrthogonal(1.0, 1.0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsZeroTest()
		  ///
		  ' Tests the `IsZero` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As PKVector2 = New PKVector2
		  
		  Assert.IsTrue(v.isZero)
		  
		  Call v.Set(1.0, 0.0)
		  Assert.IsFalse(v.IsZero)
		  
		  Call v.Set(1.0, 1.0)
		  Assert.IsFalse(v.IsZero)
		  
		  Call v.Set(0.0, 1.0)
		  Assert.IsFalse(v.IsZero)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LeftTest()
		  ///
		  ' Tests the `Left` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As PKVector2 = New PKVector2(11.0, 2.5)
		  Call v.Left
		  
		  Assert.AreEqual( 2.5, v.x)
		  Assert.AreEqual( -11.0, v.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MultiplyTest()
		  ///
		  ' Tests the `Multiply` and `Product` methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As PKVector2 = New PKVector2(2.0, 1.0)
		  
		  Var r As PKVector2 = v1.Product(-1.5)
		  Assert.AreEqual(-3.0, r.x)
		  Assert.AreEqual(-1.5, r.y)
		  
		  Call v1.Multiply(-1.5)
		  Assert.AreEqual(-3.0, v1.x)
		  Assert.AreEqual(-1.5, v1.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NegateTest()
		  ///
		  ' Tests the `Negate` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As PKVector2 = New PKVector2(1.0, -6.0)
		  
		  Call v.Negate
		  Assert.AreEqual(-1.0, v.x)
		  Assert.AreEqual( 6.0, v.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NormaliseTest()
		  ///
		  ' Tests the `Normalise` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As PKVector2 = New PKVector2(3.0, 4.0)
		  Call v.Normalise
		  
		  Assert.AreEqual( 3.0 / 5.0, v.x, 1.0e-3)
		  Assert.AreEqual( 4.0 / 5.0, v.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProjectTest()
		  ///
		  ' Tests the `Project` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As PKVector2 = New PKVector2(1.0, 1.0)
		  Var v2 As PKVector2 = New PKVector2(0.5, 1.0)
		  
		  Var r As PKVector2 = v1.Project(v2)
		  
		  Assert.AreEqual( 0.600, r.x, 1.0e-3)
		  Assert.AreEqual( 1.200, r.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RightTest()
		  ///
		  ' Tests the `Right` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As PKVector2 = New PKVector2(11.0, 2.5)
		  Call v.Right
		  
		  Assert.AreEqual( -2.5, v.x)
		  Assert.AreEqual( 11.0, v.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateTest()
		  ///
		  ' Tests the `Rotate` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As PKVector2 = New PKVector2(2.0, 1.0)
		  
		  Call v.Rotate(MathsKit.ToRadians(90))
		  Assert.AreEqual(-1.000, v.x, 1.0e-3)
		  Assert.AreEqual( 2.000, v.y, 1.0e-3)
		  
		  Call v.Rotate(New Rotation(MathsKit.ToRadians(60)), 0.0, 1.0)
		  Assert.AreEqual(-1.366, v.x, 1.0e-3)
		  Assert.AreEqual( 0.634, v.y, 1.0e-3)
		  
		  Call v.InverseRotate(New Rotation(MathsKit.ToRadians(60)), 0.0, 1.0)
		  Assert.AreEqual(-1.000, v.x, 1.0e-3)
		  Assert.AreEqual( 2.000, v.y, 1.0e-3)
		  
		  Call v.InverseRotate(MathsKit.ToRadians(90))
		  Assert.AreEqual(2.0, v.x, 1.0e-3)
		  Assert.AreEqual(1.0, v.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTest()
		  ///
		  ' Tests the `Set` methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As PKVector2 = New PKVector2
		  
		  Var v2 As PKVector2 = New PKVector2(1.0, -3.0)
		  Call v.Set(v2)
		  
		  Assert.IsFalse(v = v2)
		  Assert.AreEqual(1.0, v.x)
		  Assert.AreEqual(-3.0, v.y)
		  
		  Call v.Set(-1.0, 0.0)
		  Assert.AreEqual(-1.0, v.x)
		  Assert.AreEqual( 0.0, v.y)
		  
		  Call v.SetDirection(MathsKit.ToRadians(90))
		  Assert.AreEqual( 0.0, v.x, 1E-10)
		  Assert.AreEqual( 1.0, v.y)
		  
		  Call v.SetMagnitude(3.0)
		  Assert.AreEqual( 0.0, v.x, 1E-10)
		  Assert.AreEqual( 3.0, v.y)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SubtractTest()
		  ///
		  ' tests the `Subtract` and `Difference` methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As PKVector2 = New PKVector2(1.0, 2.0)
		  Var v2 As PKVector2 = New PKVector2(-2.0, 1.0)
		  
		  Var v3 As PKVector2 = v1.Difference(v2)
		  Assert.AreEqual( 3.0, v3.x)
		  Assert.AreEqual( 1.0, v3.y)
		  
		  v3 = v1.Difference(3.0, -7.5)
		  Assert.AreEqual(-2.0, v3.x)
		  Assert.AreEqual( 9.5, v3.y)
		  
		  Call v1.Subtract(v2)
		  Assert.AreEqual( 3.0, v1.x)
		  Assert.AreEqual( 1.0, v1.y)
		  
		  Call v1.Subtract(-2.0, 1.0)
		  Assert.AreEqual( 5.0, v1.x)
		  Assert.AreEqual( 0.0, v1.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TowardsTest()
		  ///
		  ' Tests the `Towards` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var p1 As PKVector2 = New PKVector2(1.0, 1.0)
		  Var p2 As PKVector2 = New PKVector2(0.0, 1.0)
		  
		  Var r As PKVector2 = p1.Towards(p2)
		  
		  Assert.AreEqual(-1.0, r.x)
		  Assert.AreEqual( 0.0, r.y)
		  
		  r = p1.Towards(2.0, 0.0)
		  
		  Assert.AreEqual( 1.0, r.x)
		  Assert.AreEqual(-1.0, r.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TripleProductTest()
		  ///
		  ' Tests the `TripleProduct` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As PKVector2 = New PKVector2(1.0, 1.0)
		  Var v2 As PKVector2 = New PKVector2(1.0, -1.0)
		  
		  Var r As PKVector2 = PKVector2.TripleProduct(v1, v2, v2)
		  
		  // T.he below would be -1.0 if the vectors were normalized.
		  Assert.AreEqual(-2.000, r.x, 1.0e-3)
		  Assert.AreEqual(-2.000, r.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ZeroTest()
		  ///
		  ' Tests the `Zero` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As PKVector2 = New PKVector2(1.0, -2.0)
		  
		  Call v.Zero
		  Assert.AreEqual( 0.0, v.x)
		  Assert.AreEqual( 0.0, v.y)
		  
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
