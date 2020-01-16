#tag Module
Protected Module Maths
	#tag Method, Flags = &h1, Description = 496E697469616C69736573207368617265642070726F706572746965732E20496E7465726E616C207573652E
		Protected Sub Initialise()
		  ///
		  ' Initialises shared properties. Internal use.
		  ///
		  
		  m180_OVER_PI = 180 / PI
		  mPI_OVER_180 = PI / 180
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320746865207061737365642072616469616E732076616C756520696E20646567726565732E
		Protected Function ToDegrees(radians As Double) As Double
		  ///
		  ' Returns the passed radians value in degrees.
		  ' 
		  ' - Parameter radians: The value to convert
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return radians * m180_OVER_PI
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E73207468652073706563696669656420616E676C6520696E2072616469616E7320696E20646567726565732E
		Protected Function ToRadians(degrees As Double) As Double
		  ///
		  ' Returns the specified angle in radians in degrees.
		  ' 
		  ' - Parameter degrees: The angle in degrees.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return degrees * mPI_OVER_180
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21, Description = 5072652D63616C63756C617465642076616C7565206F6620313830202F20CF802E2055736564207768656E20636F6E76657274696E672072616469616E7320746F20646567726565732E
		Private m180_OVER_PI As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPI_OVER_180 As Double
	#tag EndProperty


	#tag Constant, Name = PI, Type = Double, Dynamic = False, Default = \"3.14159265359", Scope = Protected
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
End Module
#tag EndModule
