#tag Class
Protected Class UUID
	#tag Method, Flags = &h0, Description = 437265617465732061206E65772055554944206F626A6563742077697468207468652073706563696669656420537472696E672076616C75652E
		Sub Constructor()
		  ///
		  ' Creates a new random UUID.
		  '
		  ' - Parameter useDeclares: If True then will attempt to use declares to 
		  '                          create the UUID (faster), otherwise will create 
		  '                          them manually.
		  '
		  ' - Returns: A new UUID object.
		  '
		  ' - Notes: 
		  '   Adapted from code by Kem Tekinay: https://forum.xojo.com/18029-native-uuid-generation/2018/01
		  ///
		  
		  Var useDeclares As Boolean = True
		  
		  Try
		    #If TargetMacOS
		      Soft Declare Function NSClassFromString Lib "Cocoa" (clsName As CFStringRef) As Ptr
		      Soft Declare Function UUID Lib "Cocoa" Selector "UUID" (clsRef As ptr) As Ptr
		      Soft Declare Function UUIDString Lib "Cocoa" Selector "UUIDString" (obj_id As Ptr) As CFStringRef
		      
		      Var classPtr As Ptr = NSClassFromString("NSUUID")
		      If classPtr = Nil Then
		        useDeclares = False
		      Else
		        Var NSUUID As Ptr = UUID(classPtr)
		        mValue = UUIDString(NSUUID)
		      End If
		      
		    #ElseIf TargetWindows
		      
		      Const kLibName = "rpcrt4"
		      
		      If Not System.IsFunctionAvailable("UuidCreate", kLibName) Then
		        useDeclares = False
		      ElseIf Not System.IsFunctionAvailable("UuidToStringA", kLibName) Then
		        useDeclares = False
		      Else
		        Soft Declare Function UUIDCreate Lib kLibName Alias "UuidCreate" (ByRef u As WindowsUUID ) As Integer
		        Soft Declare Function UUIDToString Lib kLibName Alias "UuidToStringA" (ByRef inUUID As WindowsUUID, ByRef outString As CString ) As Integer
		        
		        Var u As WindowsUUID
		        If UUIDCreate(u) <> 0 Then
		          useDeclares = False
		        Else
		          Var out As CString
		          If UUIDToString(u, out) <> 0 Then
		            useDeclares = False
		          Else
		            mValue = out
		            mValue = mValue.DefineEncoding(Encodings.UTF8)
		          End If
		        End If
		      End If
		      
		    #ElseIf TargetLinux
		      Const kLibName = "uuid"
		      
		      If Not System.IsFunctionAvailable("uuid_generate", kLibName) Then
		        useDeclares = False
		      ElseIf Not System.IsFunctionAvailable("uuid_unparse_upper", kLibName) Then
		        useDeclares = False
		      Else
		        Soft Declare Sub UUIDGenerate Lib kLibName Alias "uuid_generate" (ByRef u As LinuxUUID)
		        Soft Declare Sub UUIDUnparse Lib kLibName Alias "uuid_unparse_upper" (ByRef u As LinuxUUID, ByRef out As LinuxUUIDString)
		        
		        Var u As LinuxUUID
		        UUIDGenerate(u)
		        
		        Var out As LinuxUUIDString
		        UUIDUnparse(u, out)
		        
		        mValue = out.Data
		        mValue = mValue.DefineEncoding(Encodings.UTF8)
		      End If
		      
		    #ElseIf TargetIOS
		      Soft Declare Function NSClassFromString Lib "Foundation" (clsName As CFStringRef) As Ptr
		      Soft Declare Function UUID Lib "Foundation" Selector "UUID" (clsRef As ptr) As Ptr
		      Soft Declare Function UUIDString Lib "Foundation" Selector "UUIDString" (obj_id As Ptr) As CFStringRef
		      
		      Var classPtr As Ptr = NSClassFromString("NSUUID")
		      Var NSUUID As Ptr = UUID(classPtr)
		      mValue = UUIDString(NSUUID)
		    #Else
		      useDeclares = False
		    #EndIf
		    
		  Catch e As RuntimeException
		    useDeclares = False
		    If e IsA EndException Or e IsA ThreadEndException Then Raise e
		  End Try
		  
		  If Not useDeclares Then
		    // Fallback to manual creation.
		    // From http://www.cryptosys.net/pki/uuid-rfc4122.html
		    //
		    // Generate 16 random bytes (=128 bits).
		    // Adjust certain bits according to RFC 4122 section 4.4 as follows:
		    // - Set the four most significant bits of the 7th byte to 0100'B, so the high nibble is '4'
		    // - Set the two most significant bits of the 9th byte to 10'B, 
		    //   so the high nibble will be one of '8', '9', 'A', or 'B'.
		    // - Convert the adjusted bytes to 32 hexadecimal digits.
		    // - Add four hyphen '-' characters to obtain blocks of 8, 4, 4, 4 and 12 hex digits
		    // - Output the resulting 36-character string "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
		    //
		    
		    #Pragma BackgroundTasks False
		    #Pragma BoundsChecking False
		    #Pragma NilObjectChecking False
		    
		    MessageDialog.Show("Generating manually!")
		    
		    Var randomBytes As MemoryBlock = Crypto.GenerateRandomBytes(16)
		    randomBytes.LittleEndian = False
		    Var p As Ptr = randomBytes
		    
		    // Adjust byte 7.
		    Var value As Byte = p.Byte(6)
		    value = value And CType(&b00001111, Byte) // Turn off the first four bits.
		    value = value Or CType(&b01000000, Byte) // Turn on the second bit.
		    p.Byte(6) = value
		    
		    // Adjust byte 9.
		    value = p.Byte(8)
		    value = value And CType(&b00111111, Byte) // Turn off the first two bits.
		    value = value Or CType(&b10000000, Byte) // Turn on the first bit.
		    p.Byte(8) = value
		    
		    mValue = EncodeHex(randomBytes)
		    mValue = mValue.LeftB(8) + "-" + mValue.MidB(9, 4) + "-" + mValue.MidB(13, 4) + "-" + _
		    mValue.MidB(17, 4) + "-" + mValue.RightB(12)
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(obj As Variant) As Boolean
		  ///
		  ' Returns True if this UUID is considered equal to the passed object.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  If obj Is Nil Then Return False
		  If obj IsA UUID = False Then Return False
		  Return If(mValue.Compare(UUID(obj).Value, ComparisonOptions.CaseSensitive) = 0, True, False)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  ///
		  ' Returns this UUID as a String.
		  '
		  ' - Returns: String.
		  ///
		  
		  Return mValue
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mValue As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mValue
			End Get
		#tag EndGetter
		Value As String
	#tag EndComputedProperty


	#tag Structure, Name = LinuxUUID, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		Bytes1 As String * 4
		  Bytes2 As String * 2
		  Bytes3 As String * 2
		  Bytes4 As String * 2
		Bytes5 As String * 6
	#tag EndStructure

	#tag Structure, Name = LinuxUUIDString, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		Data As String * 36
		TrailingNull As String * 1
	#tag EndStructure

	#tag Structure, Name = WindowsUUID, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		Data1 As UInt32
		  Data2 As UInt16
		  Data3 As UInt16
		Data4 As String * 8
	#tag EndStructure


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
		#tag ViewProperty
			Name="Value"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
