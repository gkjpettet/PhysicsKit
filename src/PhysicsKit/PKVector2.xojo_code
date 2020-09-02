#tag Class
Protected Class PKVector2
	#tag Method, Flags = &h0, Description = 416464732074686520676976656E20766563746F7220636F6D706F6E656E747320746F207468697320766563746F722E2052657475726E73207468697320766563746F722E
		Function Add(x As Double, y As Double) As PKVector2
		  ///
		  ' Adds the given vector components to Self vector.
		  '
		  ' - Parameter x: The X component of the vector to add.
		  ' - Parameter y: The Y component of the vector to add.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Self.X = Self.X + x
		  Self.Y = Self.Y + y
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 416464732074686520676976656E20766563746F7220746F207468697320766563746F722E2052657475726E73207468697320766563746F722E
		Function Add(vector As PKVector2) As PKVector2
		  ///
		  ' Adds the given vector to Self vector.
		  ' 
		  ' - Parameter vector: The vector to add.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Self.X = Self.X + vector.X
		  Self.Y = Self.Y + vector.Y
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44656661756C7420636F6E7374727563746F722E
		Sub Constructor()
		  ///
		  ' Default constructor.
		  ///
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573206120756E6974206C656E67746820766563746F7220696E2074686520676976656E20646972656374696F6E2028696E2072616469616E73292E
		Sub Constructor(direction As Double)
		  ///
		  ' Creates a unit length vector in the given direction.
		  ' - Parameter direction: The direction in radians.
		  ///
		  
		  Self.X = Cos(direction)
		  Self.Y = Sin(direction)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4F7074696F6E616C20636F6E7374727563746F722E
		Sub Constructor(x As Double, y As Double)
		  ///
		  ' Optional constructor.
		  ' - Parameter x: The X component.
		  ' - Parameter y: The Y component.
		  ///
		  
		  Self.X = x
		  Self.Y = y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573206120566563746F72322066726F6D2074686520666972737420706F696E7420746F20746865207365636F6E6420706F696E742E
		Sub Constructor(x1 As Double, y1 As Double, x2 As Double, y2 As Double)
		  ///
		  ' Creates a `PKVector2` from the first point to the second point.
		  ' - Parameter x1 The X coordinate of the first point.
		  ' - Parameter y1: The Y coordinate of the first point.
		  ' - Parameter x2: The X coordinate of the second point.
		  ' - Parameter: y2 The Y coordinate of the second point.
		  ///
		  
		  Self.X = x2 - x1
		  Self.Y = y2 - y1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F707920636F6E7374727563746F722E
		Sub Constructor(vector As PKVector2)
		  ///
		  ' Copy constructor.
		  ' - Parameter vector: The PKVector2 to copy from.
		  ///
		  
		  Self.X = vector.X
		  Self.Y = vector.Y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573206120566563746F72322066726F6D2074686520666972737420706F696E7420746F20746865207365636F6E6420706F696E742E
		Sub Constructor(p1 As PKVector2, p2 As PKVector2)
		  ///
		  ' Creates a {PKVector2} from the first point to the second point.
		  ' - Parameter p1: The first point.
		  ' - Parameter p2: The second point.
		  ///
		  
		  Self.X = p2.X - p1.X
		  Self.Y = p2.Y - p1.Y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120636F7079206F66207468697320566563746F72322E
		Function Copy() As PKVector2
		  ///
		  ' Returns a copy of Self PKVector2.
		  ' - Returns: A new PKVector2.
		  ///
		  
		  Return New PKVector2(Self.X, Self.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720566563746F723220676976656E20746865206D61676E697475646520616E6420646972656374696F6E2E2060646972656374696F6E6020697320696E2072616469616E732E
		Shared Function Create(magnitude As Double, direction As Double) As PKVector2
		  ///
		  ' Returns a new PKVector2 given the magnitude and direction.
		  ' - Parameter magnitude: The magnitude of the PKVector2.
		  ' - Parameter direction: The direction of the PKVector2 in radians.
		  ' - Returns: A new PKVector2.
		  ///
		  
		  Var x_ As Double = magnitude * Cos(direction)
		  Var y_ As Double = magnitude * Sin(direction)
		  Return New PKVector2(x_, y_)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652063726F73732070726F64756374206F66207468697320766563746F7220616E6420746865207A2076616C7565206F662074686520726967687420766563746F722061732061206E657720766563746F722E
		Function Cross(z As Double) As PKVector2
		  ///
		  ' Returns the cross product of Self vector and the z value of the right vector 
		  ' as a new vector.
		  '
		  ' - Parameter z: The z component of the vector.
		  '
		  ' - Returns: A new vector.
		  ///
		  
		  Return New PKVector2(-Self.Y * z, Self.X * z)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652063726F73732070726F64756374206F6620746865207468697320766563746F7220616E642074686520676976656E20766563746F7220636F6D706F6E656E74732E
		Function Cross(x As Double, y As Double) As Double
		  ///
		  ' Returns the cross product of the Self vector and the given vector components.
		  '
		  ' - Parameter x: The X component of the other vector.
		  ' - Parameter y: The Y component of the other vector.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.X * y - Self.Y * x
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652063726F73732070726F64756374206F6620746865207468697320766563746F7220616E642074686520676976656E20766563746F722E
		Function Cross(vector As PKVector2) As Double
		  ///
		  ' Returns the cross product of the Self vector and the given vector.
		  '
		  ' - Parameter vector: The vector to cross with.
		  ' 
		  ' - Returns: Double.
		  ///
		  
		  Return Self.X * vector.Y - Self.Y * vector.X
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5375627472616374732074686520676976656E20766563746F7220636F6D706F6E656E74732066726F6D207468697320766563746F722072657475726E696E672061206E657720766563746F7220636F6E7461696E696E672074686520726573756C742E
		Function Difference(x As Double, y As Double) As PKVector2
		  ///
		  ' Subtracts the given vector components from Self vector returning
		  ' a new vector containing the result.
		  '
		  ' - Parameter x: The X component of the vector to subtract.
		  ' - Parameter y: The Y component of the vector to subtract.
		  '
		  ' - Returns: A new vector.
		  ///
		  
		  Return New PKVector2(Self.X - x, Self.Y - y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5375627472616374732074686520676976656E20766563746F722066726F6D207468697320766563746F722072657475726E696E672061206E657720766563746F7220636F6E7461696E696E672074686520726573756C742E
		Function Difference(vector As PKVector2) As PKVector2
		  ///
		  ' Subtracts the given vector from Self vector returning a new vector containing the result.
		  '
		  ' - Parameter vector: The vector to subtract.
		  '
		  ' - Returns: A new vector.
		  ///
		  
		  Return New PKVector2(Self.X - vector.X, Self.Y - vector.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Distance(x As Double, y As Double) As Double
		  ///
		  ' Returns the distance from Self point to the given point.
		  ' - Parameter x: The X coordinate of the point.
		  ' - Parameter y: The Y coordinate of the point.
		  ' - Returns: Double.
		  ///
		  
		  Var dx As Double = Self.X - x
		  Var dy As Double = Self.Y - y
		  
		  Return Sqrt(dx * dx + dy * dy)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652064697374616E63652066726F6D207468697320706F696E7420746F2074686520676976656E20706F696E742E0A
		Function Distance(point As PKVector2) As Double
		  ///
		  ' Returns the distance from Self point to the given point.
		  ' - Parameter point: The point.
		  ' - Returns: Double.
		  ///
		  
		  Var dx As Double = Self.X - point.X
		  Var dy As double = Self.Y - point.Y
		  
		  Return Sqrt(dx * dx + dy * dy)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652064697374616E63652066726F6D207468697320706F696E7420746F2074686520676976656E20706F696E7420737175617265642E
		Function DistanceSquared(x As Double, y As Double) As Double
		  ///
		  ' Returns the distance from Self point to the given point squared.
		  ' - Parameter x: The X coordinate of the point.
		  ' - Parameter y: The Y coordinate of the point.
		  ' - Returns: Double.
		  ///
		  
		  Var dx As Double = Self.X - x
		  Var dy As Double = Self.Y - y
		  
		  Return dx * dx + dy * dy
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652064697374616E63652066726F6D207468697320706F696E7420746F2074686520676976656E20706F696E7420737175617265642E
		Function DistanceSquared(point As PKVector2) As Double
		  ///
		  ' Returns the distance from Self point to the given point squared.
		  ' - Parameter point: The point.
		  ' - Returns: Double.
		  ///
		  
		  Var dx As Double = Self.X - point.X
		  Var dy  As Double = Self.Y - point.Y
		  
		  Return dx * dx + dy * dy
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44697669646573207468697320766563746F722062792074686520676976656E207363616C617220616E642072657475726E73207468697320766563746F722E
		Function Divide(scalar As Double) As PKVector2
		  ///
		  ' Divides Self vector by the given scalar.
		  '
		  ' - Parameter scalar: The scalar.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Self.X = Self.X / scalar
		  Self.Y = Self.Y / scalar
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 272052657475726E732074686520646F742070726F64756374206F662074686520676976656E20766563746F7220636F6D706F6E656E747320616E64207468697320766563746F722E
		Function Dot(x As Double, y As Double) As Double
		  //
		  ' Returns the dot product of the given vector components and Self vector.
		  '
		  ' - Parameter x: The X component of the other vector.
		  ' - Parameter y: The Y component of the other vector.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.X * x + Self.Y * y
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520646F742070726F64756374206F662074686520676976656E20766563746F7220616E64207468697320766563746F722E
		Function Dot(vector As PKVector2) As Double
		  ///
		  ' Returns the dot product of the given vector and Self vector.
		  '
		  ' - Parameter vector: The other vector.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.X * vector.X + Self.Y * vector.Y
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73205472756520696620746865205820616E64205920636F6D706F6E656E7473206F66207468697320566563746F723220617265207468652073616D652061732074686520676976656E207820616E64207920636F6D706F6E656E74732E
		Function Equals(x As Double, y As Double) As Boolean
		  ///
		  ' Returns True if the X and Y components of Self PKVector2 are the same 
		  ' as the given x and y components.
		  '
		  ' - Parameter x: The X coordinate of the PKVector2 to compare with.
		  ' - Parameter y: The Y coordinate of the PKVector2 to compare with.
		  '
		  ' Returns: Boolean.
		  ///
		  
		  Return Self.X = x And Self.Y = y
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73205472756520696620746865205820616E64205920636F6D706F6E656E7473206F66207468697320566563746F723220617265207468652073616D652061732074686520676976656E20566563746F72322E
		Function Equals(vector As PKVector2) As Boolean
		  ///
		  ' Returns True if the X and Y components of Self PKVector2 are the same as the given PKVector2.
		  ' 
		  ' - Parameter vector: The PKVector2 to compare with.
		  ' 
		  ' Returns: Boolean.
		  ///
		  
		  If vector = Nil Then Return False
		  
		  If Self = vector Then Return True
		  
		  Return Self.X = vector.X And Self.Y = vector.Y
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520706173736564206F626A656374206973207468652073616D65206F626A656374206173207468697320766563746F72206F72206973206120566563746F7232206F626A6563742077697468207468652073616D65205820616E64205920636F6D706F6E656E74732E
		Function Equals(obj As Variant) As Boolean
		  ///
		  ' Returns True if the passed object is the same object as this vector or is a 
		  ' PKVector2 object with the same X and Y components.
		  '
		  ' - Parameter obj: The object to compare with.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  If obj = Nil Then Return False
		  If obj = Self Then Return True
		  If obj IsA PKVector2 Then
		    Var v As PKVector2 = PKVector2(obj)
		    Return If(Self.X = v.X And Self.Y = v.Y, True, False)
		  End If
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520736D616C6C65737420616E676C65206265747765656E207468697320766563746F7220616E642074686520676976656E20616E676C652028696E2072616469616E73292E2052657475726E732074686520616E676C6520696E2072616469616E7320696E207468652072616E6765202DCF8020746F20CF802E
		Function GetAngleBetween(otherAngle As Double) As Double
		  ///
		  ' Returns the smallest angle between Self vector and the given angle (in radians).
		  ' Returns the angle in radians in the range -π to π.
		  '
		  ' - Parameter otherAngle: The angle. Must be in the range -π to π.
		  '
		  ' - Returns: The angle in radians.
		  ///
		  
		  Var a As Double = otherAngle - ATan2(Self.Y, Self.X)
		  If a > MathsKit.PI Then Return a - PKGeometry.TWO_PI
		  If a < -MathsKit.PI Then Return a + PKGeometry.TWO_PI
		  Return a
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520736D616C6C65737420616E676C652028696E2072616469616E7329206265747765656E2074686520676976656E20766563746F727320696E207468652072616E6765202DCF8020746F20CF802E
		Function GetAngleBetween(vector As PKVector2) As Double
		  ///
		  ' Returns the smallest angle (in radians) between the given vectors in the range -π to π.
		  '
		  ' - Parameter vector: The other vector.
		  ' - Returns: The angle in radians.
		  ///
		  
		  Var a As Double = ATan2(vector.Y, vector.X) - ATan2(Self.Y, Self.X)
		  If a > MathsKit.PI Then Return a - PKGeometry.TWO_PI
		  If a < -MathsKit.PI then Return a + PKGeometry.TWO_PI
		  Return a
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520646972656374696F6E206F66207468697320766563746F7220617320616E20616E676C6520696E2072616469616E732E
		Function GetDirection() As Double
		  ///
		  ' Returns the direction of Self vector as an angle in radians.
		  '
		  ' - Returns: The angle in radians.
		  ///
		  
		  Return ATan2(Self.Y, Self.X)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73202861732061206E657720766563746F722920746865206C6566742D68616E646564206E6F726D616C206F66207468697320766563746F722E
		Function GetLeftHandOrthogonalVector() As PKVector2
		  ///
		  ' Returns the left-handed normal of Self vector.
		  '
		  ' - Returns: A new vector.
		  ///
		  
		  Return New PKVector2(Self.Y, -Self.X)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D61676E6974756465206F66207468697320766563746F722E
		Function GetMagnitude() As Double
		  ///
		  ' Returns the magnitude of Self vector.
		  ' 
		  ' Returns: Double.
		  ///
		  
		  // The magnitude is just the pythagorean theorem.
		  Return Sqrt(Self.X * Self.X + Self.Y * Self.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D61676E6974756465206F66207468697320766563746F7220737175617265642E
		Function GetMagnitudeSquared() As Double
		  ///
		  ' Returns the magnitude of Self vector squared.
		  ' 
		  ' - Returns: Double
		  ///
		  
		  Return Self.X * Self.X + Self.Y * Self.Y
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720766563746F7220776869636820697320746865206E65676174697665206F66207468697320766563746F722E
		Function GetNegative() As PKVector2
		  ///
		  ' Returns a new vector which is the negative of Self vector.
		  '
		  ' - Returns: A new vector.
		  ///
		  
		  Return New PKVector2(-Self.X, -Self.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120756E697420766563746F72206F66207468697320766563746F722061732061206E657720766563746F722E205265717569726573207468617420746865206C656E677468206F66207468697320766563746F72206973206E6F74207A65726F2E
		Function GetNormalised() As PKVector2
		  ///
		  ' Returns a unit vector of Self vector.
		  ' Self method requires that the length of Self vector is not zero.
		  '
		  ' - Returns: A new vector.
		  ///
		  
		  Var magnitude As Double = Self.GetMagnitude
		  If magnitude <= PhysicsKit.Epsilon.E then Return New PKVector2
		  
		  magnitude = 1.0 / magnitude
		  
		  Return New PKVector2(Self.X * magnitude, Self.Y * magnitude)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73202861732061206E657720766563746F7229207468652072696768742D68616E646564206E6F726D616C206F66207468697320766563746F722E
		Function GetRightHandOrthogonalVector() As PKVector2
		  ///
		  ' Returns the right-handed normal of Self vector.
		  '
		  ' - Returns: A new vector.
		  ///
		  
		  Return New PKVector2(-Self.Y, Self.X)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720766563746F722077686F7365205820636F6D706F6E656E74206D617463686573207468697320766563746F7227732E
		Function GetXComponent() As PKVector2
		  ///
		  ' Returns a new vector whose X component matches Self vector's.
		  '
		  ' Returns: A new PKVector2.
		  ///
		  
		  Return New PKVector2(Self.X, 0.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720766563746F722077686F7365205920636F6D706F6E656E74206D617463686573207468697320766563746F7227732E
		Function GetYComponent() As PKVector2
		  ///
		  ' Returns a new vector whose Y component matches Self vector's.
		  '
		  ' Returns: A new PKVector2.
		  ///
		  
		  Return New PKVector2(0.0, Self.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E697469616C69736573207368617265642070726F706572746965732E205573656420696E7465726E616C6C792E
		Shared Sub Initialise()
		  // Initialises shared properties. Used internally.
		  
		  X_AXIS = New PKVector2(1.0, 0.0)
		  Y_AXIS = New PKVector2(0.0, 1.0)
		  INV_X_AXIS = New PKVector2(-1.0, 0.0)
		  INV_Y_AXIS = New PKVector2(0.0, -1.0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F74617465732061626F757420746865206F726967696E2062792074686520696E766572736520616E676C65202DF09D9B9D20616E642072657475726E73207468697320766563746F722E
		Function InverseRotate(theta As Double) As PKVector2
		  ///
		  ' Rotates about the origin by the inverse angle -𝛝.
		  '
		  ' - Parameter theta: The rotation angle in radians.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Return Self.Rotate(Cos(theta), -Sin(theta))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F74617465732061626F75742074686520676976656E20636F6F7264696E617465732062792074686520696E766572736520616E676C65202DF09D9B9D2028696E2072616469616E732920616E64207468656E2072657475726E73207468697320766563746F722E
		Function InverseRotate(theta As Double, x As Double, y As Double) As PKVector2
		  ///
		  ' Rotates about the given coordinates by the inverse angle -𝛝.
		  '
		  ' - Parameter theta: The rotation angle in radians.
		  ' - Parameter x: The X coordinate to rotate about.
		  ' - Parameter y: The Y coordinate to rotate about.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Return Self.Rotate(Cos(theta), -Sin(theta), x, y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320766563746F722061626F75742074686520676976656E20706F696E742062792074686520696E766572736520616E676C65202DF09D9B9D2028696E2072616469616E73292E2052657475726E73207468697320766563746F722E
		Function InverseRotate(theta As Double, point As PKVector2) As PKVector2
		  ///
		  ' Rotates Self vector about the given point by the inverse angle -𝛝.
		  '
		  ' - Parameter theta: The rotation angle in radians.
		  ' - Parameter point: The point to rotate about.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Return Self.InverseRotate(theta, point.X, point.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F74617465732061626F757420746865206F726967696E2062792074686520696E766572736520616E676C65202DF09D9B9D20616E642072657475726E73207468697320766563746F722E
		Function InverseRotate(rotation As PKRotation) As PKVector2
		  ///
		  ' Rotates about the origin by the inverse angle -𝛝.
		  '
		  ' - Parameter rotation: The Rotation.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Return Self.Rotate(rotation.Cost, -rotation.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F74617465732061626F75742074686520676976656E20636F6F7264696E617465732062792074686520696E766572736520616E676C65202DF09D9B9D20616E64207468656E2072657475726E73207468697320766563746F722E
		Function InverseRotate(rotation As PKRotation, x As Double, y As Double) As PKVector2
		  /// 
		  ' Rotates about the given coordinates by the inverse angle -𝛝.
		  '
		  ' - Parameter rotation: The Rotation.
		  ' - Parameter x: The X coordinate to rotate about.
		  ' - Parameter y: The Y coordinate to rotate about.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Return Self.Rotate(rotation.Cost, -rotation.Sint, x, y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320766563746F722061626F75742074686520676976656E20706F696E742062792074686520696E766572736520616E676C65202DF09D9B9D20616E64207468656E2072657475726E73207468697320766563746F722E
		Function InverseRotate(rotation As PKRotation, point As PKVector2) As PKVector2
		  ///
		  ' Rotates Self vector about the given point by the inverse angle -𝛝.
		  '
		  ' - Parameter rotation: The Rotation.
		  ' - Parameter point: The point to rotate about.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Return Self.InverseRotate(rotation, point.X, point.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E20766563746F7220636F6D706F6E656E747320636F6E73746974757465206120766563746F722074686174206973206F7274686F676F6E616C202870657270656E646963756C61722920746F207468697320766563746F722E
		Function IsOrthogonal(x As Double, y As Double) As Boolean
		  ///
		  ' Returns True if the given vector components constitute a vector that is 
		  ' orthogonal (perpendicular) to Self vector.
		  '
		  ' If the dot product of Self vector and the given vector is zero then we 
		  ' know that they are perpendicular.
		  '
		  ' - Parameter x: The X component of the vector to test against.
		  ' - Parameter y: The Y component of the vector to test against.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Abs(Self.X * x + Self.Y * y) <= PhysicsKit.Epsilon.E
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E20766563746F72206973206F7274686F676F6E616C202870657270656E646963756C61722920746F207468697320766563746F722E
		Function IsOrthogonal(vector As PKVector2) As Boolean
		  ///
		  ' Returns True if the given vector is orthogonal (perpendicular) to Self vector.
		  '
		  ' If the dot product of Self vector and the given vector is zero then we know 
		  ' that they are perpendicular.
		  '
		  ' - Parameter vector: The vector to test against.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Abs(Self.X * vector.X + Self.Y * vector.Y) <= PhysicsKit.Epsilon.E
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732054727565206966207468697320766563746F7220697320746865207A65726F20766563746F722E
		Function IsZero() As Boolean
		  ///
		  ' Returns True if Self vector is the zero vector.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Abs(Self.X) <= PhysicsKit.Epsilon.E And Abs(Self.Y) <= PhysicsKit.Epsilon.E
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320766563746F7220746F20746865206C6566742D68616E646564206E6F726D616C206F66207468697320766563746F7220616E64207468656E2072657475726E73207468697320766563746F722E
		Function Left() As PKVector2
		  ///
		  ' Sets Self vector to the left-handed normal of Self vector.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Var temp As Double = Self.X
		  Self.X = Self.Y
		  Self.Y = -temp
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C696573207468697320766563746F722062792074686520676976656E207363616C617220616E642072657475726E73207468697320766563746F722E
		Function Multiply(scalar As Double) As PKVector2
		  ///
		  ' Multiplies Self vector by the given scalar.
		  '
		  ' - Parameter scalar: The scalar.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Self.X = Self.X * scalar
		  Self.Y = Self.Y * scalar
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4E656761746573207468697320766563746F7220616E642072657475726E732069742E
		Function Negate() As PKVector2
		  ///
		  ' Negates Self vector.
		  ' 
		  ' - Returns: Self vector.
		  ///
		  
		  Self.X = -Self.X
		  Self.Y = -Self.Y
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F6E7665727473207468697320766563746F7220696E746F206120756E697420766563746F7220616E642072657475726E7320746865206D61676E6974756465206265666F7265206E6F726D616C697A6174696F6E2E2054686973206D6574686F6420726571756972657320746865206C656E677468206F662074686973206973206E6F74207A65726F2E
		Function Normalise() As Double
		  ///
		  ' Converts Self vector into a unit vector and returns the magnitude before normalization.
		  ' Self method requires the length of Self is not zero.
		  '
		  ' - Returns: Double.
		  ///
		  
		  var magnitude As Double = Sqrt(Self.X * Self.X + Self.Y * Self.Y)
		  If magnitude <= PhysicsKit.Epsilon.E Then Return 0
		  
		  Var m As Double = 1.0 / magnitude
		  Self.X = Self.X * m
		  Self.Y = Self.Y * m
		  
		  Return magnitude
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D756C7469706C696573207468697320766563746F722062792074686520676976656E207363616C61722072657475726E696E672061206E657720766563746F7220636F6E7461696E696E672074686520726573756C742E
		Function Product(scalar As Double) As PKVector2
		  ///
		  ' Multiplies Self vector by the given scalar returning a new vector containing the result.
		  '
		  ' - Parameter scalar: The scalar.
		  '
		  ' - Return: A new vector.
		  ///
		  
		  Return New PKVector2(Self.X * scalar, Self.Y * scalar)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 50726F6A65637473207468697320766563746F72206F6E746F2074686520676976656E20766563746F722E2052657475726E732061206E657720766563746F722E
		Function Project(vector As PKVector2) As PKVector2
		  ///
		  ' Projects Self vector onto the given vector.
		  '
		  ' - Parameter vector: The vector to project onto.
		  '
		  ' - Returns: A new vector.
		  ///
		  
		  Var dotProd As Double = Self.Dot(vector)
		  Var denominator As Double = vector.Dot(vector)
		  
		  If denominator <= PhysicsKit.Epsilon.E Then Return New PKVector2
		  
		  denominator = dotProd / denominator
		  
		  Return New PKVector2(denominator * vector.X, denominator * vector.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44697669646573207468697320766563746F722062792074686520676976656E207363616C61722072657475726E696E672061206E657720766563746F7220636F6E7461696E696E672074686520726573756C742E
		Function Quotient(scalar As Double) As PKVector2
		  ///
		  ' Divides Self vector by the given scalar returning a new vector containing the result.
		  '
		  ' - Parameter scalar: The scalar.
		  '
		  ' - Returns: A new vector.
		  ///
		  
		  Return New PKVector2(Self.X / scalar, Self.Y / scalar)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320766563746F7220746F207468652072696768742D68616E646564206E6F726D616C206F66207468697320766563746F7220616E642072657475726E73207468697320766563746F722E
		Function Right() As PKVector2
		  ///
		  ' Sets Self vector to the right-handed normal of Self vector.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Var temp As Double = Self.X
		  Self.X = -Self.Y
		  Self.Y = temp
		  
		  Return Self
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F74617465732061626F757420746865206F726967696E20627920607468657461602028696E2072616469616E732920616E642072657475726E73207468697320766563746F722E
		Function Rotate(theta As Double) As PKVector2
		  ///
		  ' Rotates about the origin.
		  '
		  ' - Parameter theta: The rotation angle in radians.
		  '
		  '' - Returns: Self vector.
		  ///
		  
		  Return Self.Rotate(Cos(theta), Sin(theta))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C2068656C706572206D6574686F64207468617420726F74617465732061626F757420746865206F726967696E20627920616E20616E676C6520CE9820616E642072657475726E73207468697320766563746F722E
		Function Rotate(cos As Double, sin As Double) As PKVector2
		  ///
		  ' Internal helper method that rotates about the origin by an angle Θ.
		  '
		  ' - Parameter cos: Cos(Θ)
		  ' - Parameter sin: Sin(Θ)
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Var x As Double = Self.X
		  Var y As Double = Self.Y
		  
		  Self.X = x * cos - y * sin
		  Self.Y = x * sin + y * cos
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320766563746F72206279207468652073706563696669656420616E676C652028696E2072616469616E73292061626F75742074686520676976656E20636F6F7264696E6174657320616E64207468656E2072657475726E73207468697320766563746F722E
		Function Rotate(theta As Double, x As Double, y As Double) As PKVector2
		  ///
		  ' Rotates Self vector about the given coordinates.
		  '
		  ' - Parameter theta: The rotation angle in radians.
		  ' - Parameter x: The X coordinate to rotate about.
		  ' - Parameter y: The Y coordinate to rotate about.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Return Self.Rotate(Cos(theta), Sin(theta), x, y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C2068656C706572206D6574686F64207468617420726F74617465732061626F75742074686520676976656E20636F6F7264696E6174657320627920616E20616E676C6520CE9820616E64207468656E2072657475726E73207468697320766563746F722E
		Function Rotate(cos As Double, sin As Double, x As Double, y As Double) As PKVector2
		  ///
		  ' Internal helper method that rotates about the given coordinates by an angle Θ.
		  '
		  ' - Parameter cos: Cos(Θ)
		  ' - Parameter sin: Sin(Θ)
		  ' - Parameter x: The X coordinate to rotate about.
		  ' - Parameter y: The Y coordinate to rotate about.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Var tx As Double = (Self.X - x)
		  Var ty As Double = (Self.Y - y)
		  
		  Self.X = tx * cos - ty * sin + x
		  Self.Y = tx * sin + ty * cos + y
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320766563746F722061626F75742074686520676976656E20706F696E7420627920746865207370656369666965642072616469616E732E2052657475726E73207468697320766563746F722E
		Function Rotate(theta As Double, point As PKVector2) As PKVector2
		  ///
		  ' Rotates Self vector about the given point.
		  '
		  ' - Parameter theta: The rotation angle in radians.
		  ' - Parameter point: The point to rotate about.
		  ' 
		  ' - Returns: Self vector.
		  ///
		  
		  Return Self.Rotate(theta, point.X, point.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F74617465732061626F757420746865206F726967696E206279207468652070617373656420526F746174696F6E20616E642072657475726E73207468697320766563746F722E
		Function Rotate(rotation As PKRotation) As PKVector2
		  ///
		  ' Rotates about the origin.
		  '
		  ' - Parameter rotation: The Rotation.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Return Self.Rotate(rotation.Cost, rotation.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320766563746F722061626F75742074686520676976656E20636F6F7264696E6174657320616E64207468656E2072657475726E73207468697320766563746F722E
		Function Rotate(rotation As PKRotation, x As Double, y As Double) As PKVector2
		  ///
		  ' Rotates Self vector about the given coordinates.
		  '
		  ' - Parameter rotation: The Rotation.
		  ' - Parameter x: The X coordinate to rotate about.
		  ' - Parameter y: The Y coordinate to rotate about.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Return Self.Rotate(rotation.Cost, rotation.Sint, x, y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F74617465732074686520766563746F722061626F75742074686520676976656E20706F696E7420616E64207468652072657475726E73207468697320766563746F722E
		Function Rotate(rotation As PKRotation, point As PKVector2) As PKVector2
		  ///
		  ' Rotates the vector about the given point.
		  '
		  ' - Parameter rotation: The Rotation.
		  ' - Paramter point: The point to rotate about.
		  '
		  ' - Returns: Self vector.
		  ///
		  
		  Return Self.Rotate(rotation, point.X, point.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320566563746F723220746F2074686520676976656E20566563746F723220616E642072657475726E73207468697320566563746F72322E
		Function Set(x As Double, y As Double) As PKVector2
		  ///
		  ' Sets Self PKVector2 to the given PKVector2.
		  ' 
		  ' - Parameter x: The X component of the PKVector2 to set Self PKVector2 to.
		  ' - Parameter y: The Y component of the PKVector2 to set Self PKVector2 to.
		  ' 
		  ' Returns: Self PKVector2.
		  ///
		  
		  Self.X = x
		  Self.Y = y
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320566563746F723220746F2074686520676976656E20566563746F723220616E642072657475726E73207468697320566563746F72322E
		Function Set(vector As PKVector2) As PKVector2
		  ///
		  ' Sets Self PKVector2 to the given PKVector2.
		  ' - Parameter vector: The PKVector2 to set Self PKVector2 to.
		  ' 
		  ' - Returns: Self vector.
		  ///
		  
		  Self.X = vector.X
		  Self.Y = vector.Y
		  
		  Return Self
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686520646972656374696F6E206F66207468697320766563746F7220746F2074686520616E676C65207061737365642028696E2072616469616E732920616E642072657475726E73207468697320766563746F722E
		Function SetDirection(angle As Double) As PKVector2
		  ///
		  ' Sets the direction of Self vector.
		  ' 
		  ' - Parameter angle: The angle in radians.
		  ' 
		  ' Returns:Self vector.
		  ///
		  
		  Var magnitude As Double = Sqrt(Self.X * Self.X + Self.Y * Self.Y)
		  Self.X = magnitude * Cos(angle)
		  Self.Y = magnitude * Sin(angle)
		  
		  Return Self
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5365747320746865206D61676E6974756465206F66207468697320766563746F722E2052657475726E73207468697320766563746F722E
		Function SetMagnitude(magnitude As Double) As PKVector2
		  ///
		  ' Sets the magnitude of Self vector.
		  ' - Parameter magnitude: The magnitude.
		  ' 
		  ' - Returns: Self vector.
		  ///
		  
		  // Check the given magnitude.
		  If Abs(magnitude) <= PhysicsKit.Epsilon.E Then
		    Self.X = 0.0
		    Self.Y = 0.0
		    Return Self
		  End If
		  
		  // Is Self vector a zero vector?
		  If Self.IsZero Then Return Self
		  
		  // Get the magnitude.
		  Var mag As Double = Sqrt(Self.X * Self.X + Self.Y * Self.Y)
		  
		  // Normalise and multiply by the new magnitude.
		  mag = magnitude / mag
		  Self.X = Self.X * mag
		  Self.Y = Self.Y * mag
		  
		  Return Self
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5375627472616374732074686520676976656E20766563746F7220636F6D706F6E656E74732066726F6D207468697320766563746F7220616E642072657475726E73207468697320766563746F722E
		Function Subtract(x As Double, y As Double) As PKVector2
		  ///
		  ' Subtracts the given vector components from Self vector.
		  '
		  ' - Parameter x: The X component of the vector to subtract.
		  ' - Parameter y: The Y component of the vector to subtract.
		  ' 
		  ' - Returns: Self vector.
		  ///
		  
		  Self.X = Self.X - x
		  Self.Y = Self.Y - y
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5375627472616374732074686520676976656E20766563746F722066726F6D207468697320766563746F7220616E642072657475726E73207468697320766563746F722E
		Function Subtract(vector As PKVector2) As PKVector2
		  ///
		  ' Subtracts the given vector from Self vector.
		  '
		  ' - Parameter vector: The vector to subtract from Self vector.
		  ' 
		  ' - Returns: Self vector.
		  ///
		  
		  Self.X = Self.X - vector.X
		  Self.Y = Self.Y - vector.Y
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 41646473207468697320766563746F7220616E642074686520676976656E20766563746F7220636F6D706F6E656E74732072657475726E696E672061206E657720566563746F723220636F6E7461696E696E672074686520726573756C742E
		Function Sum(x As Double, y As Double) As PKVector2
		  ///
		  ' Adds Self vector and the given vector components returning a new PKVector2 
		  ' containing the result.
		  ' 
		  ' - Parameter x: The X component.
		  ' - Parameter y: The Y component.
		  '
		  ' Returns: A new vector.
		  ///
		  
		  Return New PKVector2(Self.X + x, Self.Y + y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 41646473207468697320766563746F7220616E642074686520676976656E20766563746F722072657475726E696E672061206E657720766563746F7220636F6E7461696E696E672074686520726573756C742E
		Function Sum(vector As PKVector2) As PKVector2
		  ///
		  ' Adds Self vector and the given vector returning a new vector containing the result.
		  '
		  ' - Parameter vector: The PKVector2 to sum with.
		  ' 
		  ' - Returns: A new PKVector2.
		  ///
		  
		  Return New PKVector2(Self.X + vector.X, Self.Y + vector.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  ///
		  ' Returns a string representation of Self vector in the form: "(X, Y)".
		  '
		  ' Returns: String.
		  ///
		  
		  Return "(" + Self.X.ToString + ", " + Self.Y.ToString + ")"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E642072657475726E732061206E657720766563746F722066726F6D207468697320766563746F7220746F2074686520676976656E20766563746F722E
		Function Towards(x As Double, y As Double) As PKVector2
		  ///
		  ' Creates and returns a new vector from Self vector to the given vector.
		  '
		  ' - Parameter x: The X component of the vector to travel towards.
		  ' - Parameter y: The Y component of the vector to travel towards.
		  ' 
		  ' - Returns: A new vector.
		  ///
		  
		  Return New PKVector2(x - Self.X, y - Self.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E642072657475726E732061206E657720766563746F722066726F6D207468697320766563746F7220746F2074686520676976656E20766563746F722E
		Function Towards(vector As PKVector2) As PKVector2
		  ///
		  ' Creates and returns a new vector from Self vector to the given vector.
		  '
		  ' - Parameter vector: The vector to travel towards.
		  '
		  ' - Returns: A new vector.
		  ///
		  
		  Return New PKVector2(vector.X - Self.X, vector.Y - Self.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520747269706C652070726F64756374206F662074686520746872656520766563746F72732061732061206E657720766563746F722E
		Shared Function TripleProduct(a As PKVector2, b As PKVector2, c As PKVector2) As PKVector2
		  ///
		  ' The triple product of three PKVector2 objects is defined as:
		  ' ```
		  ' a x (b x c)
		  ' ```
		  ' However, Self method performs the following triple product:
		  ' ```
		  ' (a x b) x c
		  ' ```
		  ' Self can be simplified to:
		  ' ```
		  ' -a * (b · c) + b * (a · c)
		  ' ```
		  ' or:
		  ' ```
		  ' b * (a · c) - a * (b · c)
		  ' ```
		  
		  ' - Parameter a: The `a` PKVector2 in the above equation.
		  ' - Parameter b: The `b` PKVector2 in the above equation.
		  ' - Parameter c: The `c` PKVector2 in the above equation.
		  
		  ' - Returns: A new PKVector2.
		  ///
		  
		  // Expanded version of above formula.
		  Var r As PKVector2 = New PKVector2
		  
		  Var dot As Double = a.X * b.Y - b.X * a.Y
		  r.X = -c.Y * dot
		  r.Y = c.X * dot
		  
		  Return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320766563746F7220746F20746865207A65726F20766563746F7220616E642072657475726E73207468697320766563746F722E
		Function Zero() As PKVector2
		  ///
		  ' Sets Self vector to the zero vector.
		  '
		  ' Returns: Self vector.
		  ///
		  
		  Self.X = 0.0
		  Self.Y = 0.0
		  
		  Return Self
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Self class represents a vector or point in 2D space. 
		The operations PKVector2.SetMagnitude(Double), PKVector2.GetNormalized(), 
		PKVector2.Project(PKVector2) and PKVector2.Normalize() require the PKVector2 to be non-zero in length.
		Some methods also return the vector to facilitate chaining.  For example:
		Var a As PKVector2 = New PKVector2
		a.Zero.Add(1, 2).Multiply(2)
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 4120766563746F7220726570726573656E74696E672074686520696E766572736520782D617869732E205468697320766563746F722073686F756C64206E6F74206265206368616E6765642061742072756E74696D652E205573656420696E7465726E616C6C79
		Shared INV_X_AXIS As PKVector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 4120766563746F7220726570726573656E74696E672074686520696E766572736520792D617869732E205468697320766563746F722073686F756C64206E6F74206265206368616E6765642061742072756E74696D652E205573656420696E7465726E616C6C79
		Shared INV_Y_AXIS As PKVector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D61676E6974756465206F6620746865205820636F6D706F6E656E74206F66207468697320566563746F72322E
		X As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 4120766563746F7220726570726573656E74696E672074686520782D617869732E205468697320766563746F722073686F756C64206E6F74206265206368616E6765642061742072756E74696D652E204974206973207573656420696E7465726E616C6C792E
		Shared X_AXIS As PKVector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D61676E6974756465206F6620746865205920636F6D706F6E656E74206F66207468697320566563746F72322E
		Y As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 4120766563746F7220726570726573656E74696E672074686520792D617869732E205468697320766563746F722073686F756C64206E6F74206265206368616E6765642061742072756E74696D652E204974206973207573656420696E7465726E616C6C792E
		Shared Y_AXIS As PKVector2
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
	#tag EndViewBehavior
End Class
#tag EndClass
