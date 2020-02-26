#tag Class
Protected Class LinkedVertex
	#tag Method, Flags = &h0
		Sub Constructor(point As PhysicsKit.Vector2)
		  ///
		  ' Minimal constructor.
		  '
		  ' - Parameter point: The point. Note this is a reference and is NOT copied.
		  ///
		  
		  Self.Point = point
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F662074686973206F626A6563742E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this LinkedVertex.
		  '
		  ' - Returns: String.
		  ///
		  
		  Return Self.Point.ToString
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Represents a vertex that is linked to its next and previous vertices.
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 546865206E657874207665727465782E
		NextVertex As PhysicsKit.LinkedVertex
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652076657274657820706F696E742E
		Point As PhysicsKit.Vector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652070726576696F7573207665727465782E
		PreviousVertex As PhysicsKit.LinkedVertex
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
			Name="Point"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
