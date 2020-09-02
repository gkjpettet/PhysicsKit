#tag Class
Protected Class Matrix33Tests
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
		  ' Tests the Add method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(_
		  0.0, 2.0, 0.0, _
		  3.0, 1.0, 1.0, _
		  2.0, 0.0, -1.0)
		  
		  Var m2 As PKMatrix33 = New PKMatrix33(_
		  1.0, 1.0, 3.0, _
		  0.0, 4.0, 1.0, _
		  2.0, 2.0, 1.0)
		  
		  Call m1.Add(m2)
		  
		  // Test the values.
		  Assert.AreEqual(1.0, m1.m00)
		  Assert.AreEqual(3.0, m1.m01)
		  Assert.AreEqual(3.0, m1.m02)
		  Assert.AreEqual(3.0, m1.m10)
		  Assert.AreEqual(5.0, m1.m11)
		  Assert.AreEqual(2.0, m1.m12)
		  Assert.AreEqual(4.0, m1.m20)
		  Assert.AreEqual(2.0, m1.m21)
		  Assert.AreEqual(0.0, m1.m22)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyTest()
		  ///
		  ' Tests the copy constructor.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(_
		  0.0, 1.0, -1.0, _
		  2.0, -1.0, 3.0, _
		  3.0, 2.5, 0.5)
		  
		  // Make a copy.
		  Var m2 As PKMatrix33 = New PKMatrix33(m1)
		  
		  // Test the values.
		  Assert.AreEqual(m2.m00, m1.m00)
		  Assert.AreEqual(m2.m01, m1.m01)
		  Assert.AreEqual(m2.m02, m1.m02)
		  Assert.AreEqual(m2.m10, m1.m10)
		  Assert.AreEqual(m2.m11, m1.m11)
		  Assert.AreEqual(m2.m12, m1.m12)
		  Assert.AreEqual(m2.m20, m1.m20)
		  Assert.AreEqual(m2.m21, m1.m21)
		  Assert.AreEqual(m2.m22, m1.m22)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateFullArrayTest()
		  ///
		  ' Tests the creation method passing a Double array.
		  ///
		  
		  Var m As PKMatrix33 = New PKMatrix33(Array(_
		  1.0, 2.0, 1.0, _
		  -3.0, 8.0, 2.0, _
		  1.0, 5.0, -1.0))
		  
		  Assert.AreEqual(1.0, m.m00)
		  Assert.AreEqual(2.0, m.m01)
		  Assert.AreEqual(1.0, m.m02)
		  Assert.AreEqual(-3.0, m.m10)
		  Assert.AreEqual(8.0, m.m11)
		  Assert.AreEqual(2.0, m.m12)
		  Assert.AreEqual(1.0, m.m20)
		  Assert.AreEqual(5.0, m.m21)
		  Assert.AreEqual(-1.0, m.m22)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateFullTest()
		  ///
		  ' Tests the creation method passing nine Doubles.
		  ///
		  
		  Var m As PKMatrix33 = New PKMatrix33(1.0, 2.0, 1.0, -3.0, 8.0, 2.0, 1.0, 5.0, -1.0)
		  
		  Assert.AreEqual(1.0, m.m00)
		  Assert.AreEqual(2.0, m.m01)
		  Assert.AreEqual(1.0, m.m02)
		  Assert.AreEqual(-3.0, m.m10)
		  Assert.AreEqual(8.0, m.m11)
		  Assert.AreEqual(2.0, m.m12)
		  Assert.AreEqual(1.0, m.m20)
		  Assert.AreEqual(5.0, m.m21)
		  Assert.AreEqual(-1.0, m.m22)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeterminantTest()
		  ///
		  ' Tests the Determinant method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(1.0, 0.0, 5.0, 2.0, 1.0, 6.0, 3.0, 4.0, 0.0)
		  Var det As Double = m1.Determinant
		  Assert.AreEqual(1.0, det)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DifferenceTest()
		  ///
		  ' Tests the Difference method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  Var m2 As PKMatrix33 = New PKMatrix33(1.0, 1.0, 3.0, 0.0, 4.0, 1.0, 2.0, 2.0, 1.0)
		  Var m3 As PKMatrix33 = m1.Difference(m2)
		  
		  // Test the values.
		  Assert.AreEqual(-1.0, m3.m00)
		  Assert.AreEqual( 1.0, m3.m01)
		  Assert.AreEqual(-3.0, m3.m02)
		  Assert.AreEqual( 3.0, m3.m10)
		  Assert.AreEqual(-3.0, m3.m11)
		  Assert.AreEqual( 0.0, m3.m12)
		  Assert.AreEqual( 0.0, m3.m20)
		  Assert.AreEqual(-2.0, m3.m21)
		  Assert.AreEqual(-2.0, m3.m22)
		  
		  // Make sure we didn't modify the first matrix.
		  Assert.IsFalse(m1.Equals(m3))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetInverseTest()
		  ///
		  ' Tests the GetInverse method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(1.0, 0.0, 5.0, 2.0, 1.0, 6.0, 3.0, 4.0, 0.0)
		  Var m2 As PKMatrix33 = m1.GetInverse
		  
		  Assert.AreEqual(-24.0, m2.m00)
		  Assert.AreEqual( 20.0, m2.m01)
		  Assert.AreEqual( -5.0, m2.m02)
		  Assert.AreEqual( 18.0, m2.m10)
		  Assert.AreEqual(-15.0, m2.m11)
		  Assert.AreEqual(  4.0, m2.m12)
		  Assert.AreEqual(  5.0, m2.m20)
		  Assert.AreEqual( -4.0, m2.m21)
		  Assert.AreEqual(  1.0, m2.m22)
		  
		  // Make sure we didn't modify the first matrix.
		  Assert.IsFalse(m1.Equals(m2))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetTransposeTest()
		  ///
		  ' Tests the GetTranspose method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  
		  Var m2 As PKMatrix33 = m1.GetTranspose
		  
		  Assert.AreEqual(0.0, m2.m00)
		  Assert.AreEqual(3.0, m2.m01)
		  Assert.AreEqual(2.0, m2.m02)
		  Assert.AreEqual(2.0, m2.m10)
		  Assert.AreEqual(1.0, m2.m11)
		  Assert.AreEqual(0.0, m2.m12)
		  Assert.AreEqual(0.0, m2.m20)
		  Assert.AreEqual(1.0, m2.m21)
		  Assert.AreEqual(-1.0, m2.m22)
		  
		  // Make sure we didn't modify the first matrix.
		  Assert.IsFalse(m1.Equals(m2))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IdentityTest()
		  ///
		  ' Tests the Identity method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  
		  Call m1.Identity
		  
		  Assert.AreEqual(1.0, m1.m00)
		  Assert.AreEqual(0.0, m1.m01)
		  Assert.AreEqual(0.0, m1.m02)
		  Assert.AreEqual(0.0, m1.m10)
		  Assert.AreEqual(1.0, m1.m11)
		  Assert.AreEqual(0.0, m1.m12)
		  Assert.AreEqual(0.0, m1.m20)
		  Assert.AreEqual(0.0, m1.m21)
		  Assert.AreEqual(1.0, m1.m22)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvertTest()
		  ///
		  ' Tests the Invert method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(1.0, 0.0, 5.0, 2.0, 1.0, 6.0, 3.0, 4.0, 0.0)
		  
		  Call m1.Invert
		  
		  Assert.AreEqual(-24.0, m1.m00)
		  Assert.AreEqual( 20.0, m1.m01)
		  Assert.AreEqual( -5.0, m1.m02)
		  Assert.AreEqual( 18.0, m1.m10)
		  Assert.AreEqual(-15.0, m1.m11)
		  Assert.AreEqual(  4.0, m1.m12)
		  Assert.AreEqual(  5.0, m1.m20)
		  Assert.AreEqual( -4.0, m1.m21)
		  Assert.AreEqual(  1.0, m1.m22)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MultiplyMatrixTest()
		  ///
		  ' Tests the multiply matrix method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  Var m2 As PKMatrix33 = New PKMatrix33(1.0, 1.0, 3.0, 0.0, 4.0, 1.0, 2.0, 2.0, 1.0)
		  
		  Call m1.Multiply(m2)
		  
		  Assert.AreEqual(0.0, m1.m00)
		  Assert.AreEqual(8.0, m1.m01)
		  Assert.AreEqual(2.0, m1.m02)
		  Assert.AreEqual(5.0, m1.m10)
		  Assert.AreEqual(9.0, m1.m11)
		  Assert.AreEqual(11.0, m1.m12)
		  Assert.AreEqual(0.0, m1.m20)
		  Assert.AreEqual(0.0, m1.m21)
		  Assert.AreEqual(5.0, m1.m22)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MultiplyScalarTest()
		  ///
		  ' Tests the multiply by a scalar method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  Call m1.Multiply(2.0)
		  
		  Assert.AreEqual(0.0, m1.m00)
		  Assert.AreEqual(4.0, m1.m01)
		  Assert.AreEqual(0.0, m1.m02)
		  Assert.AreEqual(6.0, m1.m10)
		  Assert.AreEqual(2.0, m1.m11)
		  Assert.AreEqual(2.0, m1.m12)
		  Assert.AreEqual(4.0, m1.m20)
		  Assert.AreEqual(0.0, m1.m21)
		  Assert.AreEqual(-2.0, m1.m22)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MultiplyVectorTest()
		  ///
		  ' Tests the multiply vector method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  Var v1 As PKVector3 = New PKVector3(1.0, -1.0, 2.0)
		  
		  Call m1.Multiply(v1)
		  
		  Assert.AreEqual(-2.0, v1.x)
		  Assert.AreEqual( 4.0, v1.y)
		  Assert.AreEqual( 0.0, v1.z)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MultiplyVectorTTest()
		  ///
		  ' Tests the multiply vector transpose method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  Var v1 As PKVector3 = New PKVector3(1.0, -1.0, 2.0)
		  
		  Call m1.MultiplyT(v1)
		  
		  Assert.AreEqual( 1.0, v1.x)
		  Assert.AreEqual( 1.0, v1.y)
		  Assert.AreEqual(-3.0, v1.z)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProductMatrixTest()
		  ///
		  ' Tests the product matrix method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  Var m2 As PKMatrix33 = New PKMatrix33(1.0, 1.0, 3.0, 0.0, 4.0, 1.0, 2.0, 2.0, 1.0)
		  Var m3 As PKMatrix33 = m1.Product(m2)
		  
		  Assert.AreEqual(0.0, m3.m00)
		  Assert.AreEqual(8.0, m3.m01)
		  Assert.AreEqual(2.0, m3.m02)
		  Assert.AreEqual(5.0, m3.m10)
		  Assert.AreEqual(9.0, m3.m11)
		  Assert.AreEqual(11.0, m3.m12)
		  Assert.AreEqual(0.0, m3.m20)
		  Assert.AreEqual(0.0, m3.m21)
		  Assert.AreEqual(5.0, m3.m22)
		  
		  // Make sure we didn't modify the first matrix.
		  Assert.IsFalse(m1.Equals(m3))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProductScalarTest()
		  ///
		  ' Tests the product by a scalar method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  Var m2 As PKMatrix33 = m1.Product(2.0)
		  
		  Assert.AreEqual(0.0, m2.m00)
		  Assert.AreEqual(4.0, m2.m01)
		  Assert.AreEqual(0.0, m2.m02)
		  Assert.AreEqual(6.0, m2.m10)
		  Assert.AreEqual(2.0, m2.m11)
		  Assert.AreEqual(2.0, m2.m12)
		  Assert.AreEqual(4.0, m2.m20)
		  Assert.AreEqual(0.0, m2.m21)
		  Assert.AreEqual(-2.0, m2.m22)
		  
		  // Make sure we didn't modify the first matrix.
		  Assert.IsFalse(m1.Equals(m2))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProductVectorTest()
		  ///
		  ' Tests the product vector method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  Var v1 As PKVector3 = New PKVector3(1.0, -1.0, 2.0)
		  
		  Var v2 As PKVector3 = m1.Product(v1)
		  
		  Assert.AreEqual(-2.0, v2.x)
		  Assert.AreEqual( 4.0, v2.y)
		  Assert.AreEqual( 0.0, v2.z)
		  
		  // Make sure we didn't modify the first vector.
		  Assert.IsFalse(v1.Equals(v2))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProductVectorTTest()
		  ///
		  ' Tests the product vector transpose method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  Var v1 As PKVector3 = New PKVector3(1.0, -1.0, 2.0)
		  
		  Var v2 As PKVector3 = m1.ProductT(v1)
		  
		  Assert.AreEqual( 1.0, v2.x)
		  Assert.AreEqual( 1.0, v2.y)
		  Assert.AreEqual(-3.0, v2.z)
		  
		  // Make sure we didn't modify the first vector.
		  Assert.IsFalse(v1.Equals(v2))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Solve22Test()
		  ///
		  ' Tests the Solve method.
		  ///
		  
		  Var A As PKMatrix33 = New PKMatrix33(3.0, -1.0, 0.0, -1.0, -1.0, 0.0, 0.0,  0.0, 0.0)
		  Var b As PKVector2 = New PKVector2(2.0, 6.0)
		  Var x As PKVector2 = A.Solve22(b)
		  
		  Assert.AreEqual(-1.0, x.x)
		  Assert.AreEqual(-5.0, x.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Solve33Test()
		  ///
		  ' Tests the Solve method.
		  ///
		  
		  Var A As PKMatrix33 = New PKMatrix33(1.0, -3.0, 3.0, 2.0, 3.0, -1.0, 4.0, -3.0, -1.0)
		  Var b As PKVector3 = New PKVector3(-4.0, 15.0, 19.0)
		  Var x As PKVector3 = A.Solve33(b)
		  
		  Assert.AreEqual( 5.0, x.x)
		  Assert.AreEqual( 1.0, x.y)
		  Assert.AreEqual(-2.0, x.z)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SubtractTest()
		  ///
		  ' Tests the Subtract method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  Var m2 As PKMatrix33 = New PKMatrix33(1.0, 1.0, 3.0, 0.0, 4.0, 1.0, 2.0, 2.0, 1.0)
		  
		  Call m1.Subtract(m2)
		  
		  // Test the values.
		  Assert.AreEqual(-1.0, m1.m00)
		  Assert.AreEqual( 1.0, m1.m01)
		  Assert.AreEqual(-3.0, m1.m02)
		  Assert.AreEqual( 3.0, m1.m10)
		  Assert.AreEqual(-3.0, m1.m11)
		  Assert.AreEqual( 0.0, m1.m12)
		  Assert.AreEqual( 0.0, m1.m20)
		  Assert.AreEqual(-2.0, m1.m21)
		  Assert.AreEqual(-2.0, m1.m22)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SumTest()
		  ///
		  ' Tests the Sum method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(_
		  0.0, 2.0, 0.0, _
		  3.0, 1.0, 1.0, _
		  2.0, 0.0, -1.0)
		  
		  Var m2 As PKMatrix33 = New PKMatrix33(_
		  1.0, 1.0, 3.0, _
		  0.0, 4.0, 1.0, _
		  2.0, 2.0, 1.0)
		  
		  Var m3 As PKMatrix33 = m1.Sum(m2)
		  
		  // Test the values.
		  Assert.AreEqual(1.0, m3.m00)
		  Assert.AreEqual(3.0, m3.m01)
		  Assert.AreEqual(3.0, m3.m02)
		  Assert.AreEqual(3.0, m3.m10)
		  Assert.AreEqual(5.0, m3.m11)
		  Assert.AreEqual(2.0, m3.m12)
		  Assert.AreEqual(4.0, m3.m20)
		  Assert.AreEqual(2.0, m3.m21)
		  Assert.AreEqual(0.0, m3.m22)
		  
		  // Make sure we didn't modify the first matrix.
		  Assert.IsFalse(m1.Equals(m3))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TransposeTest()
		  ///
		  ' Tests the Transpose method.
		  ///
		  
		  Var m1 As PKMatrix33 = New PKMatrix33(0.0, 2.0, 0.0, 3.0, 1.0, 1.0, 2.0, 0.0, -1.0)
		  
		  Call m1.Transpose
		  
		  Assert.AreEqual(0.0, m1.m00)
		  Assert.AreEqual(3.0, m1.m01)
		  Assert.AreEqual(2.0, m1.m02)
		  Assert.AreEqual(2.0, m1.m10)
		  Assert.AreEqual(1.0, m1.m11)
		  Assert.AreEqual(0.0, m1.m12)
		  Assert.AreEqual(0.0, m1.m20)
		  Assert.AreEqual(1.0, m1.m21)
		  Assert.AreEqual(-1.0, m1.m22)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Prop1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Prop2 As Integer
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
