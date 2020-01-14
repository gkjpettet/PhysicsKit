#tag Class
Protected Class Epsilon
	#tag Method, Flags = &h21
		Private Shared Function Compute() As Double
		  // Computes an approximation of machine epsilon.
		  
		  Var e As Double = 0.5
		  
		  While (1.0 + e > 1.0)
		    e = e * 0.5
		  Wend
		  
		  Return e
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // Hidden default constructor.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C207573652E20496E697469616C69736573207368617265642070726F706572746965732E
		Shared Sub Initialise()
		  ///
		  ' - Internal use. Initialises shared properties.
		  ///
		  
		  E_ = Compute
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return E_
			End Get
		#tag EndGetter
		Shared E As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared E_ As Double
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
