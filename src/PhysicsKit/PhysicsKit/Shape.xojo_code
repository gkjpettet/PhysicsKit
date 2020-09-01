#tag Interface
Protected Interface Shape
Implements PhysicsKit.DataContainer,PKTransformable
	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E20706F696E742028776F726C642073706163652920697320696E736964652074686973206C696E6B2053686170652E2049662074686520676976656E20706F696E74206C696573206F6E20616E20656467652074686520706F696E7420697320636F6E7369646572656420746F20626520696E7369646520746865206C696E6B2053686170652E
		Function Contains(point As PKVector2) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E20706F696E742028776F726C642073706163652920697320696E7369646520746869732053686170652E2049662074686520676976656E20706F696E74206C696573206F6E20616E20656467652074686520706F696E7420697320636F6E7369646572656420746F20626520696E73696465207468652053686170652E
		Function Contains(point As PKVector2, transform As PKTransform) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E20414142422066726F6D20746869732053686170652E
		Function CreateAABB() As PKAABB
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E20414142422066726F6D2074686973205368617065206166746572206170706C79696E672074686520676976656E207472616E73666F726D6174696F6E20746F207468652073686170652E
		Function CreateAABB(transform As PKTransform) As PKAABB
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061204D617373206F626A656374207573696E67207468652067656F6D65747269632070726F70657274696573206F66207468697320536861706520616E642074686520676976656E2064656E7369747920286B672F6D32292E
		Function CreateMass(density As Double) As PhysicsKit.Mass
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652063656E7465722F63656E74726F6964206F662074686520536861706520696E206C6F63616C20636F6F7264696E617465732E
		Function GetCenter() As PKVector2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520756E69717565206964656E74696669657220666F72207468697320736861706520696E7374616E63652E20446570726563746165643A20494420736368656D65732073686F756C6420626520696D706C656D656E746564206279207468652075736572207768657265206E65656465642E
		Function GetID() As PhysicsKit.UUID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D6178696D756D20726164697573206F66207468652073686170652066726F6D207468652063656E7465722E
		Function GetRadius() As Double
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520726164697573206F66207468652073686170652069662074686520676976656E20706F696E7420776173207468652063656E74657220666F7220746869732073686170652E
		Function GetRadius(center As PKVector2) As Double
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 20526F7461746573207468652053686170652061626F757420697427732063656E7465722E2054686973206D6574686F64207265706C6163656420746865206F766572726964696E672066756E6374696F6E616C697479206F662074686520526F74617465206D6574686F642066726F6D2074686520205472616E73666F726D61626C6520696E746572666163652E
		Function Project(vector As PKVector2) As PhysicsKit.Interval
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520496E74657276616C206F6620746869732053686170652070726F6A6563746564206F6E746F2074686520676976656E20566563746F723220676976656E20746865205472616E73666F726D2E
		Function Project(vector As PKVector2, transform As PKTransform) As PhysicsKit.Interval
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 20526F7461746573207468652053686170652061626F757420697427732063656E7465722E2054686973206D6574686F64207265706C6163656420746865206F766572726964696E672066756E6374696F6E616C697479206F662074686520526F74617465206D6574686F642066726F6D20746865205472616E73666F726D61626C6520696E746572666163652E
		Sub RotateAboutCenter(theta As Double)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Represents a geometric shape.
		The `Shape` class implements the `Transformable` interface and modifies the 
		internal state of the `Shape` directly (translating the vertices for example).
		The various implementing classes may allow mutation of the shape indirectly by returning
		mutable objects.  It's recommended that a `Shape`, after creation and use, remain
		unchanged and instead be replaced with a new `Shape` if modification is necessary.
		
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
