#tag Class
Protected Class Link
Inherits PhysicsKit.Segment
	#tag Method, Flags = &h0
		Sub Constructor(point1 As PKVector2, point2 As PKVector2)
		  ///
		  ' Creates a new link.
		  '
		  ' - Parameter point1: The first vertex.
		  ' - Parameter point2: The last vertex.
		  ///
		  
		  Super.Constructor(point1, point2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206E657874206C696E6B20696E2074686520636861696E2E
		Function GetNext() As PhysicsKit.Link
		  ///
		  ' Returns the next link in the chain.
		  '
		  ' - Returns: Link.
		  ///
		  
		  Return Self.NextLink
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206C61737420766572746578206F66207468652070726576696F7573207365676D656E742E
		Function GetPoint0() As PKVector2
		  ///
		  ' Returns the last vertex of the previous segment.
		  '
		  ' - Returns: PKVector2.
		  ///
		  
		  Return If(Self.PreviousLink <> Nil, Self.PreviousLink.GetPoint1, Nil)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520666972737420766572746578206F6620746865206E657874207365676D656E742E
		Function GetPoint3() As PKVector2
		  ///
		  ' Returns the first vertex of the next segment.
		  '
		  ' - Returns: PKVector2.
		  ///
		  
		  Return If(Self.NextLink <> Nil, Self.NextLink.getPoint2, Nil)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652070726576696F7573206C696E6B20696E2074686520636861696E2E
		Function GetPrevious() As PhysicsKit.Link
		  ///
		  ' Returns the previous link in the chain.
		  '
		  ' - Returns: Link.
		  ///
		  
		  Return Self.PreviousLink
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double, x As Double, y As Double)
		  ///
		  ' - Note: Local rotation and translation will modify the next and previous links.
		  ///
		  
		  Super.Rotate(theta, x, y)
		  
		  // We need to update the next/prev links to reflect the change in this link's vertices.
		  If Self.NextLink <> Nil Then
		    Call Self.NextLink.Vertices(0).Set(Self.vertices(1))
		    // Update normals.
		    UpdateNormals(Self.NextLink)
		    UpdateLength(Self.NextLink)
		  End If
		  
		  If Self.PreviousLink <> Nil Then
		    Call Self.PreviousLink.Vertices(1).Set(Self.Vertices(0))
		    // Update normals.
		    UpdateNormals(Self.PreviousLink)
		    UpdateLength(Self.PreviousLink)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5365747320746865206E657874206C696E6B20696E2074686520636861696E2E
		Sub SetNext(nextLink As PhysicsKit.Link)
		  ///
		  ' Sets the next link in the chain.
		  '
		  ' This method will also:
		  ' 1. Unlink the current next (if applicable) and this link
		  ' 2. Link the given next and this link
		  '
		  ' - Parameter nextLink: The next link.
		  ///
		  
		  If Self.NextLink <> Nil Then
		    Self.NextLink.PreviousLink = Nil
		  End If
		  
		  Self.NextLink = nextLink
		  
		  If nextLink <> Nil Then
		    nextLink.PreviousLink = Self
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468652070726576696F7573206C696E6B20696E2074686520636861696E2E
		Sub SetPrevious(previousLink As PhysicsKit.Link)
		  ///
		  ' Sets the previous link in the chain.
		  '
		  ' This method will also:
		  ' 1. Unlink the current previous (if applicable) and this link.
		  ' 2.Link the given previous and this link.
		  '
		  ' - Parameter previous: The previous link.
		  ///
		  
		  If Self.PreviousLink <> Nil Then
		    Self.PreviousLink.NextLink = Nil
		  End If
		  
		  Self.PreviousLink = previousLink
		  
		  If previousLink <> Nil Then
		    previousLink.NextLink = Self
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Link.
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  
		  s.AddRow("Link[")
		  s.AddRow(Super.ToString)
		  s.AddRow("|Length=")
		  s.AddRow(Self.Length.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(x As Double, y As Double)
		  Super.Translate(x, y)
		  
		  // We need to update the next/prev links to reflect the change in this link's vertices.
		  If Self.NextLink <> Nil Then
		    Call Self.NextLink.Vertices(0).Set(Self.Vertices(1))
		    UpdateLength(Self.NextLink)
		  End If
		  
		  If Self.PreviousLink <> Nil Then
		    Call Self.PreviousLink.vertices(1).Set(Self.Vertices(0))
		    UpdateLength(Self.PreviousLink)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5570646174657320746865206C656E67746820616E6420726164697573206F662074686520676976656E205365676D656E742E
		Private Shared Sub UpdateLength(segment As PhysicsKit.Segment)
		  ///
		  ' Updates the length and radius of the given Segment.
		  '
		  ' When rotating or translating a link in a link chain, the connected links
		  ' will need their lengths and maximum radius recomputed to match the change.
		  '
		  ' - Parameter segment: The segment to update.
		  ///
		  
		  Var length As Double = segment.Vertices(0).Distance(segment.Vertices(1))
		  segment.Length = length
		  segment.Radius = length * 0.5
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5570646174657320746865206E6F726D616C73206F662074686520676976656E205365676D656E742E
		Private Shared Sub UpdateNormals(segment As PhysicsKit.Segment)
		  ///
		  ' Updates the normals of the given Segment.
		  '
		  ' When rotating a link in a link chain, the connected links
		  ' will need their normals recomputed to match the change.
		  '
		  ' - Parameter segment: The segment to update.
		  ///
		  
		  Var v As PKVector2 = segment.Vertices(0).Towards(segment.Vertices(1))
		  segment.Normals(0) = v.Copy
		  Call segment.Normals(0).Normalise
		  segment.Normals(1) = v.Right
		  Call segment.Normals(1).Normalise
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This class is a specialization of the Segment class that provides smooth sliding across
		a chain of line segments. This is achieved by storing the connectivity information between the
		links. With this, a correction process is performed to avoid the 'internal edge' problem.
		
		A Link is an infinitely thin line segment and will behave like the Segment class in
		collision response.
		
		Like the Segment class, this class can be locally rotated or translated. However, doing
		so will also translate/rotated the next or previous Links.
		
		For ease of use, it's recommended to use the Geometry class to create chains of Links.
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 546865206E657874206C696E6B20696E2074686520636861696E2E
		NextLink As PhysicsKit.Link
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652070726576696F7573206C696E6B20696E2074686520636861696E2E
		PreviousLink As PhysicsKit.Link
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
		#tag ViewProperty
			Name="Length"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
