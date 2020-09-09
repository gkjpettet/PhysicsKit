#tag Class
Protected Class TransformTests
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
		Sub CopyTest()
		  ///
		  ' Tests the `Copy` method.
		  ///
		  
		  Var t As PKTransform = New PKTransform
		  t.Translate(2.0, -1.0)
		  t.Rotate(MathsKit.ToRadians(20), -2.0, 6.0)
		  
		  Var tc As PKTransform = t.Copy
		  
		  Assert.AreEqual(t.cost, tc.cost)
		  Assert.AreEqual(t.sint, tc.sint)
		  Assert.AreEqual(t.x, tc.x)
		  Assert.AreEqual(t.y, tc.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetTransformedTest()
		  ///
		  ' Tests the `GetTransformed` methods.
		  ///
		  
		  Var t As PKTransform = New PKTransform
		  t.Translate(2.0, 1.0)
		  t.Rotate(MathsKit.ToRadians(25), 1.0, -1.0)
		  
		  Var v As PKVector2 = New PKVector2(1.0, 0.0)
		  
		  // Test transformation.
		  Var vt As PKVector2 = t.GetTransformed(v)
		  Assert.AreEqual(1.967, vt.x, 1.0e-3)
		  Assert.AreEqual(1.657, vt.y, 1.0e-3)
		  
		  // Test inverse transformation.
		  vt = t.GetInverseTransformed(vt)
		  Assert.AreEqual(1.000, vt.x, 1.0e-3)
		  Assert.AreEqual(0.000, vt.y, 1.0e-3)
		  
		  // Test just a rotation transformation.
		  vt = t.GetTransformedR(v)
		  Assert.AreEqual(0.906, vt.x, 1.0e-3)
		  Assert.AreEqual(0.422, vt.y, 1.0e-3)
		  
		  // Test inverse rotation transformation.
		  vt = t.GetInverseTransformedR(v)
		  vt = t.GetTransformedR(vt)
		  Assert.IsTrue(vt.Equals(v))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IdentityTest()
		  ///
		  ' Tests the `Identity` method.
		  ///
		  
		  Var t As PKTransform = New PKTransform
		  t.Translate(5, 2)
		  
		  t.Identity
		  
		  Assert.AreEqual(0.0, t.x)
		  Assert.AreEqual(0.0, t.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LerpTest()
		  ///
		  ' Tests the linear interpolation methods.
		  ///
		  
		  Var p As PKVector2 = New PKVector2
		  
		  Var start As PKTransform = New PKTransform
		  start.Translate(1.0, 0.0)
		  start.Rotate(MathsKit.ToRadians(45))
		  
		  Var endT As PKTransform = New PKTransform
		  endT.Set(start)
		  endT.Translate(3.0, 2.0)
		  endT.Rotate(MathsKit.ToRadians(20))
		  
		  Var s As PKVector2 = start.GetTransformed(p)
		  Var e As PKVector2 = endT.GetTransformed(p)
		  
		  Const alpha = 0.5
		  
		  Var mid As PKTransform = New PKTransform
		  start.Lerp(endT, alpha, mid)
		  start.Lerp(endT, alpha)
		  
		  Var m As PKVector2 = mid.GetTransformed(p)
		  // This test only works this way for the mid point
		  // otherwise we would have to replicate the lerp method.
		  Assert.AreEqual((s.x + e.x) * alpha, m.x, 1.0e-9)
		  Assert.AreEqual((s.y + e.y) * alpha, m.y, 1.0e-9)
		  
		  m = start.GetTransformed(p)
		  // This test only works this way for the mid point
		  // otherwise we would have to replicate the lerp method.
		  Assert.AreEqual((s.x + e.x) * alpha, m.x, 1.0e-9)
		  Assert.AreEqual((s.y + e.y) * alpha, m.y, 1.0e-9)
		  
		  // Test opposing sign angles.
		  start.Identity
		  start.Rotate(MathsKit.ToRadians(174.0))
		  
		  endT.Identity
		  endT.Rotate(MathsKit.ToRadians(-168))
		  
		  Var l As PKTransform = start.Lerped(endT, alpha)
		  Assert.AreEqual(-3.089, l.GetRotationAngle, 1.0e-3)
		  
		  // Test opposing sign angles.
		  start.Identity
		  start.Rotate(MathsKit.ToRadians(354.0))
		  
		  endT.Identity
		  endT.Rotate(MathsKit.ToRadians(2.0))
		  
		  l = start.Lerped(endT, alpha)
		  Assert.AreEqual(-0.034, l.GetRotationAngle, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateTest()
		  ///
		  ' Tests the `Rotate` method.
		  ///
		  
		  Var t As PKTransform = New PKTransform
		  
		  t.Rotate(MathsKit.ToRadians(30))
		  Assert.AreEqual(MathsKit.ToRadians(30), t.GetRotationAngle, 1.0e-3)
		  
		  t.Rotate(PKRotation.OfDegrees(50))
		  Assert.AreEqual(MathsKit.ToRadians(80), t.GetRotationAngle, 1.0e-3)
		  
		  t.Identity
		  
		  t.Translate(5, 5)
		  t.Rotate(MathsKit.ToRadians(90))
		  
		  Var v As PKVector2 = t.GetTranslation
		  Assert.AreEqual(-5.000, v.x, 1.0e-3)
		  Assert.AreEqual( 5.000, v.y, 1.0e-3)
		  
		  t.Rotate(PKRotation.OfDegrees(90))
		  v = t.GetTranslation
		  Assert.AreEqual(-5.000, v.x, 1.0e-3)
		  Assert.AreEqual(-5.000, v.y, 1.0e-3)
		  
		  t.Rotate(MathsKit.ToRadians(35), -5.0, -5.0)
		  v = t.GetTranslation
		  Assert.AreEqual(-5.000, v.x, 1.0e-3)
		  Assert.AreEqual(-5.000, v.y, 1.0e-3)
		  
		  t.Rotate(PKRotation.OfDegrees(45), -1.0, -1.0)
		  v = t.GetTranslation
		  Assert.AreEqual(-1.000, v.x, 1.0e-3)
		  Assert.AreEqual(-6.656, v.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRotationTest()
		  ///
		  ' Tests the `SetRotation` method.
		  ///
		  
		  Var tx As PKTransform = New PKTransform
		  tx.Rotate(MathsKit.toRadians(45.0))
		  tx.Translate(1.0, 0.0)
		  
		  Call tx.SetRotation(MathsKit.ToRadians(30.0))
		  Assert.AreEqual(30.000, MathsKit.ToDegrees(tx.GetRotationAngle), 1.0e-3)
		  Assert.AreEqual(1.0, tx.x)
		  Assert.AreEqual(0.0, tx.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTransformTest()
		  ///
		  ' Tests the `SetTransform` method.
		  ///
		  
		  Var tx As PKTransform = New PKTransform
		  tx.Rotate(MathsKit.ToRadians(30))
		  tx.Translate(2.0, 0.5)
		  Var tx2 As PKTransform = New PKTransform
		  tx2.Set(tx)
		  
		  // Shouldn't be the same object reference.
		  Assert.AreDifferent(tx2, tx)
		  
		  // Should be the same transformation.
		  Assert.AreEqual(tx.cost, tx2.cost)
		  Assert.AreEqual(tx.sint, tx2.sint)
		  Assert.AreEqual(tx.x, tx2.x)
		  Assert.AreEqual(tx.y, tx2.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTranslationTest()
		  ///
		  ' Tests the `SetTranslation` methods.
		  ///
		  
		  Var tx As PKTransform = New PKTransform
		  tx.Translate(1.0, 2.0)
		  tx.Rotate(MathsKit.ToRadians(45))
		  tx.SetTranslation(0.0, 0.0)
		  
		  Assert.AreEqual(0.0, tx.x)
		  Assert.AreEqual(0.0, tx.y)
		  Assert.AreEqual(MathsKit.ToRadians(45.000), tx.GetRotationAngle, 1.0e-3)
		  
		  tx.SetTranslationX(2.0)
		  Assert.AreEqual(2.0, tx.x)
		  Assert.AreEqual(0.0, tx.y)
		  Assert.AreEqual(MathsKit.ToRadians(45.000), tx.GetRotationAngle, 1.0e-3)
		  
		  tx.SetTranslationY(3.0)
		  Assert.AreEqual(2.0, tx.x)
		  Assert.AreEqual(3.0, tx.y)
		  Assert.AreEqual(MathsKit.ToRadians(45.000), tx.GetRotationAngle, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TransformTest()
		  ///
		  ' Tests the `Transform` methods.
		  ///
		  
		  Var t As PKTransform = New PKTransform
		  t.Translate(2.0, 1.0)
		  t.Rotate(MathsKit.ToRadians(25), 1.0, -1.0)
		  
		  Var v As PKVector2 = New PKVector2(1.0, 0.0)
		  
		  // Test transformation.
		  t.TransformV(v)
		  Assert.AreEqual(1.967, v.x, 1.0e-3)
		  Assert.AreEqual(1.657, v.y, 1.0e-3)
		  
		  // Test inverse transformation.
		  t.InverseTransform(v)
		  Assert.AreEqual(1.000, v.x, 1.0e-3)
		  Assert.AreEqual(0.000, v.y, 1.0e-3)
		  
		  // Test just a rotation transformation.
		  t.TransformR(v)
		  Assert.AreEqual(0.906, v.x, 1.0e-3)
		  Assert.AreEqual(0.422, v.y, 1.0e-3)
		  
		  // Test inverse rotation transformation.
		  t.InverseTransformR(v)
		  t.transformR(v)
		  Assert.IsTrue(v.equals(v))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateTest()
		  ///
		  ' Tests the `Translate` method.
		  ///
		  
		  Var t As PKTransform = New PKTransform
		  t.Translate(2, -1)
		  
		  t.Translate(4, 4)
		  
		  Assert.AreEqual(6.000, t.GetTranslationX, 1.0e-3)
		  Assert.AreEqual(3.000, t.GetTranslationY, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ValuesTest()
		  ///
		  ' tests the `GetValues` method.
		  ///
		  
		  Var t As PKTransform = New PKTransform
		  t.Translate(2.0, -1.0)
		  
		  Var values() As Double = t.GetValues
		  Assert.AreEqual(1.0, values(0))
		  Assert.AreEqual(-0.0, values(1))
		  Assert.AreEqual(2.0, values(2))
		  Assert.AreEqual(0.0, values(3))
		  Assert.AreEqual(1.0, values(4))
		  Assert.AreEqual(-1.0, values(5))
		  
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
