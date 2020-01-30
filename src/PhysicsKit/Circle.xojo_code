#tag Class
Protected Class Circle
Inherits PhysicsKit.AbstractShape
Implements PhysicsKit.Convex
	#tag Method, Flags = &h21, Description = 56616C69646174656420636F6E7374727563746F722E20437265617465732061206E657720436972636C652063656E7465726564206F6E20746865206F726967696E20776974682074686520676976656E207261646975732E
		Private Sub Constructor(valid As Boolean, radius As Double)
		  ///
		  ' Validated constructor.
		  '
		  ' Creates a new Circle centered on the origin with the given radius.
		  '
		  ' - Parameter valid: Always True or this constructor would not be called.
		  ' - Parameter radius: The radius.
		  ///
		  
		  #Pragma Unused valid
		  
		  Super.Constructor(radius)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E20437265617465732061206E657720436972636C652063656E7465726564206F6E20746865206F726967696E20776974682074686520676976656E207261646975732E205468726F777320496E76616C6964417267756D656E74457863657074696F6E2E
		Sub Constructor(radius As Double)
		  ///
		  ' Full constructor.
		  '
		  ' Creates a new Circle centered on the origin with the given radius.
		  '
		  ' - Parameter radius: The radius.
		  '
		  ' - Throws: InvalidArgumentException if the given radius is less than or equal to zero.
		  ///
		  
		  Constructor(Validate(radius), radius)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As Boolean
		  // Part of the PhysicsKit.Shape interface.
		  
		  // Transform the center.
		  Var v As Vector2 = transform.GetTransformed(Self.Center)
		  
		  // Get the transformed radius squared.
		  Var radiusSquared As Double = Self.Radius * Self.Radius
		  
		  // Create a vector from the center to the given point.
		  Call v.Subtract(point)
		  
		  If v.GetMagnitudeSquared <= radiusSquared Then Return True
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB(transform As PhysicsKit.Transform) As PhysicsKit.AABB
		  // Part of the PhysicsKit.Shape interface.
		  
		  // If the transform is not Nil then transform the center.
		  Var center As Vector2 = transform.GetTransformed(Self.Center)
		  
		  // Return a new AABB.
		  Return New AABB(center, Self.Radius)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateMass(density As Double) As PhysicsKit.Mass
		  ///
		  ' - Notes:
		  ' ```
		  ' m = d * π * r²
		  ' I = m * r² / 2
		  ' ```
		  ' Part of the PhysicsKit.Shape interface.
		  ///
		  
		  Var r2 As Double = Self.Radius * Self.Radius
		  
		  // Compute the mass.
		  Var mass As Double = density * MathsKit.PI * r2
		  
		  // Compute the inertia tensor.
		  Var inertia As Double = mass * r2 * 0.5
		  
		  // Use the center supplied to the circle.
		  Return New Mass(Self.Center, mass, inertia)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAxes(foci() As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Vector2()
		  ///
		  ' Circular shapes are handled specifically in the SAT algorithm since
		  ' they have an infinite number of axes. As a result this method returns Nil.
		  '
		  ' - Returns: Nil.
		  '
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  #Pragma Unused foci
		  #Pragma Unused transform
		  
		  // A circle has infinite separating axes and zero voronoi regions therefore we return Nil.
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestFeature(vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.PointFeature
		  // Part of the PhysicsKit.Convex interface.
		  
		  // Obtain the farthest point along the given vector.
		  Var farthest As Vector2 = Self.GetFarthestPoint(vector, transform)
		  
		  // For a circle the farthest feature along a vector will always be a vertex.
		  Return New PointFeature(farthest)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestPoint(vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Vector2
		  // Part of the PhysicsKit.Convex interface.
		  
		  // Make sure the axis is normalised.
		  Var nAxis As Vector2 = vector.GetNormalised
		  
		  // Get the transformed center.
		  Var center As Vector2 = transform.GetTransformed(Self.Center)
		  
		  // Add the radius along the vector to the center to get the farthest point.
		  center.X = center.X + (Self.Radius * nAxis.X)
		  center.Y = center.Y + (Self.Radius * nAxis.Y)
		  
		  // Return the new point.
		  Return center
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFoci(transform As PhysicsKit.Transform) As PhysicsKit.Vector2()
		  // Part of the PhysicsKit.Convex interface.
		  
		  Var foci(0) As Vector2
		  
		  // A circle only has one focus.
		  foci(0) = transform.GetTransformed(Self.Center)
		  
		  Return foci
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius(center As PhysicsKit.Vector2) As Double
		  // Part of the PhysicsKit.Shape interface.
		  
		  Return Self.Radius + center.Distance(Self.Center)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Interval
		  // Part of the PhysicsKit.Shape interface.
		  
		  // If the transform is not Nil then transform the center.
		  Var center As Vector2 = transform.GetTransformed(Self.Center)
		  
		  // Project the center onto the given axis.
		  Var c As Double = center.Dot(vector)
		  
		  // The interval is defined by the radius.
		  Return New Interval(c - Self.Radius, c + Self.Radius)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F66207468697320436972636C6520696E2074686520666F726D3A202022436972636C655B49443D69647C43656E7465723D28582C59297C5261646975733D7261646975735D222E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Circle in the form: 
		  ' "Circle[ID=id|Center=(X,Y)|Radius=radius]".
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  s.AddRow("Circle[")
		  s.AddRow(Super.ToString)
		  s.AddRow("]")
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 56616C6964617465732074686520636F6E7374727563746F7220696E7075742072657475726E696E6720547275652069662076616C6964206F72207468726F77696E6720616E20496E76616C6964417267756D656E74457863657074696F6E20696620696E76616C69642E
		Shared Function Validate(radius As Double) As Boolean
		  ///
		  ' Validates the constructor input returning True if valid or throwing an exception if invalid.
		  '
		  ' - Parameter radius: The radius.
		  '
		  ' - Returns: True or raises an exception.
		  '
		  ' - Throws: InvalidArgumentException if the given radius is less than or equal to zero.
		  ///
		  
		  If radius <= 0 Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_CIRCLE_INVALID_RADIUS)
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod


End Class
#tag EndClass
