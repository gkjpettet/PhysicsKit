#tag Class
Protected Class TestBody
Inherits PKAbstractCollisionBody
	#tag Method, Flags = &h0
		Function AddFixture(convex As PKConvex) As PKFixture
		  Var fixture As PKFixture = New PKFixture(convex)
		  Call Self.AddFixture(fixture)
		  Return fixture
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Self.Center = New PKVector2
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(fixtureCount As Integer)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(fixtureCount)
		  
		  Self.Center = New PKVector2
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLocalCenter() As PKVector2
		  Return Self.Center
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Center As PKVector2
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
