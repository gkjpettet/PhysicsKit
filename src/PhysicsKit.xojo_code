#tag Module
Protected Module PhysicsKit
	#tag Method, Flags = &h1
		Protected Sub Initialise()
		  // Initialises the physics module including shared properties within classes.
		  
		  Maths.Initialise
		  
		  Epsilon.Initialise
		  Geometry.Initialise
		  Rotation.Initialise
		  Transform.Initialise
		  Vector2.Initialise
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(Extends mt As PhysicsKit.MassTypes) As String
		  Select Case mt
		  Case MassTypes.FixedAngularVelocity
		    Return "Fixed Angular Velocity"
		  Case MassTypes.FixedLinearVelocity
		    Return "Fixed Linear Velocity"
		  Case MassTypes.Infinite
		    Return "Infinite"
		  Case MassTypes.Normal
		    Return "Normal"
		  Case Else
		    Return "Unknown mass type"
		  End Select
		End Function
	#tag EndMethod


	#tag Note, Name = MassTypes Enumeration
		An enumeration for special Mass types.
		
		Normal:
		Indicates a normal mass.
		
		Infinite:
		Indicates that the mass is infinite (rate of rotation and translation should not change)
		
		FixedAngularVelocity:
		Indicates that the mass's rate of rotation should not change.
		
		FixedLinearVelocity:
		Indicates that the mass's rate of translation should not change.
		
		
	#tag EndNote


	#tag Enum, Name = MassTypes, Type = Integer, Flags = &h1
		Normal
		  Infinite
		  FixedAngularVelocity
		FixedLinearVelocity
	#tag EndEnum


End Module
#tag EndModule
