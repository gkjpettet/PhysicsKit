#tag Class
Protected Class Transform
Implements PhysicsKit.Transformable
	#tag Method, Flags = &h0, Description = 44656661756C74207075626C696320636F6E7374727563746F722E
		Sub Constructor()
		  ///
		  ' Default public constructor.
		  ///
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5072697661746520636F6E7374727563746F7220666F7220736F6D6520636F707920616E6420696E7465726E616C206F7065726174696F6E732E
		Private Sub Constructor(cost As Double, sint As Double, x As Double, y As Double)
		  ///
		  ' Private constructor for some copy and internal operations.
		  '
		  ' - Parameter cost: The cosine.
		  ' - Parameter sint: The negative sine.
		  ' - Parameter x: The x translation.
		  ' - Parameter y: The y translation.
		  ///
		  
		  Self.Cost = cost
		  Self.Sint = sint
		  Self.X = x
		  Self.Y = y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5075626C696320636F707920636F6E7374727563746F722E
		Sub Constructor(t As PhysicsKit.Transform)
		  ///
		  ' Public copy constructor.
		  '
		  ' - Parameter t: The transform to copy.
		  ///
		  
		  Self.Cost = t.Cost
		  Self.Sint = t.Sint
		  Self.X = t.X
		  Self.Y = t.Y
		  
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

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double)
		  // Part of the PhysicsKit.Rotatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double, x As Double, y As Double)
		  // Part of the PhysicsKit.Rotatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double, point As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Rotatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation)
		  // Part of the PhysicsKit.Rotatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation, x As Double, y As Double)
		  // Part of the PhysicsKit.Rotatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation, point As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Rotatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F662074686973205472616E73666F726D20696E2074686520666F726D61743A20225B636F73742073696E74207C2078205D5B73696E7420636F7374207C2079205D222E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Transform in the format: 
		  ' "[cost sint | x ][sint cost | y ]".
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  s.AddRow("[")
		  s.AddRow(Self.Cost.ToString)
		  s.AddRow(" ")
		  Var negSint As Double = -Self.Sint
		  s.AddRow(negSint.ToString)
		  s.AddRow(" | ")
		  s.AddRow(Self.X.ToString)
		  s.AddRow("]")
		  s.AddRow("[")
		  s.AddRow(Self.Sint.ToString)
		  s.AddRow(" ")
		  s.AddRow(Self.Cost.ToString)
		  s.AddRow(" | ")
		  s.AddRow(Self.Y.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(x As Double, y As Double)
		  // Part of the PhysicsKit.Translatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(vector As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Translatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
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
