#tag Class
Protected Class DivideAndConquer
Implements PhysicsKit.HullGenerator
	#tag Method, Flags = &h0, Description = 526563757273697665206D6574686F6420746F2073756264697669646520616E64206D657267652074686520706F696E74732E
		Function Divide(points() As PhysicsKit.Vector2, first As Integer, last As Integer) As PhysicsKit.LinkedVertexHull
		  ///
		  ' Recursive method to subdivide and merge the points.
		  '
		  ' - Parameter points: The array of points.
		  ' - Parameter first: The first index inclusive.
		  ' - Parameter last: The last index exclusive.
		  '
		  ' - Returns: The convex hull created as a Linked VertexHull.
		  ///
		  
		  // Compute the size of the hull we need to create.
		  Var size As Integer = last - first
		  
		  If size = 1 Then
		    // If we only have one point create a hull containing the one point.
		    Return New LinkedVertexHull(points(first))
		  Else
		    // Otherwise find the middle index.
		    Var mid As Integer = (first + last) / 2
		    
		    // Create the left convex hull.
		    Var left As LinkedVertexHull = Divide(points, first, mid)
		    
		    // Create the right convex hull.
		    Var right As LinkedVertexHull = Divide(points, mid, last)
		    
		    // Merge the two convex hulls.
		    Return LinkedVertexHull.Merge(left, right)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Generate(points() As PhysicsKit.Vector2) As PhysicsKit.Vector2()
		  ///
		  ' - Note: Part of the PhysicsKit.HullGenerator interface.
		  ///
		  
		  // Check for a Nil array of points.
		  If points = Nil Then Raise New NilObjectException(Messages.GEOMETRY_HULL_NIL_ARRAY)
		  
		  // Get the size.
		  Var size As Integer = points.Count
		  
		  // Check the size.
		  If size <= 2 Then Return points
		  
		  Try
		    // Sort the points by the x coordinate, then the y coordinate.
		    points.Sort(AddressOf MinXYPointComparator.Compare)
		  Catch e As NilObjectException
		    // This will be hit if any of the points are Nil.
		    Raise New NilObjectException(Messages.GEOMETRY_HULL_NIL_POINTS)
		  End Try
		  
		  // No need to pre-process the input and remove coincident points.
		  // Those are gracefully handled and removed in the main algorithm. 
		  
		  // Perform the divide and conquer algorithm on the point cloud.
		  Var hull As LinkedVertexHull = Self.Divide(points, 0, size)
		  
		  // Return the array.
		  Return hull.ToArray
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of the Divide and Conquer convex hull algorithm.
		
		This algorithm handles coincident and colinear points by ignoring them during processing. This ensures
		the produced hull will not have coincident or colinear vertices.
		
		This algorithm is O(n log n) where n is the number of input points.
		
		
	#tag EndNote


End Class
#tag EndClass
