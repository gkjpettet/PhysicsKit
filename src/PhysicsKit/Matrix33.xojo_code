#tag Class
Protected Class Matrix33
	#tag Method, Flags = &h0, Description = 416464732074686520676976656E204D6174726978333320746F2074686973204D617472697833332C2072657475726E696E672074686973204D617472697833332E
		Function Add(matrix As PhysicsKit.Matrix33) As PhysicsKit.Matrix33
		  ///
		  ' Adds the given Matrix33 to this Matrix33, returning this Matrix33.
		  '
		  ' `Self = Self + m`
		  '
		  ' - Parameter matrix: The Matrix33 to add.
		  '
		  ' - Returns: This Matrix33.
		  ///
		  
		  Self.M00 = Self.M00 + matrix.M00 
		  Self.M01 = Self.M01 + matrix.M01 
		  Self.M02 = Self.M02 + matrix.M02
		  Self.M10 = Self.M10 + matrix.M10 
		  Self.M11 = Self.M11 + matrix.M11 
		  Self.M12 = Self.M12 + matrix.M12
		  Self.M20 = Self.M20 + matrix.M20 
		  Self.M21 = Self.M21 + matrix.M21 
		  Self.M22 = Self.M22 + matrix.M22
		  
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
		  '* `Matrix33(Double, Double, Double, Double, Double, Double, Double, Double, Double)` constructor.
		  '
		  '- Parameter values: The values array.
		  '
		  ' - Raises: NilObjectException if `values` is Nil.
		  ' - Raises: InvalidArgumentException if `values` does not have 9 elements.
		  ///
		  
		  If values Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_MATRIX_NIL_ARRAY)
		  If values.Count <> 9 Then Raise New OutOfBoundsException(Messages.GEOMETRY_MATRIX_INVALID_LENGTH_9)
		  Self.M00 = values(0)
		  Self.M01 = values(1)
		  Self.M02 = values(2)
		  Self.M10 = values(3)
		  Self.M11 = values(4)
		  Self.M12 = values(5)
		  Self.M20 = values(6)
		  Self.M21 = values(7)
		  Self.M22 = values(8)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(m00 As Double, m01 As Double, m02 As Double, m10 As Double, m11 As Double, m12 As Double, m20 As Double, m21 As Double, m22 As Double)
		  ///
		  ' Full constructor.
		  '
		  ' - Parameter m00: The element at 0,0.
		  ' - Parameter m01: The element at 0,1.
		  ' - Parameter m02: The element at 0,2.
		  ' - Parameter m10: The element at 1,0.
		  ' - Parameter m11: The element at 1,1.
		  ' - Parameter m12: The element at 1,2.
		  ' - Parameter m20: The element at 2,0.
		  ' - Parameter m21: The element at 2,1.
		  ' - Parameter m22: The element at 2,2.
		  ///
		  
		  Self.M00 = m00
		  Self.M01 = m01
		  Self.M02 = m02
		  Self.M10 = m10
		  Self.M11 = m11
		  Self.M12 = m12
		  Self.M20 = m20
		  Self.M21 = m21
		  Self.M22 = m22
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(matrix As PhysicsKit.Matrix33)
		  ///
		  ' Copy constructor.
		  '
		  ' - Parameter matrix: The Matrix33 to copy.
		  ///
		  
		  Self.M00 = matrix.M00 
		  Self.M01 = matrix.M01 
		  Self.M02 = matrix.M02
		  Self.M10 = matrix.M10 
		  Self.M11 = matrix.M11 
		  Self.M12 = matrix.M12
		  Self.M20 = matrix.M20 
		  Self.M21 = matrix.M21 
		  Self.M22 = matrix.M22
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy() As PhysicsKit.Matrix33
		  ///
		  ' Returns a copy of this Matrix33.
		  '
		  ' - Returns: A new Matrix33.
		  ///
		  
		  Return New Matrix33(Self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Determinant() As Double
		  ///
		  ' Returns the determinant of this Matrix33.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.M00 * Self.M11 * Self.M22 + _
		  Self.M01 * Self.M12 * Self.M20 + _
		  Self.M02 * Self.M10 * Self.M21 - _
		  Self.M20 * Self.M11 * Self.M02 - _
		  Self.M21 * Self.M12 * Self.M00 - _
		  Self.M22 * Self.M10 * Self.M01
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E6577204D6174726978333320746861742069732074686520646966666572656E6365206F662074686973204D6174726978333320616E642074686520676976656E204D617472697833332E
		Function Difference(matrix As PhysicsKit.Matrix33) As PhysicsKit.Matrix33
		  ///
		  ' Returns a new Matrix33 that is the difference of this Matrix33 and the given Matrix33.
		  '
		  ' `r = Self - m`
		  '
		  ' - Parameter matrix: The Matrix33 to subtract.
		  '
		  ' - Returns: A new Matrix33.
		  ///
		  
		  // Make a copy of this matrix and perform the subtraction.
		  Return Self.Copy.Subtract(matrix)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520706173736564206F626A65637420697320636F6E7369646572656420657175616C20746F2074686973204D617472697833332E
		Function Equals(obj As Variant) As Boolean
		  ///
		  ' Returns True if the passed object is considered equal to this Matrix33.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  If obj Is Nil Then Return False
		  If obj = Self Then Return True
		  If obj IsA Matrix33 Then
		    Var other As Matrix33 = Matrix33(obj)
		    If other.M00 = Self.m00 And _
		      other.M01 = Self.M01 And _
		      other.M02 = Self.M02 And _
		      other.M10 = Self.M10 And _
		      other.M11 = Self.M11 And _ 
		      other.M12 = Self.M12 And _ 
		      other.M20 = Self.M20 And _
		      other.M21 = Self.M21 And _
		      other.M22 = Self.M22 Then
		      Return True
		    End If
		  End If
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInverse() As PhysicsKit.Matrix33
		  ///
		  ' Returns a new Matrix33 containing the inverse of this Matrix33.
		  '
		  ' - Returns: A new Matrix33.
		  ///
		  
		  // Make a copy of this matrix and perform the inversion.
		  Return Self.Copy.Invert
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTranspose() As PhysicsKit.Matrix33
		  ///
		  ' Returns the the transpose of this Matrix33 in a new Matrix33.
		  '
		  ' - Returns: A new Matrix33.
		  ///
		  
		  Var rm As Matrix33 = New Matrix33
		  
		  rm.M00 = Self.M00
		  rm.M01 = Self.M10
		  rm.M02 = Self.M20
		  rm.M10 = Self.M01
		  rm.M11 = Self.M11
		  rm.M12 = Self.M21
		  rm.M20 = Self.M02
		  rm.M21 = Self.M12
		  rm.M22 = Self.M22
		  
		  Return rm
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Identity() As PhysicsKit.Matrix33
		  ///
		  ' Sets this Matrix33 to an identity Matrix33.
		  '
		  ' - Returns: This Matrix33.
		  ///
		  
		  Self.M00 = 1
		  Self.M01 = 0
		  Self.M02 = 0
		  Self.M10 = 0
		  Self.M11 = 1
		  Self.M12 = 0
		  Self.M20 = 0
		  Self.M21 = 0
		  Self.M22 = 1
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Invert() As PhysicsKit.Matrix33
		  ///
		  ' Performs the inverse of this Matrix33 and places the result in this Matrix33.
		  '
		  ' - Returns: This Matrix33.
		  //
		  
		  // Get the determinant.
		  Var det As Double = Self.determinant()
		  
		  // Check for zero determinant.
		  If Abs(det) > Epsilon.E Then det = 1.0 / det
		  
		  // Compute the cofactor determinants and apply the signs and transpose the matrix 
		  // and multiply by the inverse of the determinant.
		  Var m00 As Double =  det * (Self.M11 * Self.M22 - Self.M12 * Self.M21)
		  Var m01 As Double = -det * (Self.M01 * Self.M22 - Self.M21 * Self.M02) // actually m10 in the cofactor matrix
		  Var m02 As Double =  det * (Self.M01 * Self.M12 - Self.M11 * Self.M02) // actually m20 in the cofactor matrix
		  
		  Var m10 As Double = -det * (Self.M10 * Self.M22 - Self.M20 * Self.M12) // actually m01 in the cofactor matrix
		  Var m11 As Double =  det * (Self.M00 * Self.M22 - Self.M20 * Self.M02)
		  Var m12 As Double = -det * (Self.M00 * Self.M12 - Self.M10 * Self.M02) // actually m21 in the cofactor matrix
		  
		  Var m20 As Double =  det * (Self.M10 * Self.M21 - Self.M20 * Self.M11) // actually m02 in the cofactor matrix
		  Var m21 As Double = -det * (Self.M00 * Self.M21 - Self.M20 * Self.M01) // actually m12 in the cofactor matrix
		  Var m22 As Double =  det * (Self.M00 * Self.M11 - Self.M10 * Self.M01)
		  
		  Self.M00 = M00
		  Self.M01 = m01
		  Self.M02 = m02
		  Self.M10 = M10
		  Self.M11 = m11
		  Self.M12 = m12
		  Self.M20 = M20
		  Self.M21 = m21
		  Self.M22 = m22
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Multiply(scalar As Double) As PhysicsKit.Matrix33
		  ///
		  ' Multiplies this Matrix33 by the given scalar and places the result in this Matrix33.
		  '
		  ' ` Self = Self * scalar`
		  '
		  ' - Parameter scalar: The scalar to multiply by.
		  '
		  ' - Returns: This Matrix33.
		  ///
		  
		  Self.M00 = Self.M00 * scalar
		  Self.M01 = Self.M01 * scalar
		  Self.M02 = Self.M02 * scalar
		  Self.M10 = Self.M10 * scalar
		  Self.M11 = Self.M11 * scalar
		  Self.M12 = Self.M12 * scalar
		  Self.M20 = Self.M20 * scalar
		  Self.M21 = Self.M21 * scalar
		  Self.M22 = Self.M22 * scalar
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C6965732074686973204D617472697833332062792074686520676976656E206D6174726978204D617472697833332C2072657475726E696E672074686973204D617472697833332E
		Function Multiply(matrix As PhysicsKit.Matrix33) As PhysicsKit.Matrix33
		  ///
		  ' Multiplies this Matrix33 by the given matrix Matrix33, returning this Matrix33.
		  '
		  ' `Self = Self * m`
		  '
		  ' - Parameter matrix: The Matrix33 to subtract.
		  '
		  ' - Returns: This Matrix33.
		  ///
		  
		  Var m00 As Double = Self.M00
		  Var m01 As Double = Self.M01
		  Var m02 As Double = Self.M02
		  Var m10 As Double = Self.M10
		  Var m11 As Double = Self.M11
		  Var m12 As Double = Self.M12
		  Var m20 As Double = Self.M20
		  Var m21 As Double = Self.M21
		  Var m22 As Double = Self.M22
		  
		  // Row 1.
		  Self.M00 = m00 * matrix.M00 + m01 * matrix.M10 + m02 * matrix.M20
		  Self.M01 = m00 * matrix.M01 + m01 * matrix.M11 + m02 * matrix.M21
		  Self.M02 = m00 * matrix.M02 + m01 * matrix.M12 + m02 * matrix.M22
		  
		  // Row 2.
		  Self.M10 = m10 * matrix.M00 + m11 * matrix.M10 + m12 * matrix.M20
		  Self.M11 = m10 * matrix.M01 + m11 * matrix.M11 + m12 * matrix.M21
		  Self.M12 = m10 * matrix.M02 + m11 * matrix.M12 + m12 * matrix.M22
		  
		  // Row 3.
		  Self.M20 = m20 * matrix.M00 + m21 * matrix.M10 + m22 * matrix.M20
		  Self.M21 = m20 * matrix.M01 + m21 * matrix.M11 + m22 * matrix.M21
		  Self.M22 = m20 * matrix.M02 + m21 * matrix.M12 + m22 * matrix.M22
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C6965732074686973204D617472697833332062792074686520676976656E20566563746F723320616E6420706C616365732074686520726573756C7420696E2074686520676976656E20566563746F72332E
		Function Multiply(vector As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' Multiplies this Matrix33 by the given Vector3 and places the result in the given Vector3.
		  '
		  ' `v = Self * v`
		  '
		  ' - Parameter vector: The Vector3 to multiply.
		  '
		  ' - Returns: The passed Vector3 containing the result.
		  ///
		  
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  Var z As Double = vector.Z
		  vector.X = Self.M00 * x + Self.M01 * y + Self.M02 * z
		  vector.Y = Self.M10 * x + Self.M11 * y + Self.M12 * z
		  vector.Z = Self.M20 * x + Self.M21 * y + Self.M22 * z
		  
		  Return vector
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MultiplyT(vector As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' Multiplies the given Vector3 by this Matrix33 and places the result in the given Vector3.
		  '
		  ' `v = vT * Self`
		  '
		  ' - Parameter vector: The Vector3 to multiply.
		  '
		  ' - Returns: The passed Vector3 containing the result.
		  ///
		  
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  Var z As Double = vector.Z
		  
		  vector.X = Self.M00 * x + Self.M10 * y + Self.M20 * z
		  vector.Y = Self.M01 * x + Self.M11 * y + Self.M21 * z
		  vector.Z = Self.M02 * x + Self.M12 * y + Self.M22 * z
		  
		  Return vector
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Product(scalar As Double) As PhysicsKit.Matrix33
		  ///
		  ' Multiplies this Matrix33 by the given scalar returning a new Matrix33 containing the result.
		  '
		  ' `r = Self * scalar`
		  '
		  ' - Parameter scalar: The scalar to multiply by.
		  '
		  ' - Returns: A new Matrix33.
		  ///
		  
		  // Make a copy of this matrix and perform the scalar multiplication.
		  Return Self.Copy.Multiply(scalar)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Product(matrix As PhysicsKit.Matrix33) As PhysicsKit.Matrix33
		  ///
		  ' Returns a new Matrix33 that is the product of this Matrix33 and the given Matrix33.
		  '
		  ' `r = Self * m`
		  '
		  ' - Parameter matrix: The Matrix33 to multiply.
		  '
		  ' - Returns: A new Matrix33.
		  ///
		  
		  // Make a copy of this matrix and perform the multiplication.
		  Return Self.Copy.Multiply(matrix)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C6965732074686973204D617472697833332062792074686520676976656E20566563746F72332072657475726E696E672074686520726573756C7420696E2061206E657720566563746F72332E
		Function Product(vector As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' Multiplies this Matrix33 by the given Vector3 returning the result in a new Vector3.
		  '
		  ' `r = Self * v`
		  '
		  ' - Parameter vector: The Vector3 to multiply.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return Self.Multiply(vector.Copy)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProductT(vector As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' Multiplies the given  Vector3 by this Matrix33 returning the result in a new Vector3.
		  '
		  ' `r = vT * Self`
		  '
		  ' - Parameter vector: The Vector3 to multiply.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return Self.MultiplyT(vector.Copy)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536F6C76657320604178203D2062602072657475726E696E67206078602061732061206E657720566563746F72322E
		Function Solve22(b As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Solves the system of linear equations:
		  '
		  ' ```
		  ' Ax = b
		  ' Multiply by A⁻¹ on both sides
		  ' x = A¹b
		  ' ```
		  '
		  ' - Parameter b: The b Vector2.
		  ' - Returns: A new Vector2.
		  ///
		  
		  // Get the 2D determinant.
		  Var det As Double = Self.M00 * Self.M11 - Self.M01 * Self.M10
		  
		  // Check for zero determinant.
		  If Abs(det) > Epsilon.E Then det = 1.0 / det
		  
		  Var r As Vector2 = New Vector2
		  r.X = det * (Self.M11 * b.X - Self.M01 * b.Y)
		  r.Y = det * (Self.M00 * b.Y - Self.M10 * b.X)
		  
		  Return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536F6C76657320604178203D20626020616E642072657475726E7320607860206173206120566563746F72332E
		Function Solve33(b As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' Solves the system of linear equations:
		  '
		  ' ```
		  ' Ax = b
		  ' Multiply by A⁻¹ on both sides
		  ' x = A⁻¹b
		  ' ```
		  '
		  ' - Parameter b: The b Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  // Get the determinant.
		  Var det As Double = Self.Determinant
		  
		  // Check for zero determinant.
		  If Abs(det) > Epsilon.E Then det = 1.0 / det
		  
		  Var r As Vector3 = New Vector3
		  
		  Var m00 As Double =  Self.M11 * Self.M22 - Self.M12 * Self.M21
		  Var m01 As Double = -Self.M01 * Self.M22 + Self.M21 * Self.M02
		  Var m02 As Double =  Self.M01 * Self.M12 - Self.M11 * Self.M02
		  
		  Var m10 As Double = -Self.M10 * Self.M22 + Self.M20 * Self.M12
		  Var m11 As Double =  Self.M00 * Self.M22 - Self.M20 * Self.M02
		  Var m12 As Double = -Self.M00 * Self.M12 + Self.M10 * Self.M02
		  
		  Var m20 As Double =  Self.M10 * Self.M21 - Self.M20 * Self.M11
		  Var m21 As Double = -Self.M00 * Self.M21 + Self.M20 * Self.M01
		  Var m22 As Double =  Self.M00 * Self.M11 - Self.M10 * Self.M01
		  
		  r.X = det * (m00 * b.X + m01 * b.Y + m02 * b.Z)
		  r.Y = det * (m10 * b.X + m11 * b.Y + m12 * b.Z)
		  r.Z = det * (m20 * b.X + m21 * b.Y + m22 * b.Z)
		  
		  Return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5375627472616374732074686520676976656E204D617472697833332066726F6D2074686973204D617472697833332C2072657475726E696E672074686973204D617472697833332E
		Function Subtract(matrix As PhysicsKit.Matrix33) As PhysicsKit.Matrix33
		  ///
		  ' Subtracts the given Matrix33 from this Matrix33, returning this Matrix33.
		  '
		  ' `Self = Self - m`
		  '
		  ' - Parameter matrix: The Matrix33 to subtract.
		  '
		  ' - Returns: This Matrix33.
		  ///
		  
		  Self.M00 = Self.M00 - matrix.M00
		  Self.M01 = Self.M01 - matrix.M01
		  Self.M02 = Self.M02 - matrix.M02
		  Self.M10 = Self.M10 - matrix.M10
		  Self.M11 = Self.M11 - matrix.M11
		  Self.M12 = Self.M12 - matrix.M12
		  Self.M20 = Self.M20 - matrix.M20
		  Self.M21 = Self.M21 - matrix.M21
		  Self.M22 = Self.M22 - matrix.M22
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E6577204D617472697833332074686174206973207468652073756D206F662074686973204D6174726978333320616E642074686520676976656E204D617472697833332E
		Function Sum(matrix As PhysicsKit.Matrix33) As PhysicsKit.Matrix33
		  ///
		  ' Returns a new Matrix33 that is the sum of this Matrix33 and the given Matrix33.
		  '
		  ' ` r = Self + m`
		  '
		  ' - Parameter matrix: The Matrix33 to add.
		  '
		  ' - Returns: A new Matrix33.
		  ///
		  
		  // Make a copy of this matrix and perform the addition.
		  Return Self.Copy.Add(matrix)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F662074686973204D617472697833332E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Matrix33.
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  s.AddRow("[")
		  s.AddRow(Self.M00.ToString)
		  s.AddRow(" ")
		  s.AddRow(Self.M01.ToString)
		  s.AddRow(" ")
		  s.AddRow(Self.M02.ToString)
		  s.AddRow("][")
		  s.AddRow(Self.M10.ToString)
		  s.AddRow(" ")
		  s.AddRow(Self.M11.ToString)
		  s.AddRow(" ")
		  s.AddRow(Self.M12.ToString)
		  s.AddRow("][")
		  s.AddRow(Self.M20.ToString)
		  s.AddRow(" ")
		  s.AddRow(Self.M21.ToString)
		  s.AddRow(" ")
		  s.AddRow(Self.M22.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transpose() As PhysicsKit.Matrix33
		  ///
		  ' Sets this Matrix33 to the transpose of this Matrix33.
		  '
		  ' - Returns: This Matrix33.
		  ///
		  
		  Var s As Double
		  
		  // Switch 01 and 10.
		  s = Self.M01
		  Self.M01 = Self.M10
		  Self.M10 = s
		  
		  // Switch 02 and 20.
		  s = Self.M02
		  Self.M02 = Self.M20
		  Self.M20 = s
		  
		  // Switch 12 and 21.
		  s = Self.M12
		  Self.M12 = Self.M21
		  Self.M21 = s
		  
		  Return Self
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Represents a 3x3 Matrix.
		Used to solve 3x3 systems of equations.
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420302C302E
		M00 As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420302C312E
		M01 As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420302C322E
		M02 As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420312C302E
		M10 As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420312C312E
		M11 As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420312C322E
		M12 As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420322C302E
		M20 As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420322C312E
		M21 As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520656C656D656E7420617420322C322E
		M22 As Double
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
			Name="M02"
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
		#tag ViewProperty
			Name="M12"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="M20"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="M21"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="M22"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
