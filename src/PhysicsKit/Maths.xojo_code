#tag Module
Protected Module Maths
	#tag Method, Flags = &h1, Description = 52657475726E732074686520666972737420617267756D656E74207769746820746865207369676E206F6620746865207365636F6E6420666C6F6174696E672D706F696E7420617267756D656E74
		Protected Function CopySign(magnitude As Double, sign As Double) As Double
		  ///
		  ' Returns the first argument with the sign of the second floating-point argument.
		  '
		  ' - Parameter magnitude: The parameter providing the magnitude of the result.
		  ' - Parameter sign: The parameter providing the sign of the result.
		  '
		  ' - Returns: A value with the magnitude of `magnitude` and the sign of `sign`.
		  ///
		  
		  Return If(sign < 0, -Abs(magnitude), Abs(magnitude))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 496E697469616C69736573207368617265642070726F706572746965732E20496E7465726E616C207573652E
		Protected Sub Initialise()
		  ///
		  ' Initialises shared properties. Internal use.
		  ///
		  
		  m180_OVER_PI = 180 / PI
		  mPI_OVER_180 = PI / 180
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320547275652069662074686520737065636966696564206E756D6265722069732061204E6F742D612D4E756D62657220284E614E292076616C75652E
		Protected Function IsNan(v As Double) As Boolean
		  ///
		  ' Returns True if the specified number is a Not-a-Number (NaN) value.
		  '
		  ' - Parameter v: The value to be tested.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return v <> v
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320746865207369676E756D2066756E6374696F6E206F662074686520617267756D656E743B207A65726F2069662074686520617267756D656E74206973207A65726F2C20312E302069662074686520617267756D656E742069732067726561746572207468616E207A65726F2C202D312E302069662074686520617267756D656E74206973206C657373207468616E207A65726F2E
		Protected Function Signum(d As Double) As Double
		  ///
		  ' Returns the signum function of the argument; zero if the argument
		  ' is zero, 1.0 if the argument is greater than zero, -1.0 if the
		  ' argument is less than zero.
		  '
		  ' <p>Special Cases:
		  ' - If the argument is NaN, then the result is NaN.
		  ' - If the argument is positive zero or negative zero, then the
		  '   result is the same as the argument.
		  '
		  ' - Parameter d: The value whose signum is to be returned.
		  '
		  '- Returns: The signum function of the argument.
		  ///
		  
		  Return If(d = 0.0 Or IsNaN(d), d, CopySign(1.0, d))
		End Function
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
