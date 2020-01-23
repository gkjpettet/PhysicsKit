#tag Class
Protected Class AABB
Implements PhysicsKit.Translatable
	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E
		Sub Constructor(radius As Double)
		  ///
		  ' Full constructor.
		  '
		  ' - Parameter radius: The radius of a circle fitting inside an AABB.
		  ///
		  
		  Constructor(Nil, radius)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E
		Sub Constructor(minX As Double, minY As Double, maxX As Double, maxY As Double)
		  ///
		  ' Full constructor.
		  ' 
		  ' - Parameter minX: The minimum x extent.
		  ' - Parameter minY: The minimum y extent.
		  ' - Parameter maxX: The maximum x extent.
		  ' - Parameter maxY: The maximum y extent.
		  '
		  ' - Throws: InvalidArgumentException if minX or minY are greater than the permitted maximum.
		  ///
		  
		  // Check the min and max.
		  If minX > maxX Or minY > maxY Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_AABB_INVALID_MIN_MAX)
		  End If
		  
		  Self.MinX = minX
		  Self.MinY = minY
		  Self.MaxX = maxX
		  Self.MaxY = maxY
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F707920636F6E7374727563746F722E
		Sub Constructor(aabb As PhysicsKit.AABB)
		  ///
		  ' Copy constructor.
		  '
		  ' - Parameter aabb: The AABB to copy.
		  ///
		  
		  Self.MinX = aabb.MinX
		  Self.MinY = aabb.MinY
		  Self.MaxX = aabb.MaxX
		  Self.MaxY = aabb.MaxY
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E204141424220666F72206120636972636C6520776974682074686520676976656E2063656E74657220616E64207261646975732E
		Sub Constructor(center As PhysicsKit.Vector2, radius As Double)
		  ///
		  ' Full constructor.
		  ' Creates an AABB for a circle with the given center and radius.
		  '
		  ' - Parameter center: The center of the circle.
		  ' - Parameter radius: The radius of the circle.
		  '
		  ' - Throws: InvalidArgumentException if the given radius is less than zero.
		  ///
		  
		  If radius < 0 Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_AABB_INVALID_RADIUS)
		  End If
		  
		  If center Is Nil Then
		    Self.MinX = -radius
		    Self.MinY = -radius
		    Self.MaxX =  radius
		    Self.MaxY =  radius
		  Else
		    Self.MinX = center.X - radius
		    Self.MinY = center.Y - radius
		    Self.MaxX = center.X + radius
		    Self.MaxY = center.Y + radius
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E
		Sub Constructor(min As PhysicsKit.Vector2, max As PhysicsKit.Vector2)
		  ///
		  ' Full constructor.
		  '
		  ' - Parameter min: The minimum extent.
		  ' - Parameter max: The maximum extent.
		  '
		  ' - Throws: InvalidArgumentException if either coordinate of the given min is greater 
		  '           than the given max.
		  ///
		  
		  Constructor(min.X, min.Y, max.X, max.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120636F7079206F66207468697320414142422E
		Function Copy() As PhysicsKit.AABB
		  ///
		  ' Returns a copy of this AABB.
		  '
		  ' - Returns: A new AABB.
		  ///
		  
		  Return New AABB(Self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573207468652076616C6964204141424220646566696E6564206279207468652074776F20706F696E74733A204128706F696E7431782C20706F696E7431792920616E64204228706F696E7432782C20706F696E743279292E
		Shared Function CreateAABBFromPoints(point1X As Double, point1Y As Double, point2X As Double, point2Y As Double) As PhysicsKit.AABB
		  ///
		  ' Creates the valid AABB defined by the two points: A(point1x, point1y) and B(point2x, point2y).
		  '
		  ' - Parameter point1x: The x coordinate of point A.
		  ' - Parameter point1y: The y coordinate of point A.
		  ' - Parameter point2x: The x coordinate of point B.
		  ' - Parameter point2y: The y coordinate of point B.
		  '
		  ' - Returns: The one and only one valid AABB formed by A and B.
		  ///
		  
		  If point2x < point1x Then
		    Var temp As Double = point1x
		    point1x = point2x
		    point2x = temp
		  End If
		  
		  If point2y < point1y then
		    Var temp As double = point1y
		    point1y = point2y
		    point2y = temp
		  End If
		  
		  Return New AABB(point1x, point1y, point2x, point2y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573207468652076616C6964204141424220646566696E6564206279207468652074776F20706F696E74732060706F696E74316020616E642060706F696E7432602E
		Shared Function CreateAABBFromPoints(point1 As PhysicsKit.Vector2, point2 As PhysicsKit.Vector2) As PhysicsKit.AABB
		  ///
		  ' Creates the valid AABB defined by the two points `point1` and `point2`.
		  '
		  ' - Parameter point1: The first point.
		  ' - Parameter point2: The second point.
		  '
		  ' - Returns: The one and only one valid AABB formed by 'point1' and 'point2'.
		  ///
		  
		  Return CreateAABBFromPoints(point1.X, point1.Y, point2.X, point2.Y)
		  
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


	#tag Note, Name = About
		Implementation of an Axis-Aligned Bounding Box.
		
		An AABB has minimum and maximum coordinates that define the box.
		
		An AABB can be unioned or intersected with other AABBs to combine them into 
		another AABB. If an intersection produces no result, a degenerate AABB is returned.
		A degenerate AABB can be tested by the `IsDegenerate()` methods and 
		is defined as an AABB who's maximum and minimum are equal.
		
		AABBs can also be tested for overlap and (full) containment using the `Overlaps(AABB)`
		and `Contains(AABB)` method.
		
		The `Expand(Double)` method can be used to expand the bounds of the AABB by some amount.
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 546865206D6178696D756D20657874656E7420616C6F6E672074686520782D61786973
		MaxX As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D6178696D756D20657874656E7420616C6F6E672074686520792D61786973
		MaxY As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D696E696D756D20657874656E7420616C6F6E672074686520782D617869732E
		MinX As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D696E696D756D20657874656E7420616C6F6E672074686520792D61786973
		MinY As Double
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
		#tag ViewProperty
			Name="MinX"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
