#tag Class
Protected Class ComparableInteger
Implements FKComparable
	#tag Method, Flags = &h0
		Function CompareTo(other As Variant) As Integer
		  ///
		  ' - Note: Part of the FKComparable interface.
		  ///
		  
		  If other IsA ComparableInteger Then
		    Var i As Integer = ComparableInteger(other).Value
		    If Value = i Then
		      Return 0
		    ElseIf Value > i Then
		      Return 1
		    Else
		      Return -1
		    End If
		  ElseIf other.Type = Variant.TypeInteger Then
		    If Value = other.IntegerValue Then
		      Return 0
		    ElseIf Value > other.IntegerValue Then
		      Return 1
		    Else
		      Return -1
		    End If
		  Else
		    Return -1
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(i As Integer)
		  Value = i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(other As Variant) As Boolean
		  ///
		  ' - Note: Part of the FKComparable interface.
		  ///
		  
		  If Self = other Then Return True
		  If other IsA ComparableInteger Then Return Value = ComparableInteger(other).Value
		  If other.Type = Variant.TypeInteger Then Return Value = other.IntegerValue
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  Return Value.ToString
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Value As Integer
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
			Name="Value"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
