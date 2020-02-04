#tag Class
Protected Class Slice
Inherits PhysicsKit.AbstractShape
Implements PhysicsKit.Convex
	#tag Method, Flags = &h21
		Private Sub Constructor(valid As Boolean, radius As Double, theta As Double, cneter As PhysicsKit.Vector2)
		  ///
		  ' Validated constructor.
		  '
		  ' This method creates a slice of a circle with the **circle centre** at the origin
		  ' and half of theta below the x-axis and half above.
		  '
		  ' - Parameter valid: Always True or this constructor would not be called.
		  ' - Parameter radius: The radius of the circular section.
		  ' - Parameter theta: The angular extent in radians. Must be > 0 and <= π
		  ' - Parameter center: The centre.
		  ///
		  
		  Var tmpV As PhysicsKit.Vector2 = New Vector2(radius, 0)
		  Super.Constructor(center, Max(center.X, center.Distance(tmpV.Rotate(0.5*theta))))
		  
		  Self.SliceRadius = radius
		  Self.Alpha = theta * 0.5
		  
		  // Compute the triangular section of the pie (and cache cos(alpha)).
		  Self.CosAlpha = Cos(Self.Alpha)
		  Var x As Double = radius * (Self.CosAlpha)
		  Var y As Double = radius * Sin(Self.Alpha)
		  Self.Vertices = Array(_
		  New Vector2, _ // the origin
		  New Vector2(x, y), _ // the top point
		  New Vector2(x, -y)) // the bottom point
		  
		  Var v1 As Vector2 = Self.Vertices(1).Towards(Self.Vertices(0))
		  Var v2 As Vector2 = Self.Vertices(0).Towards(Self.Vertices(2))
		  Call v1.Left.Normalise
		  Call v2.Left.Normalise
		  Self.Normals = Array(v1, v2)
		  
		  // Initially the slice is aligned to the world space x axis.
		  Self.Rotation = New Rotation
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(radius As Double, theta As Double)
		  ///
		  ' Full constructor.
		  '
		  ' This method creates a slice of a circle with the **circle centre** at the origin
		  ' and half of theta below the x-axis and half above.
		  '
		  ' - Parameter radius: The radius of the circular section.
		  ' - Parameter theta: The angular extent in radians. Must be > 0 and <= π
		  '
		  ' - Raises: InvalidArgumentException if `radius` is <= 0 or `theta` is <= 0 or `theta` > 180 degrees.
		  ///
		  
		  Constructor(Validate(radius, theta), _
		  radius, _
		  theta, _
		  New Vector2(2.0 * radius * Sin(theta * 0.5) / (1.5 * theta), 0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PhysicsKit.Vector2) As Boolean
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As Boolean
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB() As PhysicsKit.AABB
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB(transform As PhysicsKit.Transform) As PhysicsKit.AABB
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateMass(density As Double) As PhysicsKit.Mass
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAxes(foci() As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Vector2()
		  // Part of the PhysicsKit.Convex interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCenter() As PhysicsKit.Vector2
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestFeature(vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Feature
		  // Part of the PhysicsKit.Convex interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestPoint(vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Vector2
		  // Part of the PhysicsKit.Convex interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFoci(transform As PhysicsKit.Transform) As PhysicsKit.Vector2()
		  // Part of the PhysicsKit.Convex interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetID() As PhysicsKit.UUID
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius() As Double
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius(center As PhysicsKit.Vector2) As Double
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUserData() As Variant
		  // Part of the PhysicsKit.DataContainer interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PhysicsKit.Vector2) As PhysicsKit.Interval
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Interval
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double)
		  // Part of the PhysicsKit.Rotatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double, x As Double, y As Double)
		  // Part of the PhysicsKit.Rotatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double, point As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Rotatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation)
		  // Part of the PhysicsKit.Rotatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation, x As Double, y As Double)
		  // Part of the PhysicsKit.Rotatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation, point As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Rotatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateAboutCenter(theta As Double)
		  // Part of the PhysicsKit.Shape interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetUserData(data As Variant)
		  // Part of the PhysicsKit.DataContainer interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(x As Double, y As Double)
		  // Part of the PhysicsKit.Translatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(vector As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Translatable interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Validate(radius As Double, theta As Double) As Boolean
		  ///
		  ' Validates the constructor input returning True if valid or throwing an exception if invalid.
		  '
		  ' - Parameter radius: The radius of the circular section.
		  ' - Parameter theta: The angular extent in radians. Must be > 0 and <= π
		  '
		  ' Returns: True
		  '
		  ' - Raises: InvalidArgumentException `radius` is <=0 or `theta` is <= 0 or `theta` is > 180 degrees.
		  ///
		  
		  // Check the radius.
		  If radius <= 0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_SLICE_INVALID_RADIUS)
		  
		  // Check the theta.
		  If theta <= 0 Or theta > MathsKit.PI Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_SLICE_INVALID_THETA)
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of a Slice Convex Shape.
		
		A slice is a piece of a Circle.
		
		This shape can represent any slice of a circle up to 180 degrees (half circle).
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 48616C662074686520746F74616C2063697263756C61722073656374696F6E20696E2072616469616E732E
		Alpha As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 436F73696E65206F662068616C662074686520746F74616C2063697263756C61722073656374696F6E20696E2072616469616E732E
		CosAlpha As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206E6F726D616C73206F662074686520706F6C79676F6E616C207369646573
		Normals() As PhysicsKit.Vector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206C6F63616C20726F746174696F6E20696E2072616469616E732E
		Rotation As PhysicsKit.Rotation
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865207261646975732070617373656420696E206174206372656174696F6E
		SliceRadius As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865207665727469636573206F662074686520736C6963652E
		Vertices() As PhysicsKit.Vector2
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
			Name="Radius"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alpha"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
