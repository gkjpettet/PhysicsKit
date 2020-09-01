#tag Class
Protected Class PointFeature
Inherits PhysicsKit.Feature
	#tag Method, Flags = &h0, Description = 4F7074696F6E616C20636F6E7374727563746F722E20417373756D65732074686520676976656E20706F696E74206973206E6F7420696E64657865642E
		Sub Constructor(point As PKVector2)
		  ///
		  ' Optional constructor.
		  '
		  ' Assumes the given point is not indexed.
		  '
		  ' - Parameter point: The vertex point.
		  ///
		  
		  Constructor(point, Feature.NOT_INDEXED)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(point As PKVector2, index As Integer)
		  ///
		  ' Full constructor.
		  ' - Paramater point: The vertex point.
		  ' - Parameter index: The index.
		  ///
		  
		  Super.Constructor(index)
		  Self.Point = point
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPoint() As PKVector2
		  ///
		  ' Returns the point.
		  '
		  ' - Returns: PKVector2.
		  ///
		  
		  Return Self.Point
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F66207468697320506F696E744665617475726520696E2074686520666F726D3A202022506F696E74466561747572655B506F696E743D28582C59297C496E6465783D696E6465785D222E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this PointFeature in the form: 
		  ' "PointFeature[Point=(X,Y)|Index=index]".
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  s.AddRow("PointFeature[Point=")
		  s.AddRow(Self.Point.ToString)
		  s.AddRow("|Index=")
		  s.AddRow(Self.Index.ToString)
		  s.AddRow("]")
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of a point Feature of a `Shape`.
		A `PointFeature can represent either a vertex or an arbitrary point on a `Shape`'s edge.
		
		The index of a `PointFeature` is the index of the vertex in the `Shape`
		or `Feature.NOT_INDEXED` if its an arbitrary point.
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 54686520766572746578206F7220706F696E742E
		Point As PKVector2
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
	#tag EndViewBehavior
End Class
#tag EndClass
