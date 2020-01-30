#tag Module
Protected Module DoubleConstants
	#tag ComputedProperty, Flags = &h1, Description = 426974206D61736B20746F2069736F6C61746520746865206578706F6E656E74206669656C64206F66206120446F75626C652E
		#tag Getter
			Get
			  ///
			  ' Bit mask to isolate the exponent field of a Double.
			  ///
			  
			  Return &h7FF0000000000000
			End Get
		#tag EndGetter
		Protected EXP_BIT_MASK As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1, Description = 546865206578706F6E656E742074686520736D616C6C65737420706F73697469766520446F75626C65207375626E6F726D616C2076616C756520776F756C64206861766520696620697420636F756C64206265206E6F726D616C697A65642E
		#tag Getter
			Get
			  ///
			  ' The exponent the smallest positive Double subnormal value would have if it could be normalized.
			  ///
			  
			  Return MIN_EXPONENT - (SIGNIFICAND_WIDTH - 1)
			End Get
		#tag EndGetter
		Protected MIN_SUB_EXPONENT As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  ///
			  ' Bit mask to isolate the sign bit of a Double.
			  ///
			  
			  Return &h8000000000000000
			  
			End Get
		#tag EndGetter
		Protected SIGNIF_BIT_MASK As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1, Description = 426974206D61736B20746F2069736F6C61746520746865207369676E20626974206F66206120446F75626C652E
		#tag Getter
			Get
			  ///
			  ' Bit mask to isolate the sign bit of a Double.
			  ///
			  
			  Return &h8000000000000000
			  
			End Get
		#tag EndGetter
		Protected SIGN_BIT_MASK As UInt64
	#tag EndComputedProperty


	#tag Constant, Name = EXP_BIAS, Type = Double, Dynamic = False, Default = \"1023", Scope = Protected, Description = 42696173207573656420696E20726570726573656E74696E67206120446F75626C65206578706F6E656E742E
	#tag EndConstant

	#tag Constant, Name = MAX_EXPONENT, Type = Double, Dynamic = False, Default = \"1023", Scope = Protected, Description = 4D6178696D756D206578706F6E656E7420612066696E69746520446F75626C65207661726961626C65206D617920686176652E20497420697320657175616C20746F207468652076616C75652072657475726E656420627920604D617468732E4765744578706F6E656E7428446F75626C65436F6E7374616E74732E4D41585F56414C554529602E
	#tag EndConstant

	#tag Constant, Name = MIN_EXPONENT, Type = Double, Dynamic = False, Default = \"-1022", Scope = Protected, Description = 4D696E696D756D206578706F6E656E742061206E6F726D616C697A656420446F75626C65207661726961626C65206D617920686176652E2020497420697320657175616C20746F207468652076616C75652072657475726E656420627920604D617468732E4765744578706F6E656E7428446F75626C65436F6E7374616E74732E4D494E5F4E4F524D414C29602E
	#tag EndConstant

	#tag Constant, Name = SIGNIFICAND_WIDTH, Type = Double, Dynamic = False, Default = \"53", Scope = Protected, Description = 546865206E756D626572206F66206C6F676963616C206269747320696E20746865207369676E69666963616E64206F66206120446F75626C65206E756D6265722C20696E636C7564696E672074686520696D706C69636974206269742E
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
