#tag Interface
Protected Interface HullGenerator
	#tag Method, Flags = &h0
		Function Generate(points() As PhysicsKit.Vector2) As PhysicsKit.Vector2()
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Represents an algorithm used to create a convex hull of a given point set.
		
		The hulls are returned as Vector2 arrays that can then be used to create a Convex Shape.
		
		Algorithms implementing this interface are intended for general use but does not imply that
		the results produced would be appropriate for the core PhysicsKit engine.
		
		Generate(ParamArray points As Vector2) As Vector2()
		---------------------------------------------------
		Returns a convex hull generated from the given point set in counter-clockwise point order.
		Returns Nil if the given points array is Nil.
		Returns the array unchanged if the length is less than or equal to 2.
		- Parameter points: The point set or cloud.
		- Returns: The convex hull vertices as a Vector2 array.
		- Raises: NilObjectException if points is Nil or contains Nil points.
		
	#tag EndNote


End Interface
#tag EndInterface
