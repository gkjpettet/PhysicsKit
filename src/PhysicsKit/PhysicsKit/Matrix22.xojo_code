#tag Class
Protected Class Matrix22
	#tag Method, Flags = &h0, Description = 416464732074686520676976656E204D6174726978323220746F2074686973204D617472697832322C2072657475726E696E672074686973204D617472697832322E
		Function Add(matrix As PhysicsKit.Matrix22) As PhysicsKit.Matrix22
		  ///
		  ' Adds the given Matrix22 to this Matrix22, returning this Matrix22.
		  '
		  ' `Self = Self + m
		  '
		  ' - Parameter matrix: The Matrix22 to add.
		  '
		  ' - Returns: This Matrix22.
		  ///
		  
		  Self.M00 = Self.M00 + matrix.M00
		  Self.M01 = Self.M01 + matrix.M01
		  Self.M10 = Self.M10 + matrix.M10
		  Self.M11 = Self.M11 + matrix.M11
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ///
		  ' Default constructor.
		  ///
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(values() As Double)
		  ///
		  ' Full constructor.
		  '
		  ' The given array should be in the same order as the 
		  ' `Matrix22(Double, Double, Double, Double)` constructor.
		  '
		  ' - Parameter values: The values array.
		  '
		  ' - Raises: NilObjectException is `values` is Nil.
		  ' - Raises: OutOfBoundsException if `values` does not have 4 elements.
		  ///
		  
		  If values = Nil Then Raise New NilObjectException(Messages.GEOMETRY_MATRIX_NIL_ARRAY)
		  If values.Count <> 4 Then Raise New OutOfBoundsException(Messages.GEOMETRY_MATRIX_INVALID_LENGTH_4)
		  Self.M00 = values(0)
		  Self.M01 = values(1)
		  Self.M10 = values(2)
		  Self.M11 = values(3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(m00 As Double, m01 As Double, m10 As Double, m11 As Double)
		  ///
		  ' Full constructor.
		  '
		  ' - Parameter m00: The element at 0,0.
		  ' - Parameter m01: The element at 0,1.
		  ' - Parameter m10: The element at 1,0.
		  ' - Parameter m11: The element at 1,1.
		  ///
		  
		  Self.M00 = m00
		  Self.M01 = m01
		  Self.M10 = m10
		  Self.M11 = m11
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(m As PhysicsKit.Matrix22)
		  ///
		  ' Copy constructor.
		  '
		  ' - Parameter m: The Matrix22 to copy.
		  ///
		  
		  Self.M00 = m.M00
		  Self.M01 = m.M01
		  Self.M10 = m.M10
		  Self.M11 = m.M11
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120636F7079206F662074686973204D617472697832322E
		Function Copy() As PhysicsKit.Matrix22
		  ///
		  ' Returns a copy of this Matrix22.
		  '
		  ' - Returns: A new Matrix22.
		  ///
		  
		  Return New Matrix22(Self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Determinant() As Double
		  ///
		  ' Returns the determinant of this Matrix22.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.M00 * Self.M11 - Self.M01 * Self.M10
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E6577204D6174726978323220746861742069732074686520646966666572656E6365206F662074686973204D6174726978323220616E642074686520676976656E204D617472697832322E
		Function Difference(matrix As PhysicsKit.Matrix22) As PhysicsKit.Matrix22
		  ///
		  ' Returns a new Matrix22 that is the difference of this Matrix22 and the given Matrix22.
		  '
		  ' `r = Self - m`
		  '
		  ' - Parameter matrix: The Matrix22 to subtract.
		  '
		  ' - Returns: A new Matrix22 containing the result.
		  ///
		  
		  // Make a copy of this matrix and perform the subtraction.
		  Return Self.Copy.Subtract(matrix)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520706173736564206F626A65637420697320636F6E7369646572656420657175616C20746F2074686973204D617472697832322E
		Function Equals(obj As Variant) As Boolean
		  ///
		  ' Returns True if the passed object is considered equal to this Matrix22.
		  ///
		  
		  If obj Is Nil Then Return False
		  If obj = Self Then Return True
		  If obj IsA Matrix22 Then
		    Var other As Matrix22 = Matrix22(obj)
		    If other.M00 = Self.M00 And _
		      other.M01 = Self.M01 And _
		      other.M10 = Self.M10 And _
		      other.M11 = Self.M11 Then
		      Return True
		    End If
		  End If
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInverse() As PhysicsKit.Matrix22
		  ///
		  ' Returns a new Matrix22 containing the inverse of this Matrix22.
		  '
		  ' - Returns: A new Matrix22.
		  ///
		  
		  // Make a copy of this matrix and perform the inversion.
		  Return Self.Copy.Invert
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207472616E73706F7365206F662074686973204D6174726978323220696E2061206E6577204D617472697832322E
		Function GetTranspose() As PhysicsKit.Matrix22
		  ///
		  ' Returns the transpose of this Matrix22 in a new Matrix22.
		  '
		  ' - Returns: A new Matrix22 containing the transpose.
		  ///
		  
		  Return Self.Copy.Transpose
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686973204D6174726978323220746F20616E206964656E74697479204D6174726978323220616E642072657475726E732074686973204D617472697832322E
		Function Identity() As PhysicsKit.Matrix22
		  ///
		  ' Sets this Matrix22 to an identity Matrix22 and returns this Matrix22.
		  '
		  ' - Returns: This Matrix22.
		  ///
		  
		  Self.M00 = 1
		  Self.M01 = 0
		  Self.M10 = 0
		  Self.M11 = 1
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 506572666F726D732074686520696E7665727365206F662074686973204D6174726978323220616E6420706C616365732074686520726573756C7420696E2074686973204D617472697832322E
		Function Invert() As PhysicsKit.Matrix22
		  ///
		  ' Performs the inverse of this Matrix22 and places the result in this Matrix22.
		  '
		  ' - Returns: This Matrix22, inverted.
		  ///
		  
		  // Get the determinant.
		  Var det As Double = Self.Determinant
		  
		  // Check for zero determinant.
		  If Abs(det) > Epsilon.E Then det = 1.0 / det
		  
		  Var a As Double = Self.M00
		  Var b As Double = Self.M01
		  Var c As Double = Self.M10
		  Var d As Double = Self.M11
		  
		  Self.M00 =  det * d
		  Self.M01 = -det * b
		  Self.M10 = -det * c
		  Self.M11 =  det * a
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C6965732074686973204D617472697832322062792074686520676976656E207363616C617220616E6420706C616365732074686520726573756C7420696E2074686973204D617472697832322E
		Function Multiply(scalar As Double) As PhysicsKit.Matrix22
		  ///
		  ' Multiplies this Matrix22 by the given scalar and places the result in this Matrix22.
		  '
		  ' `this = this * scalar`
		  '
		  ' - Parameter scalar: The scalar to multiply by.
		  '
		  ' - Returns: This Matrix22.
		  ///
		  
		  Self.M00 = Self.M00 * scalar
		  Self.M01 = Self.M01 * scalar
		  Self.M10 = Self.M10 * scalar
		  Self.M11 = Self.M11 * scalar
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C6965732074686973204D617472697832322062792074686520676976656E206D6174726978204D617472697832322C2072657475726E696E672074686973204D617472697832322E
		Function Multiply(matrix As PhysicsKit.Matrix22) As PhysicsKit.Matrix22
		  ///
		  ' Multiplies this Matrix22 by the given matrix Matrix22, returning this Matrix22.
		  '
		  ' `Self = Self * m`
		  '
		  ' - Parameter matrix: The Matrix22 to subtract.
		  '
		  ' - Returns: This Matrix22.
		  ///
		  
		  Var m00 As Double = Self.M00
		  Var m01 As Double = Self.M01
		  Var m10 As Double = Self.M10
		  Var m11 As Double = Self.M11
		  
		  Self.M00 = m00 * matrix.M00 + m01 * matrix.M10
		  Self.M01 = m00 * matrix.M01 + m01 * matrix.M11
		  Self.M10 = m10 * matrix.M00 + m11 * matrix.M10
		  Self.M11 = m10 * matrix.M01 + m11 * matrix.M11
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C6965732074686973204D617472697832322062792074686520676976656E20566563746F723220616E6420706C616365732074686520726573756C7420696E2074686520676976656E20566563746F72322E20526169736573204E696C4F626A656374457863657074696F6E2E
		Function Multiply(vector As PKVector2) As PKVector2
		  ///
		  ' Multiplies this Matrix22 by the given PKVector2 and places the result in the given PKVector2.
		  '
		  ' `v = Self * v`
		  '
		  ' - Parameter vector: The PKVector2 to multiply.
		  '
		  ' - Returns: The passed PKVector2, now containing the result.
		  '
		  ' - Raises: NilObjectException if the passed vector is Nil.
		  ///
		  
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  
		  vector.X = Self.M00 * x + Self.M01 * y
		  vector.Y = Self.M10 * x + Self.M11 * y
		  
		  Return vector
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C6965732074686520676976656E20566563746F72322062792074686973204D6174726978323220616E6420706C616365732074686520726573756C7420696E2074686520676976656E20566563746F72322E
		Function MultiplyT(vector As PKVector2) As PKVector2
		  ///
		  ' Multiplies the given PKVector2 by this Matrix22 and places the result in the given PKVector2.
		  '
		  ' ` v = vT * this`
		  '
		  ' - Parameter vector: The PKVector2 to multiply.
		  '
		  ' - Returns: The passed PKVector2 containing the result.
		  ///
		  
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  
		  vector.X = Self.M00 * x + Self.M10 * y
		  vector.Y = Self.M01 * x + Self.M11 * y
		  
		  Return vector
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C6965732074686973204D617472697832322062792074686520676976656E207363616C61722072657475726E696E672061206E6577204D6174726978323220636F6E7461696E696E672074686520726573756C742E
		Function Product(scalar As Double) As PhysicsKit.Matrix22
		  ///
		  ' Multiplies this Matrix22 by the given scalar returning a new Matrix22 containing the result.
		  '
		  ' `r = this * scalar`
		  '
		  ' - Parameter scalar: The scalar to multiply by.
		  '
		  ' - Returns: A new Matrix22 containing the result.
		  ///
		  
		  // Make a copy of this matrix and perform the scalar multiplication.
		  Return Self.Copy.Multiply(scalar)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E6577204D617472697832322074686174206973207468652070726F64756374206F662074686973204D6174726978323220616E642074686520676976656E204D617472697832322E
		Function Product(matrix As PhysicsKit.Matrix22) As PhysicsKit.Matrix22
		  ///
		  ' Returns a new Matrix22 that is the product of this Matrix22 and the given Matrix22.
		  '
		  ' `r = Self * m`
		  '
		  ' - Parameter matrix: The Matrix22 to multiply.
		  '
		  ' - Returns: A new Matrix22 a new matrix containing the result.
		  ///
		  
		  // Make a copy of this matrix and perform the multiplication.
		  Return Self.Copy.Multiply(matrix)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C6965732074686973204D617472697832322062792074686520676976656E20566563746F72322072657475726E696E672074686520726573756C7420696E2061206E657720566563746F72322E20526169736573204E696C4F626A656374457863657074696F6E732E
		Function Product(vector As PKVector2) As PKVector2
		  ///
		  ' Multiplies this Matrix22 by the given PKVector2 returning the result in a new PKVector2.
		  '
		  ' `r = Self * v`
		  '
		  ' - Parameter vector: The PKVector2 to multiply.
		  ' 
		  ' - Returns: A new PKVector2 containing the result.
		  '
		  ' - Raises: NilObjectException if `vector` is Nil.
		  ///
		  
		  Return Self.Multiply(vector.Copy)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C6965732074686520676976656E20566563746F72322062792074686973204D617472697832322072657475726E696E672074686520726573756C7420696E2061206E657720566563746F72322E
		Function ProductT(vector As PKVector2) As PKVector2
		  ///
		  ' Multiplies the given PKVector2 by this Matrix22 returning the result in a new PKVector2.
		  '
		  ' `r = vT * Self`
		  '
		  ' - Parameter vector: The PKVector2 to multiply.
		  '
		  ' - Returns: A new PKVector2 containing the result.
		  ///
		  
		  Return Self.MultiplyT(vector.Copy)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536F6C76657320604178203D20626020616E642072657475726E732074686520726573756C742061732061206E657720566563746F72322E
		Function Solve(b As PKVector2) As PKVector2
		  ///
		  ' Solves the system of linear equations:
		  '
		  ' ```
		  ' Ax = b
		  ' Multiply by A⁻¹ on both sides
		  ' x = A⁻¹b
		  ' ```
		  ' - Parameter b: The b PKVector2.
		  '
		  ' - Returns: A new PKVector2.
		  ///
		  
		  // Get the determinant.
		  Var det As Double = Self.Determinant
		  
		  // Check for zero determinant.
		  If Abs(det) > Epsilon.E Then det = 1.0 / det
		  
		  Var r As PKVector2 = New PKVector2
		  r.X = det * (Self.M11 * b.X - Self.M01 * b.Y)
		  r.Y = det * (Self.M00 * b.Y - Self.M10 * b.X)
		  
		  Return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5375627472616374732074686520676976656E204D617472697832322066726F6D2074686973204D617472697832322C2072657475726E696E672074686973204D617472697832322E
		Function Subtract(matrix As PhysicsKit.Matrix22) As PhysicsKit.Matrix22
		  ///
		  ' Subtracts the given Matrix22 from this Matrix22, returning this Matrix22.
		  '
		  ' ` Self = Self - m`
		  '
		  ' - Parameter matrix: The Matrix22 to subtract.
		  '
		  ' - Returns: This Matrix22.
		  ///
		  
		  Self.M00 = Self.M00 - matrix.M00
		  Self.M01 = Self.M01 - matrix.M01
		  Self.M10 = Self.M10 - matrix.M10
		  Self.M11 = Self.M11 - matrix.M11
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sum(matrix As PhysicsKit.Matrix22) As PhysicsKit.Matrix22
		  ///
		  ' Returns a new Matrix22 that is the sum of this Matrix22 and the given Matrix22.
		  '
		  ' `r = this + m`
		  '
		  ' - Parameter matrix: The Matrix22 to add.
		  '
		  ' - Returns: A new Matrix22 containing the result.
		  ///
		  
		  // Make a copy of this matrix and perform the addition.
		  Return Self.Copy.Add(matrix)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F662074686973206D61747269782E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this matrix.
		  ///
		  
		  Var s() As String
		  
		  s.AddRow("[")
		  s.AddRow(Self.M00.ToString)
		  s.AddRow(" ")
		  s.AddRow(Self.M01.ToString)
		  s.AddRow("][")
		  s.AddRow(Self.M10.ToString)
		  s.AddRow(" ")
		  s.AddRow(Self.M11.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transpose() As PhysicsKit.Matrix22
		  ///
		  ' Sets this Matrix22 to the transpose of this Matrix22 and returns this Matrix22.
		  '
		  ' - Returns: This Matrix22.
		  ///
		  
		  Var m As Double = Self.M01
		  Self.M01 = Self.M10
		  Self.M10 = m
		  
		  Return Self
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Represents a 2x2 Matrix.
		Used to solve 2x2 systems of equations.
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420302C302E
		M00 As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420302C312E
		M01 As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420312C302E
		M10 As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420312C312E
		M11 As Double
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="M00"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="M01"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="M10"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="M11"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
