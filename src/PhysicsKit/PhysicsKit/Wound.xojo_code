#tag Interface
Protected Interface Wound
Implements  PKShape
	#tag Method, Flags = &h0, Description = 52657475726E7320616E206974657261746F7220666F7220746865206E6F726D616C732E
		Function GetNormalIterator() As Iterator
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNormals() As PKVector2()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320616E206974657261746F7220666F72207468652076657274696365732E
		Function GetVertexIterator() As Iterator
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206172726179206F6620766572746963657320696E206C6F63616C20636F6F7264696E617465732E
		Function GetVertices() As PKVector2()
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Represents a shape that is defined by vertices with line segment connections 
		with counter-clockwise winding.
		
		GetVertexIterator() As Iterator
		-------------------------------
		Returns an iterator for the vertices.
		
		The iterator returns a new Vector in the `Value` method.
		This method is safer than `GetVertices()` since its not possible to 
		modify the array or its elements.
		
		- Returns: A PKVector2 Iterator.
		
		GetNormalIterator() As Iterator
		-------------------------------
		Returns an iterator for the normals.
		
		The iterator eturns a new PKVector2 in the `Value` method rather than the underlying value.
		This method is safer than `GetNormals()` since its not possible to 
		modify the array or its elements.
		
		- Returns: A PKVector2 Iterator.
		
		GetVertices() As PKVector2()
		--------------------------
		Returns the array of vertices in local coordinates.
		
		For performance, this array may be the internal storage array of the shape.
		Both the array elements and their properties should not be modified via this method.
		It's possible that this method will be deprecated and/or removed in later versions.
		
		- Returns: PKVector2 array.
		
		GetNormals() As PKVector2()
		-------------------------
		Returns the array of edge normals in local coordinates.
		
		For performance, this array may be the internal storage array of the shape.
		Both the array elements and their properties should not be modified via this method.
		It's possible that this method will be deprecated and/or removed in later versions.
		
		- Returns: PKVector2 array.
		
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
End Interface
#tag EndInterface
