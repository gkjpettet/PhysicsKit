#tag Class
Protected Class Ray
	#tag Method, Flags = &h0
		Sub Constructor(direction As Double)
		  ///
		  ' Creates a ray from the origin in the given direction.
		  '
		  ' -Parameter direction: The direction in radians.
		  ///
		  
		  Constructor(New PKVector2(direction))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(direction As PKVector2)
		  ///
		  ' Creates a ray from the origin in the given direction.
		  '
		  ' - Parameter direction: The direction.
		  ///
		  
		  Constructor(New PKVector2, direction)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(start As PKVector2, direction As Double)
		  ///
		  ' Creates a ray from the given start point in the given direction.
		  '
		  ' - Parameter start: The start point.
		  ' - Parameter direction: The direction in radians.
		  ///
		  
		  Constructor(start, New PKVector2(direction))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(start As PKVector2, direction As PKVector2)
		  ///
		  ' Creates a ray from the given start point in the given direction.
		  '
		  ' - Parameter start: The start point.
		  ' - Parameter direction: The direction.
		  '
		  ' - Raises: NilObjectException if `start` or `direction` is Nil.
		  ' - Raises: InvalidArgumentException if `direction` is the zero vector.
		  ///
		  
		  If start Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_RAY_NIL_START)
		  If direction Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_RAY_NIL_DIRECTION)
		  If direction.IsZero Then Raise New InvalidArgumentException(Messages.GEOMETRY_RAY_ZERO_DIRECTION)
		  
		  Self.Start = start
		  Self.Direction = direction.GetNormalised
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520646972656374696F6E206F6620746869732072617920696E2072616469616E73202872616E6765202DCF8020746F20CF80292E
		Function GetDirection() As Double
		  ///
		  ' Returns the direction of this ray in radians.
		  '
		  ' - Returns: The direction in radians between (-π, π)
		  ///
		  
		  Return Self.Direction.GetDirection
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520646972656374696F6E2E
		Function GetDirectionVector() As PKVector2
		  ///
		  ' Returns the direction.
		  '
		  ' - Returns: PKVector2.
		  ///
		  
		  Return Self.Direction
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStart() As PKVector2
		  ///
		  ' Returns the start point.
		  '
		  ' - Returns: PKVector2.
		  ///
		  
		  Return Self.Start
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686520646972656374696F6E206F6620746869732072617920696E2072616469616E732E
		Sub SetDirection(direction As Double)
		  ///
		  ' Sets the direction of this ray in radians.
		  '
		  ' - Parameter direction: The direction in radians.
		  ///
		  
		  Self.Direction = New PKVector2(direction)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686520646972656374696F6E2E2054686520646972656374696F6E2073686F756C64206265206E6F726D616C697365642E
		Sub SetDirection(direction As PKVector2)
		  ///
		  ' Sets the direction.
		  '
		  ' - Parameter direction: The direction. Should be normalised.
		  '
		  ' - Raises: NilObjectException if `direction` is Nil.
		  ' - Raises: InvalidArgumentException if `direction` is the zero vector.
		  ///
		  
		  If direction Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_RAY_NIL_DIRECTION)
		  If direction.IsZero Then Raise New InvalidArgumentException(Messages.GEOMETRY_RAY_ZERO_DIRECTION)
		  Self.Direction = direction
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686520737461727420706F696E742E20526169736573204E696C4F626A656374457863657074696F6E2069662060737461727460206973204E696C2E
		Sub SetStart(start As PKVector2)
		  ///
		  ' Sets the start point.
		  '
		  ' - Parameter start: The start point.
		  '
		  ' - Raises: NilObjectException if `start` is Nil.
		  ///
		  
		  If start Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_RAY_NIL_START)
		  Self.Start = start
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F662074686973205261792E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Ray.
		  ///
		  
		  Var s() As String
		  s.AddRow("Ray[Start=")
		  s.AddRow(Self.Start.ToString)
		  s.AddRow("|Direction=")
		  s.AddRow(Self.GetDirection.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of a ray.
		A ray is a vector with a start point.
		
		
	#tag EndNote


	#tag Property, Flags = &h1, Description = 54686520646972656374696F6E2E
		Protected Direction As PKVector2
	#tag EndProperty

	#tag Property, Flags = &h1, Description = 54686520737461727420706F696E742E
		Protected Start As PKVector2
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
