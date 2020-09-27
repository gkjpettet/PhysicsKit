#tag Class
Protected Class ComparableObject
Implements FKComparable
	#tag Method, Flags = &h0
		Function CompareTo(other As Variant) As Integer
		  ///
		  ' - Note: Part of the FKComparable interface.
		  ///
		  
		  #Pragma Unused other
		  
		  Raise New UnsupportedOperationException
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(other As Variant) As Boolean
		  ///
		  ' - Note: Part of the FKComparable interface.
		  ///
		  
		  #Pragma Unused other
		  
		  Raise New UnsupportedOperationException
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HashCode() As Integer
		  ///
		  ' - Note: Part of the FKComparable interface.
		  ///
		  
		  Return Variant(Self).Hash
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  ///
		  ' - Note: Part of the FKComparable interface.
		  ///
		  
		  Return "ComparableObject instance"
		  
		End Function
	#tag EndMethod


End Class
#tag EndClass
