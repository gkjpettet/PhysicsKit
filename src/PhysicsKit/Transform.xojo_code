#tag Class
Protected Class Transform
	#tag Method, Flags = &h0, Description = 44656661756C74207075626C696320636F6E7374727563746F722E
		Sub Constructor()
		  ///
		  ' Default public constructor.
		  ///
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E697469616C69736573207368617265642070726F706572746965732E
		Shared Sub Initialise()
		  ///
		  ' Initialises shared properties.
		  ///
		  
		  mIDENTITY = New Transform
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 54686520636F73696E65206F662074686520726F746174696F6E20616E676C652E
		Cost As Double = 1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIDENTITY
			End Get
		#tag EndGetter
		Attributes( Deprecated = "Create your own instances of Transform instead." ) Shared IDENTITY As PhysicsKit.Transform
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared mIDENTITY As PhysicsKit.Transform
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652073696E65206F662074686520726F746174696F6E20616E676C652E
		Sint As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652058207472616E736C6174696F6E2E
		X As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652059207472616E736C6174696F6E2E
		Y As Double = 0
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
