#tag Class
Protected Class Polygon
Inherits PhysicsKit.AbstractShape
Implements PhysicsKit.Wound,  PKConvex
	#tag Method, Flags = &h21, Description = 56616C69646174656420636F6E7374727563746F722E20437265617465732061206E657720506F6C79676F6E207573696E672074686520676976656E2076657274696365732E20205468652063656E747265206F662074686520706F6C79676F6E2069732063616C63756C61746564207573696E6720616E2061726561207765696768746564206D6574686F642E
		Private Sub Constructor(valid As Boolean, vertices() As PKVector2, center As PKVector2)
		  ///
		  ' Validated constructor.
		  '
		  ' Creates a new Polygon using the given vertices.  The centre of the polygon
		  ' is calculated using an area weighted method.
		  '
		  ' - Parameter valid: Always True or this constructor would not be called.
		  ' - Parameter vertices(): The polygon vertices.
		  ' - Parameter center: The center of the polygon.
		  ///
		  
		  #Pragma Unused valid
		  
		  Super.Constructor(center, Geometry.GetRotationRadius(center, vertices))
		  
		  // Set the vertices.
		  Self.Vertices = vertices
		  
		  // Create the normals.
		  Self.Normals = Geometry.GetCounterClockwiseEdgeNormals(vertices)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E20437265617465732061206E657720506F6C79676F6E207573696E672074686520676976656E2076657274696365732E205468652063656E746572206F662074686520706F6C79676F6E2069732063616C63756C61746564207573696E6720616E2061726561207765696768746564206D6574686F642E205468726F777320657863657074696F6E732E
		Sub Constructor(verts() As PKVector2)
		  ///
		  ' Full constructor.
		  '
		  ' Creates a new Polygon using the given vertices. The center of the polygon
		  ' is calculated using an area weighted method.
		  '
		  ' A polygon must have 3 or more vertices, of which one is not colinear with the other two.
		  '
		  ' A polygon must also be convex and have counter-clockwise winding.
		  '
		  ' - Parameter verts: The array of vertices.
		  '
		  ' - Raises: NilObjectException if vertices is Nil or contains a Nil element.
		  ' - Raises: InvalidArgumentException if vertices contains less than 3 points,
		  '           contains coincident points, is not convex, or has clockwise winding
		  ///
		  
		  Constructor(Validate(verts), verts, Geometry.GetAreaWeightedCenter(verts))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F7220666F7220737562636C61737365732E
		Sub Constructor(center As PKVector2, radius As Double, vertices() As PKVector2, normals() As PKVector2)
		  ///
		  ' Full constructor for subclasses.
		  '
		  ' - Parameter center: The center.
		  ' - Parameter radius: The rotation radius.
		  ' - Paramater vertices(): The vertices.
		  ' - Parameter normals(): The normals.
		  ///
		  
		  Super.Constructor(center, radius)
		  Self.Vertices = vertices
		  Self.Normals = normals
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PKVector2, transform As PKTransform) As Boolean
		  // Part of the PhysicsKit.Shape interface.
		  
		  // If the polygon is convex then do a simple inside test.
		  // If the the sign of the location of the point on the side of an edge (or line)
		  // is always the same and the polygon is convex then we know that the
		  // point lies inside the polygon.
		  // This method doesn't care about vertex winding.
		  
		  // Inverse transform the point to put it in local coordinates.
		  Var p As PKVector2 = transform.GetInverseTransformed(point)
		  
		  // Start from the pair (p1 = last, p2 = first) so there's no 
		  // need to check in the loop for wrap-around of the i + 1 vertice.
		  Var size As Integer = Self.Vertices.Count
		  Var p1 As PKVector2 = Self.Vertices(size - 1)
		  Var p2 As PKVector2 = Self.Vertices(0)
		  
		  // Get the location of the point relative to the first two vertices.
		  Var last As Double = Segment.GetLocation(p, p1, p2)
		  
		  // Loop through the rest of the vertices.
		  For i As Integer = 0 To size - 2
		    // p1 is now p2.
		    p1 = p2
		    // p2 is the next point.
		    p2 = Self.Vertices(i + 1)
		    // Check if they are equal (one of the vertices).
		    If p.Equals(p1) Or p.Equals(p2) Then Return True
		    
		    // Do side of line test.
		    Var location As Double = Segment.GetLocation(p, p1, p2)
		    
		    // Multiply the last location with this location.
		    // If they are the same sign then the opertation will yield a positive result
		    // -x * -y = +xy, x * y = +xy, -x * y = -xy, x * -y = -xy
		    If last * location < 0 Then
		      // reminder: (-0.0 < 0.0) evaluates to false and not true
		      Return False
		    End If
		    
		    // Update the last location, but only if it's not zero.
		    // A location of zero indicates that the point lies ON the line
		    // through p1 and p2. We can ignore these values because the
		    // convexity requirement of the shape will ensure that if it's outside, a sign will change.
		    If Abs(location) > Epsilon.E Then last = location
		  Next i
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB(transform As PKTransform) As PKAABB
		  // Part of the PhysicsKit.Shape interface.
		  
		  // Get the first point.
		  Var p As PKVector2 = transform.GetTransformed(Self.Vertices(0))
		  
		  // Initialize min and max values.
		  Var minX As Double = p.X
		  Var maxX As Double = p.X
		  Var minY As Double = p.Y
		  Var maxY As Double = p.Y
		  
		  // Loop over the rest of the vertices.
		  Var iLimit As Integer = Self.Vertices.LastRowIndex
		  For i As Integer = 1 To iLimit
		    // Get the next point.
		    Var px As Double = transform.GetTransformedX(Self.Vertices(i))
		    Var py As Double = transform.GetTransformedY(Self.Vertices(i))
		    
		    // Compare the x values.
		    If px < minX Then
		      minX = px
		    ElseIf px > maxX Then
		      maxX = px
		    End If
		    
		    // Compare the y values.
		    If py < minY Then
		      minY = py
		    ElseIf py > maxY Then
		      maxY = py
		    End If
		  Next i
		  
		  // Create the PKAABB.
		  Return New PKAABB(minX, minY, maxX, maxY)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061204D617373206F626A656374207573696E67207468652067656F6D65747269632070726F70657274696573206F66207468697320506F6C79676F6E20616E642074686520676976656E2064656E736974792E
		Function CreateMass(density As Double) As PhysicsKit.Mass
		  ///
		  ' Creates a Mass object using the geometric properties of this Polygon and the given density.
		  '
		  ' A Polygon's centroid must be computed by the area weighted method since the
		  ' average method can be bias to one side if there are more points on that one side than another.
		  '
		  ' - Parameter density: The density in kg/m².
		  '
		  ' - Returns: The Mass of this Polygon.
		  '
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // Can't use normal centroid calculation since it will be weighted towards sides
		  // that have larger distribution of points.
		  Var center As PKVector2 = new PKVector2
		  Var area As Double = 0.0
		  Var I As Double = 0.0
		  Var n As Integer = Self.Vertices.Count
		  
		  // Get the average centre.
		  Var ac As PKVector2 = New PKVector2
		  Var kLimit As Integer = n - 1
		  For k As Integer = 0 To kLimit
		    Call ac.Add(Self.Vertices(k))
		  Next k
		  Call ac.Divide(n)
		  
		  // Loop through the vertices using two variables to avoid branches in the loop.
		  Var i1 As Integer = n - 1
		  Var i2 As Integer = 0
		  While i2 < n
		    // Get two vertices.
		    Var p1 As PKVector2 = Self.Vertices(i1)
		    Var p2 As PKVector2 = Self.Vertices(i2)
		    // Get the vector from the center to the point.
		    p1 = p1.Difference(ac)
		    p2 = p2.Difference(ac)
		    // Perform the cross product (yi * x(i+1) - y(i+1) * xi).
		    Var D As Double = p1.Cross(p2)
		    // Multiply by half.
		    Var triangleArea As Double = 0.5 * D
		    // Add it to the total area.
		    area = area + triangleArea
		    
		    // Area weighted centroid.
		    // (p1 + p2) * (D / 6)
		    // = (x1 + x2) * (yi * x(i+1) - y(i+1) * xi) / 6
		    // We will divide by the total area later.
		    center.X = center.X + ((p1.X + p2.X) * Geometry.INV_3 * triangleArea)
		    center.Y = center.Y + ((p1.Y + p2.Y) * Geometry.INV_3 * triangleArea)
		    
		    // (yi * x(i+1) - y(i+1) * xi) * (p2^2 + p2 . p1 + p1^2)
		    I = I + (triangleArea * (p2.Dot(p2) + p2.Dot(p1) + p1.Dot(p1)))
		    // We will do the m / 6A = (d / 6) when we have the area summed up.
		    
		    i1 = i2
		    i2 = i2 + 1
		  Wend
		  
		  // Compute the mass.
		  Var m As Double = density * area
		  // Finish the centroid calculation by dividing by the total area
		  // and adding in the average centre.
		  Call center.Divide(area)
		  Var c As PKVector2 = center.Sum(ac)
		  // Finish the inertia tensor by dividing by the total area and multiplying by d / 6
		  I = I * ((density / 6.0))
		  // Shift the axis of rotation to the area weighted center
		  // (center is the vector from the average center to the area weighted center since
		  // the average center is used as the origin).
		  I = I - (m * center.GetMagnitudeSquared)
		  
		  Return New Mass(c, m, I)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAxes(foci() As PKVector2, transform As PKTransform) As PKVector2()
		  // Part of the PhysicsKit.Convex interface.
		  
		  // Get the size of the foci list.
		  Var fociSize As Integer = If(foci <> Nil, foci.Count, 0)
		  
		  // Get the number of vertices this polygon has.
		  Var size As Integer = Self.Vertices.Count
		  
		  // The axes of a polygon are created from the normal of the edges
		  // plus the closest point to each focus.
		  Var axes() As PKVector2
		  axes.ResizeTo(size + fociSize - 1)
		  Var n As Integer = 0
		  // Loop over the edge normals and put them into world space.
		  For Each v As PKVector2 In Self.Normals
		    // Transform it into world space and add it to the list.
		    axes(n) = transform.GetTransformedR(v)
		    n = n + 1
		  Next v
		  
		  // Loop over the focal points and find the closest points on the polygon to the focal points.
		  For Each f As PKVector2 In foci
		    // Create a place for the closest point.
		    Var closest As PKVector2 = transform.GetTransformed(Self.Vertices(0))
		    Var d As Double = f.DistanceSquared(closest)
		    // Find the minimum distance vertex.
		    Var jLimit As Integer = Self.Vertices.LastRowIndex
		    For j As Integer = 1 To jLimit
		      // Get the vertex.
		      Var p As PKVector2 = Self.Vertices(j)
		      // Transform it into world space.
		      p = transform.GetTransformed(p)
		      // Get the squared distance to the focus.
		      Var dt As Double = f.DistanceSquared(p)
		      // Compare with the last distance.
		      If dt < d Then
		        // If it's closer then save it.
		        closest = p
		        d = dt
		      End If
		    Next j
		    // Once we have found the closest point create a vector from the focal point to the point.
		    Var axis As PKVector2 = f.Towards(closest)
		    // Normalise it.
		    Call axis.Normalise
		    // Add it to the array.
		    axes(n) = axis
		    n = n + 1
		  Next f
		  
		  // Return all the axes.
		  Return axes
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestFeature(vector As PKVector2, transform As PKTransform) As PhysicsKit.EdgeFeature
		  // Part of the PhysicsKit.Convex interface.
		  
		  // Transform the normal into local space.
		  Var localn As PKVector2 = transform.GetInverseTransformedR(vector)
		  
		  Var index As Integer = GetFarthestVertexIndex(localn)
		  Var count As Integer = Self.Vertices.Count
		  
		  Var maximum As PKVector2 = New PKVector2(Self.Vertices(index))
		  
		  // Once we have the point of maximum, see which edge is most perpendicular.
		  Var leftN As PKVector2 = Self.Normals(If(index = 0, count - 1, index - 1))
		  Var rightN As PKVector2 = Self.Normals(index)
		  
		  // Create the maximum point for the feature (transform the maximum into world space).
		  transform.TransformV(maximum)
		  Var vm As PointFeature = New PointFeature(maximum, index)
		  
		  // Is the left or right edge more perpendicular?
		  If leftN.Dot(localn) < rightN.Dot(localn) Then
		    Var l As Integer = If((index = count - 1), 0, index + 1)
		    
		    Var left As PKVector2 = transform.GetTransformed(Self.Vertices(l))
		    Var vl As PointFeature = New PointFeature(left, l)
		    
		    // Make sure the edge is the right winding.
		    Return New EdgeFeature(vm, vl, vm, maximum.Towards(left), index + 1)
		  Else
		    Var r As Integer = If((index = 0), count - 1, index - 1)
		    
		    Var right As PKVector2 = transform.GetTransformed(Self.Vertices(r))
		    Var vr As PointFeature = New PointFeature(right, r)
		    
		    // Make sure the edge is the right winding.
		    Return New EdgeFeature(vr, vm, vm, right.Towards(maximum), index)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestPoint(vector As PKVector2, transform As PKTransform) As PKVector2
		  // Part of the PhysicsKit.Convex interface.
		  
		  // Transform the normal into local space.
		  Var localn As PKVector2 = transform.GetInverseTransformedR(vector)
		  
		  // Find the index of the farthest point.
		  Var index As Integer = GetFarthestVertexIndex(localn)
		  
		  // Transform the point into world space and return.
		  Return transform.GetTransformed(Self.Vertices(index))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 496E7465726E616C2068656C706572206D6574686F6420746861742072657475726E732074686520696E646578206F662074686520706F696E74207468617420697320666172746865737420696E20646972656374696F6E206F66206120766563746F722E
		Private Function GetFarthestVertexIndex(vector As PKVector2) As Integer
		  ///
		  ' Internal helper method that returns the index of the point that is 
		  ' farthest in direction of a vector.
		  '
		  ' - Parameter vector: The direction.
		  '
		  ' - Returns: The index of the farthest vertex in that direction.
		  ///
		  
		  // The sequence a(n) = vector.dot(vertices[n]) has a maximum, a minimum and is 
		  // monotonic (though not strictly monotonic) between those extrema.
		  // All indices are considered in modular arithmetic. I choose the initial index to be 0.
		  //
		  // Based on that I follow this approach:
		  // We start from an initial index n0. We want to an adjacent to n0 index n1 for which a(n1) > a(n0).
		  // If no such index exists then n0 is the maximum. Else we start in 
		  // direction of n1 (i.e. left or right of n0) and while a(n) increases we continue to 
		  // that direction. When the next number of the sequence does not increases anymore
		  // we can stop and we have found max{a(n)}.
		  //
		  // Although the idea is simple we need to be careful with some edge cases and the 
		  // correctness of the algorithm in all cases.
		  // Although the sequence is not strictly monotonic the absence of equalities is intentional 
		  // and wields the correct answer (see below).
		  //
		  // The correctness of this method relies on some properties:
		  // 1) If n0 and n1 are two adjacent indices and a(n0) = a(n1) then a(n0) and a(n1) are 
		  //    either max{a(n)} or min{a(n)}.
		  //    This holds for all convex polygons. This property can guarantee that if our initial 
		  //    index is n0 or n1 then it does not matter to which side (left or right) we start searching.
		  // 2) The polygon has no coincident vertices.
		  //    This guarantees us that there are no adjacent n0, n1, n2 for which a(n0) = a(n1) = a(n2)
		  //    and that only two adjacent n0, n1 can exist with a(n0) = a(n1). This is important because if
		  //    those adjacent n0, n1, n2 existed the code below would always return the initial index, 
		  //    without knowing if it's a minimum or maximum. But since only two adjacent indices can 
		  //    exist with a(n0) = a(n1) the code below will always start searching in one direction and 
		  //    because of 1) this will give us the correct answer.
		  
		  // The initial starting index and the corresponding dot product.
		  Var maxIndex As Integer = 0
		  Var n As Integer = Self.Vertices.Count
		  Var max As Double = vector.Dot(Self.Vertices(0))
		  Var candidateMax As Double
		  
		  candidateMax = vector.Dot(Self.Vertices(1))
		  If max < candidateMax Then
		    // Search to the right.
		    Do
		      max = candidateMax
		      maxIndex = maxIndex + 1
		      
		      // Exit?
		      If maxIndex + 1 >= n Then
		        Exit
		      Else
		        candidateMax = vector.Dot(Self.Vertices(maxIndex + 1))
		        If max >= candidateMax Then Exit
		      End If
		    Loop
		  Else
		    candidateMax = vector.Dot(Self.Vertices(n - 1))
		    If max < candidateMax Then
		      maxIndex = n
		      
		      // Search to the left.
		      Do
		        max = candidateMax
		        maxIndex = maxIndex - 1
		        
		        // Exit?
		        If maxIndex <= 0 Then
		          Exit
		        Else
		          candidateMax = vector.Dot(Self.Vertices(maxIndex - 1))
		          If max > candidateMax Then Exit
		        End If
		      Loop
		    End If
		  End If
		  
		  Return maxIndex
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFoci(transform As PKTransform) As PKVector2()
		  ///
		  ' - Notes:
		  '   Not applicable to this shape. Always returns Nil.
		  '   Part of the PhysicsKit.Convex interface.
		  '
		  ' - Returns: Nil.
		  ///
		  
		  #Pragma Unused transform
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNormalIterator() As Iterator
		  /// 
		  ' - Note: Part of the PhysicsKit.Wound interface.
		  ///
		  
		  Return New WoundIterator(Self.Normals)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNormals() As PKVector2()
		  // Part of the PhysicsKit.Wound interface.
		  
		  Return Self.Normals
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius(center As PKVector2) As Double
		  // Part of the PhysicsKit.Shape interface.
		  
		  Return Geometry.GetRotationRadius(center, Self.Vertices)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVertexIterator() As Iterator
		  /// 
		  ' - Note: Part of the PhysicsKit.Wound interface.
		  ///
		  
		  Return New WoundIterator(Self.Vertices)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVertices() As PKVector2()
		  // Part of the PhysicsKit.Wound interface.
		  
		  Return Self.Vertices
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PKVector2, transform As PKTransform) As PhysicsKit.Interval
		  // Part of the PhysicsKit.Shape interface.
		  
		  Var v As Double = 0.0
		  
		  // Get the first point.
		  Var p As PKVector2 = transform.GetTransformed(Self.Vertices(0))
		  
		  // Project the point onto the vector.
		  Var min As Double = vector.Dot(p)
		  Var max As Double = min
		  
		  // Loop over the rest of the vertices.
		  Var limit As Integer = Self.Vertices.LastRowIndex
		  For i As Integer = 1 To limit
		    // Get the next point.
		    p = transform.GetTransformed(Self.Vertices(i))
		    // Project it onto the vector.
		    v = vector.Dot(p)
		    If v < min Then
		      min = v
		    ElseIf v > max Then
		      max = v
		    End If
		  Next i
		  
		  Return New Interval(min, max)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PKRotation, x As Double, y As Double)
		  // Part of the PKRotatable interface.
		  
		  Super.Rotate(r, x, y)
		  
		  Var limit As Integer = Self.Vertices.LastRowIndex
		  For i As Integer = 0 To limit
		    Call Self.Vertices(i).Rotate(r, x, y)
		    Call Self.Normals(i).Rotate(r)
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F66207468697320506F6C79676F6E20696E2074686520666F726D3A2022506F6C79676F6E5B49443D69647C43656E7465723D28582C59297C5261646975733D7261646975737C56657274696365733D7B28582C59292C6E7D5D222E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Polygon in the form:
		  ' "Polygon[ID=id|Center=(X,Y)|Radius=radius|Vertices={(X,Y),n}]".
		  '
		  ' - Returns: String
		  ///
		  
		  Var s() As String
		  s.AddRow("Polygon[")
		  s.AddRow(Super.ToString)
		  s.AddRow("|Vertices={")
		  For i As Integer = 0 To Self.Vertices.LastRowIndex
		    If i <> 0 Then s.AddRow(",")
		    s.AddRow(Self.Vertices(i).ToString)
		  Next i
		  s.AddRow("}")
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(x As Double, y As Double)
		  // Part of the PhysicsKit.Translatable interface.
		  
		  Super.Translate(x, y)
		  For Each v As PKVector2 In Self.Vertices
		    Call v.Add(x, y)
		  Next v
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 56616C6964617465732074686520636F6E7374727563746F7220696E7075742072657475726E696E6720547275652069662076616C6964206F72207468726F77696E6720616E20657863657074696F6E20696620696E76616C69642E
		Shared Function Validate(verts() As PKVector2) As Boolean
		  ///
		  ' Validates the constructor input returning True if valid or throwing an exception if invalid.
		  '
		  ' - Parameter verts: The array of vertices.
		  '
		  ' - Returns: True or raises an exception.
		  '
		  ' - Raises: NilObjectException if verts is Nil or contains a Nil element.
		  ' - Raises: InvalidArgumentException if verts contains less than 3 points, 
		  '           contains coincident points, is not convex, or has clockwise winding.
		  ///
		  
		  // Check the vertex array.
		  If verts = Nil Then Raise New NilObjectException(Messages.GEOMETRY_POLYGON_NIL_ARRAY)
		  
		  // Get the size.
		  Var size As Integer = verts.Count
		  
		  // Check the size.
		  If size < 3 Then Raise New InvalidArgumentException(Messages.GEOMETRY_POLYGON_LESS_THAN_3_VERTICES)
		  
		  // Check for Nil vertices.
		  For Each v As PKVector2 In verts
		    If v Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_POLYGON_NIL_VERTICES)
		  Next v
		  
		  // Check for convex.
		  Var area As Double = 0.0
		  Var sign As Double = 0.0
		  Var limit As Integer = size - 1
		  For i As Integer = 0 to limit
		    Var p0 As PKVector2 = If((i - 1 < 0), verts(size - 1), verts(i - 1))
		    Var p1 As PKVector2 = verts(i)
		    Var p2 As PKVector2 = If((i + 1 = size), verts(0), verts(i + 1))
		    // Check for coincident vertices.
		    If p1.Equals(p2) Then
		      Raise New InvalidArgumentException(Messages.GEOMETRY_POLYGON_COINCIDENT_VERTICES)
		    End If
		    // Check the cross product for CCW winding.
		    Var cross As Double = p0.Towards(p1).Cross(p1.Towards(p2))
		    Var tsign As Double = MathsKit.Signum(cross)
		    area = area + cross
		    // Check for colinear edges (for now its allowed).
		    If Abs(cross) > Epsilon.E Then
		      // Check for convexity.
		      If sign <> 0.0 And tsign <> sign Then
		        Raise New InvalidArgumentException(Messages.GEOMETRY_POLYGON_NON_CONVEX)
		      End If
		    End If
		    sign = tsign
		  Next i
		  
		  // Don't allow degenerate polygons.
		  If Abs(area) <= Epsilon.E Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_POLYGON_ZERO_AREA)
		  End If
		  
		  // Check for CCW.
		  If area < 0.0 Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_POLYGON_INVALID_WINDING)
		  End If
		  
		  // If we've made it this far then continue.
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 56616C6964617465732074686520636F6E7374727563746F7220696E7075742072657475726E696E6720547275652069662076616C6964206F72207468726F77696E6720616E20657863657074696F6E20696620696E76616C69642E
		Shared Function Validate(ParamArray verts As PKVector2) As Boolean
		  ///
		  ' Wrapper to facilitate passing a variable number of vertices to the Validate method.
		  ///
		  
		  Return Validate(verts)
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of an arbitrary polygon Convex Shape.
		
		A Polygon must have at least 3 vertices where one of which is not colinear with the other two.
		A Polygon must also be Convex and have counter-clockwise winding of points.
		A polygon cannot have coincident vertices.
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 54686520706F6C79676F6E206E6F726D616C732E
		Normals() As PKVector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520706F6C79676F6E2076657274696365732E
		Vertices() As PKVector2
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
			Name="Radius"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
