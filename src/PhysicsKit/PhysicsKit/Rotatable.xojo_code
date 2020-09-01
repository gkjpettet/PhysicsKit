#tag Interface
Protected Interface Rotatable
	#tag Method, Flags = &h0, Description = 526F746174657320746865206F626A6563742061626F757420746865206F726967696E2062792074686520616E676C652073706563696669656420696E2072616469616E732E
		Sub Rotate(theta As Double)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F746174657320746865206F626A6563742061626F75742074686520676976656E20636F6F7264696E61746573206279207468652073706563696669656420616E676C6520696E6D2072616469616E732E
		Sub Rotate(theta As Double, x As Double, y As Double)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F746174657320746865206F626A6563742061626F75742074686520676976656E20706F696E742062792074686520616E676C652073706563696669656420696E2072616469616E732E
		Sub Rotate(theta As Double, point As PKVector2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F746174657320746865206F626A6563742061626F757420746865206F726967696E2062792074686520616D6F756E74207370656369666965642062792074686520526F746174696F6E20706172616D657465722E
		Sub Rotate(r As PhysicsKit.Rotation)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 20526F746174657320746865206F626A6563742061626F75742074686520676976656E20706F696E74206279207468652073706563696669656420726F746174696F6E20616D6F756E742E
		Sub Rotate(r As PhysicsKit.Rotation, x As Double, y As Double)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F746174657320746865206F626A6563742061626F75742074686520676976656E20706F696E74206279207468652073706563696669656420616D6F756E74206F6620726F746174696F6E2E
		Sub Rotate(r As PhysicsKit.Rotation, point As PKVector2)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Interface representing an object that can be rotated.
		
		Rotate(theta As Double)
		-----------------------
		Rotates the object about the origin by the angle specified in radians.
		- Parameter theta: The angle of rotation in radians.
		
		Rotate(r As Rotation)
		---------------------
		Rotates the object about the origin
		- Parameter r: The Rotation representing the rotation amount.
		
		Rotate(theta As Double, point As PKVector2)
		-----------------------------------------
		Rotates the object about the given point.
		- Parameter theta: The angle of rotation in radians.
		- Parameter point: The point to rotate about.
		
		Rotate(r As Rotation, point As PKVector2)
		---------------------------------------
		Rotates the object about the given point.
		- Parameter rotation: The Rotation representing the rotation amount.
		- Parameter point: The point to rotate about.
		
		Rotate(theta As Double, x As Double, y As Double)
		-------------------------------------------------
		Rotates the object about the given coordinates.
		- Parameter theta: The angle of rotation in radians.
		- Parameter x: The x coordinate to rotate about.
		- Parameter y: The y coordinate to rotate about.
		
		Rotate(r As Rotation, x As Double, y As Double)
		-----------------------------------------------
		Rotates the object about the given point.
		- Parameter r: The Rotation representing the rotation amount.
		- Parameter x: The x coordinate to rotate about.
		- Parameter y: The y coordinate to rotate about.
		
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
