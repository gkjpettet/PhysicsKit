#tag Class
Protected Class Rotation
	#tag Method, Flags = &h0, Description = 496E7465726E616C207573652E20496E697469616C69736573207368617265642070726F706572746965732E
		Shared Sub Initialise()
		  ///
		  ' Internal use. Initialises shared properties.
		  ///
		  
		  m_SQRT_2_INV = 1.0 / Sqrt(2)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 54686520636F73696E65206F662074686520616E676C6520646573637269626564206279207468697320526F746174696F6E2E
		Cost As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared m_SQRT_2_INV As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652073696E65206F662074686520616E676C6520646573637269626564206279207468697320526F746174696F6E2E
		Sint As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		Private Shared SQRT_2_INV As Double
	#tag EndComputedProperty


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
