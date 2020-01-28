#tag Class
Protected Class Feature
	#tag Method, Flags = &h0
		Sub Constructor(index As Integer)
		  ///
		  ' Minimal constructor.
		  ' - Parameter index: The index of the feature in the Shape.
		  ///
		  
		  Self.Index = index
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206564676520696E6465782E2049662060696E64657860203D2060466561747572652E4E4F545F494E444558454460207468656E2074686973206665617475726520726570726573656E747320612063757276656420736861706520666561747572652E
		Function GetIndex() As Integer
		  ///
		  ' Returns the edge index.
		  '
		  ' If index = NOT_INDEXED then this feature represents a curved shape feature.
		  '
		  ' - Returns: Integer.
		  ///
		  
		  Return Self.Index
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1, Description = 54686520696E646578206F66207468652065646765206F6E207468652073686170652E
		Protected Index As Integer
	#tag EndProperty


	#tag Constant, Name = NOT_INDEXED, Type = Double, Dynamic = False, Default = \"-1", Scope = Public, Description = 496E64657820666F72206E6F6E2D696E64657865642076657274696365732E
	#tag EndConstant


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
