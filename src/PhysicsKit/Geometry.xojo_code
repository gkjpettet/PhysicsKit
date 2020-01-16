#tag Class
Protected Class Geometry
	#tag Method, Flags = &h0, Description = 496E7465726E616C207573652E20496E7469616C69736573207368617265642070726F706572746965732E
		Shared Sub Initialise()
		  ///
		  ' Internal use. Intialises shared properties.
		  ///
		  
		  mTWO_PI = 2.0 * Maths.PI
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mTWO_PI As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTWO_PI
			End Get
		#tag EndGetter
		Shared TWO_PI As Double
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
