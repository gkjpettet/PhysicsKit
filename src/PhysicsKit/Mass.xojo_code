#tag Class
Protected Class Mass
	#tag Method, Flags = &h0, Description = 44656661756C7420636F6E7374727563746F722E
		Sub Constructor()
		  ///
		  ' Default constructor.
		  '
		  ' Creates and infinite mass centred at the origin.
		  ///
		  
		  Self.Type = MassTypes.Infinite
		  Self.Center = New Vector2
		  Self.Mass = 0.0
		  Self.Inertia = 0.0
		  Self.InvMass = 0.0
		  Self.InvInertia = 0.0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F707920636F6E7374727563746F722E
		Sub Constructor(mass As PhysicsKit.Mass)
		  ///
		  ' Copy constructor.
		  '
		  ' Performs a deep copy.
		  '
		  ' - Parameter mass: The Mass to copy.
		  '
		  ' - Throws:NilObjectException if `mass` is Nil.
		  ///
		  
		  // Validate the input.
		  If mass Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_MASS_NIL_MASS)
		  
		  // Setup the mass.
		  Self.Type = mass.Type
		  Self.Center = mass.Center.Copy
		  Self.Mass = mass.Mass
		  Self.Inertia = mass.Inertia
		  Self.InvMass = mass.InvMass
		  Self.InvInertia = mass.InvInertia
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(center As PhysicsKit.Vector2, mass As Double, inertia As Double)
		  ///
		  ' Full Constructor.
		  '
		  ' - Note: The `center` parameter will be copied.
		  '
		  ' - Parameter center: The centre of Mass in local coordinates.
		  ' - Parameter mass: The mass in kg.
		  ' - Parameter inertia: The inertia tensor in kg·m²
		  '
		  ' - Throws: NilObjectException if `center` is Nil.
		  ' - Throws: InvalidArgumentException if `mass` or `inertia` is less than zero.
		  ///
		  
		  // Validate the input,
		  If center Is Nil Then
		    Raise New NilObjectException(Messages.GEOMETRY_MASS_NIL_CENTER)
		  End If
		  If mass < 0.0 Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_MASS_INVALID_MASS)
		  End If
		  If inertia < 0.0 Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_MASS_INVALID_INERTIA)
		  End If
		  
		  // Create the mass.
		  Self.Type = MassTypes.Normal
		  Self.Center = center.Copy
		  Self.Mass = mass
		  Self.Inertia = inertia
		  
		  // Set the inverse mass.
		  If mass > Epsilon.E Then
		    Self.InvMass = 1.0 / mass
		  Else
		    Self.InvMass = 0.0
		    Self.Type = MassTypes.FixedLinearVelocity
		  End If
		  
		  // Set the inverse inertia.
		  If inertia > Epsilon.E Then
		    Self.InvInertia = 1.0 / inertia
		  Else
		    Self.InvInertia = 0.0
		    Self.Type = MassTypes.FixedAngularVelocity
		  End If
		  
		  // Check if both the mass and inertia are zero.
		  If mass <= Epsilon.E And inertia <= Epsilon.E Then Self.Type = MassTypes.Infinite
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F706965732074686973204D61737320616E642072657475726E732069742061732061206E6577204D61737320696E7374616E63652E
		Function Copy() As PhysicsKit.Mass
		  ///
		  ' Copies this Mass.
		  '
		  ' - Returns: A new Mass instance.
		  ///
		  
		  Return New Mass(Self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061204D617373206F626A6563742066726F6D2074686520676976656E206172726179206F66206D61737365732E
		Function Create(masses() As PhysicsKit.Mass) As PhysicsKit.Mass
		  ///
		  ' Creates a Mass object from the given array of masses.
		  '
		  ' Uses the Parallel Axis Theorem to obtain the inertia tensor about
		  ' the center of all the given masses:
		  ' ```
		  ' Idis = Icm + mr²
		  ' Itotal = ∑ Idis
		  ' ```
		  '
		  ' The center for the resulting mass will be a mass weighted center.
		  '
		  ' This method will produce unexpected results if any mass contained in the list is infinite.
		  '
		  ' - Parameter masses: The array of Mass objects to combine.
		  '
		  ' - Returns: A new Mass instance.
		  '
		  ' - Throws: NilObjectException if `masses` is Nil or contains Nil elements.
		  ' - Throws: InvalidArgumentException if `masses` is empty.
		  ///
		  
		  // Check the array for Nil or empty.
		  If masses = Nil Then
		    Raise New NilObjectException(Messages.GEOMETRY_MASS_NIL_MASS_ARRAY)
		  End If
		  If masses.Count = 0 Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_MASS_INVALID_MASS_ARRAY_SIZE)
		  End If
		  
		  // Get the length of the masses array.
		  Var size As Integer = masses.Count
		  
		  // Check for a list of one.
		  If size = 1 Then
		    // Check for Nil item.
		    Var m As Mass = masses(0)
		    If m <> Nil Then
		      Return New Mass(masses(0))
		    Else
		      Raise New NilObjectException(Messages.GEOMETRY_MASS_NIL_MASS_ARRAY_ELEMENT)
		    End If
		  End If
		  
		  // Initialize the new mass values.
		  Var c As Vector2 = New Vector2
		  Var m As Double = 0.0
		  Var I As Double = 0.0
		  
		  // Loop over the masses.
		  For Each mass As PhysicsKit.Mass In masses
		    // Check for Nil mass.
		    If mass = Nil Then
		      Raise New NilObjectException(Messages.GEOMETRY_MASS_NIL_MASS_ARRAY_ELEMENT)
		    End If
		    // Add the centers up (weighting them by their respective mass).
		    Call c.Add(mass.Center.Product(mass.Mass))
		    // Sum the masses.
		    m = M + mass.Mass
		  Next mass
		  
		  // The mass will never be negative but could be zero if all the masses are infinite.
		  If m > 0.0 Then
		    // Compute the center by dividing by the total mass.
		    Call c.Divide(m)
		  End If
		  
		  // After obtaining the new center of mass we need to compute the interia tensor about the center
		  // using the parallel axis theorem:
		  // `Idis = Icm + mr^2` where `r` is the perpendicular distance between the two parallel axes.
		  For Each mass As PhysicsKit.Mass In masses
		    // Compute the distance from the new center to the current mass's center.
		    Var d2 As Double = mass.Center.DistanceSquared(c)
		    // Compute `Idis`:
		    Var Idis As Double = mass.Inertia + mass.Mass * d2
		    // Add it to the sum.
		    I = I + Idis
		  Next mass
		  
		  // Finally create the Mass.
		  Return New Mass(c, m, I)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(other As Variant) As Boolean
		  If other Is Nil Then Return False
		  
		  If other IsA PhysicsKit.Mass Then
		    Var o As PhysicsKit.Mass = Mass(other)
		    If Self.Type = o.Type And _
		      Self.Mass = o.Mass And _ 
		      Self.Inertia = o.Inertia And _
		      Self.Center.Equals(o.Center) Then
		      Return True
		    End If
		  End If
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652063656E746572206F66206D6173732E
		Function GetCenter() As PhysicsKit.Vector2
		  ///
		  ' Returns the center of mass.
		  '
		  ' - Returns: Vector2.
		  ///
		  
		  Return Self.Center
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520696E65727469612074656E736F722E
		Function GetInertia() As Double
		  ///
		  ' Returns the inertia tensor.
		  '
		  ' - Returns: Double.
		  ///
		  
		  If Self.Type = MassTypes.Infinite Or Self.Type = MassTypes.FixedAngularVelocity Then
		    Return 0.0
		  Else
		    Return Self.Inertia
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520696E766572736520696E65727469612074656E736F722E
		Function GetInverseInertia() As Double
		  ///
		  ' Returns the inverse inertia tensor.
		  '
		  ' - Returns: Double.
		  ///
		  
		  If Self.Type = MassTypes.Infinite Or Self.Type = MassTypes.FixedangularVelocity Then
		    Return 0.0
		  Else
		    Return Self.InvInertia
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520696E7665727365206D6173732E
		Function GetInverseMass() As Double
		  ///
		  ' Returns the inverse mass.
		  '
		  ' - Returns: Double.
		  ///
		  
		  If Self.Type = MassTypes.Infinite Or Self.Type = MassTypes.FixedLinearVelocity Then
		    Return 0.0
		  Else
		    Return Self.InvMass
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D6173732E
		Function GetMass() As Double
		  ///
		  ' Returns the mass.
		  '
		  ' - Returns: Double.
		  ///
		  
		  If Self.Type = MassTypes.Infinite Or Self.Type = MassTypes.FixedLinearVelocity Then
		    Return 0.0
		  Else
		    Return Self.Mass
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D61737320747970652E
		Function GetType() As PhysicsKit.MassTypes
		  ///
		  ' Returns the mass type.
		  '
		  ' - Returns: MassTypes.
		  ///
		  
		  Return Self.Type
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsInfinite() As Boolean
		  ///
		  ' Returns True if this Mass object is of type MassTypes.INFINITE.
		  '
		  ' A mass will still be treated as an infinite mass in physical modeling if the
		  ' mass and inertia are zero. This method simply checks the mass type.
		  ' 
		  ' - Returns: Boolean.
		  ///
		  
		  Return Self.Type = MassTypes.Infinite
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetType(type As PhysicsKit.MassTypes)
		  ///
		  ' Sets the mass type.
		  '
		  ' - Parameter type: The mass type.
		  ///
		  
		  Self.Type = type
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F662074686973204D61737320696E7374616E636520696E2074686520666F726D3A20224D6173735B547970653D747970657C43656E7465723D637C4D6173733D6D7C496E65727469613D695D222E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Mass instance in the form: 
		  ' "Mass[Type=type|Center=c|Mass=m|Inertia=i]".
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  s.AddRow("Mass[Type=")
		  s.AddRow(Self.Type.ToString)
		  s.AddRow("|Center=")
		  s.AddRow(Self.Center.ToString)
		  s.AddRow("|Mass=")
		  s.AddRow(Self.Mass.ToString)
		  s.AddRow("|Inertia=")
		  s.AddRow(Self.Inertia.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 5468652063656E746572206F66206D6173732E
		Center As PhysicsKit.Vector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520696E65727469612074656E736F7220696E206B67C2B76D32
		Inertia As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520696E766572736520696E65727469612074656E736F722E
		InvInertia As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520696E7665727365206D6173732E
		InvMass As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D61737320696E206B672E
		Mass As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D6173732074797065
		Type As PhysicsKit.MassTypes
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
			Name="Type"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
