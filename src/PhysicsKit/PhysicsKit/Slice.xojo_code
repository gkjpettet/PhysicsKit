#tag Class
Protected Class Slice
Inherits PhysicsKit.AbstractShape
Implements PhysicsKit.Convex
	#tag Method, Flags = &h21
		Private Sub Constructor(valid As Boolean, radius As Double, theta As Double, center As PKVector2)
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
		  
		  #Pragma Unused valid
		  
		  Var tmpV As PKVector2 = New PKVector2(radius, 0)
		  Super.Constructor(center, Max(center.X, center.Distance(tmpV.Rotate(0.5*theta))))
		  
		  Self.SliceRadius = radius
		  Self.Alpha = theta * 0.5
		  
		  // Compute the triangular section of the pie (and cache cos(alpha)).
		  Self.CosAlpha = Cos(Self.Alpha)
		  Var x As Double = radius * (Self.CosAlpha)
		  Var y As Double = radius * Sin(Self.Alpha)
		  Self.Vertices = Array(_
		  New PKVector2, _ // the origin
		  New PKVector2(x, y), _ // the top point
		  New PKVector2(x, -y)) // the bottom point
		  
		  Var v1 As PKVector2 = Self.Vertices(1).Towards(Self.Vertices(0))
		  Var v2 As PKVector2 = Self.Vertices(0).Towards(Self.Vertices(2))
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
		  New PKVector2(2.0 * radius * Sin(theta * 0.5) / (1.5 * theta), 0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PKVector2, transform As PhysicsKit.Transform) As Boolean
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // See if the point is in the circle, transform the point into local space.
		  Var lp As PKVector2 = transform.GetInverseTransformed(point)
		  
		  // Get the transformed radius squared.
		  Var radiusSquared As Double = Self.SliceRadius * Self.SliceRadius
		  
		  // Create a vector from the circle centre to the given point.
		  Var v As PKVector2 = Self.Vertices(0).Towards(lp)
		  
		  If v.GetMagnitudeSquared <= radiusSquared Then
		    // If it's in the circle then we need to make sure its in the section.
		    If Segment.GetLocation(lp, Self.Vertices(0), Self.Vertices(1)) <= 0 And _
		      Segment.GetLocation(lp, Self.Vertices(0), Self.Vertices(2)) >= 0 Then
		      Return True
		    End If
		  End If
		  
		  // If it's not in the circle then no other checks need to be performed.
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB(transform As PhysicsKit.Transform) As PKAABB
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // Inlined projection of x axis
		  Var minX As Double = Self.GetFarthestPoint(PKVector2.INV_X_AXIS, transform).X
		  Var maxX As Double = Self.GetFarthestPoint(PKVector2.X_AXIS, transform).X
		  
		  // Inlined projection of y axis
		  Var minY As Double = Self.GetFarthestPoint(PKVector2.INV_Y_AXIS, transform).Y
		  Var maxY As Double = Self.GetFarthestPoint(PKVector2.Y_AXIS, transform).Y
		  
		  Return New PKAABB(minX, minY, maxX, maxY)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateMass(density As Double) As PhysicsKit.Mass
		  ///
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // Area of a circular section is a = r^2 * alpha
		  Var r2 As Double = Self.SliceRadius * Self.SliceRadius
		  Var m As Double = density * r2 * Self.Alpha
		  
		  // Inertia about z: http://www.efunda.com/math/areas/CircularSection.cfm
		  Var sina As Double = Sin(Self.Alpha)
		  Var I As Double = _
		  1.0 / 18.0 * r2 * r2 * (9.0 * Self.Alpha * Self.Alpha - 8.0 * sina * sina) / Self.Alpha
		  
		  Return New Mass(Self.Center, m, I)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAxes(foci() As PKVector2, transform As PhysicsKit.Transform) As PKVector2()
		  /// 
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  // Get the size of the foci list.
		  Var fociSize As Integer = If(foci <> Nil, foci.Count, 0)
		  
		  // Get the number of vertices this polygon has.
		  Var size As Integer = Self.Vertices.Count
		  
		  // The axes of a polygon are created from the normal of the edges
		  // plus the closest point to each focus.
		  Var axes() As PKVector2
		  axes.ResizeTo(fociSize + 1)
		  Var n As Integer = 0
		  
		  // Add the normals of the sides.
		  axes(n) = transform.GetTransformedR(Self.Normals(0))
		  n = n + 1
		  axes(n) = transform.GetTransformedR(Self.Normals(1))
		  n = n + 1
		  
		  // Loop over the focal points and find the closest points on the polygon to the focal points.
		  Var focus As PKVector2 = transform.GetTransformed(Self.Vertices(0))
		  
		  Var iLimit As Integer = fociSize - 1
		  For i As Integer = 0 To iLimit
		    // Get the current focus.
		    Var f As PKVector2 = foci(i)
		    
		    // Create a place for the closest point.
		    Var closest As PKVector2 = focus
		    Var d As Double = f.DistanceSquared(closest)
		    
		    // Find the minimum distance vertex.
		    Var jLimit As Integer = size - 1
		    For j As Integer = 1 To jLimit
		      // Get the vertex.
		      Var p As PKVector2 = Self.Vertices(j)
		      // Transform it into world space.
		      p = transform.GetTransformed(p)
		      // Get the squared distance to the focus.
		      Var dt As Double = f.DistanceSquared(p)
		      // Compare with the last distance.
		      If dt < d Then
		        // If it's closer then save it.
		        closest = p
		        d = dt
		      End If
		    Next j
		    
		    // Once we have found the closest point create  a vector from the focal point to the point.
		    Var axis As PKVector2 = f.Towards(closest)
		    // Normalise it.
		    Call axis.Normalise
		    // Add it to the array.
		    axes(n) = axis
		    n =n + 1
		  Next i
		  
		  // Return all the axes.
		  Return axes
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520746970206F6620746865207069652073686170652E2054686973206973207468652063656E747265206F662074686520636972636C652E
		Function GetCircleCenter() As PKVector2
		  ///
		  ' Returns the tip of the pie shape.
		  '
		  ' This is the centre of the circle.
		  '
		  '- Returns: PKVector2.
		  ///
		  
		  Return Self.Vertices(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestFeature(vector As PKVector2, transform As PhysicsKit.Transform) As PhysicsKit.Feature
		  ///
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  Var localn As PKVector2 = transform.GetInverseTransformedR(vector)
		  Var localnRotated As PKVector2
		  
		  // We need to normalize localn in order for localnRotated.x < cosAlpha to work
		  // and we also use that to compute the farthest point in the circle part of the slice.
		  Call localn.Normalise
		  
		  // Include rotation if needed.
		  // Note that the vertices are already rotated and we need both the rotated and not rotated 
		  // localn vector
		  If Not Self.Rotation.IsIdentity Then
		    localnRotated = localn.Copy.InverseRotate(Self.Rotation)
		  Else
		    localnRotated = localn
		  End If
		  
		  If localnRotated.X < Self.CosAlpha Then
		    // Check if this section is nearly a half circle.
		    If Self.CosAlpha <= 1.0e-6 Then
		      // If so, we want to return the full back side.
		      Return Segment.GetFarthestFeature(Self.Vertices(1), Self.Vertices(2), vector, transform)
		    End If
		    
		    // Otherwise check which side its on.
		    If localnRotated.Y > 0 Then
		      // It's the top segment.
		      Return Segment.GetFarthestFeature(Self.Vertices(0), Self.Vertices(1), vector, transform)
		    ElseIf localnRotated.Y < 0 Then
		      // It's the bottom segment.
		      Return Segment.GetFarthestFeature(Self.Vertices(0), Self.Vertices(2), vector, transform)
		    Else
		      // It's the tip point.
		      Return New PointFeature(transform.GetTransformed(Self.Vertices(0)))
		    End If
		  Else
		    // Taken from `Slice.GetFarthestPoint`.
		    Call localn.Multiply(Self.SliceRadius).Add(Self.Vertices(0))
		    transform.TransformV(localn)
		    
		    Return New PointFeature(localn)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestPoint(vector As PKVector2, transform As PhysicsKit.Transform) As PKVector2
		  /// 
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  Var localn As PKVector2 = transform.GetInverseTransformedR(vector)
		  Var localnRotated As PKVector2
		  
		  // We need to normalize localn in order for localnRotated.x < cosAlpha to work
		  // and we also use that to compute the farthest point in the circle part of the slice
		  Call localn.Normalise
		  
		  // Include rotation if needed
		  // Note that the vertices are already rotated and we need both the rotated and not rotated localn vector
		  If Not Self.Rotation.IsIdentity Then
		    localnRotated = localn.Copy.InverseRotate(Self.Rotation)
		  Else
		    localnRotated = localn
		  End If
		  
		  If localnRotated.X < Self.CosAlpha Then
		    Var edge As Double = Self.Vertices(0).Dot(localn)
		    Var maxIndex As Integer = 0
		    
		    // Based on the sign of localnRotated.Y we can rule out one vertex.
		    If localnRotated.Y < 0 Then
		      If Self.Vertices(2).Dot(localn) > edge Then maxIndex = 2
		    Else
		      If Self.Vertices(1).Dot(localn) > edge Then maxIndex = 1
		    End If
		    
		    Var point As PKVector2 = New PKVector2(Self.Vertices(maxIndex))
		    
		    // Transform the point into world space.
		    transform.TransformV(point)
		    
		    Return point
		  Else
		    // NOTE: taken from `Circle.GetFarthestPoint` with some modifications.
		    Call localn.Multiply(Self.SliceRadius).Add(Self.Vertices(0))
		    transform.TransformV(localn)
		    
		    Return localn
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFoci(transform As PhysicsKit.Transform) As PKVector2()
		  ///
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  Return Array(transform.GetTransformed(Self.Vertices(0)))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius(center As PKVector2) As Double
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // Is the given center in region A?
		  // \    /)
		  //  \  /  )
		  //   \/    )
		  //A  /\    )
		  //  /  \  )
		  // /    \)
		  
		  If Segment.GetLocation(center, Self.Vertices(1), Self.Vertices(0)) <= 0 And _
		    Segment.GetLocation(center, Self.Vertices(2), Self.Vertices(0)) >= 0 Then
		    // It's the slice radius plus the distance from the centre to the tip of the slice.
		    Return Self.SliceRadius + center.Distance(Self.Vertices(0))
		  Else
		    // Otherwise its the rotation radius of the triangular section.
		    Return Geometry.GetRotationRadius(center, Self.Vertices)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRotation() As PhysicsKit.Rotation
		  ///
		  ' - Returns: The Rotation object that represents the local rotation.
		  ///
		  
		  Return Self.Rotation.Copy
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRotationAngle() As Double
		  ///
		  ' Returns the rotation about the local centre in radians.
		  '
		  ' - Returns: The rotation in radians.
		  ///
		  
		  Return Self.Rotation.ToRadians
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520736C696365207261646975732E205468697320697320746865207261646975732070617373656420696E206174206372656174696F6E2E
		Function GetSliceRadius() As Double
		  ///
		  ' Returns the slice radius.
		  '
		  ' This is the radius passed in at creation.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.SliceRadius
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTheta() As Double
		  ///
		  ' Returns the angular extent of the slice in radians.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Alpha * 2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PKVector2, transform As PhysicsKit.Transform) As PhysicsKit.Interval
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // Get the world space farthest point.
		  Var p1 As PKVector2 = Self.GetFarthestPoint(vector, transform)
		  Var p2 As PKVector2 = Self.GetFarthestPoint(vector.GetNegative, transform)
		  
		  // Project the point onto the axis.
		  Var d1 As Double = p1.Dot(vector)
		  Var d2 As Double = p2.Dot(vector)
		  
		  // Get the interval along the axis.
		  Return New Interval(d2, d1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation, x As Double, y As Double)
		  /// 
		  ' - Note: Part of the PhysicsKit.Rotatable interface.
		  ///
		  
		  Super.Rotate(r, x, y)
		  
		  // Rotate the pie vertices.
		  for Each v As PKVector2 In Self.Vertices
		    Call v.Rotate(r, x, y)
		  Next v
		  
		  // Rotate the pie normals.
		  For Each n As PKVector2 In Self.Normals
		    Call n.Rotate(r)
		  Next n
		  
		  // Rotate the local x axis.
		  Call Self.Rotation.Rotate(r)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F66207468697320536C6963652E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Slice.
		  ///
		  
		  Var s() As String
		  s.AddRow("Slice[")
		  s.AddRow(Super.ToString)
		  s.AddRow("|Radius=")
		  s.AddRow(Self.SliceRadius.ToString)
		  s.AddRow("|Theta=")
		  s.AddRow(Self.GetTheta.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(x As Double, y As Double)
		  /// 
		  ' - Note: Part of the PhysicsKit.Translatable interface.
		  ///
		  
		  // Translate the centroid.
		  Super.Translate(x, y)
		  
		  // Translate the pie vertices.
		  For Each v As PKVector2 In Self.Vertices
		    Call v.Add(x, y)
		  Next v
		  
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
		Normals() As PKVector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206C6F63616C20726F746174696F6E20696E2072616469616E732E
		Rotation As PhysicsKit.Rotation
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865207261646975732070617373656420696E206174206372656174696F6E
		SliceRadius As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865207665727469636573206F662074686520736C6963652E
		Vertices() As PKVector2
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
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CosAlpha"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SliceRadius"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
