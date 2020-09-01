#tag Interface
Protected Interface Shiftable
	#tag Method, Flags = &h0, Description = 5472616E736C6174657320746865206F626A65637420746F206D617463682074686520676976656E20636F6F7264696E6174652073686966742E
		Sub Shift(shift As PKVector2)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Represents an object that can be shifted in the x and y plane.
		
		Shifting is defined as repositioning for better accuracy. In floating point as an
		object's position drifts farther from the origin, the accuracy of calculations begin to
		suffer. One way to mitigate this problem is to shift all coordinates back to a reasonable
		place. Classes that implement this interface support this process.
		
		
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
