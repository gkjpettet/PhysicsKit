#tag Class
Protected Class PKBayazit
Implements PKDecomposer
	#tag Method, Flags = &h0, Description = 506572666F726D7320746865206465636F6D706F736974696F6E206F6E2074686520676976656E20706F6C79676F6E2072657475726E696E672061206C697374206F6620436F6E766578207368617065732E
		Function Decompose(points() As PKVector2) As PKConvex()
		  ///
		  ' - Note: Part of the PKDecomposer interface.
		  ///
		  
		  // Check for Nil array.
		  If points Is Nil Then
		    Raise New NilObjectException(PKMessages.GEOMETRY_DECOMPOSE_NIL_ARRAY)
		  End If
		  
		  // Get the number of points.
		  Var size As Integer = points.Count
		  
		  // Check the size.
		  If size < 4 Then
		    Raise New InvalidArgumentException(PKMessages.GEOMETRY_DECOMPOSE_INVALID_SIZE)
		  End If
		  
		  // Get the winding order.
		  Var winding As Double = PKGeometry.GetWinding(points)
		  
		  // Reverse the array if the points are in clockwise order.
		  If winding < 0.0 Then PKGeometry.ReverseWinding(points)
		  
		  // Create an array for the points to go in.
		  Var polygon() As PKVector2
		  
		  // Copy the points to the list.
		  For Each p As PKVector2 In points
		    polygon.AddRow(p)
		  Next p
		  
		  // Create an array for the polygons to live.
		  Var polygons() As PKConvex
		  
		  // Decompose the polygon.
		  Self.DecomposePolygon(polygon, polygons)
		  
		  // Return the result.
		  Return polygons
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 496E7465726E616C20726563757273697665206D6574686F6420746F206465636F6D706F73652074686520676976656E20706F6C79676F6E20696E746F20636F6E766578207375622D706F6C79676F6E732E
		Protected Sub DecomposePolygon(polygon() As PKVector2, polygons() As PKConvex)
		  ///
		  ' Internal recursive method to decompose the given polygon into convex sub-polygons.
		  '
		  ' - Parameter polygon(): The polygon to decompose.
		  ' - Parameter polygons(): The array to store the convex polygons resulting from the decomposition.
		  ///
		  
		  // Get the size of the given polygon.
		  Var size As Integer = polygon.Count
		  Var polygonLastRowIndex As Integer = polygon.LastRowIndex
		  
		  // Initialise.
		  Var upperIntersection As PKVector2 = New PKVector2
		  Var lowerIntersection As PKVector2 = New PKVector2
		  Var upperDistance As Double = MathsKit.DOUBLE_MAX_VALUE
		  Var lowerDistance As Double = MathsKit.DOUBLE_MAX_VALUE
		  Var closestDistance As Double = MathsKit.DOUBLE_MAX_VALUE
		  Var upperIndex, lowerIndex, closestIndex As Integer = 0
		  
		  Var lower() As PKVector2
		  Var upper() As PKVector2
		  
		  // Loop over all the vertices.
		  For i As Integer = 0 To polygonLastRowIndex
		    // Get the current vertex.
		    Var p As PKVector2 = polygon(i)
		    
		    // Get the adjacent vertices.
		    Var p0 As PKVector2 = polygon(If(i - 1 < 0, size - 1, i - 1))
		    Var p1 As PKVector2 = polygon(If(i + 1 = size, 0, i + 1))
		    
		    // Check if the vertex is a reflex vertex.
		    If IsReflex(p0, p, p1) Then
		      
		      // Loop over the vertices to determine if both extended
		      // adjacent edges intersect one edge (in which case a steiner point will be added).
		      For j As Integer = 0 To polygonLastRowIndex
		        Var q As PKVector2 = polygon(j)
		        
		        // Get the adjacent vertices.
		        Var q0 As PKVector2 = polygon(If(j - 1 < 0, size - 1, j - 1))
		        Var q1 As PKVector2 = polygon(If(j + 1 = size, 0, j + 1))
		        
		        // Create a storage location for the intersection point.
		        Var s As PKVector2 = New PKVector2
		        
		        // Extend the previous edge.
		        // Does the line p0->p go between the vertices q and q0?
		        If Left(p0, p, q) And RightOn(p0, p, q0) Then
		          // Get the intersection point.
		          If Self.GetIntersection(p0, p, q, q0, s) Then
		            // Make sure the intersection point is to the right of
		            // the edge p1->p (this makes sure it's inside the polygon).
		            If Right(p1, p, s) Then
		              // Get the distance from p to the intersection point s.
		              Var dist As Double = p.DistanceSquared(s)
		              // Only save the smallest.
		              If dist < lowerDistance Then
		                lowerDistance = dist
		                Call lowerIntersection.Set(s)
		                lowerIndex = j
		              End If
		            End If
		          End If
		        End If
		        
		        // Extend the next edge.
		        // Does the line p1->p go between q and q1?
		        If Left(p1, p, q1) And RightOn(p1, p, q) Then
		          // Get the intersection point.
		          If Self.GetIntersection(p1, p, q, q1, s) Then
		            // Make sure the intersection point is to the left of
		            // the edge p0->p (this makes sure its inside the polygon).
		            If Left(p0, p, s) Then
		              // Get the distance from p to the intersection point s.
		              Var dist As Double = p.DistanceSquared(s)
		              // Only save the smallest.
		              If dist < upperDistance Then
		                upperDistance = dist
		                Call upperIntersection.Set(s)
		                upperIndex = j
		              End If
		            End If
		          End If
		        End If
		      Next j
		      
		      // If the lower index and upper index are equal then this means
		      // that the range of p only included an edge (both extended previous 
		      // and next edges of p only intersected the same edge, therefore no
		      // point exists within that range to connect to).
		      If lowerIndex = (upperIndex + 1) Mod size Then
		        // Create a steiner point in the middle.
		        Var s As PKVector2 = upperIntersection.Sum(lowerIntersection).Multiply(0.5)
		        
		        // Partition the polygon.
		        If i < upperIndex Then
		          lower.addAll(polygon.subList(i, upperIndex + 1))
		          lower.AddRow(s)
		          upper.AddRow(s)
		          If lowerIndex <> 0 Then upper.addAll(polygon.subList(lowerIndex, size) Then
		          upper.addAll(polygon.subList(0, i + 1))
		        Else
		          If i <> 0 Then lower.addAll(polygon.subList(i, size))
		          lower.addAll(polygon.subList(0, upperIndex + 1))
		          lower.AddRow(s)
		          upper.AddRow(s)
		          upper.addAll(polygon.subList(lowerIndex, i + 1))
		        End If
		      Else
		        // Otherwise we need to find the closest "visible" point to p.
		        If lowerIndex > upperIndex Then
		          upperIndex = upperIndex + size
		        End If
		        
		        closestIndex = lowerIndex
		        // Find the closest visible point.
		        For j As Integer = lowerIndex to upperIndex
		          Var jmod As Integer = j Mod size
		          Var q As PKVector2 = polygon(jmod)
		          
		          If q = p Or q = p0 Or q = p1 Then Continue
		          
		          // Check the distance first, since this is generally
		          // a much faster operation than checking if its visible.
		          Var dist As Double = p.DistanceSquared(q)
		          If dist < closestDistance Then
		            If Self.IsVisible(polygon, i, jmod) Then
		              closestDistance = dist
		              closestIndex = jmod
		            End If
		          End If
		        Next j
		        
		        // Once we find the closest partition the polygon.
		        If i < closestIndex Then
		          lower.addAll(polygon.subList(i, closestIndex + 1))
		          If closestIndex <> 0 Then upper.addAll(polygon.subList(closestIndex, size))
		          upper.addAll(polygon.subList(0, i + 1))
		        Else
		          If i <> 0 Then lower.addAll(polygon.subList(i, size))
		          lower.addAll(polygon.subList(0, closestIndex + 1))
		          upper.addAll(polygon.subList(closestIndex, i + 1))
		        End If
		      End If
		      
		      // Decompose the smaller first.
		      If lower.Count < upper.Count Then
		        DecomposePolygon(lower, polygons)
		        DecomposePolygon(upper, polygons)
		      Else
		        DecomposePolygon(upper, polygons)
		        DecomposePolygon(lower, polygons)
		      End If
		      
		      // If the given polygon contains a reflex vertex, then return.
		      Return
		    End If
		  Next i
		  
		  // If we get here, we know the given polygon has 0 reflex vertices
		  // and is therefore convex, add it to the list of convex polygons.
		  If polygon.Count < 3 Then
		    Raise New InvalidArgumentException(PKMessages.GEOMETRY_DECOMPOSE_CROSSING_EDGES)
		  End If
		  
		  Var vertices() As PKVector2
		  vertices.ResizeTo(polygon.Count - 1)
		  polygon.ToArray(vertices)
		  polygons.AddRow(PKGeometry.CreatePolygon(vertices))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320547275652069662074686520676976656E206C696E657320696E7465727365637420616E642072657475726E732074686520696E74657273656374696F6E20706F696E7420696E20746865207020706172616D657465722E
		Protected Function GetIntersection(a1 As PKVector2, a2 As PKVector2, b1 As PKVector2, b2 As PKVector2, p As PKVector2) As Boolean
		  ///
		  ' Returns True if the given lines intersect and returns the intersection point in the p parameter.
		  '
		  ' - Parameter a1: The first point of the first line.
		  ' - Parameter a2: The second point of the first line.
		  ' - Parameter b1: The first point of the second line.
		  ' - Parameter b2: The second point of the second line.
		  ' - Parameter p: The destination object for the intersection point.
		  ///
		  
		  // Compute S1 and S2.
		  Var s1 As PKVector2 = a1.Difference(a2)
		  Var s2 As PKVector2 = b1.Difference(b2)
		  
		  // Compute the cross product (the determinant if we used matrix solving techniques).
		  Var det As Double = s1.Cross(s2)
		  
		  // Make sure the matrix isn't singular (the lines could be parallel).
		  If Abs(det) <= PKEpsilon.E Then
		    // Return False since there is no way that the segments could be intersecting.
		    Return False
		  Else
		    // Pre-divide the determinant.
		    det = 1.0 / det
		    
		    // Compute t2.
		    Var t2 As Double = det * (a1.Cross(s1) - b1.Cross(s1))
		    
		    // Compute the intersection point.
		    // P = B1(1.0 - t2) + B2(t2)
		    p.X = b1.X * (1.0 - t2) + b2.X * t2
		    p.Y = b1.Y * (1.0 - t2) + b2.Y * t2
		    
		    // Return that they intersect.
		    Return True
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320547275652069662074686520676976656E207665727465782C20622C2069732061207265666C6578207665727465782E2028492E653A2061207665727465782077686F277320696E746572696F7220616E676C652069732067726561746572207468616E203138302064656772656573292E
		Protected Function IsReflex(p0 As PKVector2, p As PKVector2, p1 As PKVector2) As Boolean
		  ///
		  ' Returns True if the given vertex, b, is a reflex vertex.
		  ' A reflex vertex is a vertex who's interior angle is greater than 180 degrees.
		  '
		  ' - Parameter p0: The vertex to test.
		  ' - Parameter p: The previous vertex.
		  ' - Parameter p1: The next vertex.
		  ///
		  
		  // If the point p is to the right of the line p0-p1 then the point is a reflex vertex.
		  Return Right(p1, p0, p)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E732054727565206966207468652076657274657820617420696E64657820692063616E20736565207468652076657274657820617420696E646578206A2E
		Private Function IsVisible(polygon() As PKVector2, i As Integer, j As Integer) As Boolean
		  ///
		  ' Returns True if the vertex at index i can see the vertex at index j.
		  '
		  ' - Parameter polygon(): The current polygon.
		  ' - Parameter i: The ith vertex.
		  ' - Parameter j: The jth vertex.
		  ///
		  
		  Var s As Integer = polygon.Count
		  Var iv0, iv, iv1 As PKVector2
		  Var jv0, jv, jv1 As PKVector2
		  
		  iv0 = polygon(If(i = 0, s - 1, i - 1))
		  iv = polygon(i)
		  iv1 = polygon(If(i + 1 = s, 0, i + 1))
		  
		  jv0 = polygon(If(j = 0, s - 1, j - 1))
		  jv = polygon(j)
		  jv1 = polygon(If(j + 1 = s, 0, j + 1))
		  
		  // Can i see j?
		  If Self.IsReflex(iv0, iv, iv1) Then
		    If LeftOn(iv, iv0, jv) And RightOn(iv, iv1, jv) Then Return False
		  Else
		    If RightOn(iv, iv1, jv) Or LeftOn(iv, iv0, jv) Then Return False
		  End If
		  // Can j see i?
		  If Self.IsReflex(jv0, jv, jv1) Then
		    If LeftOn(jv, jv0, iv) And RightOn(jv, jv1, iv) Then Return False
		  Else
		    If RightOn(jv, jv1, iv) Or LeftOn(jv, jv0, iv) Then Return False
		  End If
		  
		  // Make sure the segment from i to j doesn't intersect any edges.
		  Var kLimit As Integer = s - 1
		  For k As Integer = 0 To kLimit
		    Var ki1 As Integer = If(k + 1 = s, 0, k + 1)
		    If k = i Or k = j Or ki1 = i Or ki1 = j Then Continue
		    Var k1 As PKVector2 = polygon(k)
		    Var k2 As PKVector2 = polygon(ki1)
		    
		    Var in_ As PKVector2 = PKSegment.GetSegmentIntersection(iv, jv, k1, k2)
		    If in_ <> Nil Then Return False
		  Next k
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320547275652069662074686520676976656E20706F696E74207020697320746F20746865206C656674206F6620746865206C696E65206372656174656420627920612D622E
		Protected Function Left(a As PKVector2, b As PKVector2, p As PKVector2) As Boolean
		  ///
		  ' Returns True if the given point p is to the left of the line created by a-b.
		  '
		  ' - Parameter a: The first point of the line.
		  ' - Parameter b: The second point of the line.
		  ' - Parameter p: The point to test.
		  ///
		  
		  Return Segment.GetLocation(p, a, b) > 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320547275652069662074686520676976656E20706F696E74207020697320746F20746865206C656674206F72206F6E20746865206C696E65206372656174656420627920612D622E
		Protected Function LeftOn(a As PKVector2, b As PKVector2, p As PKVector2) As Boolean
		  ///
		  ' Returns True if the given point p is to the left or on the line created by a-b.
		  '
		  ' - Parameter a: The first point of the line.
		  ' - Parameter b: The second point of the line.
		  ' - Parameter p: The point to test.
		  ///
		  
		  Return Segment.GetLocation(p, a, b) >= 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320547275652069662074686520676976656E20706F696E74207020697320746F20746865207269676874206F6620746865206C696E65206372656174656420627920612D622E
		Protected Function Right(a As PKVector2, b As PKVector2, p As PKVector2) As Boolean
		  ///
		  ' Returns True if the given point p is to the right of the line created by a-b.
		  '
		  ' - Parameter a: The first point of the line.
		  ' - Parameter b: The second point of the line.
		  ' - Parameter p: The point to test.
		  ///
		  
		  Return Segment.GetLocation(p, a, b) < 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320547275652069662074686520676976656E20706F696E74207020697320746F20746865207269676874206F72206F6E20746865206C696E65206372656174656420627920612D622E
		Protected Function RightOn(a As PKVector2, b As PKVector2, p As PKVector2) As Boolean
		  ///
		  ' Returns True if the given point p is to the right or on the line created by a-b.
		  '
		  ' - Parameter a: The first point of the line.
		  ' - Parameter b: The second point of the line.
		  ' - Parameter p: The point to test.
		  ///
		  
		  Return Segment.GetLocation(p, a, b) <= 0
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of the Bayazit convex decomposition algorithm for simple polygons.
		This algorithm is a O(nr) complexity algorithm where n is the number of input vertices and r is 
		the number of output convex polygons.
		This algorithm can achieve optimal decompositions, however this is not guaranteed.
		
		
	#tag EndNote


End Class
#tag EndClass
