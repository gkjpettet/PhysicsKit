#tag Class
Protected Class Segment
Inherits PhysicsKit.AbstractShape
Implements PhysicsKit.Convex, PhysicsKit.Wound
	#tag Method, Flags = &h21, Description = 56616C69646174656420636F6E7374727563746F722E20437265617465732061206E6577207365676D656E74207573696E672074686520676976656E20706F696E74732E20205468652063656E7465722077696C6C206265207468652061766572616765206F662074686520706F696E74732E
		Private Sub Constructor(valid As Boolean, vertices() As PhysicsKit.Vector2, segment As PhysicsKit.Vector2, length As Double)
		  ///
		  ' Validated constructor.
		  '
		  ' Creates a new segment using the given points.  The center will be the average of the points.
		  '
		  ' - Parameter valid: Always True or this constructor would not be called.
		  ' - Parameter point1: The first point.
		  ' - Parameter point2: The second point.
		  ///
		  
		  Super.Constructor(Geometry.GetAverageCenter(vertices), length * 0.5)
		  
		  // Assign the verices.
		  Self.Vertices = vertices
		  
		  // Create the normals.
		  Self.Normals.ResizeTo(1)
		  Self.Normals(0) = segment.Copy
		  Call Self.Normals(0).Normalise
		  Self.Normals(1) = segment.Right
		  Call Self.Normals(1).Normalise
		  
		  // Compute the length.
		  Self.Length = length
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577207365676D656E74207573696E672074686520676976656E20706F696E74732E20205468652063656E7465722077696C6C206265207468652061766572616765206F662074686520706F696E74732E2041207365676D656E74277320706F696E74732063616E6E6F74206265204E696C206F72207468652073616D6520706F696E742E205468726F77732E
		Sub Constructor(point1 As PhysicsKit.Vector2, point2 As PhysicsKit.Vector2)
		  ///
		  ' Full constructor.
		  '
		  ' Creates a new segment using the given points.  The center will be the average of the points.
		  ' A segment's points cannot be Nil or the same point.
		  '
		  ' - Parameter point1: The first point.
		  ' - Parameter point2: The second point.
		  '
		  ' - Throws: NilObjectException if `point1` or `point2` is Nil.
		  ' - Throws: InvalidArgumentException if `point1` = `point2`.
		  ///
		  
		  Constructor(Validate(point1, point2), Array(point1, point2), _
		  point1.Towards(point2), point1.Distance(point2))
		  
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
		Function GetAxes(foci() As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Vector2()
		  // Part of the PhysicsKit.Convex interface.
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
		Function GetFarthestFeature(vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Feature
		  // Part of the PhysicsKit.Convex interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652066617274686573742066656174757265206F6E2074686520676976656E207365676D656E742E20546869732077696C6C20616C776179732072657475726E20746865207365676D656E7420697473656C662C20627574206D7573742072657475726E20697420776974682074686520636F72726563742077696E64696E6720616E642074686520636F7272656374206D6178696D756D2E205468726F7773204E696C4F626A656374457863657074696F6E2E
		Shared Function GetFarthestFeature(v1 As PhysicsKit.Vector2, v2 As PhysicsKit.Vector2, vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.EdgeFeature
		  ///
		  ' Returns the farthest feature on the given segment.
		  '
		  ' This will always return the segment itself, but must return it with the correct winding
		  ' and the correct maximum.
		  '
		  ' - Parameter v1: The first segment vertex.
		  ' - Parameter v2: The second segment vertex.
		  ' - Parameter vector: The direction.
		  ' - Parameter transform: The local to world space Transform of this Convex Shape.
		  '
		  ' - Returns: New EdgeFeature.'
		  ' - Throws: NilObjectException if `v1`, `v2`, `vector`, or `transform` is Nil.
		  ///
		  
		  // The farthest feature for a line is always the line itself.
		  Var max As Vector2 = Nil
		  
		  // Get the vertices.
		  Var p1 As Vector2 = transform.GetTransformed(v1)
		  Var p2 As Vector2 = transform.GetTransformed(v2)
		  
		  // Project them onto the vector.
		  Var dot1 As Double = vector.Dot(p1)
		  Var dot2 As Double = vector.Dot(p2)
		  
		  // Find the greatest projection.
		  Var index As Integer = 0
		  If dot1 >= dot2 Then
		    max = p1
		    index = 0
		  Else
		    max = p2
		    index = 1
		  End If
		  
		  // Return the points of the segment in the opposite direction as the other shape.
		  Var vp1 As PointFeature = New PointFeature(p1, 0)
		  Var vp2 As PointFeature = New PointFeature(p2, 1)
		  Var vm As PointFeature = New PointFeature(max, index)
		  
		  // Make sure the edge is the right winding.
		  If p1.Towards(p2).Right.Dot(vector) > 0 Then
		    Return New EdgeFeature(vp2, vp1, vm, p2.Towards(p1), 0)
		  Else
		    Return New EdgeFeature(vp1, vp2, vm, p1.Towards(p2), 0)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestPoint(vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Vector2
		  // Part of the PhysicsKit.Convex interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520666172746865737420706F696E74206F6E2074686520676976656E207365676D656E742E205468726F7773204E696C4F626A656374457863657074696F6E2E
		Shared Function GetFarthestPoint(v1 As PhysicsKit.Vector2, v2 As PhysicsKit.Vector2, vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Vector2
		  ///
		  ' Returns the farthest point on the given segment.
		  '
		  ' - Parameter v1: The first point of the segment.
		  ' - Parameter v2: The second point of the segment.
		  ' - Parameter vector: The direction.
		  ' - Parameter transform: The local to world space Transform of this Convex Shape.
		  '
		  ' - Returns: A new Vector2.
		  '
		  ' - Throws: NilObjectException if `v1`, `v2`, `vector`, or `transform` is Nil.
		  ///
		  
		  // Get the vertices and the centre.
		  Var p1 As Vector2 = transform.GetTransformed(v1)
		  Var p2 As Vector2 = transform.GetTransformed(v2)
		  
		  // Project them onto the vector.
		  Var dot1 As Double = vector.Dot(p1)
		  Var dot2 As Double = vector.Dot(p2)
		  
		  // Find the greatest projection.
		  If dot1 >= dot2 Then
		    Return p1
		  Else
		    Return p2
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFoci(transform As PhysicsKit.Transform) As PhysicsKit.Vector2()
		  // Part of the PhysicsKit.Convex interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetID() As PhysicsKit.UUID
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206C656E677468206F6620746865206C696E65205365676D656E742E
		Function GetLength() As Double
		  ///
		  ' Returns the length of the line Segment.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Length
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206C696E6520696E74657273656374696F6E206F662074686520676976656E205365676D656E7420616E642074686973205365676D656E742E20417373756D6573207468617420626F7468207468697320616E642074686520676976656E207365676D656E742061726520696E207468652073616D652073706163652028656974686572206C6F63616C206F7220776F726C64207370616365292E204D61792072657475726E204E696C2E205468726F7773204E696C4F626A656374457863657074696F6E2E
		Function GetLineIntersection(segment As PhysicsKit.Segment) As PhysicsKit.Vector2
		  ///
		  ' Returns the line intersection of the given Segment and this Segment.
		  '
		  ' This method treats this segment and the given segment as defining **lines** rather than segments.
		  '
		  ' This method assumes that both this and the given segment are in the same space (either
		  ' local or world space).
		  '
		  ' - Parameter segment: The other segment.
		  ' 
		  ' - Returns: Vector2 or Nil if the lines are parallel or coincident.
		  '
		  ' - Throws: NilObjectException if the given segment is Nil.
		  ///
		  
		  Return Segment.GetLineIntersection(Self.Vertices(0), _
		  Self.Vertices(1), segment.Vertices(0), segment.Vertices(1))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520696E74657273656374696F6E20706F696E74206F66207468652074776F206C696E6573206F72204E696C20696620746865792061726520706172616C6C656C206F7220636F696E636964656E742E205468726F7773204E696C4F626A656374457863657074696F6E2E
		Shared Function GetLineIntersection(ap1 As PhysicsKit.Vector2, ap2 As PhysicsKit.Vector2, bp1 As PhysicsKit.Vector2, bp2 As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Returns the intersection point of the two lines or Nil if they are parallel or coincident.
		  '
		  ' If we let:
		  ' ```
		  ' A = Ap2 - Ap1
		  ' B = Bp2 - Bp1
		  ' ```
		  '
		  ' We can create two parametric equations:
		  ' ```
		  ' Q = Ap1 + taA
		  ' Q = Bp1 + tbB
		  ' ```
		  '
		  ' Where Q is the intersection point:
		  ' ```
		  ' Ap1 + taA = Bp1 + tbB
		  '
		  ' We can solve for tb by applying the cross product with A on both sides:
		  ' ```
		  ' (Ap1 + taA) x A = (Bp1 + tbB) x A
		  ' Ap1 x A = Bp1 x A + tbB x A
		  ' (Ap1 - Bp1) x A = tbB x A
		  ' tb = ((Ap1 - Bp1) x A) / (B x A)
		  ' ```
		  '
		  ' If B x A = 0 then the lines are parallel.  If both the top and bottom are zero 
		  ' then the lines are coincident.
		  '
		  ' - Parameter ap1: The first point of the first line.
		  ' - Parameter ap2: The second point of the first line.
		  ' - Parameter bp1: The first point of the second line.
		  ' - Parameter bp2: The second point of the second line.
		  '
		  ' - Returns: The intersection point as a Vector2 or Nil if the lines are parallel or coincident.
		  '
		  ' - Throws: NilObjectException if `ap1`, `ap2`, `bp1` or `bp2` is Nil.
		  ///
		  
		  Var A As Vector2 = ap1.Towards(ap2)
		  Var B As Vector2 = bp1.Towards(bp2)
		  
		  // Compute the bottom.
		  Var BxA As Double = B.Cross(A)
		  If Abs(BxA) <= Epsilon.E Then
		    // The lines are parallel and don't intersect.
		    Return Nil
		  End If
		  
		  // Compute the top.
		  Var ambxA As Double = ap1.Difference(bp1).Cross(A)
		  If Abs(ambxA) <= Epsilon.E Then
		    // The lines are coincident.
		    Return Nil
		  End If
		  
		  // Compute tb.
		  Var tb As Double = ambxA / BxA
		  
		  // Compute the intersection point.
		  Return B.Product(tb).Add(bp1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44657465726D696E65732077686572652074686520706F696E742069732072656C617469766520746F2074686520676976656E206C696E652E205468726F7773204E696C4F626A656374457863657074696F6E2E
		Shared Function GetLocation(point As PhysicsKit.Vector2, linePoint1 As PhysicsKit.Vector2, linePoint2 As PhysicsKit.Vector2) As Double
		  ///
		  ' Determines where the point is relative to the given line.
		  '
		  ' ```
		  ' Set L = linePoint2 - linePoint1
		  ' Set P = point - linePoint1
		  ' location = L.cross(P)
		  ' ```
		  ' Returns 0 if the point lies on the line created from the line segment.
		  ' Assuming a right handed coordinate system:
		  '   Returns < 0 if the point lies on the right side of the line.
		  '   Returns > 0 if the point lies on the left side of the line.
		  '
		  ' Assumes all points are in world space.
		  '
		  ' - Parameter point: The point.
		  ' - Parameter linePoint1: The first point of the line.
		  ' - Parameter linePoint2: The second point of the line.
		  '
		  ' - Returns: Double.
		  '
		  ' - Throws: NilObjectException if `point`, `linePoint1`, or `linePoint2` is Nil.
		  ///
		  
		  Return (linePoint2.X - linePoint1.X) * (point.Y - linePoint1.Y) - _
		  (point.X - linePoint1.X) * (linePoint2.Y - linePoint1.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNormalIterator() As Iterator
		  // Part of the PhysicsKit.Wound interface.
		  
		  #Pragma error  "Must implement!"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNormals() As PhysicsKit.Vector2()
		  // Part of the PhysicsKit.Wound interface.
		  
		  Return Self.Normals
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320706F696E743120696E206C6F63616C20636F6F7264696E617465732E
		Function GetPoint1() As PhysicsKit.Vector2
		  ///
		  ' Returns point1 in local coordinates.
		  '
		  ' - Returns: Vector2.
		  ///
		  
		  Return Self.Vertices(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320706F696E743220696E206C6F63616C20636F6F7264696E617465732E
		Function GetPoint2() As PhysicsKit.Vector2
		  ///
		  ' Returns point2 in local coordinates.
		  '
		  ' - Returns: Vector2.
		  ///
		  
		  Return Self.Vertices(1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520706F696E74206F6E20746865206C696E6520746861742074686973205365676D656E7420646566696E657320636C6F7365737420746F2074686520676976656E20706F696E742E20576F726B7320696E2074686973205365676D656E742773206C6F63616C2073706163652E205468726F7773204E696C4F626A656374457863657074696F6E2E
		Function GetPointOnLineClosestToPoint(point As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Returns the point on the **line** that this Segment defines closest to the given point.
		  '
		  ' This method works in this Segment's local space.
		  '
		  ' - Parameter point: The local space point.
		  '
		  ' - Returns: Vector2.
		  '
		  ' - Throws: NilObjectException: If the given point is Nil.
		  ///
		  
		  Return Segment.GetPointOnLineClosestToPoint(point, Self.Vertices(0), Self.Vertices(1))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520706F696E74206F6E2074686520676976656E206C696E6520636C6F7365737420746F2074686520676976656E20706F696E742E205468726F7773204E696C4F626A656374457863657074696F6E2E
		Shared Function GetPointOnLineClosestToPoint(point As PhysicsKit.Vector2, linePoint1 As PhysicsKit.Vector2, linePoint2 As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Returns the point on the given line closest to the given point.
		  '
		  ' Project the point onto the line:
		  ' ```
		  ' Vline = P₁ - P₀
		  ' Vpoint = P₀ - P
		  ' Pclosest = Vpoint.project(Vline)
		  ' ```
		  ' Assumes all points are in world space.
		  '
		  ' - Parameter point: The point.
		  ' - Parameter linePoint1: The first point of the line.
		  ' - Parameter linePoint2: The second point of the line.
		  '
		  ' - Returns: Vector2
		  '
		  ' - Throws: NilObjectException if `point`, `linePoint1`, or `linePoint2` is Nil.
		  ///
		  
		  // Create a vector from the point to the first line point.
		  Var p1ToP As Vector2 = point.Difference(linePoint1)
		  
		  // Create a vector representing the line.
		  Var line As Vector2 = linePoint2.Difference(linePoint1)
		  
		  // Get the length squared of the line.
		  Var ab2 As Double = line.Dot(line)
		  
		  // Check ab2 for zero (linePoint1 = linePoint2).
		  If ab2 <= Epsilon.E Then Return linePoint1.Copy
		  
		  // Get the projection of AP on AB.
		  Var ap_ab As Double = p1ToP.Dot(line)
		  
		  // Get the position from the first line point to the projection.
		  Var t As Double = ap_ab / ab2
		  
		  // Create the point on the line.
		  Return line.Multiply(t).Add(linePoint1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520706F696E74206F6E2074686973205365676D656E7420636C6F7365737420746F2074686520676976656E20706F696E742E2054686973206D6574686F6420776F726B7320696E2074686973205365676D656E742773206C6F63616C2073706163652E205468726F7773204E696C4F626A656374457863657074696F6E2E
		Function GetPointOnSegmentClosestToPoint(point As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Returns the point on this Segment closest to the given point.
		  '
		  ' This method works in this Segment's local space.
		  '
		  ' - Parameter point: The local space point.
		  '
		  ' - Retiurns: Vector2.
		  '
		  ' - Throws: NilObjectException if the given point is Nil.
		  ///
		  
		  Return Segment.GetPointOnSegmentClosestToPoint(point, Self.Vertices(0), Self.Vertices(1))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520706F696E74206F6E2074686520676976656E206C696E65207365676D656E7420636C6F7365737420746F2074686520676976656E20706F696E742E20417373756D657320616C6C20706F696E74732061726520696E20776F726C642073706163652E205468726F7773204E696C4F626A656374457863657074696F6E2E
		Shared Function GetPointOnSegmentClosestToPoint(point As PhysicsKit.Vector2, linePoint1 As PhysicsKit.Vector2, linePoint2 As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Returns the point on the given line segment closest to the given point.
		  '
		  ' If the point closest to the given point is on the line created by the
		  ' given line segment, but is not on the line segment then either of the segment's
		  ' end points will be returned.
		  '
		  ' Assumes all points are in world space.
		  '
		  ' - Parameter point: The point.
		  ' - Parameter linePoint1: The first point of the line.
		  ' - Parameter linePoint2: The second point of the line.
		  '
		  ' - Returns: Vector2.
		  '
		  ' - Throws: NilObjectException if `point`, `linePoint1`, or `linePoint2` is Nil.
		  ///
		  
		  // Create a vector from the point to the first line point.
		  Var p1ToP As Vector2 = point.Difference(linePoint1)
		  
		  // Create a vector representing the line.
		  Var line As Vector2 = linePoint2.Difference(linePoint1)
		  
		  // Get the length squared of the line.
		  Var ab2 As Double = line.Dot(line)
		  
		  // Get the projection of AP on AB.
		  Var ap_ab As Double = p1ToP.Dot(line)
		  
		  // Check ab2 for zero (linePoint1 = linePoint2).
		  If ab2 <= Epsilon.E Then Return linePoint1.Copy
		  
		  // Get the position from the first line point to the projection.
		  Var t As Double = ap_ab / ab2
		  
		  // Make sure t is in between 0.0 and 1.0.
		  t = Interval.Clamp(t, 0.0, 1.0)
		  
		  // Create the point on the line.
		  Return line.Multiply(t).Add(linePoint1)
		  
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
		  
		  Return Geometry.GetRotationRadius(center, Self.Vertices)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520696E74657273656374696F6E206F662074686520676976656E205365676D656E7420616E642074686973205365676D656E742E20417373756D6573207468617420626F7468207468697320616E642074686520676976656E207365676D656E742061726520696E207468652073616D652073706163652028656974686572206C6F63616C206F7220776F726C64207370616365292E205468726F7773204E696C4F626A656374457863657074696F6E2E
		Function GetSegmentIntersection(segment As PhysicsKit.Segment) As PhysicsKit.Vector2
		  ///
		  ' Returns the intersection of the given Segment and this Segment.
		  '
		  ' This method assumes that both this and the given segment are in the same space (either
		  ' local or world space).
		  '
		  '
		  ' - Parameter segment: The other segment.
		  '
		  ' - Returns: Vector2 or Nil (if the segments do not intersect, are parallel, or are coincident).
		  '
		  ' - Throws: NilObjectException if the given segment is Nil.
		  ///
		  
		  Return Segment.GetSegmentIntersection(Self.Vertices(0), Self.Vertices(1), _
		  segment.Vertices(0), segment.vertices(1))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520696E74657273656374696F6E20706F696E74206F66207468652074776F206C696E65207365676D656E7473206F72204E696C20696620746865792061726520706172616C6C656C2C20636F696E636964656E74206F7220646F6E277420696E746572736563742E205468726F7773204E696C4F626A656374457863657074696F6E2E
		Shared Function GetSegmentIntersection(ap1 As PhysicsKit.Vector2, ap2 As PhysicsKit.Vector2, bp1 As PhysicsKit.Vector2, bp2 As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Returns the intersection point of the two line segments or Nil if they are parallel, coincident
		  ' or don't intersect.
		  '
		  ' If we let:
		  ' ```
		  ' A = Ap2 - Ap1
		  ' B = Bp2 - Bp1
		  ' ```
		  '
		  ' We can create two parametric equations:
		  '
		  ' ```
		  ' Q = Ap1 + taA
		  ' Q = Bp1 + tbB
		  ' ```
		  '
		  ' Where Q is the intersection point:
		  ' ```
		  ' Ap1 + taA = Bp1 + tbB
		  ' ```
		  '
		  ' We can solve for tb by applying the cross product with A on both sides:
		  ' ```
		  ' (Ap1 + taA) x A = (Bp1 + tbB) x A
		  ' Ap1 x A = Bp1 x A + tbB x A
		  ' (Ap1 - Bp1) x A = tbB x A
		  ' tb = ((Ap1 - Bp1) x A) / (B x A)
		  ' ```
		  '
		  ' If B x A = 0 then the segments are parallel. If the top = 0 then they don't intersect. If both the
		  ' top and bottom are zero then the segments are coincident.
		  '
		  ' If tb or ta < 0 or > 1 then the segments do not intersect.
		  '
		  ' - Parameter ap1: The first point of the first line segment.
		  ' - Parameter ap2: The second point of the first line segment.
		  ' - Parameter bp1: The first point of the second line segment.
		  ' - Parameter bp2: The second point of the second line segment.
		  '
		  ' - Returns: The intersection point as a Vector2 or 
		  '            Nil if the line segments don't intersect, are parallel, or are coincident.
		  '
		  ' - Throws: NilObjectException if `ap1`, `ap2`, `bp1`, or `bp2` is Nil.
		  ///
		  
		  Var A As Vector2 = ap1.Towards(ap2)
		  Var B As Vector2 = bp1.Towards(bp2)
		  
		  // Compute the bottom.
		  Var BxA As Double = B.Cross(A)
		  If Abs(BxA) <= Epsilon.E Then
		    // The line segments are parallel and don't intersect.
		    Return Nil
		  End If
		  
		  // Compute the top.
		  Var ambxA As Double = ap1.Difference(bp1).Cross(A)
		  If Abs(ambxA) <= Epsilon.E Then
		    // The line segments are coincident.
		    Return Nil
		  End If
		  
		  // Compute tb.
		  Var tb As Double = ambxA / BxA
		  If tb < 0.0 Or tb > 1.0 Then
		    // No intersection.
		    Return Nil
		  End If
		  
		  // Compute the intersection point.
		  Var ip As Vector2 = B.Product(tb).Add(bp1)
		  
		  // Since both are segments we need to verify that ta is also valid.
		  // Compute ta.
		  Var ta As Double= ip.Difference(ap1).Dot(A) / A.Dot(A)
		  If ta < 0.0 Or ta > 1.0 Then
		    // No intersection.
		    Return Nil
		  End If
		  
		  Return ip
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUserData() As Variant
		  // Part of the PhysicsKit.DataContainer interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVertexIterator() As Iterator
		  // Part of the PhysicsKit.Wound interface.
		  
		  #Pragma error  "Must implement!"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVertices() As PhysicsKit.Vector2()
		  // Part of the PhysicsKit.Wound interface.
		  
		  Return Self.Vertices
		  
		End Function
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

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F662074686973205365676D656E742E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Segment.
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  s.AddRow("Segment[")
		  s.AddRow(Super.ToString)
		  s.AddRow("|Length=")
		  s.AddRow(Self.Length.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
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

	#tag Method, Flags = &h21, Description = 56616C6964617465732074686520636F6E7374727563746F7220696E7075742072657475726E696E6720547275652069662076616C6964206F72207468726F77696E6720616E20657863657074696F6E20696620696E76616C69642E
		Private Shared Function Validate(point1 As PhysicsKit.Vector2, point2 As PhysicsKit.Vector2) As Boolean
		  ///
		  ' Validates the constructor input returning True if valid or throwing an exception if invalid.
		  '
		  ' - Parameter point1: The first point.
		  ' - Parameter point2: The second point.
		  '
		  ' - Returns: True or throws.
		  '
		  ' - Throws: NilObjectException if `point1` or `point2` is Nil.
		  ' - Throws: InvalidArgumentException if `point1` = `point2`.
		  ///
		  
		  // Make sure either point is not Nil.
		  If point1 = Nil Then Raise New NilObjectException(Messages.GEOMETRY_SEGMENT_NIL_POINT1)
		  If point2 = Nil Then Raise New NilObjectException(Messages.GEOMETRY_SEGMENT_NIL_POINT2)
		  
		  // Make sure the two points are not coincident.
		  If point1.Equals(point2) Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_SEGMENT_SAME_POINT)
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of a Line Segment Convex Shape.
		This class represents a line segment that is infinitely thin.
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 546865207365676D656E74206C656E6774682E
		Length As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865207365676D656E74206E6F726D616C732E
		Normals() As PhysicsKit.Vector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865207365676D656E742076657274696365732E
		Vertices() As PhysicsKit.Vector2
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
