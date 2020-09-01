#tag Interface
Protected Interface Convex
Implements PhysicsKit.Shape
	#tag Method, Flags = &h0, Description = 52657475726E7320616E206172726179206F662073657061726174696E67206178657320746F207465737420666F7220746869732073686170652E
		Function GetAxes(foci() As PKVector2, transform As PhysicsKit.Transform) As PKVector2()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestFeature(vector As PKVector2, transform As PhysicsKit.Transform) As PhysicsKit.Feature
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520706F696E7420666172746865737420696E2074686520646972656374696F6E206F662074686520676976656E20766563746F722E202049662074776F20706F696E74732061726520657175616C6C792064697374616E7420616C6F6E672074686520676976656E20766563746F722C20746865206669727374206F6E6520697320757365642E
		Function GetFarthestPoint(vector As PKVector2, transform As PhysicsKit.Transform) As PKVector2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320616E206172726179206F6620776F726C6420737061636520666F636920706F696E747320666F722063697263756C6172206375727665642065646765732E2052657475726E73204E696C2069662074686520536861706520686173207A65726F206375727665642065646765732E0A
		Function GetFoci(transform As PhysicsKit.Transform) As PKVector2()
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Represents a convex shape.
		
		A convex shape is a shape that, given a line, the line will only intersect at 
		most 2 non-coincident non-colinear edges.
		
		Working with convex shapes specifically allows collision detection algorithms to be very
		fast.  If non-convex shapes are required, they are typically handled by attaching multiple
		convex shapes together.
		
		GetAxes(foci() As Vectors, transform As Transform) As PKVector2()
		---------------------------------------------------------------
		Returns an array of separating axes to test for this shape.
		
		The `foci` parameter is an array of **circular** focal points of the other `Shape`.
		
		If foci points are given, this method will return the separating axes for this Shape's voronoi regions 
		also. The points in the foci array are assumed to be in world space.
		
		The returned axes are normalized and in world space.
		
		- Parameter foci: The world space points representing foci of curved Shapes. Can be Nil.
		- Parameter transform: The local to world space `Transform` of this `Convex Shape`.
		
		- Returns: An array of PKVector2 objects.
		
		- Raises: UnsupportedOperationException if this shape doesn't support this method.
		
		GetFoci(transform As Transform) As PKVector2()
		--------------------------------------------
		Returns an array of world space foci points for **circular** curved edges.
		
		This method returns Nil if the `Shape` has zero curved edges.
		
		The returned points are in world space.
		
		- Parameter transform: The local to world space `Transform` of this `Convex Shape`.
		
		- Returns: An array of PKVector2 objects.
		
		- Raises: UnsupportedOperationException if this shape doesn't support this method.
		
		GetFarthestFeature(vector As PKVector2, transform As Transform) As Feature
		------------------------------------------------------------------------
		Returns the `Feature farthest in the direction of the given vector.
		
		The returned feature is in world space.
		
		- Parameter vector: The direction.
		- Parameter transform: The local to world space `Transform` of this convex shape.
		
		- Returns: Feature.
		
		GetFarthestPoint(vector As PKVector2, transform As Transform) As PKVector2
		----------------------------------------------------------------------
		Returns the point farthest in the direction of the given vector.  If two points are 
		equally distant along the given vector, the first one is used.
		
		The returned point is in world space.
		
		- Parameter vector: The direction.
		- Parameter transform: The local to world space `Transform` of this convex shape.
		
		- Returns: PKVector2.
		
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
