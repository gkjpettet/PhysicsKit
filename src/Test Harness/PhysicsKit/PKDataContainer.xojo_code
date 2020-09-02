#tag Interface
Protected Interface PKDataContainer
	#tag Method, Flags = &h0, Description = 476574732074686520637573746F6D207573657220646174612E2057696C6C2072657475726E204E696C206966206E6F74207365742E
		Function GetUserData() As Variant
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686520637573746F6D2075736572206461746120746F2074686520676976656E20646174612E
		Sub SetUserData(data As Variant)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Represents an object that can store an arbitrary user data object.
		
	#tag EndNote


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
End Interface
#tag EndInterface
