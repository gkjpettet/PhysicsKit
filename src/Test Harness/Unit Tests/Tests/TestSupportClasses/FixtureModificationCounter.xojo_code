#tag Class
Protected Class FixtureModificationCounter
Implements PKFixtureModificationHandler
	#tag Method, Flags = &h0
		Sub AllFixturesRemoved()
		  ///
		  ' - Note: Part of the PKFixtureModificationHandler interface.
		  ///
		  
		  AllRemoved = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FixtureAdded(fixture As PKFixture)
		  ///
		  ' - Note: Part of the PKFixtureModificationHandler interface.
		  ///
		  
		  #Pragma Unused fixture
		  
		  Added = Added + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FixtureRemoved(fixture As PKFixture)
		  ///
		  ' - Note: Part of the PKFixtureModificationHandler interface.
		  ///
		  
		  #Pragma Unused fixture
		  
		  Removed = Removed + 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  Added = 0
		  Removed = 0
		  AllRemoved = False
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Added As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		AllRemoved As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Removed As Integer
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
	#tag EndViewBehavior
End Class
#tag EndClass
