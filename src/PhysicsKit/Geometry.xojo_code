#tag Class
Protected Class Geometry
	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720436972636C6520776974682074686520676976656E207261646975732063656E7465726564206F6E20746865206F726967696E2E205468726F777320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function CreateCircle(radius As Double) As PhysicsKit.Circle
		  ///
		  ' Returns a new Circle with the given radius centered on the origin.
		  '
		  ' - Parameter radius: The radius in metres.
		  '
		  ' - Returns: A new Circle instance.'
		  ' 
		  ' - Throws: InvalidArgumentException if radius is less than or equal to zero.
		  ///
		  
		  Return New Circle(radius)
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = INV_3, Type = Double, Dynamic = False, Default = \"0.3333333333333333", Scope = Public
	#tag EndConstant

	#tag Constant, Name = INV_SQRT_3, Type = Double, Dynamic = False, Default = \"0.5773502691896258", Scope = Public, Description = 5468652076616C7565206F662074686520696E7665727365206F66207468652073717561726520726F6F74206F6620333A20312F53717274283329
	#tag EndConstant

	#tag Constant, Name = TWO_PI, Type = Double, Dynamic = False, Default = \"6.2831853071800001", Scope = Public, Description = 32202A20E2888F20636F6E7374616E74
	#tag EndConstant


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
