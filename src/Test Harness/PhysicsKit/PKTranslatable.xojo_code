#tag Interface
Protected Interface PKTranslatable
	#tag Method, Flags = &h0, Description = 5472616E736C6174657320746865206F626A6563742074686520676976656E20616D6F756E747320696E20746865207265737065637469766520646972656374696F6E732E
		Sub Translate(x As Double, y As Double)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E736C6174657320746865206F626A65637420616C6F6E672074686520676976656E20766563746F722E
		Sub Translate(vector As PKVector2)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Represents an object that can be translated or moved in the x-y plane.
		
		Translate(x As Double, y As Double)
		-----------------------------------
		Translates the object the given amounts in the respective directions.
		- Parameter x: The translation in the X direction.
		- Parameter y: The translation in the Y direction.
		
		Translate(vector As PKVector2)
		----------------------------
		Translates the object along the given vector.
		- Parameter vector: The translation along a vector.
		
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
