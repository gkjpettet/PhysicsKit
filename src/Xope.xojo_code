#tag Module
Protected Module Xope
	#tag Method, Flags = &h1
		Protected Sub Initialise()
		  // Initialises the physics module including shared properties within classes.
		  
		  Maths.Initialise
		  
		  Epsilon.Initialise
		  Geometry.Initialise
		  Rotation.Initialise
		  Vector2.Initialise
		End Sub
	#tag EndMethod


End Module
#tag EndModule
