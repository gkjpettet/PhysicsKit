#tag Class
Protected Class Rotation
	#tag Method, Flags = &h0, Description = 416C7465726E61746976652077617920746F206372656174652061206E657720526F746174696F6E2066726F6D206120676976656E20616E676C652C20696E2072616469616E732E204571756976616C656E7420746F206064796E346A2E526F746174696F6E2E6F662829602E
		Shared Function From(angle As Double) As Xope.Rotation
		  ///
		  ' Alternative way to create a new Rotation from a given angle, in radians.
		  '
		  ' - Parameter angle: The angle in radians.
		  '
		  ' - Returns: A new Rotation for the given angle.
		  ///
		  
		  Return New Rotation(angle)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 537461746963206D6574686F6420746F20637265617465206120526F746174696F6E2066726F6D20612070616972206F662076616C7565732074686174206C6965206F6E2074686520756E697420636972636C652E205468726F777320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function From(cost As Double, sint As Double) As Xope.Rotation
		  ///
		  ' Static method to create a Rotation from a pair of values that lie on the unit circle.
		  ' That is a pair of values (x, y) such that `x = cos(Θ), y = sin(Θ)` for some value Θ.
		  ' This method is provided for the case where the cos and sin values are already computed and
		  ' the overhead can be avoided.
		  ' This method will check whether those values are indeed on the unit circle and 
		  ' otherwise throw an InvalidArgumentException.
		  '
		  ' - Parameter cost: The x value = cos(Θ).
		  ' - Parameter sint: The y value = sin(Θ).
		  '
		  ' - Throws: InvalidArgumentExcpetion if (cost, sint) is not on the unit circle.
		  '
		  ' - Returns: A new Rotation defined by (cost, sint).
		  ///
		  
		  Var magnitude As Double = cost * cost + sint * sint
		  
		  If Abs(magnitude - 1) > Epsilon.E Then
		    Raise New InvalidArgumentException(Messages.Geometry.Rotation.InvalidPoint)
		  End If
		  
		  Return New Rotation(cost, sint)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E20726570726573656E74696E67207468652073616D6520726F746174696F6E2061732061205472616E73666F726D206F626A6563742E204571756976616C656E7420746F206064796E346A2E6F662829602E
		Shared Function From(transform As Xope.Transform) As Xope.Rotation
		  ///
		  ' Creates a new Rotation representing the same rotation as a Transform object.
		  '
		  ' - Parameter transform: The Transform.
		  '
		  ' - Returns: A new Rotation.
		  //
		  
		  // The cos and sin values are already computed internally in Transform.
		  Return New Rotation(transform.Cost, transform.Sint)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 537461746963206D6574686F6420746F20637265617465206120526F746174696F6E206F626A6563742066726F6D2074686520646972656374696F6E206F66206120676976656E20766563746F722E
		Shared Function From(direction As Xope.Vector2) As Xope.Rotation
		  ///
		  ' Static method to create a Rotation object from the direction of a given vector.
		  '
		  ' - Parameter direction: The vector describing a direction.
		  '
		  ' - Returns: A new Rotation with the same direction.
		  ///
		  
		  // Normalise the vector.
		  Var magnitude As Double = Sqrt(direction.X * direction.X + direction.Y * direction.Y)
		  
		  If magnitude <= Epsilon.E Then
		    // The zero vector has no direction, return the Identity rotation.
		    Return New Rotation
		  End If
		  
		  // The rotation is the normalized vector.
		  Return New Rotation(direction.X / magnitude, direction.Y / magnitude)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 416C7465726E61746976652077617920746F206372656174652061206E657720526F746174696F6E2066726F6D206120676976656E20616E676C652C20696E20646567726565732E204571756976616C656E7420746F206064796E346A2E526F746174696F6E2E6F66446567726565732829602E
		Shared Function FromDegrees(angle As Double) As Xope.Rotation
		  ///
		  ' Alternative way to create a new Rotation from a given angle, in degrees.
		  '
		  ' - Parameter angle: The angle in degrees.
		  '
		  ' - Returns :A new Rotation for the passed angle.
		  ///
		  
		  Return New Rotation(Maths.ToRadians(angle))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C207573652E20496E697469616C69736573207368617265642070726F706572746965732E
		Shared Sub Initialise()
		  ///
		  ' Internal use. Initialises shared properties.
		  ///
		  
		  m_SQRT_2_INV = 1.0 / Sqrt(2)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 54686520636F73696E65206F662074686520616E676C6520646573637269626564206279207468697320526F746174696F6E2E
		Cost As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared m_SQRT_2_INV As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652073696E65206F662074686520616E676C6520646573637269626564206279207468697320526F746174696F6E2E
		Sint As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		Private Shared SQRT_2_INV As Double
	#tag EndComputedProperty


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
			Name="Cost"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Sint"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
