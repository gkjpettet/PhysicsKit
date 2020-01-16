#tag Class
Protected Class Transform
Implements PhysicsKit.Transformable
	#tag Method, Flags = &h0, Description = 44656661756C74207075626C696320636F6E7374727563746F722E
		Sub Constructor()
		  ///
		  ' Default public constructor.
		  ///
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5072697661746520636F6E7374727563746F7220666F7220736F6D6520636F707920616E6420696E7465726E616C206F7065726174696F6E732E
		Private Sub Constructor(cost As Double, sint As Double, x As Double, y As Double)
		  ///
		  ' Private constructor for some copy and internal operations.
		  '
		  ' - Parameter cost: The cosine.
		  ' - Parameter sint: The negative sine.
		  ' - Parameter x: The x translation.
		  ' - Parameter y: The y translation.
		  ///
		  
		  Self.Cost = cost
		  Self.Sint = sint
		  Self.X = x
		  Self.Y = y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5075626C696320636F707920636F6E7374727563746F722E
		Sub Constructor(t As PhysicsKit.Transform)
		  ///
		  ' Public copy constructor.
		  '
		  ' - Parameter t: The transform to copy.
		  ///
		  
		  Self.Cost = t.Cost
		  Self.Sint = t.Sint
		  Self.X = t.X
		  Self.Y = t.Y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F706965732074686973205472616E73666F726D2E
		Function Copy() As PhysicsKit.Transform
		  ///
		  ' Copies this Transform.
		  '
		  ' - Returns: A new Transform.
		  ///
		  
		  Return New Transform(Self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7665727365207472616E73666F726D732074686520676976656E20566563746F723220616E642072657475726E732061206E657720566563746F723220636F6E7461696E696E672074686520726573756C742E
		Function GetInverseTransformed(vector As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Inverse transforms the given Vector2 and returns a new Vector2 containing the result.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  '
		  ' - Returns: A new Vector2.
		  ///
		  
		  Var tv As PhysicsKit.Vector2 = New Vector2
		  Var tx As Double = vector.X - Self.X
		  Var ty As Double = vector.Y - Self.Y
		  tv.X = Self.Cost * tx + Self.Sint * ty
		  tv.Y = -Self.Sint * tx + Self.Cost * ty
		  Return tv
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7665727365207472616E73666F726D732074686520676976656E20566563746F723220616E642072657475726E732074686520726573756C7420696E207468652064657374696E6174696F6E20566563746F72322E
		Sub GetInverseTransformed(vector As PhysicsKit.Vector2, destination As PhysicsKit.Vector2)
		  ///
		  ' Inverse transforms the given Vector2 and returns the result in the destination Vector2.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  ' - Parameter destination: The Vector2 containing the result.
		  ///
		  
		  Var tx As Double = vector.X - Self.X
		  Var ty As Double = vector.Y - Self.Y
		  destination.X = Self.Cost * tx + Self.Sint * ty
		  destination.Y = -Self.Sint * tx + Self.Cost * ty
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7665727365207472616E73666F726D732074686520676976656E20566563746F7232206F6E6C792062792074686520726F746174696F6E20616E642072657475726E732061206E657720566563746F723220636F6E7461696E696E672074686520726573756C742E
		Function GetInverseTransformedR(vector As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Inverse transforms the given Vector2 only by the rotation and returns
		  ' a new Vector2 containing the result.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  '
		  ' - Returns: A new Vector2.
		  ///
		  
		  Var v As PhysicsKit.Vector2 = New Vector2
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  
		  // The transpose of a rotation matrix is the inverse.
		  v.X = Self.Cost * x + Self.Sint * y
		  v.Y = -Self.Sint * x + Self.Cost * y
		  
		  Return v
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E73666F726D732074686520676976656E20566563746F7232206F6E6C792062792074686520726F746174696F6E20616E642072657475726E732074686520726573756C7420696E207468652064657374696E6174696F6E20566563746F72322E
		Sub GetInverseTransformedR(vector As PhysicsKit.Vector2, destination As PhysicsKit.Vector2)
		  ///
		  ' Transforms the given Vector2 only by the rotation and returns the result in the
		  ' destination Vector2.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  ' - Parameter destination: The Vector2 containing the result.
		  ///
		  
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  
		  // The transpose of a rotation matrix is the inverse.
		  destination.X = Self.Cost * x + Self.Sint * y
		  destination.Y = -Self.Sint * x + Self.Cost * y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRotation() As PhysicsKit.Rotation
		  ///
		  ' Returns the Rotation object representing the rotation of this Transform.
		  '
		  ' Returns: Rotation.
		  ///
		  
		  Return Rotation.Of_(Self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520726F746174696F6E20616E676C6520696E207468652072616E6765205B2DCF802C20CF805D2E
		Function GetRotationAngle() As Double
		  ///
		  ' Returns the rotation angle in the range [-π, π].
		  '
		  ' - Returns: Double.
		  ///
		  
		  // Copied from Rotation class. See there for more info.
		  Var acos As Double = ACos(Self.Cost)
		  Var angle As Double = If((Self.Sint >= 0), acos, -acos)
		  Return angle
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRotationTransform() As PhysicsKit.Transform
		  ///
		  ' Returns a new Transform including only the rotation of this Transform.
		  '
		  ' - Returns: A new Transform.
		  ///
		  
		  Var t As PhysicsKit.Transform = New Transform(Self.Cost, Self.Sint, 0, 0)
		  Return t
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E73666F726D732074686520676976656E20566563746F723220616E642072657475726E732061206E657720566563746F723220636F6E7461696E696E672074686520726573756C742E
		Function GetTransformed(vector As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Transforms the given Vector2 and returns a new Vector2 containing the result.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  '
		  ' - Returns: A new Vector2.
		  ///
		  
		  Var tv As PhysicsKit.Vector2 = New Vector2
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  
		  tv.X = Self.Cost * x - Self.Sint * y + Self.X
		  tv.Y = Self.Sint * x + Self.Cost * y + Self.Y
		  
		  Return tv
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E73666F726D732074686520676976656E20566563746F723220616E642072657475726E732074686520726573756C7420696E206064657374696E6174696F6E602E
		Sub GetTransformed(vector As PhysicsKit.Vector2, destination As PhysicsKit.Vector2)
		  ///
		  ' Transforms the given Vector2 and returns the result in `destination`.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  ' - Parameter destination: The Vector2 containing the result.
		  ///
		  
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  destination.X = Self.Cost * x - Self.Sint * y + Self.X
		  destination.Y = Self.Sint * x + Self.Cost * y + Self.Y
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E73666F726D732074686520676976656E20566563746F7232206F6E6C792062792074686520726F746174696F6E20616E642072657475726E732061206E657720566563746F723220636F6E7461696E696E672074686520726573756C742E
		Function GetTransformedR(vector As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Transforms the given Vector2 only by the rotation and returns a new 
		  ' Vector2 containing the result.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  '
		  ' - Returns: A new Vector2.
		  ///
		  
		  Var v As PhysicsKit.Vector2 = New Vector2
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  v.X = Self.Cost * x - Self.Sint * y
		  v.Y = Self.Sint * x + Self.Cost * y
		  Return v
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E73666F726D732074686520676976656E20566563746F7232206F6E6C792062792074686520726F746174696F6E20616E642072657475726E732074686520726573756C7420696E207468652064657374696E6174696F6E20566563746F72322E
		Sub GetTransformedR(vector As PhysicsKit.Vector2, destination As PhysicsKit.Vector2)
		  ///
		  ' Transforms the given Vector2 only by the rotation and returns the result in the
		  ' destination Vector2.
		  ' 
		  ' - Parameter vector: The Vector2 to transform.
		  ' - Parameter destination: The Vector2 containing the result.
		  ///
		  
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  destination.X = Self.Cost * x - Self.Sint * y
		  destination.Y = Self.Sint * x + Self.Cost * y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E73666F726D73206F6E6C7920746865205820636F6F7264696E617465206F662074686520676976656E20566563746F723220616E642072657475726E732074686520726573756C742E
		Function GetTransformedX(vector As PhysicsKit.Vector2) As Double
		  ///
		  ' Transforms only the X coordinate of the given Vector2 and returns the result.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  '
		  ' - Returns: The transformed X coordinate.
		  ///
		  
		  Return Self.Cost * vector.X - Self.Sint * vector.Y + Self.X
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E73666F726D73206F6E6C7920746865205920636F6F7264696E617465206F662074686520676976656E20566563746F723220616E642072657475726E732074686520726573756C742E
		Function GetTransformedY(vector As PhysicsKit.Vector2) As Double
		  ///
		  ' Transforms only the Y coordinate of the given Vector2 and returns the result.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  '
		  ' - Returns: The transformed Y coordinate.
		  ///
		  
		  Return Self.Sint * vector.X + Self.Cost * vector.Y + Self.Y
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207472616E736C6174696F6E20766563746F722061732061206E657720566563746F72322E
		Function GetTranslation() As PhysicsKit.Vector2
		  ///
		  ' Returns the translation vector as a new Vector2.
		  '
		  ' - Returns: A new Vector2.
		  ///
		  
		  Return New Vector2(Self.X, Self.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTranslationTransform() As PhysicsKit.Transform
		  ///
		  ' Returns a new Transform including only the translation of this Transform.
		  '
		  ' - Returns: A new Transform.
		  ///
		  
		  Var t As PhysicsKit.Transform = New Transform(1.0, 0.0, Self.X, Self.Y)
		  Return t
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652058207472616E736C6174696F6E2E
		Function GetTranslationX() As Double
		  ///
		  ' Returns the X translation.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.X
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTranslationY() As Double
		  ///
		  ' Returns the Y translation.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Y
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652076616C7565732073746F72656420696E2074686973207472616E73666F726D2E205468652076616C7565732061726520696E20746865206F72646572202830302C2030312C20782C2031302C2031312C2079292E
		Function GetValues() As Double()
		  ///
		  ' Returns the values stored in this transform.
		  ' The values are in the order of 00, 01, x, 10, 11, y.
		  '
		  ' Returns: A Double array.
		  ///
		  
		  Return Array(Self.Cost, -Self.Sint, Self.X, Self.Sint, Self.Cost, Self.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686973205472616E73666F726D20746F20746865206964656E746974792E
		Sub Identity()
		  ///
		  ' Sets this Transform to the identity.
		  ///
		  
		  Self.Cost = 1
		  Self.Sint = 0
		  Self.X = 0
		  Self.Y = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E697469616C69736573207368617265642070726F706572746965732E
		Shared Sub Initialise()
		  ///
		  ' Initialises shared properties.
		  ///
		  
		  mIDENTITY = New Transform
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7665727365207472616E73666F726D732074686520676976656E20566563746F723220616E6420706C616365732074686520726573756C7420696E2074686520676976656E20566563746F72322E
		Sub InverseTransform(vector As PhysicsKit.Vector2)
		  ///
		  ' Inverse transforms the given Vector2 and places the result in the given Vector2.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  ///
		  
		  Var x As Double = vector.X - Self.X
		  Var y As Double = vector.Y - Self.Y
		  vector.X = Self.Cost * x + Self.Sint * y
		  vector.Y = -Self.Sint * x + Self.Cost * y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E73666F726D732074686520676976656E20566563746F7232206F6E6C792062792074686520726F746174696F6E20616E642072657475726E732074686520726573756C7420696E2074686520676976656E20566563746F7232
		Sub InverseTransformR(vector As PhysicsKit.Vector2)
		  //
		  ' Transforms the given Vector2 only by the rotation and returns the
		  ' result in the given Vector2.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  ///
		  
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  
		  // The transpose of a rotation matrix is the inverse.
		  vector.X = Self.Cost * x + Self.Sint * y
		  vector.Y = -Self.Sint * x + Self.Cost * y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Lerp(end_ As PhysicsKit.Transform, alpha As Double)
		  ///
		  ' Interpolates this transform linearly by `alpha` towards the given `end_` Transform.
		  ' Interpolating from one angle to another can have two results depend_ing on the
		  '  direction of the rotation.  If a rotation was from 30 to 200 the rotation could
		  '  be 170 or -190.  This interpolation method will always choose the smallest
		  '  rotation (regardless of sign) as the rotation direction.
		  '
		  ' - Parameter end_: Theend_d Transform.
		  ' - Parameter alpha: The amount to interpolate.
		  ///
		  
		  // Interpolate the position.
		  Var x As Double = Self.X + alpha * (end_.X - Self.X)
		  Var y As Double = Self.Y + alpha * (end_.Y - Self.Y)
		  
		  // Compute the angle.
		  // Get the start and end rotations.
		  // It's key that these methods use atan2 because it ensures that the angles are always within
		  // the range -π < 𝛝 < π therefore no normalization has to be done.
		  Var rs As Double = Self.GetRotationAngle
		  Var re As Double = end_.GetRotationAngle
		  // Make sure we use the smallest rotation as described in the comments above.
		  // There are two possible rotations depending on the direction, we always choose the smaller
		  Var diff As Double = re - rs
		  If diff < -Maths.PI Then diff = diff + Geometry.TWO_PI
		  If diff > Maths.PI Then diff = diff - Geometry.TWO_PI
		  // Interpolate.
		  // It's OK if this method produces an angle outside the range of -π < 𝛝 < π
		  // since the `Rotate` method uses sin and cos which are not bounded.
		  Var a As Double = diff * alpha + rs
		  
		  // Set this transform to the interpolated transform.
		  // The following performs the following calculations:
		  // Self.Identity()
		  // Self.Rotate(a)
		  // Self.Translate(x, y)
		  
		  Self.Cost = Cos(a)
		  Self.Sint = Sin(a)
		  Self.X = x
		  Self.Y = y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572706F6C61746573206C696E6561726C7920627920616C70686120746F77617264732074686520676976656E2060656E645F60207472616E73666F726D20706C6163696E672074686520726573756C7420696E2074686520676976656E205472616E73666F726D2E
		Sub Lerp(end_ As PhysicsKit.Transform, alpha As Double, result As PhysicsKit.Transform)
		  ///
		  ' Interpolates linearly by alpha towards the given `end_` transform placing
		  ' the result in the given Transform.
		  ' Interpolating from one angle to another can have two results depending on the
		  ' direction of the rotation.  If a rotation was from 30 to 200 the rotation could
		  ' be 170 or -190.  This interpolation method will always choose the smallest
		  ' rotation (regardless of sign) as the rotation direction.
		  '
		  ' - Parameter end_: The end Transform.
		  ' - Parameter alpha: The amount to interpolate.
		  ' - Parameter result: The Transform to place the result.
		  ///
		  
		  // Interpolate the position.
		  Var x As Double = Self.X + alpha * (end_.X - Self.X)
		  Var y As Double = Self.Y + alpha * (end_.Y - Self.Y)
		  
		  // Compute the angle.
		  // Get the start and end rotations. It's key that these methods use atan2 because
		  // it ensures that the angles are always within the range -π < 𝛝 < π therefore no
		  // normalization has to be done.
		  Var rs As Double = Self.GetRotationAngle
		  Var re As Double = end_.GetRotationAngle
		  // Make sure we use the smallest rotation as described in the comments above. 
		  // There are two possible rotations depending on the direction, we always choose the smaller.
		  Var diff As Double = re - rs
		  If diff < -Maths.PI Then diff = diff + Geometry.TWO_PI
		  If diff > Maths.PI Then diff = diff - Geometry.TWO_PI
		  // Interpolate.
		  // It's OK if this method produces an angle outside the range of -π < theta < π
		  // since the `Rotate` method uses sin and cos which are not bounded.
		  Var a As Double = diff * alpha + rs
		  
		  // Set the result transform to the interpolated Transform.
		  // The following performs the following calculations:
		  // result.Identity
		  // result.Rotate(a)
		  // result.Translate(x, y)
		  result.Cost = Cos(a)
		  result.Sint = Sin(a)
		  result.X = x
		  result.Y = y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572706F6C617465732074686973207472616E73666F726D206C696E6561726C792C20627920616C7068612C20676976656E20746865206368616E676520696E20706F736974696F6E20616E6420746865206368616E676520696E20616E676C652E
		Sub Lerp(dp As PhysicsKit.Vector2, da As Double, alpha As Double)
		  ///
		  ' Interpolates this transform linearly, by alpha, given the change in 
		  ' position (Δp) and the change in angle (Δa).
		  '
		  ' - Parameter dp: The change in position.
		  ' - Parameter da: The change in angle.
		  ' - Parameter alpha: The amount to interpolate.
		  ///
		  
		  Self.RotateOnly(da * alpha)
		  Self.Translate(dp.X * alpha, dp.Y * alpha)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572706F6C617465732074686973207472616E73666F726D206C696E6561726C792C20627920616C7068612C20676976656E20746865206368616E676520696E20706F736974696F6E20616E6420746865206368616E676520696E20616E676C6520616E6420706C6163657320697420696E746F20726573756C742E
		Sub Lerp(dp As PhysicsKit.Vector2, da As Double, alpha As Double, result As PhysicsKit.Transform)
		  ///
		  ' Interpolates this transform linearly, by alpha, given the change in 
		  ' position (Δp) and the change in angle (Δa) and places it into result.
		  '
		  ' - Parameter dp: The change in position.
		  ' - Parameter da: The change in angle.
		  ' - Parameter alpha: The amount to interpolate.
		  ' - Parameter result: The Transform to place the result.
		  ///
		  
		  result.Set(Self)
		  result.RotateOnly(da * alpha)
		  result.Translate(dp.X * alpha, dp.Y * alpha)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572706F6C61746573206C696E6561726C7920627920616C70686120746F77617264732074686520676976656E2060656E645F60207472616E73666F726D2072657475726E696E672061206E6577205472616E73666F726D20636F6E7461696E696E672074686520726573756C742E
		Function Lerped(end_ As PhysicsKit.Transform, alpha As Double) As PhysicsKit.Transform
		  ///
		  ' Interpolates linearly by alpha towards the given `end_` transform returning
		  ' a new Transform containing the result.
		  '
		  ' Interpolating from one angle to another can have two results depending on the
		  ' direction of the rotation.  If a rotation was from 30 to 200 the rotation could
		  ' be 170 or -190.  This interpolation method will always choose the smallest
		  ' rotation (regardless of sign) as the rotation direction.
		  '
		  ' - Parameter end_: The end Transform.
		  ' - Parameter alpha: The amount to interpolate.
		  '
		  ' - Returns: A new Transform.
		  ///
		  
		  // Interpolate the position.
		  Var x As Double = Self.X + alpha * (end_.X - Self.X)
		  Var y As Double = Self.Y + alpha * (end_.Y - Self.Y)
		  
		  // Compute the angle.
		  // Get the start and end rotations. It's key that these methods use atan2 because
		  // it ensures that the angles are always within the range -π < 𝛝 < π therefore no
		  // normalization has to be done.
		  Var rs As Double = Self.GetRotationAngle
		  Var re As Double = end_.GetRotationAngle
		  // Make sure we use the smallest rotation as described in the comments above.
		  // There are two possible rotations depending on the direction, we always choose the smaller.
		  Var diff As Double = re - rs
		  If diff < -Maths.PI Then diff = diff + Geometry.TWO_PI
		  If diff > Maths.PI Then diff = diff - Geometry.TWO_PI
		  // Interpolate.
		  // It's OK if this method produces an angle outside the range of -π < 𝛝 < π
		  // since the `Rotate` method uses sin and cos which are not bounded.
		  Var a As Double = diff * alpha + rs
		  
		  // Create the interpolated Transform.
		  // The following performs the following calculations:
		  // tx.Rotate(a)
		  // tx.=Translate(x, y)
		  Var tx As PhysicsKit.Transform = New Transform(Cos(a), Sin(a), x, y)
		  Return tx
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572706F6C617465732074686973207472616E73666F726D206C696E6561726C792C20627920616C7068612C20676976656E20746865206368616E676520696E20706F736974696F6E20616E6420746865206368616E676520696E20616E676C6520616E642072657475726E732074686520726573756C742061732061206E6577205472616E73666F726D2E
		Function Lerped(dp As PhysicsKit.Vector2, da As Double, alpha As Double) As PhysicsKit.Transform
		  ///
		  ' Interpolates this transform linearly, by alpha, given the change in 
		  ' position (Δp) and the change in angle (Δa) and returns the result.
		  '
		  ' - Parameter dp: The change in position.
		  ' - Parameter da: The change in angle.
		  ' - Parameter alpha: The amount to interpolate.
		  '
		  ' - Returns: A new Transform.
		  ///
		  
		  Var result As PhysicsKit.Transform = New Transform(Self)
		  result.RotateOnly(da * alpha)
		  result.Translate(dp.X * alpha, dp.Y * alpha)
		  Return result
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double)
		  // Part of the PhysicsKit.Rotatable interface.
		  
		  Self.rotate(Cos(theta), Sin(theta))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C2068656C706572206D6574686F6420746F20726F746174652074686973205472616E73666F726D20627920616E20616E676C6520F09D9B9D2E2E
		Sub Rotate(c As Double, s As Double)
		  ///
		  ' Internal helper method to rotate this Transform by an angle 𝛝.
		  '
		  ' - Parameter c: Cos(𝛝).
		  ' - Parameter s: Sin(𝛝).
		  ///
		  
		  // Perform an optimized version of matrix multiplication.
		  Var cost As Double = c * Self.Cost - s * Self.Sint
		  Var sint As Double = s * Self.Cost + c * Self.Sint
		  Var x As Double = c * Self.X - s * Self.Y
		  Var y As Double = s * Self.X + c * Self.Y
		  
		  // Set the new values.
		  Self.Cost = cost
		  Self.Sint = sint
		  Self.X = x
		  Self.Y = y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double, x As Double, y As Double)
		  // Part of the PhysicsKit.Rotatable interface.
		  
		  Self.Rotate(Cos(theta), Sin(theta), x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C2068656C706572206D6574686F6420746F20726F746174652074686973205472616E73666F726D20627920616E20616E676C6520F09D9B9D2061726F756E64206120706F696E742E
		Sub Rotate(c As Double, s As Double, x As Double, y As Double)
		  ///
		  ' Internal helper method to rotate this Transform by an angle 𝛝 around a point.
		  '
		  ' - Parameter c: Cos(𝛝).
		  ' - Parameter s: Sin(𝛝).
		  ' - Parameter x: The X coordinate of the point.
		  ' - Parameter y: The Y coordinate of the point.
		  ///
		  
		  // Perform an optimized version of the matrix multiplication:
		  // M(new) = inverse(T) * R * T * M(old)
		  Var cost As Double = c * Self.Cost - s * Self.Sint
		  Var sint As Double = s * Self.Cost + c * Self.Sint
		  Self.Cost = cost
		  Self.Sint = sint
		  
		  Var cx As Double = Self.X - x
		  Var cy As Double = Self.Y - y
		  Self.X = c * cx - s * cy + x
		  Self.Y = s * cx + c * cy + y
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double, point As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Rotatable interface.
		  
		  Self.Rotate(theta, point.X, point.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation)
		  // Part of the PhysicsKit.Rotatable interface.
		  
		  Self.Rotate(r.Cost, r.Sint)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation, x As Double, y As Double)
		  // Part of the PhysicsKit.Rotatable interface.
		  
		  Self.Rotate(r.Cost, r.Sint, x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation, point As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Rotatable interface.
		  
		  Self.Rotate(r, point.X, point.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RotateOnly(theta As Double)
		  ///
		  ' Helper method for some `Lerp` methods.
		  ' Performs rotation but leaves translation intact.
		  '
		  ' - Parameter theta: The angle of rotation in radians.
		  ///
		  
		  // Perform rotation by theta but leave x and y intact.
		  Var cos As Double = Cos(theta)
		  Var sin As Double = Sin(theta)
		  
		  Var cost As Double = cos * Self.Cost - sin * Self.Sint
		  Var sint As Double = sin * Self.Cost + cos * Self.Sint
		  Self.Cost = cost
		  Self.Sint = sint
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686973207472616E73666F726D20746F2074686520676976656E207472616E73666F726D2E
		Sub Set(t As PhysicsKit.Transform)
		  ///
		  ' Sets this transform to the given transform.
		  '
		  ' - Parameter t: The transform to copy.
		  ///
		  
		  Self.Cost = t.Cost
		  Self.Sint = t.Sint
		  Self.X = t.X
		  Self.Y = t.Y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetRotation(theta As Double) As Double
		  ///
		  ' Sets the rotation and returns the previous rotation (in the range [-π, π]).
		  '
		  ' - Parameter theta: The angle in radians.
		  '
		  ' - Returns: Double.
		  ///
		  
		  // Get the current rotation.
		  Var r As Double = Self.GetRotationAngle
		  
		  // Get rid of the current rotation and rotate by the new theta.
		  Self.Cost = Cos(theta)
		  Self.Sint = Sin(theta)
		  
		  // Return the previous amount.
		  Return r
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetRotation(rotation As PhysicsKit.Rotation) As PhysicsKit.Rotation
		  ///
		  ' Sets the rotation and returns the previous rotation as a new Rotation object.
		  '
		  ' - Parameter rotation: The Rotation.
		  '
		  ' - Returns: A new Rotation object representing the old rotation of this Transform.
		  ///
		  
		  // Get the current rotation.
		  Var r As PhysicsKit.Rotation = GetRotation
		  
		  // Get rid of the current rotation and rotate by the new rotation.
		  Self.Cost = rotation.Cost
		  Self.Sint = rotation.Sint
		  
		  // Return the previous rotation object.
		  Return r
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5365747320746865207472616E736C6174696F6E2E
		Sub SetTranslation(x As Double, y As Double)
		  ///
		  ' Sets the translation.
		  '
		  ' - Parameter x: The translation along the x axis.
		  ' - Parameter y; The translation along the y axis.
		  ///
		  
		  Self.X = x
		  Self.Y = y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTranslation(translation As PhysicsKit.Vector2)
		  ///
		  ' Sets the translation.
		  '
		  ' - Parameter translation: The translation along both axes.
		  ///
		  
		  Self.SetTranslation(translation.X, translation.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTranslationX(x As Double)
		  //
		  ' Sets the translation along the X axis.
		  '
		  ' - Parameter x: The translation along the x axis.
		  ///
		  
		  Self.X = x
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTranslationY(y As Double)
		  ///
		  ' Sets the translation along the Y axis.
		  '
		  ' - Parameter y: The translation along the y axis.
		  ///
		  
		  Self.Y = y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F662074686973205472616E73666F726D20696E2074686520666F726D61743A20225B636F73742073696E74207C2078205D5B73696E7420636F7374207C2079205D222E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Transform in the format: 
		  ' "[cost sint | x ][sint cost | y ]".
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  s.AddRow("[")
		  s.AddRow(Self.Cost.ToString)
		  s.AddRow(" ")
		  Var negSint As Double = -Self.Sint
		  s.AddRow(negSint.ToString)
		  s.AddRow(" | ")
		  s.AddRow(Self.X.ToString)
		  s.AddRow("]")
		  s.AddRow("[")
		  s.AddRow(Self.Sint.ToString)
		  s.AddRow(" ")
		  s.AddRow(Self.Cost.ToString)
		  s.AddRow(" | ")
		  s.AddRow(Self.Y.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E73666F726D732074686520676976656E20566563746F723220616E6420706C616365732074686520726573756C7420696E2074686520676976656E20566563746F72322E
		Sub Transform(vector As PhysicsKit.Vector2)
		  ///
		  ' Transforms the given Vector2 and places the result in the given Vector2.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  ///
		  
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  vector.X = Self.Cost * x - Self.Sint * y + Self.X
		  vector.Y = Self.Sint * x + Self.Cost * y + Self.Y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E73666F726D732074686520676976656E20566563746F7232206F6E6C792062792074686520726F746174696F6E20616E642072657475726E732074686520726573756C7420696E2074686520676976656E20566563746F72322E
		Sub TransformR(vector As PhysicsKit.Vector2)
		  ///
		  ' Transforms the given Vector2 only by the rotation and returns the
		  ' result in the given Vector2.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  ///
		  
		  Var x As Double = vector.X
		  Var y As Double = vector.Y
		  vector.X = Self.Cost * x - Self.Sint * y
		  vector.Y = Self.Sint * x + Self.Cost * y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E73666F726D73206F6E6C7920746865205820636F6F7264696E617465206F662074686520676976656E20566563746F723220616E6420706C616365732074686520726573756C7420696E207468652058206669656C64206F662074686520676976656E20566563746F72322E
		Sub TransformX(vector As PhysicsKit.Vector2)
		  ///
		  ' Transforms only the X coordinate of the given Vector2 and places the result 
		  ' in the X field of the given Vector2.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  ///
		  
		  vector.X = Self.Cost * vector.X - Self.Sint * vector.Y + Self.X
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E73666F726D73206F6E6C7920746865205920636F6F7264696E617465206F662074686520676976656E20566563746F723220616E6420706C616365732074686520726573756C7420696E207468652059206669656C64206F662074686520676976656E20566563746F72322E
		Sub TransformY(vector As PhysicsKit.Vector2)
		  ///
		  ' Transforms only the Y coordinate of the given Vector2 and places the 
		  ' result in the Y field of the given Vector2.
		  '
		  ' - Parameter vector: The Vector2 to transform.
		  ///
		  
		  vector.Y = Self.Sint * vector.X + Self.Cost * vector.Y + Self.Y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(x As Double, y As Double)
		  // Part of the PhysicsKit.Translatable interface.
		  
		  Self.X = Self.X + x
		  Self.Y = Self.Y + y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(vector As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Translatable interface.
		  
		  Self.X = Self.X + vector.X
		  Self.Y = Self.Y + vector.Y
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Represents a transformation matrix.
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 54686520636F73696E65206F662074686520726F746174696F6E20616E676C652E
		Cost As Double = 1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIDENTITY
			End Get
		#tag EndGetter
		Attributes( Deprecated = "Create your own instances of Transform instead." ) Shared IDENTITY As PhysicsKit.Transform
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared mIDENTITY As PhysicsKit.Transform
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652073696E65206F662074686520726F746174696F6E20616E676C652E
		Sint As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652058207472616E736C6174696F6E2E
		X As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652059207472616E736C6174696F6E2E
		Y As Double = 0
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
