#tag Class
Protected Class TestBounds
Inherits PKAbstractBounds
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(x As Double, y As Double)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(x, y)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(translation As PKVector2)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(translation)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsOutside(aabb As PKAABB) As Boolean
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsOutside(body As PKCollisionBody) As Boolean
		  Return False
		  
		End Function
	#tag EndMethod


End Class
#tag EndClass
