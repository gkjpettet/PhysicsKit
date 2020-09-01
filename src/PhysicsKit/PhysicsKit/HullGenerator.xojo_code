#tag Interface
Protected Interface HullGenerator
	#tag Method, Flags = &h0
		Function Generate(points() As PKVector2) As PKVector2()
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Represents an algorithm used to create a convex hull of a given point set.
		
		The hulls are returned as PKVector2 arrays that can then be used to create a Convex Shape.
		
		Algorithms implementing this interface are intended for general use but does not imply that
		the results produced would be appropriate for the core PhysicsKit engine.
		
		Generate(ParamArray points As PKVector2) As PKVector2()
		---------------------------------------------------
		Returns a convex hull generated from the given point set in counter-clockwise point order.
		Returns Nil if the given points array is Nil.
		Returns the array unchanged if the length is less than or equal to 2.
		- Parameter points: The point set or cloud.
		- Returns: The convex hull vertices as a PKVector2 array.
		- Raises: NilObjectException if points is Nil or contains Nil points.
		
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
