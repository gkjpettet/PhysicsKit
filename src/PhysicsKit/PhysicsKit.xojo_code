#tag Module
Protected Module PhysicsKit
	#tag Method, Flags = &h1
		Protected Sub Initialise()
		  // Initialises the physics module including shared properties within classes.
		  // We could avoid initialise methods on these classes by making the shared properties 
		  // static but that would require us to use computed shared properties which I suspect are 
		  // slower than regular properties.
		  PKAbstractShape.Initialise
		  Ellipse.Initialise
		  Epsilon.Initialise
		  HalfEllipse.Initialise
		  RobustGeometry.Initialise
		  PKTransform.Initialise
		  PKVector2.Initialise
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
