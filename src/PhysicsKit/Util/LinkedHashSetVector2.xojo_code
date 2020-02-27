#tag Class
Protected Class LinkedHashSetVector2
	#tag Method, Flags = &h0, Description = 41646473207468652073706563696669656420656C656D656E7420746F207468697320736574206966206974206973206E6F7420616C72656164792070726573656E742E20
		Function Add(e As PhysicsKit.Vector2) As Boolean
		  ///
		  ' Adds the specified element to this set if it is not already present. 
		  ' More formally, adds the specified element `e` to this set if this set contains 
		  ' no element `e2` such that (`e=Nil ? e2=Nil : e.Equals(e2)`). 
		  ' If this set already contains the element, the call leaves the set unchanged and returns False.
		  ///
		  
		  If DataDictionary.HasKey(e) Then Return False
		  
		  DataDictionary.Value(e) = True
		  DataArray.AddRow(e)
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  DataDictionary = New Dictionary
		  DataArray.ResizeTo(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Size() As Integer
		  ///
		  ' Returns the number of elements in this set.
		  ///
		  
		  Return DataArray.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320616E20617272617920636F6E7461696E696E6720616C6C206F662074686520656C656D656E747320696E2074686973207365742E20
		Function ToArray() As PhysicsKit.Vector2()
		  ///
		  ' Returns an array containing all of the elements in this set. 
		  ' Returns the elements in the same order.
		  ' The returned array will be "safe" in that no references to it are maintained by this set. 
		  ' In other words, this method allocates a new array.
		  ' The caller is thus free to modify the returned array.
		  ///
		  
		  Var result() As Vector2
		  
		  For Each v As Vector2 In DataArray
		    result.AddRow(v)
		  Next v
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToArray(result() As PhysicsKit.Vector2) As PhysicsKit.Vector2()
		  ///
		  ' Returns an array containing all of the elements in this set. 
		  ' If the set fits in the specified array, it is returned therein. 
		  ' Otherwise, a new array is allocated and the size of this set.
		  ' If this set fits in the specified array with room to spare (i.e., the array has more 
		  ' elements than this set), the element in the array immediately following the end of the 
		  ' set is set to Nil. (This is useful in determining the length of this set only if 
		  ' the caller knows that this set does not contain any null elements.)
		  ///
		  
		  If result.Count < Self.Size Then
		    result.ResizeTo(-1)
		    For Each v As Variant In DataArray
		      result.Append(v)
		    Next v
		  Else
		    Var i As Integer = 0
		    For Each v As Variant In DataArray
		      result(i) = v
		      i = i + 1
		    Next v
		    If result.Count > Self.Size Then result(i) = Nil
		  End If
		  
		  Return result
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private DataArray() As PhysicsKit.Vector2
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DataDictionary As Dictionary
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
			Name="DataDictionary"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
