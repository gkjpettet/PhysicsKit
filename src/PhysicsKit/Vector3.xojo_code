#tag Class
Protected Class Vector3
	#tag Method, Flags = &h0, Description = 416464732074686520676976656E20566563746F723320746F207468697320566563746F723320616E642072657475726E73207468697320566563746F72332E
		Function Add(x As Double, y As Double, z As Double) As PhysicsKit.Vector3
		  ///
		  ' Adds the given Vector3 to this Vector3.
		  '
		  ' - Parameter x: The x component of the Vector3.
		  ' - Parameter y: The y component of the Vector3.
		  ' - Parameter z: The z component of the Vector3.
		  '
		  ' - Returns: This Vector3.
		  ///
		  
		  Self.X = Self.X + x
		  Self.Y = Self.Y + y
		  Self.Z = Self.Z + z
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 416464732074686520676976656E20566563746F723320746F207468697320566563746F723320616E642072657475726E73207468697320566563746F72332E
		Function Add(vector As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' Adds the given Vector3 to this Vector3.
		  '
		  ' - Parameter vector: The Vector3.
		  '
		  ' - Returns: This Vector3.
		  ///
		  
		  Self.X = Self.X + vector.X
		  Self.Y = Self.Y + vector.Y
		  Self.Z = Self.Z + vector.Z
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ///
		  ' Default constructor.
		  ///
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(x As Double, y As Double, z As Double)
		  ///
		  ' Optional constructor.
		  '
		  ' - Parameter x: The x component.
		  ' - Parameter y: The y component.
		  ' - Parameter z: The z component.
		  ///
		  
		  Self.X = x
		  Self.Y = y
		  Self.Z = z
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(x1 As Double, y1 As Double, z1 As Double, x2 As Double, y2 As Double, z2 As Double)
		  ///
		  ' Creates a Vector3 from the first point to the second point.
		  '
		  ' - Parameter x1: The x coordinate of the first point.
		  ' - Parameter y1: The y coordinate of the first point.
		  ' - Parameter z1: The z coordinate of the first point.
		  ' - Parameter x2: The x coordinate of the second point.
		  ' - Parameter y2: The y coordinate of the second point.
		  ' - Parameter z2: The z coordinate of the second point.
		  ///
		  
		  Self.X = x2 - x1
		  Self.Y = y2 - y1
		  Self.X = z2 - z1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(vector As PhysicsKit.Vector3)
		  ///
		  ' Copy constructor.
		  '
		  ' - Parameter vector: The Vector3 to copy from.
		  ///
		  
		  Self.X = vector.X
		  Self.Y = vector.Y
		  Self.X = vector.X
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(p1 As PhysicsKit.Vector3, p2 As PhysicsKit.Vector3)
		  ///
		  ' Creates a Vector3 from the first point to the second point.
		  '
		  ' - Parameter p1: The first point.
		  ' - Parameter p2: The second point.
		  ///
		  
		  Self.X = p2.X - p1.X
		  Self.Y = p2.Y - p1.Y
		  Self.Z = p2.Z - p1.Z
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120636F7079206F66207468697320566563746F72332E
		Function Copy() As PhysicsKit.Vector3
		  //
		  ' Returns a copy of this Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(Self.X, Self.Y, Self.Z)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652063726F73732070726F64756374206F6620746865207468697320566563746F723320616E642074686520676976656E20566563746F72332061732061206E657720566563746F72332E
		Function Cross(x As Double, y As Double, z As Double) As PhysicsKit.Vector3
		  ///
		  ' Returns the cross product of the this Vector3 and the given Vector3 as a new Vector3.
		  '
		  ' - Parameter x: The x component of the Vector3.
		  ' - Parameter y: The y component of the Vector3.
		  ' - Parameter z: The z component of the Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(Self.Y * z - Self.Z * y, _
		  Self.Z * x - Self.X * z, _
		  Self.X * y - Self.Y * x)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652063726F73732070726F64756374206F6620746865207468697320566563746F723320616E642074686520676976656E20566563746F72332061732061206E657720566563746F72332E
		Function Cross(vector As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' Returns the cross product of the this Vector3 and the given Vector3 as a new Vector3.
		  '
		  ' - Parameter vector: The Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(Self.Y * vector.Z - Self.Z * vector.Y, _
		  Self.Z * vector.X - Self.X * vector.Z, _
		  Self.X * vector.Y - Self.Y * vector.X)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5375627472616374732074686520676976656E20566563746F72332066726F6D207468697320566563746F72332072657475726E696E672061206E657720566563746F723320636F6E7461696E696E672074686520726573756C742E
		Function Difference(x As Double, y As Double, z As Double) As PhysicsKit.Vector3
		  ///
		  ' Subtracts the given Vector3 from this Vector3 returning a new Vector3 containing the result.
		  '
		  ' - Parameter x: The x component of the Vector3.
		  ' - Parameter y: The y component of the Vector3.
		  ' - Parameter z: The z component of the Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(Self.X - x, Self.Y - y, Self.Z - z)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5375627472616374732074686520676976656E20566563746F72332066726F6D207468697320566563746F72332072657475726E696E672061206E657720566563746F723320636F6E7461696E696E672074686520726573756C742E
		Function Difference(vector As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' Subtracts the given Vector3 from this Vector3 returning a new Vector3 containing the result.
		  '
		  ' - Parameter vector: The Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(Self.X - vector.X, Self.Y - vector.Y, Self.Z - vector.Z)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652064697374616E63652066726F6D207468697320706F696E7420746F2074686520676976656E20706F696E742E
		Function Distance(x As Double, y As Double, z As Double) As Double
		  ///
		  ' Returns the distance from this point to the given point.
		  '
		  ' - Parameter x: The x coordinate of the point.
		  ' - Parameter y: The y coordinate of the point.
		  ' - Parameter z: The z coordinate of the point.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Var xd As Double = Self.X - x
		  Var yd As Double = Self.Y - y
		  Var zd As Double = Self.Z - z
		  
		  Return Sqrt(xd * xd + yd * yd + zd * zd)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652064697374616E63652066726F6D207468697320706F696E7420746F2074686520676976656E20706F696E742E
		Function Distance(point As PhysicsKit.Vector3) As Double
		  ///
		  ' Returns the distance from this point to the given point.
		  '
		  ' - Parameter point: The point.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Var xd As Double = Self.X - point.X
		  Var yd As Double = Self.Y - point.Y
		  Var zd As Double = Self.Z - point.Z
		  
		  Return Sqrt(xd * xd + yd * yd + zd * zd)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652064697374616E63652066726F6D207468697320706F696E7420746F2074686520676976656E20706F696E7420737175617265642E
		Function DistanceSquared(x As Double, y As Double, z As Double) As Double
		  ///
		  ' Returns the distance from this point to the given point squared.
		  '
		  ' - Parameter x: The x coordinate of the point.
		  ' - Parameter y: The y coordinate of the point.
		  ' - Parameter z: The z coordinate of the point.
		  ' 
		  ' - Returns: Double.
		  ///
		  
		  Var xd As Double = Self.X - x
		  Var yd As Double = Self.Y - y
		  Var zd As Double = Self.Z - z
		  
		  Return xd * xd + yd * yd + zd * zd
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652064697374616E63652066726F6D207468697320706F696E7420746F2074686520676976656E20706F696E7420737175617265642E
		Function DistanceSquared(point As PhysicsKit.Vector3) As Double
		  ///
		  ' Returns the distance from this point to the given point squared.
		  '
		  ' - Parameter point: The point.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Var xd As Double = Self.X - point.X
		  Var yd As Double = Self.Y - point.Y
		  Var zd As Double = Self.Z - point.Z
		  
		  Return xd * xd + yd * yd + zd * zd
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520646F742070726F64756374206F662074686520676976656E20566563746F723320616E64207468697320566563746F72332E
		Function Dot(x As Double, y As Double, z As Double) As Double
		  ///
		  ' Returns the dot product of the given Vector3 and this Vector3.
		  '
		  ' - Parameter x: The x component of the Vector3.
		  ' - Parameter y: The y component of the Vector3.
		  ' - Parameter z: The z component of the Vector3.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.X * x + Self.Y * y + Self.Z * z
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520646F742070726F64756374206F662074686520676976656E20566563746F723320616E64207468697320566563746F72332E
		Function Dot(vector As PhysicsKit.Vector3) As Double
		  ///
		  ' Returns the dot product of the given Vector3 and this Vector3.
		  '
		  ' - Parameter vector: The Vector3.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.X * vector.X + Self.Y * vector.Y + Self.Z * vector.Z
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520782C207920616E64207A20636F6D706F6E656E7473206F66207468697320566563746F723320617265207468652073616D652061732074686520676976656E20782C207920616E64207A20636F6D706F6E656E74732E
		Function Equals(x As Double, y As Double, z As Double) As Boolean
		  ///
		  ' Returns True if the x, y and z components of this Vector3 are the same 
		  ' as the given x, y and z components.
		  '
		  ' - Parameter x: The x coordinate of the Vector3 to compare to.
		  ' - Parameter y: The y coordinate of the Vector3 to compare to.
		  ' - Parameter z: The z coordinate of the Vector3 to compare to.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Self.X = x And Self.Y = y And Self.Z = z
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 272052657475726E7320547275652069662074686520782C207920616E64207A20636F6D706F6E656E7473206F66207468697320566563746F723320617265207468652073616D652061732074686520676976656E20566563746F72332E
		Function Equals(vector As PhysicsKit.Vector3) As Boolean
		  ///
		  ' Returns True if the x, y and z components of this Vector3 are the same as the given Vector3.
		  '
		  ' - Parameter vector: The Vector3 to compare to.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  If vector Is Nil Then Return False
		  If Self = vector Then
		    Return True
		  Else
		    Return Self.X = vector.X And Self.Y = vector.Y And Self.Z = vector.Z
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520706173736564206F626A65637420697320636F6E7369646572656420657175616C20746F207468697320566563746F72332E
		Function Equals(obj As Variant) As Boolean
		  ///
		  ' Returns True if the passed object is considered equal to this Vector3.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  If obj Is Nil Then Return False
		  If obj = Self Then Return True
		  If obj IsA Vector3 Then
		    Var other As Vector3 = Vector3(obj)
		    If Self.X = other.X And _
		      Self.Y = other.Y And _
		      Self.Z = other.Z Then
		      Return True
		    End If
		  End If
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D61676E6974756465206F66207468697320566563746F72332E
		Function GetMagnitude() As Double
		  ///
		  ' Returns the magnitude of this Vector3.
		  '
		  ' - Returns: Double.
		  ///
		  
		  // The magnitude is just the pathagorean theorem.
		  Return Sqrt(Self.X * Self.X + Self.Y * Self.Y + Self.Z * Self.Z)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D61676E6974756465206F66207468697320566563746F723320737175617265642E
		Function GetMagnitudeSquared() As Double
		  ///
		  ' Returns the magnitude of this Vector3 squared.
		  ' 
		  ' - Returns: Double.
		  ///
		  
		  Return Self.X * Self.X + Self.Y * Self.Y + Self.Z * Self.Z
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720566563746F723320776869636820697320746865206E65676174697665206F66207468697320566563746F72332E
		Function GetNegative() As PhysicsKit.Vector3
		  ///
		  ' Returns a new Vector3 which is the negative of this Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(-Self.X, -Self.Y, -Self.Z)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207820636F6D706F6E656E74206F66207468697320566563746F72332061732061206E657720566563746F72332E
		Function GetXComponent() As PhysicsKit.Vector3
		  ///
		  ' Returns the x component of this Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(Self.X, 0.0, 0.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207920636F6D706F6E656E74206F66207468697320566563746F72332061732061206E657720566563746F72332E
		Function GetYComponent() As PhysicsKit.Vector3
		  ///
		  ' Returns the y component of this Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(0.0, Self.Y, 0.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207A20636F6D706F6E656E74206F66207468697320566563746F72332061732061206E657720566563746F72332E
		Function GetZComponent() As PhysicsKit.Vector3
		  ///
		  ' Returns the z component of this Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(0.0, 0.0, Self.Z)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E20566563746F7233206973206F7274686F676F6E616C202870657270656E646963756C61722920746F207468697320566563746F72332E
		Function IsOrthogonal(x As Double, y As Double, z As Double) As Boolean
		  ///
		  ' Returns True if the given Vector3 is orthogonal (perpendicular) to this Vector3.
		  '
		  ' If the dot product of this vector and the given vector is
		  ' zero then we know that they are perpendicular.
		  '
		  ' - Parameter x: The x component of the Vector3.
		  ' - Parameter y: The y component of the Vector3.
		  ' - Parameter z: The z component of the Vector3.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Abs(Self.X * x + Self.Y * y + Self.Z * z) <= Epsilon.E
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E20566563746F7233206973206F7274686F676F6E616C202870657270656E646963756C61722920746F207468697320566563746F72332E
		Function IsOrthogonal(vector As PhysicsKit.Vector3) As Boolean
		  ///
		  ' Returns True if the given Vector3 is orthogonal (perpendicular) to this Vector3.
		  '
		  ' If the dot product of this vector and the given vector is
		  ' zero then we know that they are perpendicular.
		  '
		  ' - Parameter vector: The Vector3.'
		  ' - Returns: Boolean.
		  ///
		  
		  Return If(Abs(Self.X * vector.X + Self.Y * vector.Y + Self.Z * vector.Z) <= Epsilon.E, True, False)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732054727565206966207468697320566563746F723320697320746865207A65726F20566563746F72332E
		Function IsZero() As Boolean
		  ///
		  ' Returns True if this Vector3 is the zero Vector3.
		  '
		  '- Returns: Boolean.
		  ///
		  
		  Return Abs(Self.X) <= Epsilon.E And Abs(Self.Y) <= Epsilon.E And Abs(Self.Z) <= Epsilon.E
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C696573207468697320566563746F72332062792074686520676976656E207363616C617220616E642072657475726E73207468697320566563746F72332E
		Function Multiply(scalar As Double) As PhysicsKit.Vector3
		  ///
		  ' Multiplies this Vector3 by the given scalar.
		  '
		  ' - Parameter scalar: The scalar.
		  '
		  ' - Returns: This Vector3.
		  ///
		  
		  Self.X = Self.X * scalar
		  Self.Y = Self.Y * scalar
		  Self.Z = Self.Z * scalar
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4E656761746573207468697320566563746F723320616E642072657475726E732069742E
		Function Negate() As PhysicsKit.Vector3
		  ///
		  ' Negates this Vector3 and returns it.
		  '
		  ' - Returns: This Vector3.
		  ///
		  
		  Self.X = -Self.X
		  Self.Y = -Self.Y
		  Self.Z = -Self.Z
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C696573207468697320566563746F72332062792074686520676976656E207363616C61722072657475726E696E672061206E657720566563746F723320636F6E7461696E696E672074686520726573756C742E
		Function Product(scalar As Double) As PhysicsKit.Vector3
		  ///
		  ' Multiplies this Vector3 by the given scalar returning a new Vector3 containing the result.
		  '
		  ' -Parameter scalar: The scalar.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(Self.X * scalar, Self.Y * scalar, Self.Z * scalar)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320566563746F723320746F2074686520676976656E20566563746F723320616E642072657475726E73207468697320566563746F72332E
		Function Set(x As Double, y As Double, z As Double) As PhysicsKit.Vector3
		  ///
		  ' Sets this Vector3 to the given Vector3.
		  '
		  ' - Parameter x: The x component of the Vector3 to set this Vector3 to.
		  ' - Parameter y: The y component of the Vector3 to set this Vector3 to.
		  ' - Parameter z: The z component of the Vector3 to set this Vector3 to.
		  '
		  ' - Returns: This Vector3.
		  ///
		  
		  Self.X = X
		  Self.Y = Y
		  Self.Z = Z
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320566563746F723320746F2074686520676976656E20566563746F723320616E642072657475726E73207468697320566563746F72332E
		Function Set(vector As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' Sets this Vector3 to the given Vector3.
		  ' 
		  ' - Parameter vector: The Vector3 to set this Vector3 to.
		  '
		  ' - Returns: This Vector3.
		  ///
		  
		  Self.X = vector.X
		  Self.Y = vector.Y
		  Self.Z = vector.Z
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5365747320746865206D61676E6974756465206F66207468697320566563746F723320616E642072657475726E732069742E
		Function SetMagnitude(magnitude As Double) As PhysicsKit.Vector3
		  ///
		  ' Sets the magnitude of the Vector3.
		  '
		  ' - Parameter magnitude: The magnitude.
		  '
		  '- Returns: This Vector3.
		  ///
		  
		  // Check the given magnitude.
		  If Abs(magnitude) <= Epsilon.E Then
		    Self.X = 0.0
		    Self.Y = 0.0
		    Self.Z = 0.0
		    Return Self
		  End If
		  
		  // Is this vector a zero vector?
		  If Self.IsZero Then Return Self
		  
		  // Get the magnitude.
		  Var mag As Double = Sqrt(Self.X * Self.X + Self.Y * Self.Y + Self.Z * Self.Z)
		  
		  // Normalise and multiply by the new magnitude.
		  mag = magnitude / mag
		  
		  Self.X = Self.X * mag
		  Self.Y = Self.Y * mag
		  Self.Z = Self.Z * mag
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5375627472616374732074686520676976656E20566563746F72332066726F6D207468697320566563746F723320616E642072657475726E73207468697320566563746F72332E
		Function Subtract(x As Double, y As Double, z As Double) As PhysicsKit.Vector3
		  ///
		  ' Subtracts the given Vector3 from this Vector3.
		  '
		  ' - Parameter x: The x component of the Vector3.
		  ' - Parameter y: The y component of the Vector3.
		  ' - Parameter z: The z component of the Vector3.
		  '
		  ' - Returns: This Vector3.
		  ///
		  
		  Self.X = Self.X - X
		  Self.Y = Self.Y - Y
		  Self.Z = Self.Z - Z
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5375627472616374732074686520676976656E20566563746F72332066726F6D207468697320566563746F723320616E642072657475726E73207468697320566563746F72332E
		Function Subtract(vector As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' Subtracts the given Vector3 from this Vector3.
		  '
		  ' - Parameter vector: The Vector3.
		  '
		  ' - Returns: This Vector3.
		  //
		  
		  Self.X = Self.X - vector.X
		  Self.Y = Self.Y - vector.Y
		  Self.Z = Self.Z - vector.Z
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 41646473207468697320566563746F723320616E642074686520676976656E20566563746F72332072657475726E696E672061206E657720566563746F723320636F6E7461696E696E672074686520726573756C742E
		Function Sum(x As Double, y As Double, z As Double) As PhysicsKit.Vector3
		  ///
		  ' Adds this Vector3 and the given Vector3 returning a new Vector3 containing the result.
		  '
		  ' - Parameter x: The x component of the Vector3.
		  ' - Parameter y: The y component of the Vector3.
		  ' - Parameter z: The z component of the Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(Self.X + x, Self.Y + y, Self.Z + z)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 41646473207468697320566563746F723320616E642074686520676976656E20566563746F72332072657475726E696E672061206E657720566563746F723320636F6E7461696E696E672074686520726573756C742E
		Function Sum(vector As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' Adds this Vector3 and the given Vector3 returning a new Vector3 containing the result.
		  '
		  ' - Parameter vector: The Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(Self.X + vector.X, Self.Y + vector.Y, Self.Z + vector.Z)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F66207468697320566563746F72332E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Vector3.
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  
		  s.AddRow("(")
		  s.AddRow(Self.X.ToString)
		  s.AddRow(", ")
		  s.AddRow(Self.Y.ToString)
		  s.AddRow(", ")
		  s.AddRow(Self.Z.ToString)
		  s.AddRow(")")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573206120566563746F72332066726F6D207468697320566563746F723320746F2074686520676976656E20566563746F72332E
		Function Towards(x As Double, y As Double, z As Double) As PhysicsKit.Vector3
		  ///
		  ' Creates a Vector3 from this Vector3 to the given Vector3.
		  '
		  ' - Parameter x: The x component of the Vector3.
		  ' - Parameter y: The y component of the Vector3.
		  ' - Parameter z: The z component of the Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(x - Self.X, y - Self.Y, z - Self.Z)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573206120566563746F72332066726F6D207468697320566563746F723320746F2074686520676976656E20566563746F72332E
		Function Towards(vector As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' Creates a Vector3 from this Vector3 to the given Vector3.
		  '
		  ' - Parameter vector: The Vector3.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  Return New Vector3(vector.X - Self.X, vector.Y - Self.Y, vector.Z - Self.Z)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 54686520747269706C652070726F64756374206F6620566563746F72337320697320646566696E656420617320602861207820622920782063602E
		Shared Function TripleProduct(a As PhysicsKit.Vector3, b As PhysicsKit.Vector3, c As PhysicsKit.Vector3) As PhysicsKit.Vector3
		  ///
		  ' The triple product of Vector3s is defined as: `a x (b x c)`
		  ' However, this method performs the following triple product: `(a x b) x c`
		  '
		  ' This can be simplified to: `-a * (b · c) + b * (a · c)`
		  ' or: `b * (a · c) - a * (b · c)`
		  '
		  ' - Parameter a: The a Vector3 in the above equation.
		  ' - Parameter b: The b Vector3 in the above equation.
		  ' - Parameter c: The c Vector3 in the above equation.
		  '
		  ' - Returns: A new Vector3.
		  ///
		  
		  // Expanded version of above formula.
		  Var r As Vector3 = New Vector3
		  
		  // Perform a.dot(c)
		  Var ac As Double = a.X * c.X + a.Y * c.Y + a.Z * c.Z
		  
		  // Perform b.dot(c)
		  Var bc As Double = b.X * c.X + b.Y * c.Y + b.Z * c.Z
		  
		  // Perform b * a.dot(c) - a * b.dot(c)
		  r.X = b.X * ac - a.X * bc
		  r.Y = b.Y * ac - a.Y * bc
		  r.Z = b.Z * ac - a.Z * bc
		  
		  Return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686520566563746F723320746F20746865207A65726F20566563746F723320616E642072657475726E73207468697320566563746F72332E
		Function Zero() As PhysicsKit.Vector3
		  ///
		  ' Sets the Vector3 to the zero Vector3 and returns this Vector3.
		  '
		  ' - Returns: This Vector3.
		  ///
		  
		  Self.X = 0.0
		  Self.Y = 0.0
		  Self.Z = 0.0
		  
		  Return Self
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This class represents a vector or point in 3D space.
		Used to solve 3x3 systems of equations.
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 546865206D61676E6974756465206F6620746865205820636F6D706F6E656E742E
		X As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D61676E6974756465206F6620746865205920636F6D706F6E656E742E
		Y As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D61676E6974756465206F6620746865205A20636F6D706F6E656E742E
		Z As Double
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
			Name="X"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Y"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Z"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
