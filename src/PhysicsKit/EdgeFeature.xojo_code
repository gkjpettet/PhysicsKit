#tag Class
Protected Class EdgeFeature
Inherits PhysicsKit.Feature
	#tag Method, Flags = &h0, Description = 4372656174657320616E206564676520666561747572652E
		Sub Constructor(vertex1 As PhysicsKit.PointFeature, vertex2 As PhysicsKit.PointFeature, max As PhysicsKit.PointFeature, edge As PhysicsKit.Vector2, index As Integer)
		  ///
		  ' Creates an edge feature.
		  ' - Parameter vertex1: The first vertex of the edge.
		  ' - Parameter vertex2: The second vertex of the edge.
		  ' - Parameter max: The maximum point.
		  ' - Parameter edge: The vector representing the edge.
		  ' - Parameter index: The index of the edge.
		  ///
		  
		  Super.Constructor(index)
		  Self.Vertex1 = vertex1
		  Self.Vertex2 = vertex2
		  Self.Edge = edge
		  Self.Max = max
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEdge() As PhysicsKit.Vector2
		  ///
		  ' Returns the vector representing this edge in counter-clockwise winding.
		  '
		  ' - Returns: Vector2.
		  ///
		  
		  Return Self.Edge
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMaximum() As PhysicsKit.PointFeature
		  ///
		  ' Returns the maximum point.
		  '
		  ' - Returns: PointFeature.
		  ///
		  
		  Return Self.Max
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520666972737420766572746578206F662074686520656467652E
		Function GetVertex1() As PhysicsKit.PointFeature
		  ///
		  ' Returns the first vertex of the edge.
		  ' - Returns: PointFeature.
		  ///
		  
		  Return Self.Vertex1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207365636F6E6420766572746578206F662074686520656467652E
		Function GetVertex2() As PhysicsKit.PointFeature
		  ///
		  ' Returns the second vertex of the edge.
		  ' - Returns: PointFeature.
		  ///
		  
		  Return Self.Vertex2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F662074686973206564676520666561747572652E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this edge feature.
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  s.AddRow("EdgeFeature[Vertex1=")
		  s.AddRow(Self.Vertex1.ToString)
		  s.AddRow("|Vertex2=")
		  s.AddRow(Self.Vertex2.ToString)
		  s.AddRow("|Edge=")
		  s.AddRow(Self.Edge.ToString)
		  s.AddRow("|Max=")
		  s.AddRow(Self.Max.ToString)
		  s.AddRow("|Index=")
		  s.AddRow(Self.Index.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of an edge Feature of a Shape.
		
		An EdgeFeature represents a **linear** edge of a Shape connecting
		two vertices.  It's not the intent of this class to represent curved edges.
		
		The index is the index of the edge in the Shape.
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 546865206564676520766563746F722E
		Edge As PhysicsKit.Vector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520766572746578206F66206D6178696D756D2070726F6A656374696F6E20616C6F6E67206120566563746F72322E
		Max As PhysicsKit.PointFeature
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520666972737420766572746578206F662074686520656467652E
		Vertex1 As PhysicsKit.PointFeature
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865207365636F6E6420766572746578206F662074686520656467652E
		Vertex2 As PhysicsKit.PointFeature
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
			Name="Index"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Vertex1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
