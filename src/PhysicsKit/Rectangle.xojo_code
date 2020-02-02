#tag Class
Protected Class Rectangle
Inherits PhysicsKit.Polygon
	#tag Method, Flags = &h21, Description = 56616C69646174656420636F6E7374727563746F722E205468652063656E747265206F66207468652072656374616E676C652077696C6C20626520746865206F726967696E2E
		Private Sub Constructor(valid As Boolean, widht As Double, height As Double, vertices() As PhysicsKit.Vector2)
		  ///
		  ' Validated constructor.
		  '
		  ' The centre of the rectangle will be the origin.
		  '
		  ' - Parameter valid: Always True or this constructor would not be called .
		  ' - Parameter width: The width.
		  ' - Parameter height: The height.
		  ' - Parameter vertices: The rectangle vertices.
		  ///
		  
		  Super.Constructor(New Vector2, vertices(0).GetMagnitude, vertices, Array( _
		  New Vector2(0.0, -1.0), New Vector2(1.0, 0.0), New Vector2(0.0, 1.0), _
		  New Vector2(-1.0, 0.0)))
		  
		  // Set the width and height
		  Self.Width = width
		  Self.Height = height
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E205468652063656E747265206F66207468652072656374616E676C652077696C6C20626520746865206F726967696E2E20412072656374616E676C65206D7573742068617665206120776964746820616E64206865696768742067726561746572207468616E207A65726F2E205468726F777320496E76616C6964417267756D656E74457863657074696F6E2E
		Sub Constructor(width As Double, height As Double)
		  ///
		  ' Full constructor.
		  '
		  ' The centre of the rectangle will be the origin.
		  ' A rectangle must have a width and height greater than zero.
		  '
		  ' - Parameter width: The width.
		  ' - Parameter height: The height.
		  '
		  ' - Throws: InvalidArgumentException if width or height is less than or equal to zero.
		  ///
		  
		  Self.Constructor(Validate(width, height), width, height, Array( _
		  New Vector2(-width * 0.5, -height * 0.5), New Vector2( width * 0.5, -height * 0.5), _
		  New Vector2( width * 0.5,  height * 0.5), New Vector2(-width * 0.5,  height * 0.5)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 56616C6964617465732074686520636F6E7374727563746F7220696E7075742072657475726E696E6720547275652069662076616C6964206F72207468726F77696E6720616E20496E76616C6964417267756D656E74457863657074696F6E20696620696E76616C69642E
		Private Shared Function Validate(width As Double, height As Double) As Boolean
		  ///
		  ' Validates the constructor input returning True if valid or throwing an exception if invalid.
		  '
		  ' - Paramter width: The width.
		  ' - Parameter height: The height.
		  '
		  ' - Returns: True.
		  '
		  ' - Throws: InvalidArgumentException if width or height is less than or equal to zero.
		  ///
		  
		  If width <= 0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_RECTANGLE_INVALID_WIDTH)
		  If height <= 0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_RECTANGLE_INVALID_HEIGHT)
		  
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of a Rectangle Convex Shape.
		This class represents both axis-aligned and oriented rectangles and squares.
		A Rectangle must have a width and height greater than zero.
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 5468652052656374616E676C652773206865696768742E
		Height As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652052656374616E676C6527732077696474682E
		Width As Double
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
