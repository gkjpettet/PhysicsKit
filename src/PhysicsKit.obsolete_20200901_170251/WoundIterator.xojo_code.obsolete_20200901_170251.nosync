#tag Class
Protected Class WoundIterator
Implements Iterator
	#tag Method, Flags = &h0
		Sub Constructor(vectors() As PhysicsKit.Vector2)
		  ///
		  ' Minimal constructor.
		  '
		  ' - Parameter vectors: The array to iterate over.
		  ///
		  
		  Self.Vectors = vectors
		  Self.Index = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoveNext() As Boolean
		  ///
		  ' - Note: Part of the Iterator interface.
		  ///
		  
		  Return index < Vectors.Count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value() As Variant
		  ///
		  ' - Note: Part of the Iterator interface.
		  ///
		  
		  If Index >= Vectors.Count Then Raise New OutOfBoundsException
		  
		  Var v As Vector2 = Vectors(index)
		  index = index + 1
		  Return v.Copy
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Represents an iterator of Vector2s for the vertices and normals of a Wound shape.
		
		
	#tag EndNote


	#tag Property, Flags = &h1, Description = 5468652063757272656E7420696E6465782E
		Protected index As Integer
	#tag EndProperty

	#tag Property, Flags = &h1, Description = 54686520617272617920746F2069746572617465206F7665722E
		Protected vectors() As PhysicsKit.Vector2
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
	#tag EndViewBehavior
End Class
#tag EndClass
