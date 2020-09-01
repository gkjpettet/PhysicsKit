#tag Class
Protected Class GiftWrap
Implements PhysicsKit.HullGenerator
	#tag Method, Flags = &h0
		Function Generate(points() As PKVector2) As PKVector2()
		  ///
		  ' - Note: Part of the PhysicsKit.HullGenerator interface.
		  ///
		  
		  // Check for Nil array.
		  If points = Nil Then Raise New NilObjectException(Messages.GEOMETRY_HULL_NIL_ARRAY)
		  
		  // Get the size.
		  Var size As Integer = points.Count
		  
		  // Check the size.
		  If size <= 2 Then Return points
		  
		  // Find the left most point.
		  Var x As Double = MathsKit.DOUBLE_MAX_VALUE
		  Var y As Double = MathsKit.DOUBLE_MAX_VALUE
		  Var leftMost As PKVector2
		  Var iLimit As Integer = size - 1
		  For i As Integer = 0 To iLimit
		    Var p As PKVector2 = points(i)
		    
		    // Check for Nil points.
		    If p = Nil Then Raise New NilObjectException(Messages.GEOMETRY_HULL_NIL_POINTS)
		    
		    // Check the x coordinate.
		    If p.X < x Then
		      x = p.X
		      leftMost = p
		      y = p.Y
		    ElseIf p.X = x And p.Y < y Then
		      x = p.X
		      leftMost = p
		      y = p.Y
		    End If
		  Next i
		  
		  Var current As PKVector2 = leftMost
		  
		  // Use a linked hash set to maintain insertion order but also prevent duplicate insertion.
		  Var hull As PhysicsKit.Util.LinkedHashSetPKVector2 = New PhysicsKit.Util.LinkedHashSetPKVector2
		  
		  Do
		    Call hull.Add(current)
		    
		    // Check all the points to see if anything is more left than the next point.
		    Var nextPoint As PKVector2 = points(0)
		    If current = nextPoint Then nextPoint = points(1)
		    
		    // Loop over the points to find a more left point than the current.
		    Var jLimit As Integer = size - 1
		    For j As Integer = 1 To jLimit
		      Var test As PKVector2 = points(j)
		      If test = current Then Continue
		      If test = nextPoint Then Continue
		      // Check the point relative to the current line.
		      // Use the robust side of line test because otherwise this algorithm
		      // can fall in an endless loop.
		      Var location As Double = RobustGeometry.GetLocation(test, current, nextPoint)
		      If location < 0 Then
		        nextPoint = test
		      ElseIf location = 0 Then
		        // In the case of colinear or coincident verticies only select this vertex if 
		        // it's farther away than the current vertex.
		        Var d1 As Double = test.DistanceSquared(current)
		        Var d2 As Double = nextPoint.DistanceSquared(current)
		        
		        // We also need to confirm that it's farther away in the 
		        // direction of the current->next vector.
		        Var dot As Double = current.Towards(nextPoint).Dot(current.Towards(test))
		        If d1 > d2 And dot >= 0 Then
		          nextPoint = test
		        Else
		          // If it's not farther, compute the winding.
		          Var l1 As PKVector2 = current.Towards(nextPoint)
		          Var l2 As PKVector2 = nextPoint.Towards(test)
		          Var cross As Double = l1.Cross(l2)
		          
		          // If the winding is anti-clockwise but the location test yielded they were colinear, 
		          // then we encountered sufficient numeric error - trust the winding
		          // in these cases.
		          If cross < 0 Then nextPoint = test
		        End If
		      End If
		    Next j
		    
		    current = nextPoint
		    // loop until we repeat the first leftMost point
		  Loop Until leftMost = current
		  
		  // Copy the set into an array.
		  Var hullPoints() As PKVector2
		  hullPoints.ResizeTo(hull.Size - 1)
		  Call hull.ToArray(hullPoints)
		  
		  // Return the array.
		  Return hullPoints
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of the Gift Wrapping convex hull algorithm.
		
		This algorithm handles coincident and colinear points by ignoring them during processing. This ensures
		the produced hull will not have coincident or colinear vertices.
		
		This algorithm is O(nh) worst case where n is the number of points and h is the
		number of sides in the resulting convex hull.
		
		
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
End Class
#tag EndClass
