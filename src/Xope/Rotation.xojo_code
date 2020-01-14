#tag Class
Protected Class Rotation
	#tag Method, Flags = &h0, Description = 44656661756C7420636F6E7374727563746F722E204372656174657320616E206964656E7469747920526F746174696F6E2E
		Sub Constructor()
		  ///
		  ' Default constructor. Creates an identity Rotation.
		  ///
		  
		  Self.Cost = 1.0 // cos(0).
		  Self.Sint = 0.0 // sin(0).
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573206120526F746174696F6E2066726F6D2074686520676976656E20616E676C652028696E2072616469616E73292E
		Sub Constructor(angle As Double)
		  ///
		  ' Creates a Rotation from the given angle (in radians).
		  '
		  ' - Parameter angle: The angle in radians.
		  ///
		  
		  Self.Cost = Cos(angle)
		  Self.Sint = Sin(angle)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 496E7465726E616C20636F6E7374727563746F722074686174206469726563746C7920736574732074686520636F737420616E642073696E74206669656C6473206F662074686520526F746174696F6E20776974686F7574206164646974696F6E616C2076616C69646174696F6E2E
		Protected Sub Constructor(cost As Double, sint As Double)
		  ///
		  ' Internal constructor that directly sets the cost and sint fields 
		  ' of the Rotation without additional validation.
		  '
		  ' - Parameter cost: The cosine of some angle.
		  ' - Parameter sint: The sine of the same angle.
		  ///
		  
		  Self.Cost = cost
		  Self.Sint = sint
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F707920636F6E7374727563746F722E
		Sub Constructor(rotation As Xope.Rotation)
		  ///
		  ' Copy constructor.
		  '
		  ' - Parameter rotation: The Rotation to copy from.
		  ///
		  
		  Self.Cost = rotation.Cost
		  Self.Sint = rotation.Sint
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120636F7079206F66207468697320526F746174696F6E2E
		Function Copy() As Xope.Rotation
		  ///
		  ' Returns a copy of this Rotation.
		  ///
		  
		  Return New Rotation(Self.Cost, Self.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520636F7320616E642073696E20636F6D706F6E656E7473206F66207468697320526F746174696F6E20617265207468652073616D652061732074686520676976656E20616E676C652028696E2072616469616E73292E
		Function Equals(angle As Double) As Boolean
		  ///
		  ' Returns True if the cos and sin components of this Rotation are 
		  ' the same as the given angle (in radians).
		  '
		  ' - Parameter angle: The angle in radians.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Self.Cost = Cos(angle) And Self.Sint = Sin(angle)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520636F7320616E642073696E20636F6D706F6E656E7473206F66207468697320526F746174696F6E20617265207468652073616D652061732074686520676976656E20616E676C65202872616469616E73292C20676976656E2074686520737065636966696564206572726F722E
		Function Equals(angle As Double, error As Double) As Boolean
		  ///
		  ' Returns True if the cos and sin components of this Rotation
		  ' are the same as the given angle given the specified error.
		  '
		  ' - Parameter angle: The angle in radians.
		  ' - Parameter error: The error.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Abs(Self.Cost - Cos(angle)) < error And Abs(Self.Sint - Sin(angle)) < error
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520636F7320616E642073696E20636F6D706F6E656E7473206F66207468697320526F746174696F6E20617265207468652073616D652061732074686520676976656E20526F746174696F6E20676976656E2074686520737065636966696564206572726F722E
		Function Equals(r As Rotation, error As Double) As Boolean
		  ///
		  ' Returns True if the cos and sin components of this Rotation are 
		  ' the same as the given Rotation given the specified error.
		  ' 
		  ' - Parameter r: The Rotation to compare to.
		  ' - Parameter error: The error.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  If r = Nil Then Return False
		  
		  Return Abs(Self.Cost - r.Cost) < error And Abs(Self.Sint - r.Sint) < error
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520636F7320616E642073696E20636F6D706F6E656E7473206F66207468697320526F746174696F6E20617265207468652073616D652061732074686520676976656E20526F746174696F6E2E
		Function Equals(r As Xope.Rotation) As Boolean
		  ///
		  ' Returns True if the cos and sin components of this Rotation 
		  ' are the same as the given Rotation.
		  '
		  ' - Parameter r: The Rotation to compare to.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  If r = Nil Then Return False
		  
		  Return Self.Cost = r.Cost And Self.Sint = r.Sint
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C207573652E20496E697469616C69736573207368617265642070726F706572746965732E
		Shared Sub Initialise()
		  ///
		  ' Internal use. Initialises shared properties.
		  ///
		  
		  mSQRT_2_INV = 1.0 / Sqrt(2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 416C7465726E61746976652077617920746F206372656174652061206E657720526F746174696F6E2066726F6D206120676976656E20616E676C652C20696E20646567726565732E
		Shared Function OfDegrees(angle As Double) As Xope.Rotation
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

	#tag Method, Flags = &h0, Description = 416C7465726E61746976652077617920746F206372656174652061206E657720526F746174696F6E2066726F6D206120676976656E20616E676C652C20696E2072616469616E732E
		Shared Function Of_(angle As Double) As Xope.Rotation
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
		Shared Function Of_(cost As Double, sint As Double) As Xope.Rotation
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

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E20726570726573656E74696E67207468652073616D6520726F746174696F6E2061732061205472616E73666F726D206F626A6563742E
		Shared Function Of_(transform As Xope.Transform) As Xope.Rotation
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
		Shared Function Of_(direction As Xope.Vector2) As Xope.Rotation
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

	#tag Method, Flags = &h0, Description = 436F6D7061726573207468697320526F746174696F6E20746F2074686520706173736564206F626A65637420666F7220657175616C6974792E
		Function Operator_Compare(obj As Variant) As Integer
		  ///
		  ' Compares this Rotation to the passed object for equality.
		  '
		  ' - Returns: 0 If `obj` is considered equal to this Rotation, -1 otherwise.
		  ///
		  
		  If obj = Nil Then Return -1
		  If obj = Self Then Return 0
		  If obj IsA Rotation Then
		    Var r As Xope.Rotation = Xope.Rotation(obj)
		    Return If(Self.Cost = r.Cost And Self.Sint = r.Sint, 0, -1)
		  End If
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F66203020646567726565732E
		Shared Function Rotation0() As Xope.Rotation
		  ///
		  ' Creates a new Rotation of 0 degrees.
		  '
		  ' - Returns: A new Rotation.
		  ///
		  
		  Return New Rotation
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F662031333520646567726565732E
		Shared Function Rotation135() As Xope.Rotation
		  ///
		  ' Creates a new Rotation of 135 degrees.
		  '
		  ' - Returns: A new Rotation.
		  ///
		  
		  Return New Rotation(-mSQRT_2_INV, mSQRT_2_INV)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F662031383020646567726565732E
		Shared Function Rotation180() As Xope.Rotation
		  ///
		  ' Creates a new Rotation of 180 degrees.
		  '
		  ' - Returns: A new Rotation.
		  ///
		  
		  Return New Rotation(-1.0, 0.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F662032323520646567726565732E
		Shared Function Rotation225() As Xope.Rotation
		  ///
		  ' Creates a new Rotation of 225 degrees.
		  '
		  ' - Returns: A new Rotation.
		  ///
		  
		  Return New Rotation(-mSQRT_2_INV, -mSQRT_2_INV)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F662032373020646567726565732E
		Shared Function Rotation270() As Xope.Rotation
		  ///
		  ' Creates a new Rotation of 270 degrees.
		  '
		  ' - Returns: A new Rotation.
		  ///
		  
		  Return New Rotation(0.0, -1.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Rotation315() As Xope.Rotation
		  ///
		  '  Creates a new Rotation of 315 degrees.
		  '
		  ' - Returns: A new Rotation.
		  ///
		  
		  Return New Rotation(mSQRT_2_INV, -mSQRT_2_INV)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F6620343520646567726565732E
		Shared Function Rotation45() As Xope.Rotation
		  ///
		  ' Creates a new Rotation of 45 degrees.
		  '
		  ' - Returns: A new Rotation.
		  ///
		  
		  Return New Rotation(mSQRT_2_INV, mSQRT_2_INV)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F6620393020646567726565732E
		Shared Function Rotation90() As Xope.Rotation
		  ///
		  ' Creates a new Rotation of 90 degrees.
		  '
		  ' - Returns: A new Rotation.
		  ///
		  
		  Return New Rotation(0.0, 1.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F66207468697320526F746174696F6E20696E2074686520666F726D61743A2022526F746174696F6E28636F73742C2073696E7429222E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Rotation in the 
		  ' format: "Rotation(cost, sint)".
		  ///
		  
		  Return "Rotation(" + Self.Cost.ToString + ", " + _
		  Self.Sint.ToString + ")"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Untitled()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 54686520636F73696E65206F662074686520616E676C6520646573637269626564206279207468697320526F746174696F6E2E
		Cost As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mSQRT_2_INV As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652073696E65206F662074686520616E676C6520646573637269626564206279207468697320526F746174696F6E2E
		Sint As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return mSQRT_2_INV
			End Get
		#tag EndGetter
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
