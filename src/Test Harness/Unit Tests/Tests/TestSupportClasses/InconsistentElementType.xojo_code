#tag Class
Protected Class InconsistentElementType
Inherits PKObject
Implements FKComparable
	#tag Method, Flags = &h0
		Function CompareTo(other As Variant) As Integer
		  ///
		  ' - Note: Part of the FKComparable interface.
		  ///
		  
		  If other IsA InconsistentElementType Then
		    Return Self.Value - InconsistentElementType(other).Value
		  Else
		    Raise New InvalidArgumentException("Expected an InconsistentElementType as the argument")
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(value As Integer)
		  Self.Value = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(other As Variant) As Boolean
		  ///
		  ' - Note: Part of the FKComparable interface.
		  ///
		  
		  #Pragma Unused other
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HashCode() As Integer
		  ///
		  ' - Note: Overrides `PKObject.HashCode`.
		  ///
		  
		  Return Value
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Value As Integer
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
