#tag Class
Protected Class GrahamScan
Implements  PKHullGenerator
	#tag Method, Flags = &h0
		Function Generate(points() As PKVector2) As PKVector2()
		  ///
		  ' - Note: Part of the PhysicsKit.HullGenerator interface.
		  ///
		  
		  // Check for a Nil points array.
		  If points Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_HULL_NIL_ARRAY)
		  
		  // Get the size.
		  Var size As Integer = points.Count
		  
		  // Check the size.
		  If size <= 2 Then Return points
		  
		  // Find the point of minimum y (choose the point of minimum x if there is a tie).
		  Var minY As PKVector2 = points(0)
		  
		  Var iLimit As Integer = size - 1
		  For i As Integer = 1 To iLimit
		    Var p As PKVector2 = points(i)
		    // Make sure the point is not Nil.
		    If p Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_HULL_NIL_POINTS)
		    If p.Y < minY.Y Then
		      minY = p
		    ElseIf p.Y = minY.Y Then
		      If p.X > minY.X Then minY = p
		    End If
		  Next i
		  
		  // Create the comparator for the array.
		  Var pc As ReferencePointComparator = New ReferencePointComparator(minY)
		  // Sort the array by angle.
		  points.Sort(AddressOf pc.Compare)
		  
		  // Build the hull.
		  Var stack() As PKVector2
		  
		  // Push
		  stack.AddRow(points(0))
		  stack.AddRow(points(1))
		  
		  Var i As Integer = 2
		  While i < size
		    Var sSize As Integer = stack.Count
		    // If the stack size is one then just push the current point onto the stack
		    // thereby making a line segment.
		    
		    If sSize = 1 Then
		      // Push.
		      stack.AddRow(points(i))
		      i = i + 1
		      Continue
		    End If
		    
		    // Otherwise get the top two items off the stack.
		    Var p1 As PKVector2 = stack(sSize - 2)
		    Var p2 As PKVector2 = stack(sSize - 1)
		    // Get the current point.
		    Var p3 As PKVector2 = points(i)
		    
		    // Test if the current point is to the left of the line
		    // created by the top two items in the stack (the last edge
		    // on the current convex hull).
		    
		    // Use the robust side of line test because otherwise this algorithm
		    // can produce incorrect results in edge cases.
		    // The order of parameters here must match the one in ReferenceComparator
		    // in order to obtain correct results and winding.
		    Var location As Double = RobustGeometry.GetLocation(p3, p2, p1)
		    
		    If location < 0 Then
		      // If it's to the left, then push the new point on
		      // the stack since it maintains convexity
		      stack.AddRow(p3)
		      i = i + 1
		    Else
		      // Otherwise the pop the previous point off the stack
		      // since this indicates that if we added the current
		      // point to the stack we would make a concave section pop.
		      Call stack.Pop
		    End If
		  Wend
		  
		  // Return the array.
		  Return stack
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of the Graham Scan convex hull algorithm.
		This algorithm handles coincident and colinear points by ignoring them during processing. This ensures
		the produced hull will not have coincident or colinear vertices.
		
		This algorithm is O(n log n) where n is the number of input points.
		
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
