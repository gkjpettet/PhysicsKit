#tag Class
Protected Class PKReferencePointComparator
	#tag Method, Flags = &h0
		Function Compare(p1 As PKVector2, p2 As PKVector2) As Integer
		  // We can use the `GetLocation` method to successfully sort by angle to the reference point
		  // This is also must faster than using ATan2 to compute the angles of the points.
		  // The order of parameters here must match the one in `GrahamScan`
		  // in order to obtain correct results and winding
		  
		  Var sign As Integer = MathsKit.Signum(PKRobustGeometry.GetLocation(p2, p1, Reference))
		  
		  If sign = 0 Then
		    // If the points are colinear we **must** choose the one that is more close to the reference point.
		    Return MathsKit.Compare(Reference.DistanceSquared(p1), Reference.DistanceSquared(p2))
		  End If
		  
		  Return sign
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(reference As PKVector2)
		  ///
		  ' Full constructor.
		  '
		  ' - Parameter reference: The reference point for finding angles.
		  ///
		  
		  Self.Reference = reference
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Comparator class to compare points by their angle from the positive
		x-axis with reference from a given point.
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 546865207265666572656E636520706F696E7420666F722074657374696E6720706F6C617220616E676C65732E
		Reference As PKVector2
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
