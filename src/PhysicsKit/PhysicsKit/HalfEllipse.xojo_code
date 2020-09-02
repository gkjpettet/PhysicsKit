#tag Class
Protected Class HalfEllipse
Inherits PhysicsKit.AbstractShape
Implements PhysicsKit.Convex
	#tag Method, Flags = &h0
		Sub Constructor(valid As Boolean, width As Double, height As Double, center As PKVector2, vertexLeft As PKVector2, vertexRight As PKVector2)
		  ///
		  ' Validated constructor.
		  '
		  ' This creates an axis-aligned half ellipse fitting inside a rectangle of the given width and height.
		  '
		  ' - Parameter valid: Always True or this constructor would not be called.
		  ' - Parameter width: The width.
		  ' - Parameter height: The height.
		  ' - Parameter center: The centre.
		  ' - Parameter vertexLeft: The first vertex.
		  ' - Parameter vertexRight: The second vertex.
		  ///
		  
		  #Pragma Unused valid
		  
		  Super.Constructor(center, center.Distance(vertexRight))
		  
		  // Set Height. Width can be computed as halfWidth * 2 when needed.
		  Self.Height = height
		  
		  // Compute the major and minor axis lengths (the x,y radii).
		  Self.HalfWidth = width * 0.5
		  
		  // Set the ellipse centre.
		  Self.EllipseCenter = New PKVector2
		  
		  // Initially the half ellipse is aligned to the world space x axis.
		  Self.Rotation = New PKRotation
		  
		  // Setup the vertices.
		  Self.VertexLeft = vertexLeft
		  Self.VertexRight = vertexRight
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(width As Double, height As Double)
		  ///
		  ' Minimal constructor.
		  '
		  ' This creates an axis-aligned half ellipse fitting inside a rectangle of the given width and height.
		  '
		  ' - Parameter width: The width.
		  ' - Parameter height: The height of the half.
		  '
		  ' - Raises: InvalidArgumentException if either the width or height is less than or equal to zero.
		  ///
		  
		  Constructor(_
		  Validate(width, height), _
		  width, _
		  height, _
		  New PKVector2(0, (4.0 * height) / (3.0 * MathsKit.PI)), _
		  New PKVector2(-width * 0.5, 0), _
		  New PKVector2( width * 0.5, 0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PKVector2, transform As PKTransform) As Boolean
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // Equation of an ellipse:
		  // (x - h)^2/a^2 + (y - k)^2/b^2 = 1
		  // For a point to be inside the ellipse, we can plug in the point into this equation 
		  // and verify that the value is less than or equal to one.
		  
		  // Get the world space point into local coordinates.
		  Var localPoint As PKVector2 = transform.GetInverseTransformed(point)
		  
		  // Account for local rotation.
		  Call localPoint.InverseRotate(Self.Rotation, Self.EllipseCenter)
		  
		  // Translate into local coordinates.
		  Var x As Double = (localPoint.X - Self.EllipseCenter.X)
		  Var y As Double = (localPoint.Y - Self.EllipseCenter.Y)
		  
		  // For half ellipse we have an early out.
		  If y < 0 Then Return False
		  
		  Var x2 As Double = x * x
		  Var y2 As Double = y * y
		  Var a2 As Double = Self.HalfWidth * Self.HalfWidth
		  Var b2 As Double = Self.Height * Self.Height
		  Var value As Double = x2 / a2 + y2 / b2
		  
		  Return value <= 1.0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB(transform As PKTransform) As PKAABB
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // Fast computation of HalfEllipse PKAABB without resorting to getFarthestPoint related methods
		  // Based on the Ellipse PKAABB calculation + adjusting the result for the missing side
		  
		  // First calculate the Ellipse PKAABB.
		  // Taken from `Ellipse.CreateAABB` with slight modifications.
		  Var u As PKVector2 = Self.Rotation.ToVector
		  transform.TransformR(u)
		  
		  Var x2 As Double = u.X * u.X
		  Var y2 As Double = u.Y * u.Y
		  
		  Var hw2 As Double = Self.HalfWidth * Self.HalfWidth
		  Var hh2 As Double = Self.Height * Self.Height // half height squared.
		  
		  Var aabbHalfWidth As Double = Sqrt(x2 * hw2 + y2 * hh2)
		  Var aabbHalfHeight As Double = Sqrt(y2 * hw2 + x2 * hh2) 
		  
		  Var cx As Double = transform.GetTransformedX(Self.EllipseCenter)
		  Var cy As Double = transform.GetTransformedY(Self.EllipseCenter)
		  
		  Var minx As Double = cx - aabbHalfWidth
		  Var miny As Double = cy - aabbHalfHeight
		  Var maxx As Double = cx + aabbHalfWidth
		  Var maxy As Double = cy + aabbHalfHeight
		  
		  // Now adjust for the missing side.
		  // Every time one point will come from the Ellipse PKAABB and the other from the left and 
		  // right vertices. Depending on the total rotation u, there are four possible cases.
		  If u.Y > 0 Then
		    If u.X > 0 Then
		      maxx = transform.GetTransformedX(Self.VertexRight)
		      miny = transform.GetTransformedY(Self.VertexLeft)
		    Else
		      maxx = transform.GetTransformedX(Self.VertexLeft)
		      maxy = transform.GetTransformedY(Self.VertexRight)    
		    End If
		  Else
		    If u.X > 0 Then
		      minx = transform.GetTransformedX(Self.VertexLeft)
		      miny = transform.GetTransformedY(Self.VertexRight)
		    Else
		      minx = transform.GetTransformedX(Self.VertexRight)
		      maxy = transform.GetTransformedY(Self.VertexLeft)    
		    End If
		  End If
		  
		  Return New PKAABB(minx, miny, maxx, maxy)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateMass(density As Double) As PhysicsKit.Mass
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  Var area As Double = MathsKit.PI * Self.HalfWidth * Self.Height
		  Var m As Double = area * density * 0.5
		  
		  // Moment of inertia given by: http://www.efunda.com/math/areas/ellipticalhalf.cfm
		  Var I As Double = m * (Self.HalfWidth * Self.HalfWidth + Self.Height * Self.Height) * INERTIA_CONSTANT
		  
		  Return New Mass(Self.Center, m, I)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAxes(foci() As PKVector2, transform As PKTransform) As PKVector2()
		  /// 
		  ' This method is not supported by this shape.
		  '
		  ' - Raises: UnsupportedOperationException when called.
		  '
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  #Pragma Unused foci
		  #Pragma Unused transform
		  
		  // This shape is not supported by SAT.
		  Raise New UnsupportedOperationException(Messages.GEOMETRY_HALF_ELLIPSE_SAT_NOT_SUPPORTED)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEllipseCenter() As PKVector2
		  ///
		  ' Returns the centre of the ellipse.
		  '
		  ' - Returns: PKVector2.
		  ///
		  
		  Return Self.EllipseCenter
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestFeature(vector As PKVector2, transform As PKTransform) As PhysicsKit.Feature
		  /// 
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  Var localAxis As PKVector2 = transform.GetInverseTransformedR(vector)
		  
		  // Invert the local rotation.
		  Call localAxis.InverseRotate(Self.Rotation)
		  
		  If localAxis.Y > 0 Then
		    // It's the farthest point.
		    GetFarthestPointOnAlignedEllipse(localAxis)
		    
		    // Include local rotation (inverse again to restore the original rotation).
		    Call localAxis.Rotate(Self.Rotation)
		    
		    // Add the radius along the vector to the centre to get the farthest point.
		    Call localAxis.Add(Self.EllipseCenter)
		    
		    transform.TransformV(localAxis)
		    
		    Return New PointFeature(localAxis)
		  Else
		    // Below code is equivalent to
		    // Return Segment.GetFarthestFeature(Self.vertexLeft, Self.vertexRight, vector, transform)
		    
		    // Transform the vertices to world space
		    Var p1 As PKVector2 = transform.GetTransformed(Self.VertexLeft)
		    Var p2 As PKVector2 = transform.GetTransformed(Self.VertexRight)
		    
		    // The vector p1->p2 is always CCW winding.
		    Var vp1 As PointFeature = New PointFeature(p1, 0)
		    Var vp2 As PointFeature = New PointFeature(p2, 1)
		    
		    // Choose the vertex that maximizes v.Dot(vector)
		    // localAxis is vector in local space and we can choose the correct vertex by
		    // checking if localAxis points to the left or right.
		    Var vmax As PointFeature = If((localAxis.X <= 0), vp1, vp2)
		    
		    Return New EdgeFeature(vp1, vp2, vmax, p1.Towards(p2), 0)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4D6F6469666965732074686520676976656E206C6F63616C207370616365206178697320696E746F2074686520666172746865737420706F696E7420616C6F6E672074686174206178697320616E64206164646974696F6E616C6C792072657475726E732069742E
		Private Function GetFarthestPoint(localAxis As PKVector2) As PKVector2
		  ///
		  ' Modifies the given local space axis into the farthest point along that axis and
		  ' additionally returns it.
		  ' 
		  ' - Parameter localAxis: The direction vector in local space.
		  '
		  ' - Returns: PKVector2.
		  ///
		  
		  // localAxis is already in local coordinates.
		  // Invert the local rotation.
		  Call localAxis.InverseRotate(Self.Rotation)
		  
		  If localAxis.Y <= 0 Then
		    If localAxis.X >= 0 Then
		      Call localAxis.Set(Self.vertexRight)
		    Else
		      Call localAxis.Set(Self.VertexLeft)
		    End If
		    Return localAxis
		  End If
		  
		  GetFarthestPointOnAlignedEllipse(localAxis)
		  
		  // Include local rotation (inverse again to restore the original rotation).
		  Call localAxis.Rotate(Self.Rotation)
		  
		  // Add the radius along the vector to the center to get the farthest point.
		  Call localAxis.Add(Self.EllipseCenter)
		  
		  Return localAxis
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestPoint(vector As PKVector2, transform As PKTransform) As PKVector2
		  /// 
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  // Convert the world space vector(n) to local space.
		  Var localAxis As PKVector2 = transform.GetInverseTransformedR(vector)
		  
		  // Private implementation.
		  localAxis = Self.GetFarthestPoint(localAxis)
		  
		  // Then convert back into world space coordinates.
		  transform.TransformV(localAxis)
		  
		  Return localAxis
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E732074686520666172746865737420706F696E7420616C6F6E672074686520676976656E206C6F63616C207370616365206178697320617373756D696E672074686520656C6C6970736520616E642074686520676976656E20617869732061726520616C69676E65642E
		Private Sub GetFarthestPointOnAlignedEllipse(localAxis As PKVector2)
		  ///
		  ' Returns the farthest point along the given local space axis assuming the
		  ' ellipse and the given axis are aligned.
		  '
		  ' Typically this means that the ellipse Is axis-aligned, but it could also
		  ' mean that the ellipse is not axis-aligned, but the given local space axis
		  ' has been rotated to match the alignment Of the ellipse.
		  ///
		  
		  // An ellipse is a circle with a non-uniform scaling transformation applied
		  // so we can achieve that by scaling the input axis by the major and minor axis lengths.
		  localAxis.X = localAxis.X * Self.HalfWidth
		  localAxis.Y = localAxis.Y * Self.Height
		  
		  // Then normalise it.
		  Call localAxis.Normalise
		  
		  // Then scale again to get a point in the ellipse.
		  localAxis.X = localAxis.X * Self.HalfWidth
		  localAxis.Y = localAxis.Y * Self.Height
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFoci(transform As PKTransform) As PKVector2()
		  /// 
		  ' This method is not supported by this shape.
		  '
		  ' - Raises: UnsupportedOperationException when called.
		  '
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  #Pragma Unused transform
		  
		  // This shape is not supported by SAT.
		  Raise New UnsupportedOperationException(Messages.GEOMETRY_HALF_ELLIPSE_SAT_NOT_SUPPORTED)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652068616C662077696474682E
		Function GetHalfWidth() As Double
		  ///
		  ' Returns the half width.
		  ///
		  
		  Return Self.HalfWidth
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206865696768742E
		Function GetHeight() As Double
		  ///
		  ' Returns the height.
		  ///
		  
		  Return Self.Height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetMaxDistanceEllipse(point As PKVector2) As Double
		  ///
		  ' Returns the maximum distance from the given point to the ellipse.
		  '
		  ' - Parameter point: The point.
		  '
		  ' - Returns: Double.
		  ///
		  
		  // We need to translate/rotate the point so that this ellipse is
		  // considered centered at the origin with it's semi-major axis aligned
		  // with the x-axis and its semi-minor axis aligned with the y-axis.
		  Var p As PKVector2 = point.Difference(Self.EllipseCenter).InverseRotate(Self.Rotation)
		  
		  // Get the farthest point.
		  Var fp As PKVector2 = Ellipse.GetFarthestPointOnEllipse(Self.HalfWidth, Self.Height, p)
		  
		  // Get the distance between the two points. The distance will be the
		  // same if we translate/rotate the points back to the real position and rotation, so don't bother.
		  
		  Return p.Distance(fp)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetMaxDistanceHalfEllipse(point As PKVector2) As Double
		  ///
		  ' Returns the maximum distance between the given point and the half ellipse.
		  '
		  ' - Parameter point: The point.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Var a As Double = Self.HalfWidth
		  Var b As Double = Self.Height
		  
		  // We need to translate/rotate the point so that this ellipse is
		  // considered centered at the origin with it's semi-major axis aligned
		  // with the x-axis and its semi-minor axis aligned with the y-axis.
		  Var p As PKVector2 = point.Difference(Self.EllipseCenter).InverseRotate(Self.Rotation)
		  
		  // If the point is below the x axis, then we only need to perform the ellipse code.
		  If p.Y < 0 Then Return Self.GetMaxDistanceEllipse(point)
		  
		  // Move the point to the 1st quadrant to conform my formulation.
		  If p.X < 0 Then p.X = -p.X
		  
		  // If the point is above the evolute, then we only need to evaluate
		  // the max distance of the two vertices.
		  // Evolute: (ax)^2/3 + (by)^2/3 = (a^2 - b^2)^2/3
		  
		  // Compute the y coordinate of the point on the evolute at p.X
		  // ey = ((b^2 - a^2)^2/3 - (ax)^2/3)^3/2 / b
		  Var ab As Double = (b * b - a * a)
		  Var ab2r3 As Double = MathsKit.Cbrt(ab * ab)
		  Var ax As Double = a * p.X
		  Var ax2r3 As Double = MathsKit.Cbrt(ax * ax)
		  Var top As Double = ab2r3 - ax2r3
		  
		  If top < 0 Then
		    // The evolute isn't defined at p.X
		    Return Self.GetMaxDistanceToVertices(point)
		  End If
		  
		  top = Sqrt(top)
		  Var ey As Double = (top * top * top) / b
		  
		  If p.y > ey Then
		    // The point is above the evolute.
		    Return Self.GetMaxDistanceToVertices(point)
		  End If
		  
		  // Check if p.x is close to zero (if it is, then m will be infinity).
		  If Abs(p.x) < 1e-16 Then
		    // Compare the distance to the points and the height.
		    Var d1 As Double = Self.Height - p.Y
		    Var d2 As Double = Self.GetMaxDistanceToVertices(point)
		    Return If(d1 > d2, d1, d2)
		  End If
		  
		  // Else compute the bounds for the unimodal region for golden section to work.
		  // Compute the slope of the evolute at x
		  // m = -a^2/3 * sqrt((b^2 - a^2)^2/3 - (ax)^2/3) / (bx^1/3)
		  Var xr3 As Double = MathsKit.Cbrt(p.X)
		  Var a2r3 As Double = MathsKIt.Cbrt(a * a)
		  Var m As Double = (-a2r3 * top) / (b * xr3)
		  
		  // Then compute the ellipse intersect of m, ex, and ey
		  // y - ey = m(x - ex)
		  // (x / a)^2 + (y / b)^2 = 1
		  // Solve for y then substitute.
		  // Then examine terms to get quadratic equation parameters.
		  // qa = a^2m^2 + b^2
		  // qb = 2a^2mey - 2a^2m^2ex
		  // qc = a^2m^2ex^2 - 2a^2mexey + a^2ey^2 - b^2a^2
		  Var a2 As Double = a * a
		  Var b2 As Double = b * b
		  Var m2 As Double = m * m
		  Var x2 As Double = p.x * p.x
		  Var y2 As Double = ey * ey
		  
		  // Compute quadratic equation parameters.
		  Var qa As Double = a2 * m2 + b2
		  Var qb As Double = 2 * a2 * m * ey - 2 * a2 * m2 * p.X
		  Var qc As Double = a2 * m2 * x2 - 2 * a2 * m * p.X * ey + a2 * y2 - b2 * a2
		  
		  // Use the quadratic equation to limit the search space.
		  Var b24ac As Double = qb * qb - 4 * qa * qc
		  If b24ac < 0 Then
		    // This would mean that the line from the evolute at p.x doesn't
		    // intersect with the ellipse, which shouldn't be possible.
		    Return Self.GetMaxDistanceToVertices(point)
		  End If
		  
		  Var xmin As Double = (-qb - Sqrt(b24ac)) / (2 * qa)
		  Var xmax As Double = 0 
		  
		  // Get the farthest point on the ellipse.
		  Var s As PKVector2 = Ellipse.GetFarthestPointOnBoundedEllipse(xmin, xmax, a, b, p)
		  
		  // Then compare that with the farthest point of the two vertices.
		  Var d1 As Double = s.Distance(p)
		  Var d2 As Double = Self.GetMaxDistanceToVertices(point)
		  
		  Return If(d1 > d2, d1, d2)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetMaxDistanceToVertices(point As PKVector2) As Double
		  ///
		  ' Returns the maximum distance between the two vertices of the ellipse and the given point.
		  '
		  ' - Parameter point: The point.
		  '
		  ' - Returns: Double.
		  ///
		  
		  // Find the maximum radius from the centre.
		  Var leftR As Double = point.DistanceSquared(Self.VertexLeft)
		  Var rightR As Double = point.DistanceSquared(Self.VertexRight)
		  
		  // Keep the largest.
		  Var r2 As Double = Max(leftR, rightR)
		  
		  Return Sqrt(r2)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius(center As PKVector2) As Double
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // It turns out that a half ellipse is even more annoying than an ellipse.
		  
		  // If the half ellipse is wider than it is tall.
		  If Self.HalfWidth >= Self.Height Then
		    // We have two solutions based on the point location.
		    // If the point is below the half ellipse, then we need to perform
		    // a golden section search like the ellipse code.
		    If Segment.GetLocation(center, Self.VertexLeft, Self.VertexRight) <= 0 Then
		      Return Self.GetMaxDistanceEllipse(center)
		    Else
		      // Otherwise we can just take the greater distance of the vertices.
		      Return Self.GetMaxDistanceToVertices(center)
		    End If
		  Else
		    // Otherwise we have even more conditions.
		    Return Self.GetMaxDistanceHalfEllipse(center)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120636F7079206F662074686520526F746174696F6E206F626A656374207468617420726570726573656E747320746865206C6F63616C20726F746174696F6E2E
		Function GetRotation() As PKRotation
		  ///
		  ' - Returns: A copy of the Rotation object that represents the local rotation.
		  ///
		  
		  Return Self.Rotation.Copy
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRotationAbgle() As Double
		  ///
		  ' Returns the rotation about the local centre in radians.
		  '
		  ' - Returns: The rotation in radians.
		  ///
		  
		  Return Self.Rotation.ToRadians
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652077696474682E
		Function GetWidth() As Double
		  ///
		  ' Returns the width.
		  ///
		  
		  Return Self.HalfWidth * 2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E697469616C69736573207368617265642070726F706572746965732E
		Sub Initialise()
		  ///
		  ' Initialises shared properties.
		  ///
		  
		  INERTIA_CONSTANT = MathsKit.PI / 8.0 - 8.0 / (9.0 * MathsKit.PI)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PKVector2, transform As PKTransform) As PhysicsKit.Interval
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
		Sub Rotate(r As PKRotation, x As Double, y As Double)
		  /// 
		  ' - Note: Part of the PKRotatable interface.
		  ///
		  
		  Super.Rotate(r, x, y)
		  
		  // Rotate the local axis as well.
		  Call Self.Rotation.Rotate(r)
		  
		  Call Self.VertexLeft.Rotate(r, x, y)
		  Call Self.VertexRight.Rotate(r, x, y)
		  Call Self.EllipseCenter.Rotate(r, x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  ///
		  ' Returns a String representation of this HalfEllipse.
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  s.AddRow("HalfEllipse[")
		  s.AddRow(Super.ToString)
		  s.AddRow("|Width=")
		  s.AddRow(Self.GetWidth.ToString)
		  s.AddRow("|Height=")
		  s.AddRow(Self.GetHeight.ToString)
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
		  Call Self.VertexLeft.Add(x, y)
		  Call Self.VertexRight.Add(x, y)
		  
		  // Translate the ellipse centre.
		  Call Self.EllipseCenter.Add(x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Validate(width As Double, height As Double) As Boolean
		  ///
		  ' Validates the constructor input returning True if valid or raising an exception if invalid.
		  '
		  ' - Parameter width: The bounding rectangle width.
		  ' - Parameter height: The bounding rectangle height.
		  '
		  ' - Returns: True
		  '
		  ' - Raises: InvalidArgumentException if either the width or height is less than or equal to zero.
		  ///
		  
		  // Validate the width and height.
		  If width <= 0.0 Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_HALF_ELLIPSE_INVALID_WIDTH)
		  End If
		  If height <= 0.0 Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_HALF_ELLIPSE_INVALID_HEIGHT)
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of an Half-Ellipse Convex Shape.
		
		A half ellipse must have a width and height greater than zero and the height parameter is the 
		height of the half.
		
		This shape is only supported by the GJK collision detection algorithm.
		
		An `UnsupportedOperationException` is raised when this shape is used with SAT.  If you are using
		or are planning on using the SAT collision detection algorithm, you can use the 
		`Geometry.CreatePolygonalHalfEllipse(int, double, double)` method to create a half ellipse
		Polygon approximation. Another option is to use the GJK or your own collision detection
		algorithm for this shape only and use SAT on others.
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 54686520656C6C697073652063656E7472652E
		EllipseCenter As PKVector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652068616C662D77696474682E
		HalfWidth As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520656C6C69707365206865696768742E
		Height As Double
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 68652068616C6620656C6C6970736520696E657274696120636F6E7374616E742E
		Private Shared INERTIA_CONSTANT As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206C6F63616C20726F746174696F6E2E
		Rotation As PKRotation
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520666972737420766572746578206F662074686520626F74746F6D2E
		VertexLeft As PKVector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865207365636F6E6420766572746578206F662074686520626F74746F6D2E
		VertexRight As PKVector2
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
			Name="HalfWidth"
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
	#tag EndViewBehavior
End Class
#tag EndClass
