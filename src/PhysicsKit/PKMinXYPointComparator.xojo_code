#tag Class
Protected Class PKMinXYPointComparator
	#tag Method, Flags = &h0, Description = 4120736F7274696E672064656C6567617465207468617420736F72747320706F696E7473206279207468656972207820636F6F7264696E617465206C6F7765737420746F20686967686573742C207468656E20627920746865207920636F6F7264696E617465206C6F7765737420746F20686967686573742E
		Shared Function Compare(p1 As PKVector2, p2 As PKVector2) As Integer
		  ///
		  ' A sorting delegate that sorts points by their x coordinate lowest to highest, 
		  ' then by the y coordinate lowest to highest.
		  ///
		  
		  // First sort on the x coordinate.
		  Var diff As Double = p1.X - p2.X
		  
		  If diff = 0.0 Then
		    // If they are equal then sort on the y coordinate.
		    diff = p1.Y - p2.Y
		  End If
		  
		  Return If(diff > 0, 1, If(diff < 0, -1, 0))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  ///
		  ' Prevent instantiation of this class.
		  ///
		  
		End Sub
	#tag EndMethod


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
