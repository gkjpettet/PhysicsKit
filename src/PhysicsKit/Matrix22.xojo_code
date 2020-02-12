#tag Class
Protected Class Matrix22
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
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
