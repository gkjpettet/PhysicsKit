#tag Class
Protected Class PKRectangle
Inherits PKPolygon
	#tag Method, Flags = &h21, Description = 56616C69646174656420636F6E7374727563746F722E205468652063656E747265206F66207468652072656374616E676C652077696C6C20626520746865206F726967696E2E
		Private Sub Constructor(valid As Boolean, width As Double, height As Double, vertices() As PKVector2)
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
		  
		  #Pragma Unused valid
		  
		  Super.Constructor(New PKVector2, vertices(0).GetMagnitude, vertices, Array( _
		  New PKVector2(0.0, -1.0), New PKVector2(1.0, 0.0), New PKVector2(0.0, 1.0), _
		  New PKVector2(-1.0, 0.0)))
		  
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
		  ' - Raises: InvalidArgumentException if width or height is less than or equal to zero.
		  ///
		  
		  Self.Constructor(Validate(width, height), width, height, Array( _
		  New PKVector2(-width * 0.5, -height * 0.5), New PKVector2( width * 0.5, -height * 0.5), _
		  New PKVector2( width * 0.5,  height * 0.5), New PKVector2(-width * 0.5,  height * 0.5)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PKVector2, transform As PKTransform) As Boolean
		  // Put the point in local coordinates.
		  Var p As PKVector2 = transform.GetInverseTransformed(point)
		  
		  // Get the centre and vertices.
		  Var c As PKVector2 = Self.Center
		  Var p1 As PKVector2 = Self.Vertices(0)
		  Var p2 As PKVector2 = Self.Vertices(1)
		  Var p4 As PKVector2 = Self.Vertices(3)
		  
		  // Get the width and height squared.
		  Var widthSquared As Double = p1.DistanceSquared(p2)
		  Var heightSquared As Double = p1.DistanceSquared(p4)
		  
		  // I could call the polygon one instead of this method, but I'm not sure which is faster.
		  Var projectAxis0 As PKVector2 = p1.Towards(p2)
		  Var projectAxis1 As PKVector2 = p1.Towards(p4)
		  
		  // Create a vector from the centroid to the point.
		  Var toPoint As PKVector2 = c.Towards(p)
		  
		  // Find the projection of this vector onto the vector from the centroid to the edge.
		  If toPoint.Project(projectAxis0).GetMagnitudeSquared <= (widthSquared * 0.25) Then
		    // If the projection of the v vector onto the x separating axis is
		    // smaller than the half width then we know that the point is within the x bounds of the rectangle.
		    If toPoint.Project(projectAxis1).GetMagnitudeSquared <= (heightSquared * 0.25) Then
		      // If the projection of the v vector onto the y separating axis is 
		      // smaller than the half height then we know that the point is within the y bounds of the rectangle.
		      Return True
		    End If
		  End If
		  
		  // Return False if they do not intersect.
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB(transform As PKTransform) As PKAABB
		  // Since we know that this is a rectangle we can get away with much fewer
		  // comparisons to find the correct PKAABB. Each vertex maps to one point of the
		  // PKAABB, we have to find in which of the four possible rotation states this
		  // rectangle currently is. This is done below by comparing the first two vertices.
		  
		  // It's more convenient to use transform.GetTransformed instead but we can
		  // split to transform.GetTransformedX/Y to save 4 PKVector2 allocations 'for free'.
		  Var v0x As Double = transform.GetTransformedX(Self.Vertices(0))
		  Var v0y As Double = transform.GetTransformedY(Self.Vertices(0))
		  Var v1x As Double = transform.GetTransformedX(Self.Vertices(1))
		  Var v1y As Double = transform.GetTransformedY(Self.Vertices(1))
		  Var v2x As Double = transform.GetTransformedX(Self.Vertices(2))
		  Var v2y As Double = transform.GetTransformedY(Self.Vertices(2))
		  Var v3x As Double = transform.GetTransformedX(Self.Vertices(3))
		  Var v3y As Double = transform.GetTransformedY(Self.Vertices(3))
		  
		  If v0y > v1y Then
		    If v0x < v1x Then
		      Return New PKAABB(v0x, v1y, v2x, v3y)
		    Else
		      Return New PKAABB(v1x, v2y, v3x, v0y)
		    End If
		  Else
		    If v0x < v1x Then
		      Return New PKAABB(v3x, v0y, v1x, v2y)
		    Else
		      Return New PKAABB(v2x, v3y, v0x, v1y)
		    End If
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061204D617373206F626A656374207573696E67207468652067656F6D65747269632070726F70657274696573206F6620746869732052656374616E676C6520616E642074686520676976656E2064656E736974792028696E206B672F6DC2B2292E
		Function CreateMass(density As Double) As PKMass
		  ///
		  ' Creates a Mass object using the geometric properties of this Rectangle and the given density.
		  '
		  ' ```
		  ' m = d * h * w
		  ' I = m * (h² + w²) / 12
		  '
		  ' - Parameter density: The density in kg/m²
		  '
		  ' - Returns: The Mass of this Rectangle.
		  ///
		  
		  Var height As Double = Self.Height
		  Var width As Double = Self.Width
		  
		  // Compute the mass.
		  Var mass As Double = density * height * width
		  
		  // Compute the inertia tensor.
		  Var inertia As Double = mass * (height * height + width * width) / 12.0
		  
		  // Since we know that a rectangle has only four points that are
		  // evenly distributed we can feel safe using the averaging method for the centroid.
		  
		  Return New PKMass(Self.Center, mass, inertia)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAxes(foci() As PKVector2, transform As PKTransform) As PKVector2()
		  // Create an array to hold the axes.
		  Var axes() As PKVector2
		  
		  // Return the normals to the surfaces, since this is a 
		  // rectangle we only have two axes to test against.
		  axes.AddRow(transform.GetTransformedR(Self.Normals(1)))
		  axes.AddRow(transform.GetTransformedR(Self.Normals(2)))
		  
		  // Get the closest point to each focus.
		  For Each focus As PKVector2 In foci
		    // Create a place for the closest point
		    Var closest As PKVector2 = transform.GetTransformed(Self.Vertices(0))
		    Var d As Double = focus.DistanceSquared(closest)
		    
		    // Find the minimum distance vertex.
		    For j As Integer = 1 To 3
		      // get the vertex
		      Var vertex As PKVector2 = Self.Vertices(j)
		      // Transform it into world space.
		      vertex = transform.GetTransformed(vertex)
		      // Get the squared distance to the focus.
		      Var dt As Double = focus.DistanceSquared(vertex)
		      // Compare with the last distance.
		      If dt < d Then
		        // If it's closer then save it.
		        closest = vertex
		        d = dt
		      End If
		    Next j
		    
		    // Once we have found the closest point create a vector from the focal point to the point.
		    Var axis As PKVector2 = focus.Towards(closest)
		    // Normalise the axis.
		    Call axis.Normalise
		    // Add it to the array.
		    axes.AddRow(axis)
		  Next focus
		  
		  // Return all the axes.
		  Return axes
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206865696768742E
		Function GetHeight() As Double
		  ///
		  ' Returns the height.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Height
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520526F746174696F6E206F626A656374207468617420726570726573656E747320746865206C6F63616C20726F746174696F6E2E
		Function GetRotation() As PKRotation
		  ///
		  ' - Returns: The Rotation object that represents the local rotation.
		  ///
		  
		  // Normals(1) is already a unit vector representing the local axis so we can 
		  // just return it as a Rotation.
		  Return New PKRotation(Self.Normals(1).X, Self.Normals(1).Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520726F746174696F6E2028696E2072616469616E73292061626F757420746865206C6F63616C2063656E74657220696E2072616469616E7320696E207468652072616E6765205B2DCF802C20CF805D2E
		Function GetRotationAngle() As Double
		  ///
		  ' Returns the rotation about the local center in radians in the range [-π, π].
		  '
		  ' - Returns: The rotation in radians.
		  ///
		  
		  // When the shape is created, Normals(1) will always be the positive x-axis.
		  // We can get the rotation by comparing it to the positive x-axis since the 
		  // normal vectors are rotated with the vertices when a shape is rotated.
		  Return ATan2(Self.Normals(1).Y, Self.Normals(1).X)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652077696474682E
		Function GetWidth() As Double
		  ///
		  ' Returns the width.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Width
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PKVector2, transform As PKTransform) As PKInterval
		  // Get the center and vertices.
		  Var center As PKVector2 = transform.GetTransformed(Self.Center)
		  
		  // Create the project axes.
		  Var projectAxis0 As PKVector2 = transform.GetTransformedR(Self.Normals(1))
		  Var projectAxis1 As PKVector2 = transform.GetTransformedR(Self.Normals(2))
		  
		  // Project the shape on the axis.
		  Var c As Double = center.Dot(vector)
		  Var e As Double = (Self.Width * 0.5) * Abs(projectAxis0.Dot(vector)) + _
		  (Self.Height * 0.5) * Abs(projectAxis1.Dot(vector))
		  
		  Return New PKInterval(c - e, c + e)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Rectangle.
		  ///
		  
		  Var s() As String
		  s.AddRow("Rectangle[")
		  s.AddRow(Super.ToString)
		  s.AddRow("|Width=")
		  s.AddRow(Self.Width.ToString)
		  s.AddRow("|Height=")
		  s.AddRow(Self.Height.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
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
		  ' - Raises: InvalidArgumentException if width or height is less than or equal to zero.
		  ///
		  
		  If width <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_RECTANGLE_INVALID_WIDTH)
		  If height <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_RECTANGLE_INVALID_HEIGHT)
		  
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
			Name="Height"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
