#tag Class
Protected Class PKLinkedVertexHull
	#tag Method, Flags = &h0
		Sub Constructor()
		  ///
		  ' Default constructor.
		  ///
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(point As PKVector2)
		  ///
		  ' Create a convex PKLinkedVertexHull of one point.
		  '
		  ' - Parameter point: The point.
		  ///
		  
		  Var root As PhysicsKit.LinkedVertex = New PhysicsKit.LinkedVertex(point)
		  Self.LeftMost = root
		  Self.RightMost = root
		  Self.Size = 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D6572676573207468652074776F20676976656E20636F6E766578204C696E6B656456657274657848756C6C7320696E746F206F6E6520636F6E766578204C696E6B656456657274657848756C6C2E
		Shared Function Merge(left As PKLinkedVertexHull, right As PKLinkedVertexHull) As PKLinkedVertexHull
		  ///
		  ' Merges the two given convex PKLinkedVertexHulls into one convex PKLinkedVertexHull.
		  '
		  ' The left PKLinkedVertexHull should contain only points whose x coordinates are
		  ' less than all the points in the right PKLinkedVertexHull.
		  '
		  ' - Parameter left: The left convex PKLinkedVertexHull.
		  ' - Parameter right: The right convex PKLinkedVertexHull.
		  '
		  ' - Returns: A new PKLinkedVertexHull representing the merged convex hull.
		  ///
		  
		  // This merge algorithm handles all cases, including point-point and point-segment without 
		  // special cases.
		  // It finds the upper and lower edges that connect the two hulls such that the resulting 
		  // hull remains convex.
		  
		  Var hull As PKLinkedVertexHull = New PKLinkedVertexHull
		  hull.LeftMost = left.LeftMost
		  hull.RightMost = right.RightMost
		  
		  Var lu As PhysicsKit.LinkedVertex = left.RightMost
		  Var ru As PhysicsKit.LinkedVertex = right.LeftMost
		  
		  // We don't use strict inequalities when checking the result of getLocation
		  // so we can remove coincident points in the hull.
		  // As a result we must limit the number of loops that go to the left or right
		  // because else ru = ru.PreviousVertex can loop over and never terminate
		  // We can walk at most side.Size - 1 before looping over.
		  Var limitRightU As Integer = right.size - 1
		  Var limitLeftU As Integer = left.Size - 1
		  
		  Do
		    Var prevLu As PhysicsKit.LinkedVertex = lu
		    Var prevRu As PhysicsKit.LinkedVertex = ru
		    
		    While limitRightU > 0 And PhysicsKit.RobustGeometry.GetLocation(ru.NextVertex.Point, lu.Point, ru.Point) <= 0
		      ru = ru.NextVertex
		      limitRightU = limitRightU - 1
		    Wend
		    
		    While limitLeftU > 0 And PhysicsKit.RobustGeometry.GetLocation(lu.PreviousVertex.Point, lu.Point, ru.Point) <= 0
		      lu = lu.PreviousVertex
		      limitLeftU = limitLeftU - 1
		    Wend
		    
		    // If no progress is made there's nothing else to do.
		    If lu = prevLu And ru = prevRu Then Exit
		  Loop
		  
		  // Same as before, for the other side.
		  Var ll As PhysicsKit.LinkedVertex = left.RightMost
		  Var rl As PhysicsKit.LinkedVertex = right.LeftMost
		  
		  Var limitRightL As Integer = right.Size - 1
		  Var limitLeftL As Integer = left.Size - 1
		  
		  Do
		    Var prevLl As PhysicsKit.LinkedVertex = ll
		    Var prevRl As PhysicsKit.LinkedVertex = rl
		    
		    While limitRightL > 0 And PhysicsKit.RobustGeometry.GetLocation(rl.PreviousVertex.Point, ll.Point, rl.Point) >= 0
		      rl = rl.PreviousVertex
		      limitRightL = limitRightL - 1
		    Wend
		    
		    While limitLeftL > 0 And PhysicsKit.RobustGeometry.GetLocation(ll.NextVertex.Point, ll.Point, rl.Point) >= 0
		      ll = ll.NextVertex
		      limitLeftL = limitLeftL - 1
		    Wend
		    
		    // If no progress is made there's nothing else to do.
		    If ll = prevLl And rl = prevRl Then Exit
		  Loop
		  
		  // Link the hull.
		  lu.NextVertex = ru
		  ru.PreviousVertex = lu
		  
		  ll.PreviousVertex = rl
		  rl.NextVertex = ll
		  
		  // We could compute size with a closed-form type based on the four values
		  // of limitLeft/Right/L/U but it is not straightforward and there is no observable
		  // speed gain. So use a simple loop instead.
		  Var size As Integer = 0
		  Var v As PhysicsKit.LinkedVertex = lu
		  
		  Do
		    size = size + 1
		    v = v.NextVertex
		  Loop Until v <> lu
		  
		  // Set the size.
		  hull.Size = size
		  
		  // Return the merged hull.
		  Return hull
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720617272617920726570726573656E74696E67207468697320636F6E7665782068756C6C2E
		Function ToArray() As PKVector2()
		  ///
		  ' Returns a new array representing this convex hull.
		  '
		  ' - Returns: An array of PKVector2 objects.
		  ///
		  
		  Var points() As PKVector2
		  points.ResizeTo(Self.Size - 1)
		  
		  Var vertex As PhysicsKit.LinkedVertex = Self.LeftMost
		  
		  Var iLimit As Integer = Self.Size - 1
		  For i As Integer = 0 To iLimit
		    points(i) = vertex.Point
		    vertex = vertex.NextVertex
		  Next i
		  
		  Return points
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F662074686973206F626A6563742E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this PKLinkedVertexHull.
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  s.AddRow("PKLinkedVertexHull[Size=")
		  s.AddRow(Self.Size.ToString)
		  s.AddRow("|LeftMostPoint=")
		  s.AddRow(Self.LeftMost.Point.ToString)
		  s.AddRow("|RightMostPoint=")
		  s.AddRow(Self.RightMost.Point.ToString)
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Represents a convex hull of LinkedVertexes.
		The root vertex can be any point on the hull.
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 546865207665727465782074686174206861732074686520736D616C6C657374207820636F6F7264696E6174652E
		LeftMost As PhysicsKit.LinkedVertex
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652076657274657820746861742068617320746865206C617267657374207820636F6F7264696E6174652E
		RightMost As PhysicsKit.LinkedVertex
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520746F74616C206E756D626572206F66207665727469636573206F6E207468652068756C6C2E
		Size As Integer
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
			Name="Size"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
