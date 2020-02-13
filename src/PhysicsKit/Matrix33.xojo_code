#tag Class
Protected Class Matrix33
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
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
