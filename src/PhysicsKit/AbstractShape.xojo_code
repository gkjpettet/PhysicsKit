#tag Class
Protected Class AbstractShape
Implements PhysicsKit.DataContainer, PhysicsKit.Shape, PhysicsKit.Transformable
	#tag Method, Flags = &h0, Description = 4D696E696D616C20636F6E7374727563746F722E
		Sub Constructor(radius As Double)
		  ///
		  ' Minimal constructor.
		  '
		  ' - Parameter radius: The rotation radius. Must be greater than zero.
		  '
		  ' - Throws: InvalidlArgumentException if radius is zero or less.
		  ///
		  
		  mID = UUID.RandomUUID
		  
		  Constructor(New Vector2, radius)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E
		Sub Constructor(center As PhysicsKit.Vector2, radius As Double)
		  ///
		  ' Full constructor.
		  '
		  ' - Parameter center: The center.
		  ' - Parameter radius: The rotation radius. Must be greater than zero.
		  '
		  ' - Throws: InvalidArgumentException if radius is zero or less.
		  ' - Throws: NilObjectException if center is Nil.
		  ///
		  
		  If mID Is Nil Then mID = UUID.RandomUUID
		  
		  Self.Center = center
		  Self.Radius = radius
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PhysicsKit.Vector2) As Boolean
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As Boolean
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB() As PhysicsKit.AABB
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB(transform As PhysicsKit.Transform) As PhysicsKit.AABB
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateMass(density As Double) As PhysicsKit.Mass
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCenter() As PhysicsKit.Vector2
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetID() As PhysicsKit.UUID
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius() As Double
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius(center As PhysicsKit.Vector2) As Double
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUserData() As Variant
		  // Part of the PhysicsKit.DataContainer interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E697469616C69736573207368617265642070726F706572746965732E
		Shared Sub Initialise()
		  ///
		  ' Intialises shared properties.
		  ///
		  
		  IDENTITY = New Transform
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PhysicsKit.Vector2) As PhysicsKit.Interval
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Interval
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
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

	#tag Method, Flags = &h0
		Sub RotateAboutCenter(theta As Double)
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetUserData(data As Variant)
		  // Part of the PhysicsKit.DataContainer interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
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


	#tag Property, Flags = &h0, Description = 5468652063656E746572206F6620746869732053686170652E
		Center As PhysicsKit.Vector2
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return mID
			End Get
		#tag EndGetter
		Private ID As UUID
	#tag EndComputedProperty

	#tag Property, Flags = &h21, Description = 4964656E74697479205472616E73666F726D20696E7374616E63652E
		Private Shared IDENTITY As PhysicsKit.Transform
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 546865207368617065277320756E69717565206964656E7469666965722E
		Private mID As UUID
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D6178696D756D207261646975732E
		Radius As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 437573746F6D20757365722064617461206F626A6563742E
		UserData As Variant
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
