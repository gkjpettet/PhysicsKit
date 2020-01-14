#tag Class
Protected Class Vector2
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
		  ' Creates a `Vector2` from the first point to the second point.
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
		Sub Constructor(vector As Xope.Vector2)
		  ///
		  ' Copy constructor.
		  ' - Parameter vector: The Vector2 to copy from.
		  ///
		  
		  Self.X = vector.X
		  Self.Y = vector.Y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573206120566563746F72322066726F6D2074686520666972737420706F696E7420746F20746865207365636F6E6420706F696E742E
		Sub Constructor(p1 As Xope.Vector2, p2 As Xope.Vector2)
		  ///
		  ' Creates a {Vector2} from the first point to the second point.
		  ' - Parameter p1: The first point.
		  ' - Parameter p2: The second point.
		  ///
		  
		  Self.X = p2.X - p1.X
		  Self.Y = p2.Y - p1.Y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120636F7079206F66207468697320566563746F72322E
		Function Copy() As Xope.Vector2
		  ///
		  ' Returns a copy of this Vector2.
		  ' - Returns: A new Vector2.
		  ///
		  
		  Return New Vector2(Self.X, Self.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720566563746F723220676976656E20746865206D61676E697475646520616E6420646972656374696F6E2E2060646972656374696F6E6020697320696E2072616469616E732E
		Function Create(magnitude As Double, direction As Double) As Xope.Vector2
		  ///
		  ' Returns a new Vector2 given the magnitude and direction.
		  ' - Parameter magnitude: The magnitude of the Vector2.
		  ' - Parameter direction: The direction of the Vector2 in radians.
		  ' - Returns: A new Vector2.
		  ///
		  
		  Var x_ As Double = magnitude * Cos(direction)
		  Var y_ As Double = magnitude * Sin(direction)
		  Return New Vector2(x_, y_)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Distance(x As Double, y As Double) As Double
		  ///
		  ' Returns the distance from this point to the given point.
		  ' - Parameter x: The X coordinate of the point.
		  ' - Parameter y: The Y coordinate of the point.
		  ' - Returns: Double.
		  ///
		  
		  Var dx As Double = Self.X - x
		  Var dy As Double = Self.Y - y
		  
		  Return Sqrt(dx * dx + dy * dy)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E697469616C69736573207368617265642070726F706572746965732E205573656420696E7465726E616C6C792E
		Shared Sub Initialise()
		  // Initialises shared properties. Used internally.
		  
		  X_AXIS = New Vector2(1.0, 0.0)
		  Y_AXIS = New Vector2(0.0, 1.0)
		  INV_X_AXIS = New Vector2(-1.0, 0.0)
		  INV_Y_AXIS = New Vector2(0.0, -1.0)
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This class represents a vector or point in 2D space. 
		The operations Vector2.SetMagnitude(Double), Vector2.GetNormalized(), 
		Vector2.Project(Vector2) and Vector2.Normalize() require the Vector2 to be non-zero in length.
		Some methods also return the vector to facilitate chaining.  For example:
		Var a As Vector2 = New Vector2
		a.Zero.Add(1, 2).Multiply(2)
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 4120766563746F7220726570726573656E74696E672074686520696E766572736520782D617869732E205468697320766563746F722073686F756C64206E6F74206265206368616E6765642061742072756E74696D652E205573656420696E7465726E616C6C79
		Shared INV_X_AXIS As Xope.Vector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 4120766563746F7220726570726573656E74696E672074686520696E766572736520792D617869732E205468697320766563746F722073686F756C64206E6F74206265206368616E6765642061742072756E74696D652E205573656420696E7465726E616C6C79
		Shared INV_Y_AXIS As Xope.Vector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D61676E6974756465206F6620746865205820636F6D706F6E656E74206F66207468697320566563746F72322E
		X As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 4120766563746F7220726570726573656E74696E672074686520782D617869732E205468697320766563746F722073686F756C64206E6F74206265206368616E6765642061742072756E74696D652E204974206973207573656420696E7465726E616C6C792E
		Shared X_AXIS As Xope.Vector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D61676E6974756465206F6620746865205920636F6D706F6E656E74206F66207468697320566563746F72322E
		Y As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 4120766563746F7220726570726573656E74696E672074686520792D617869732E205468697320766563746F722073686F756C64206E6F74206265206368616E6765642061742072756E74696D652E204974206973207573656420696E7465726E616C6C792E
		Shared Y_AXIS As Xope.Vector2
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
