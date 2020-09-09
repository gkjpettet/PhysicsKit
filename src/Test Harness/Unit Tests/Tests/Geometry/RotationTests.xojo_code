#tag Class
Protected Class RotationTests
Inherits TestGroup
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
		Sub CompareTest()
		  ///
		  ' Tests the `Compare` methods.
		  ///
		  
		  Var r1 As PKRotation = New PKRotation(MathsKit.ToRadians(10))
		  Var r2 As PKRotation = New PKRotation(MathsKit.ToRadians(100))
		  Var r3 As PKRotation = New PKRotation(MathsKit.ToRadians(100))
		  Var r4 As PKRotation = New PKRotation(MathsKit.ToRadians(-50))
		  Var r5 As PKRotation = New PKRotation(MathsKit.ToRadians(110 + 10 * 360))
		  
		  Var v1 As PKVector2 = New PKVector2(MathsKit.ToRadians(-65))
		  Var v2 As PKVector2 = New PKVector2(MathsKit.ToRadians(120))
		  Call v1.Multiply(4.5)
		  Call v2.Multiply(0.75)
		  
		  Assert.AreEqual(0, r1.Compare(r1))
		  
		  Assert.AreEqual(0, r2.Compare(r3))
		  Assert.AreEqual(1, r1.Compare(r2))
		  Assert.AreEqual(1, r3.Compare(r5))
		  Assert.AreEqual(-1, r1.Compare(r4))
		  
		  Assert.AreEqual(1, r3.Compare(v2))
		  Assert.AreEqual(-1, r4.Compare(v1))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyTest()
		  ///
		  ' Tests the `Copy` method.
		  ///
		  
		  Var r As PKRotation = New PKRotation(1.0, 3.0)
		  Var rc As PKRotation = r.Copy
		  
		  Assert.IsFalse(r = rc)
		  Assert.AreEqual(r.cost, rc.cost)
		  Assert.AreEqual(r.sint, rc.sint)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTest()
		  ///
		  ' Tests the `Create` method.
		  ///
		  
		  Var r1 As PKRotation = New PKRotation
		  // Should default to zero angle.
		  Assert.AreEqual(1.0, r1.cost, 1.0e-6)
		  Assert.AreEqual(0.0, r1.sint, 1.0e-6)
		  
		  Var r2 As PKRotation = New PKRotation(MathsKit.PI)
		  Assert.AreEqual(-1.0, r2.cost, 1.0e-6)
		  Assert.AreEqual(0.0, r2.sint, 1.0e-6)
		  
		  Var r3 As PKRotation = New PKRotation(-1.0, 0.0)
		  Assert.AreEqual(-1.0, r3.cost)
		  Assert.AreEqual(0.0, r3.sint)
		  
		  Var r4 As PKRotation = New PKRotation(1.0)
		  Assert.AreEqual(Cos(1.0), r4.cost, 1.0e-6)
		  Assert.AreEqual(Sin(1.0), r4.sint, 1.0e-6)
		  
		  Var r5 As PKRotation = New PKRotation(r4)
		  Assert.AreEqual(Cos(1.0), r5.cost, 1.0e-6)
		  Assert.AreEqual(Sin(1.0), r5.sint, 1.0e-6)
		  
		  Var r6 As PKRotation = PKRotation.of_(2.5)
		  Assert.AreEqual(Cos(2.5), r6.cost, 1.0e-6)
		  Assert.AreEqual(Sin(2.5), r6.sint, 1.0e-6)
		  
		  Var v1 As PKVector2 = New PKVector2(5, -5)
		  
		  Var r7 As PKRotation = PKRotation.of_(v1)
		  Assert.AreEqual(Cos(MathsKit.ToRadians(-45)), r7.cost, 1.0e-6)
		  Assert.AreEqual(Sin(MathsKit.ToRadians(-45)), r7.sint, 1.0e-6)
		  
		  Var t1 As PKTransform = New PKTransform
		  Call t1.SetRotation(-1.0)
		  t1.Translate(-10, -20) // Translation should not affect the result.
		  
		  Var r8 As PKRotation = PKRotation.of_(t1)
		  Assert.AreEqual(Cos(-1.0), r8.cost, 1.0e-6)
		  Assert.AreEqual(Sin(-1.0), r8.sint, 1.0e-6)
		  
		  // Test static methods for creation of common angles.
		  Var r0 As PKRotation = PKRotation.Rotation0
		  Assert.AreEqual(Cos(MathsKit.ToRadians(0.0)), r0.cost, 1.0e-6)
		  Assert.AreEqual(Sin(MathsKit.ToRadians(0.0)), r0.sint, 1.0e-6)
		  
		  Var r90 As PKRotation = PKRotation.Rotation90
		  Assert.AreEqual(Cos(MathsKit.ToRadians(90.0)), r90.cost, 1.0e-6)
		  Assert.AreEqual(Sin(MathsKit.ToRadians(90.0)), r90.sint, 1.0e-6)
		  
		  Var r180 As PKRotation = PKRotation.Rotation180
		  Assert.AreEqual(Cos(MathsKit.ToRadians(180.0)), r180.cost, 1.0e-6)
		  Assert.AreEqual(Sin(MathsKit.ToRadians(180.0)), r180.sint, 1.0e-6)
		  
		  Var r270 As PKRotation = PKRotation.Rotation270
		  Assert.AreEqual(Cos(MathsKit.ToRadians(270.0)), r270.cost, 1.0e-6)
		  Assert.AreEqual(Sin(MathsKit.ToRadians(270.0)), r270.sint, 1.0e-6)
		  
		  Var r45 As PKRotation = PKRotation.Rotation45
		  Assert.AreEqual(Cos(MathsKit.ToRadians(45.0)), r45.cost, 1.0e-6)
		  Assert.AreEqual(Sin(MathsKit.ToRadians(45.0)), r45.sint, 1.0e-6)
		  
		  Var r135 As PKRotation = PKRotation.Rotation135
		  Assert.AreEqual(Cos(MathsKit.ToRadians(135.0)), r135.cost, 1.0e-6)
		  Assert.AreEqual(Sin(MathsKit.ToRadians(135.0)), r135.sint, 1.0e-6)
		  
		  Var r225 As PKRotation = PKRotation.Rotation225
		  Assert.AreEqual(Cos(MathsKit.ToRadians(225.0)), r225.cost, 1.0e-6)
		  Assert.AreEqual(Sin(MathsKit.ToRadians(225.0)), r225.sint, 1.0e-6)
		  
		  Var r315 As PKRotation = PKRotation.Rotation315
		  Assert.AreEqual(Cos(MathsKit.ToRadians(315.0)), r315.cost, 1.0e-6)
		  Assert.AreEqual(Sin(MathsKit.ToRadians(315.0)), r315.sint, 1.0e-6)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CrossTest()
		  ///
		  ' Tests the cross product methods.
		  ///
		  
		  Var r1 As PKRotation = New PKRotation(1.0, 0.0)
		  Var r2 As PKRotation = New PKRotation(0.0, 1.0)
		  Var v As PKVector2 = New PKVector2(-5.0, 0.0)
		  
		  Assert.AreEqual(1.0, r1.Cross(r2), 1.0e-6)
		  Assert.AreEqual(0.0, r1.Cross(r2.GetRotated90), 1.0e-6)
		  Assert.AreEqual(0.0, r1.Cross(v), 1.0e-6)
		  
		  Assert.AreEqual(0.0, r1.Cross(r1), 1.0e-6)
		  Assert.AreEqual(0.0, r2.Cross(r2), 1.0e-6)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DotTest()
		  ///
		  ' Tests the `Dot` method.
		  ///
		  
		  Var r1 As PKRotation = New PKRotation(1.0, 0.0)
		  Var r2 As PKRotation = New PKRotation(0.0, 1.0)
		  Var v As PKVector2 = New PKVector2(0.0, -5.0)
		  
		  Assert.AreEqual(0.0, r1.Dot(r2), 1.0e-6)
		  Assert.AreEqual(-1.0, r1.Dot(r2.GetRotated90), 1.0e-6)
		  Assert.AreEqual(0.0, r1.Dot(v), 1.0e-6)
		  
		  // All Rotation objects are unit vectors.
		  Assert.AreEqual(1.0, r1.Dot(r1), 1.0e-6)
		  Assert.AreEqual(1.0, r2.Dot(r2), 1.0e-6)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EqualsTest()
		  ///
		  ' Tests the `equals` method.
		  ///
		  
		  Var r As PKRotation = New PKRotation(2.0)
		  
		  Assert.IsTrue(r.Equals(r))
		  Assert.IsTrue(r.Equals(r.Copy))
		  Assert.IsTrue(r.Equals(New PKRotation(2.0)))
		  
		  Assert.IsFalse(r.Equals(New PKRotation(1.0)))
		  Assert.IsFalse(r.Equals(New PKVector2))
		  
		  Var nilObj As PKVector2 = Nil
		  Assert.IsFalse(r.Equals(nilObj))
		  
		  Assert.IsTrue(r.Equals(r, 1.0e-4))
		  Var r2 As PKRotation = r.Copy.Rotate(5).Rotate(-5)
		  Assert.IsTrue(r.Equals(r2, 1.0e-4))
		  
		  Assert.IsFalse(r.Equals(New PKRotation(1.0), 1.0e-4))
		  
		  Assert.IsTrue(r.Equals(2.0))
		  Assert.IsTrue(r.Equals(2.0 + 1.0e-6, 1.0e-4))
		  
		  Assert.IsFalse(r.Equals(1.0))
		  Assert.IsFalse(r.Equals(2.0 + 1.0e-2, 1.0e-4))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetRotatedTest()
		  ///
		  ' Tests the `GetRotated` methods.
		  ///
		  
		  Var temp As PKRotation
		  Var r1 As PKRotation = New PKRotation(MathsKit.ToRadians(0))
		  
		  temp = r1.GetRotated(MathsKit.toRadians(90))
		  Assert.AreEqual(0.0, temp.cost, 1.0e-6)
		  Assert.AreEqual(1.0, temp.sint, 1.0e-6)
		  
		  temp = r1.GetRotated(New PKRotation(MathsKit.ToRadians(180)))
		  Assert.AreEqual(-1.0, temp.cost, 1.0e-6)
		  Assert.AreEqual( 0.0, temp.sint, 1.0e-6)
		  
		  Var r2 As PKRotation = New PKRotation(MathsKit.ToRadians(45))
		  
		  temp = r2.GetRotated(MathsKit.ToRadians(63))
		  Assert.AreEqual(-0.309, temp.cost, 1.0e-3)
		  Assert.AreEqual( 0.951, temp.sint, 1.0e-3)
		  
		  temp = r2.GetRotated(New PKRotation(MathsKit.ToRadians(29)))
		  Assert.AreEqual(0.276, temp.cost, 1.0e-3)
		  Assert.AreEqual(0.961, temp.sint, 1.0e-3)
		  
		  Var r3 As PKRotation = New PKRotation(MathsKit.ToRadians(60))
		  
		  Assert.AreEqual(0.500, r3.cost, 1.0e-3)
		  Assert.AreEqual(0.866, r3.sint, 1.0e-3)
		  
		  temp = r3.GetRotated90
		  Assert.AreEqual(-0.866, temp.cost, 1.0e-3)
		  Assert.AreEqual( 0.500, temp.sint, 1.0e-3)
		  
		  temp = r3.GetRotated180
		  Assert.AreEqual(-0.500, temp.cost, 1.0e-3)
		  Assert.AreEqual(-0.866, temp.sint, 1.0e-3)
		  
		  temp = r3.GetRotated270
		  Assert.AreEqual( 0.866, temp.cost, 1.0e-3)
		  Assert.AreEqual(-0.500, temp.sint, 1.0e-3)
		  
		  temp = r3.GetRotated45
		  Assert.AreEqual(-0.259, temp.cost, 1.0e-3)
		  Assert.AreEqual( 0.966, temp.sint, 1.0e-3)
		  
		  temp = r3.GetRotated135
		  Assert.AreEqual(-0.966, temp.cost, 1.0e-3)
		  Assert.AreEqual(-0.259, temp.sint, 1.0e-3)
		  
		  temp = r3.GetRotated225
		  Assert.AreEqual( 0.259, temp.cost, 1.0e-3)
		  Assert.AreEqual(-0.966, temp.sint, 1.0e-3)
		  
		  temp = r3.GetRotated315
		  Assert.AreEqual(0.966, temp.cost, 1.0e-3)
		  Assert.AreEqual(0.259, temp.sint, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetRotationBetweenTest()
		  ///
		  ' Tests the `GetRotationBetween` methods.
		  ///
		  
		  Var r1 As PKRotation = New PKRotation(MathsKit.ToRadians(10))
		  Var r2 As PKRotation = New PKRotation(MathsKit.ToRadians(100))
		  Var r3 As PKRotation = New PKRotation(MathsKit.ToRadians(100))
		  Var r4 As PKRotation = New PKRotation(MathsKit.toRadians(-50))
		  Var r5 As PKRotation = New PKRotation(MathsKit.toRadians(110 + 10 * 360))
		  
		  Var v1 As PKVector2 = New PKVector2(MathsKit.ToRadians(-65))
		  Var v2 As PKVector2 = New PKVector2(MathsKit.ToRadians(120))
		  Call v1.Multiply(4.5)
		  Call v2.Multiply(0.75)
		  
		  Assert.AreEqual(MathsKit.ToRadians(0), r1.GetRotationBetween(r1).ToRadians, 1.0e-6)
		  Assert.AreEqual(MathsKit.ToRadians(0), r2.GetRotationBetween(r3).ToRadians, 1.0e-6)
		  Assert.AreEqual(MathsKit.ToRadians(90), r1.GetRotationBetween(r2).ToRadians, 1.0e-6)
		  Assert.AreEqual(MathsKit.ToRadians(-60), r1.GetRotationBetween(r4).ToRadians, 1.0e-6)
		  Assert.AreEqual(MathsKit.ToRadians(10), r3.GetRotationBetween(r5).ToRadians, 1.0e-6)
		  
		  Assert.AreEqual(MathsKit.ToRadians(20), r3.GetRotationBetween(v2).ToRadians, 1.0e-6)
		  Assert.AreEqual(MathsKit.ToRadians(-15), r4.GetRotationBetween(v1).ToRadians, 1.0e-6)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetTest()
		  ///
		  ' Tests the `Get` methods.
		  ///
		  
		  Var r As PKRotation = New PKRotation(1.5)
		  
		  Assert.AreEqual(Cos(1.5), r.GetCost)
		  Assert.AreEqual(Sin(1.5), r.GetSint)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InverseTest()
		  ///
		  ' Tests the `Inverse` method.
		  ///
		  
		  Var r1 As PKRotation = New PKRotation(0.0)
		  
		  Call r1.Inverse
		  Assert.AreEqual(1.0, r1.cost, 1.0e-6)
		  Assert.AreEqual(0.0, r1.sint, 1.0e-6)
		  
		  Var r2 As PKRotation = New PKRotation(MathsKit.PI / 2.0)
		  Var r3 As PKRotation = r2.Copy
		  
		  Call r2.Inverse
		  Assert.AreEqual(0.0, r2.cost, 1.0e-6)
		  Assert.AreEqual(-1.0, r2.sint, 1.0e-6)
		  
		  Call r2.Inverse
		  Assert.IsTrue(r3.Equals(r2))
		  
		  Var temp As PKRotation = r2.GetInversed
		  Assert.AreEqual(0.0, temp.cost, 1.0e-6)
		  Assert.AreEqual(-1.0, temp.sint, 1.0e-6)
		  
		  Assert.IsTrue(r3.Equals(r2))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsIdentityTest()
		  ///
		  ' Tests the `IsIdentity` method.
		  ///
		  
		  Var r As PKRotation = New PKRotation
		  
		  Assert.IsTrue(r.IsIdentity)
		  Assert.IsTrue(r.IsIdentity(1.0e-6))
		  
		  Call r.Set(1.0)
		  Assert.IsFalse(r.IsIdentity)
		  Assert.IsFalse(r.IsIdentity(1.0e-6))
		  
		  Call r.Set(1.0e-6)
		  Assert.IsFalse(r.IsIdentity)
		  Assert.IsTrue(r.IsIdentity(1.0e-4))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsUnitTest()
		  ///
		  ' Tests the unit length property of rotations.
		  ///
		  
		  // For any angle, the corresponding Rotation is always a unit vector.
		  For i As Integer = 0 to 999
		    Var r As PKRotation = New PKRotation(MathsKit.ToRadians(i))
		    Assert.AreEqual(1.0, r.Dot(r), 1.0e-6)
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateTest()
		  ///
		  ' Tests the `Rotate` methods.
		  ///
		  
		  Var r1 As PKRotation = New PKRotation(MathsKit.ToRadians(0))
		  
		  Call r1.Rotate(MathsKit.ToRadians(90))
		  Assert.AreEqual(0.0, r1.cost, 1.0e-6)
		  Assert.AreEqual(1.0, r1.sint, 1.0e-6)
		  
		  Call r1.Rotate(New PKRotation(MathsKit.ToRadians(90)))
		  Assert.AreEqual(-1.0, r1.cost, 1.0e-6)
		  Assert.AreEqual( 0.0, r1.sint, 1.0e-6)
		  
		  Var r2 As PKRotation = New PKRotation(MathsKit.ToRadians(45))
		  
		  Call r2.Rotate(MathsKit.ToRadians(63))
		  Assert.AreEqual(-0.309, r2.cost, 1.0e-3)
		  Assert.AreEqual( 0.951, r2.sint, 1.0e-3)
		  
		  Call r2.Rotate(New PKRotation(MathsKit.ToRadians(29)))
		  Assert.AreEqual(-0.731, r2.cost, 1.0e-3)
		  Assert.AreEqual( 0.682, r2.sint, 1.0e-3)
		  
		  Var r3 As PKRotation = New PKRotation(MathsKit.ToRadians(60))
		  
		  Assert.AreEqual(0.500, r3.cost, 1.0e-3)
		  Assert.AreEqual(0.866, r3.sint, 1.0e-3)
		  
		  Call r3.Rotate90
		  Assert.AreEqual(-0.866, r3.cost, 1.0e-3)
		  Assert.AreEqual( 0.500, r3.sint, 1.0e-3)
		  
		  Call r3.Rotate180
		  Assert.AreEqual( 0.866, r3.cost, 1.0e-3)
		  Assert.AreEqual(-0.500, r3.sint, 1.0e-3)
		  
		  Call r3.Rotate270
		  Assert.AreEqual(-0.500, r3.cost, 1.0e-3)
		  Assert.AreEqual(-0.866, r3.sint, 1.0e-3)
		  
		  Call r3.Rotate90
		  Assert.AreEqual( 0.866, r3.cost, 1.0e-3)
		  Assert.AreEqual(-0.500, r3.sint, 1.0e-3)
		  
		  Call r3.Rotate45
		  Assert.AreEqual(0.966, r3.cost, 1.0e-3)
		  Assert.AreEqual(0.259, r3.sint, 1.0e-3)
		  
		  Call r3.Rotate45
		  Assert.AreEqual(0.500, r3.cost, 1.0e-3)
		  Assert.AreEqual(0.866, r3.sint, 1.0e-3)
		  
		  Call r3.Rotate135
		  Assert.AreEqual(-0.966, r3.cost, 1.0e-3)
		  Assert.AreEqual(-0.259, r3.sint, 1.0e-3)
		  
		  Call r3.Rotate225
		  Assert.AreEqual(0.500, r3.cost, 1.0e-3)
		  Assert.AreEqual(0.866, r3.sint, 1.0e-3)
		  
		  Call r3.Rotate315
		  Assert.AreEqual(0.966, r3.cost, 1.0e-3)
		  Assert.AreEqual(0.259, r3.sint, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTest()
		  ///
		  ' Tests the `Set` methods.
		  ///
		  
		  Var r As PKRotation = New PKRotation(2.0)
		  
		  Var r2 As PKRotation = New PKRotation(3.0)
		  Call r.Set(r2)
		  
		  Assert.IsFalse(r = r2)
		  Assert.AreEqual(Cos(3.0), r.cost, 1.0e-6)
		  Assert.AreEqual(Sin(3.0), r.sint, 1.0e-6)
		  Assert.AreEqual(r2.cost, r.cost)
		  Assert.AreEqual(r2.sint, r.sint)
		  
		  Call r.Set(-1.0)
		  Assert.AreEqual(Cos(-1.0), r.cost, 1.0e-6)
		  Assert.AreEqual(Sin(-1.0), r.sint, 1.0e-6)
		  
		  Call r.SetIdentity
		  Assert.AreEqual(1.0, r.cost, 1.0e-6)
		  Assert.AreEqual(0.0, r.sint, 1.0e-6)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToAngleTest()
		  ///
		  ' Tests radians/degrees conversion methods.
		  ///
		  
		  Var r As PKRotation = New PKRotation(0.0, -1.0)
		  
		  Assert.AreEqual(-MathsKit.PI / 2, r.ToRadians, 1.0e-6)
		  Assert.AreEqual(-90, r.ToDegrees, 1.0e-6)
		  
		  Call r.Rotate135
		  
		  Assert.AreEqual(MathsKit.PI / 4, r.ToRadians, 1.0e-6)
		  Assert.AreEqual(45, r.ToDegrees, 1.0e-6)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToVectorTest()
		  ///
		  ' Tests vector conversion methods.
		  ///
		  
		  Var r As PKRotation = New PKRotation(MathsKit.ToRadians(30))
		  Var v1 As PKVector2 = r.ToVector
		  Var v2 As PKVector2 = r.ToVector(2.5)
		  
		  Assert.AreEqual(r.ToRadians, v1.GetDirection, 1.0e-6)
		  Assert.AreEqual(r.ToRadians, v2.GetDirection, 1.0e-6)
		  
		  Assert.AreEqual(1.0, v1.GetMagnitude, 1.0e-6)
		  Assert.AreEqual(2.5, v2.GetMagnitude, 1.0e-6)
		  
		End Sub
	#tag EndMethod


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
