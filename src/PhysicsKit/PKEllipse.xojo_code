#tag Class
Protected Class PKEllipse
Inherits PKAbstractShape
Implements  PKConvex
	#tag Method, Flags = &h0
		Sub Constructor(valid As Boolean, width As Double, height As Double)
		  ///
		  ' Validated constructor.
		  '
		  ' Creates an axis-aligned ellipse fitting inside a rectangle Of the given width and 
		  ' height centered at the origin.
		  ' - Parameter valid: Always True or this constructor would not be called.
		  ' - Parameter width: The width.
		  ' - Parameter height: The height.
		  ///
		  
		  #Pragma Unused valid
		  
		  Super.Constructor(Max(width, height) * 0.5)
		  
		  // Compute the major and minor axis lengths (the x,y radii).
		  Self.HalfWidth = width * 0.5
		  Self.HalfHeight = height * 0.5
		  
		  // Initially the ellipse is aligned to the world space x axis.
		  Self.Rotation = New PKRotation
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(width As Double, height As Double)
		  ///
		  ' Minimal constructor.
		  '
		  ' Creates an axis-aligned ellipse fitting inside a rectangle of the given width and 
		  ' height centered at the origin.
		  '
		  ' - Parameter width: The width.
		  ' - Parameter height: The height.
		  '
		  ' - Raises: InvalidArgumentException if either the width or height Is less than or equal To zero.
		  ///
		  
		  Constructor(Validate(width, height), width, height)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PKVector2, transform As PKTransform) As Boolean
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // Equation of an ellipse:
		  // (x - h)^2/a^2 + (y - k)^2/b^2 = 1
		  // For a point to be inside the ellipse, we can plug in the point into this equation and 
		  // verify that the value is less than or equal to one.
		  
		  // Get the world space point into local coordinates.
		  Var localPoint As PKVector2 = transform.GetInverseTransformed(point)
		  
		  // Account for local rotation.
		  Call localPoint.InverseRotate(Self.Rotation, Self.Center)
		  
		  Var x As Double = localPoint.X - Self.Center.X
		  Var y As Double = localPoint.Y - Self.Center.Y
		  Var x2 As Double = x * x
		  Var y2 As Double = y * y
		  Var a2 As Double = Self.HalfWidth * Self.HalfWidth
		  Var b2 As Double = Self.HalfHeight * Self.HalfHeight
		  Var value As Double = x2 / a2 + y2 / b2
		  
		  Return value <= 1.0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB(transform As PKTransform) As PKAABB
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // Fast computation of Ellipse PKAABB without resorting to `GetFarthestPoint` related methods
		  // Also see http://www.iquilezles.org/www/articles/ellipses/ellipses.htm
		  
		  // u is a unit vector with the world and local rotation.
		  Var u As PKVector2 = Self.Rotation.ToVector
		  transform.TransformR(u)
		  
		  Var x2 As Double = u.x * u.x
		  Var y2 As Double = u.y * u.y
		  
		  // Half width half height squared.
		  Var hw2 As Double = Self.HalfWidth * Self.HalfWidth
		  Var hh2 As Double = Self.HalfHeight * Self.HalfHeight
		  
		  // Calculate the resulting PKAABB's half width and half height.
		  Var aabbHalfWidth As Double = Sqrt(x2 * hw2 + y2 * hh2)
		  Var aabbHalfHeight As Double = Sqrt(y2 * hw2 + x2 * hh2) 
		  
		  // Compute world centre.
		  Var cx As Double = transform.GetTransformedX(Self.Center)
		  Var cy As Double = transform.GetTransformedY(Self.Center)
		  
		  // Combine to form the ellipse PKAABB.
		  Var minx As Double = cx - aabbHalfWidth
		  Var miny As Double = cy - aabbHalfHeight
		  Var maxx As Double = cx + aabbHalfWidth
		  Var maxy As Double = cy + aabbHalfHeight
		  
		  Return New PKAABB(minx, miny, maxx, maxy)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateMass(density As Double) As PKMass
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  Var area As Double = MathsKit.PI * Self.HalfWidth * Self.HalfHeight
		  Var m As Double = area * density
		  
		  // Inertia about the z:
		  // http://math.stackexchange.com/questions/152277/moment-of-inertia-of-an-ellipse-in-2d
		  Var I As Double = m * (Self.HalfWidth * Self.HalfWidth + Self.HalfHeight * Self.HalfHeight) / 4.0
		  
		  Return New PKMass(Self.Center, m, I)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAxes(foci() As PKVector2, transform As PKTransform) As PKVector2()
		  /// 
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  #Pragma Unused foci
		  #Pragma Unused transform
		  
		  // This shape is not supported by SAT.
		  Raise New UnsupportedOperationException(PKMessages.GEOMETRY_ELLIPSE_SAT_NOT_SUPPORTED)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestFeature(vector As PKVector2, transform As PKTransform) As PKFeature
		  /// 
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  // Obtain the farthest point along the given vector.
		  Var farthest As PKVector2 = Self.GetFarthestPoint(vector, transform)
		  
		  // For an ellipse the farthest feature along a vector will always be a vertex.
		  Return New PKPointFeature(farthest)
		  
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
		  If Self.Rotation.IsIdentity Then
		    // This is the case most of the time, and saves a lot of computations.
		    Self.GetFarthestPointOnAlignedEllipse(localAxis)
		  Else
		    // Invert the local rotation.
		    Call localAxis.InverseRotate(Self.Rotation)
		    
		    Self.GetFarthestPointOnAlignedEllipse(localAxis)
		    
		    // Include local rotation.
		    Call localAxis.Rotate(Self.Rotation)
		  End If
		  
		  // Add the radius along the vector to the center to get the farthest point.
		  Call localAxis.Add(Self.Center)
		  
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
		  
		  // Then finally convert back into world space coordinates.
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
		  ' Typically this means that the ellipse is axis-aligned, but it could also
		  ' mean that the ellipse is not axis-aligned, but the given local space axis
		  ' has been rotated to match the alignment of the ellipse.
		  ///
		  
		  // An ellipse is a circle with a non-uniform scaling transformation applied
		  // so we can achieve that by scaling the input axis by the major and minor axis lengths.
		  localAxis.X = localAxis.X * Self.HalfWidth
		  localAxis.Y = localAxis.Y * Self.HalfHeight
		  
		  // Then normalise it.
		  Call localAxis.Normalise
		  
		  // Then scale again to get a point in the ellipse.
		  localAxis.X = localAxis.X * Self.HalfWidth
		  localAxis.Y = localAxis.Y * Self.HalfHeight
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 506572666F726D73206120676F6C64656E2073656374696F6E20736561726368206F662074686520656C6C6970736520626F756E646564206265747765656E2074686520696E74657276616C205B786D696E2C20786D61785D20666F722074686520666172746865737420706F696E742066726F6D2074686520676976656E20706F696E742E
		Shared Function GetFarthestPointOnBoundedEllipse(xmin As Double, xmax As Double, a As Double, b As Double, point As PKVector2) As PKVector2
		  ///
		  ' Performs a golden section search of the ellipse bounded between the interval [xmin, xmax] 
		  ' for the farthest point from the given point.
		  '
		  ' This method assumes that this ellipse is centered on the origin and has it's semi-major axis 
		  ' aligned with the x-axis and its semi-minor axis aligned With the y-axis.
		  '
		  ' - Parameter xmin: The minimum x value.
		  ' - Parameter xmax: The maximum x value.
		  ' - Parameter a: The half width of the ellipse.
		  ' - Parameter b: The half height of the ellipse.
		  ' - Parameter point: The query point.
		  ///
		  
		  Var px As Double = point.X
		  Var py As Double = point.Y
		  
		  // Our bracketing bounds will be [x0, x1].
		  Var x0 As Double = xmin
		  Var x1 As Double = xmax
		  
		  Var q As PKVector2 = New PKVector2(px, py)
		  Var p As PKVector2 = New PKVector2
		  
		  Var aa As Double = a * a
		  Var ba As Double = b / a
		  
		  // Compute the golden ratio test points.
		  Var x2 As Double = x1 - (x1 - x0) * INV_GOLDEN_RATIO
		  Var x3 As Double = x0 + (x1 - x0) * INV_GOLDEN_RATIO
		  Var fx2 As Double = PKEllipse.GetSquaredDistance(aa, ba, x2, q, p)
		  Var fx3 As Double = PKEllipse.GetSquaredDistance(aa, ba, x3, q, p)
		  
		  // Our bracket is now: [x0, x2, x3, x1]. Iteratively reduce the bracket.
		  Var iLimit As Integer = FARTHEST_POINT_MAX_ITERATIONS - 1
		  For i As Integer = 0 To iLimit
		    If fx2 < fx3 Then
		      If Abs(x1 - x2) <= FARTHEST_POINT_EPSILON Then Exit
		      x0 = x2
		      x2 = x3
		      fx2 = fx3
		      x3 = x0 + (x1 - x0) * INV_GOLDEN_RATIO
		      fx3 = PKEllipse.GetSquaredDistance(aa, ba, x3, q, p)
		    Else
		      If Abs(x3 - x0) <= FARTHEST_POINT_EPSILON Then Exit
		      x1 = x3
		      x3 = x2
		      fx3 = fx2
		      x2 = x1 - (x1 - x0) * INV_GOLDEN_RATIO
		      fx2 = PKEllipse.GetSquaredDistance(aa, ba, x2, q, p)
		    End If
		  Next i
		  
		  Return p
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetFarthestPointOnEllipse(a As Double, b As Double, point As PKVector2) As PKVector2
		  ///
		  ' Returns the point on this ellipse farthest from the given point.
		  '
		  ' Assumes that this ellipse is centered on the origin and has it's 
		  ' semi-major axis aligned with the x-axis and its semi-minor axis aligned with the y-axis.
		  '
		  ' This method performs a Golden Section Search to find the point of maximum distance 
		  ' from the given point.
		  '
		  ' - Parameter a: The half width of the ellipse.
		  ' - Parameter b: The half height of the ellipse.
		  ' - Parameter point: The query point.
		  ///
		  
		  Var px As Double = point.X
		  Var py As Double = point.Y
		  
		  // Check the semi-major/minor axes.
		  Var flipped As Boolean = False
		  If a < b Then
		    // Swap the semi-major/minor axes.
		    Var temp As Double = a
		    a = b
		    b = temp
		    
		    // If we swap the axes, then we need to also rotate our point.
		    temp = px
		    px = -py
		    py = temp
		    
		    flipped = True
		  End If
		  
		  // Solve as if point is in 3rd quadrant due to the symmetry of the ellipse we only have
		  // to solve this problem in one quadrant and then just flip signs to get the answer
		  // in the original quadrant.
		  Var quadrant As Integer = 3
		  If px >= 0 And py >= 0 Then
		    quadrant = 1
		    px = -px
		    py = -py
		  Elseif px >= 0 And py <= 0 Then
		    quadrant = 4
		    px = -px
		  Elseif px <= 0 And py >= 0 Then
		    quadrant = 2
		    py = -py
		  End If
		  
		  Var p As PKVector2
		  If py = 0.0 Then
		    // It's on the x-axis and the farthest point is easy to calculate.
		    p = New PKVector2(If(px < 0, a, -a), 0)
		  Else
		    p = PKEllipse.GetFarthestPointOnBoundedEllipse(0, a, a, b, New PKVector2(px, py))
		  End If
		  
		  // Translate the point to the correct quadrant.
		  If quadrant = 1 Then
		    p.X = p.X * -1
		    p.Y = p.Y * -1
		  Elseif quadrant = 2 Then
		    p.Y = p.Y * -1
		  Elseif quadrant = 4 Then
		    p.X = p.X * -1
		  End If
		  
		  // Flip the point's coorindates if the semi-major/minor axes were flipped.
		  If flipped Then
		    Var temp As Double = p.X
		    p.X = p.Y
		    p.Y = -temp
		  End If
		  
		  Return p
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFoci(transform As PKTransform) As PKVector2()
		  /// 
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  #Pragma Unused transform
		  
		  // This shape is not supported by SAT.
		  Raise New UnsupportedOperationException(PKMessages.GEOMETRY_ELLIPSE_SAT_NOT_SUPPORTED)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652068616C662D6865696768742E
		Function GetHalfHeight() As Double
		  ///
		  ' Returns the half-height.
		  ///
		  
		  Return Self.HalfHeight
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652068616C662D77696474682E
		Function GetHalfWidth() As Double
		  ///
		  ' Returns the half-width.
		  ///
		  
		  Return Self.HalfWidth
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206865696768742E
		Function GetHeight() As Double
		  ///
		  ' Returns the height.
		  ///
		  
		  Return Self.HalfHeight * 2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius(center As PKVector2) As Double
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // Annoyingly, finding the radius of a rotated/translated ellipse about another point 
		  // is the same as finding the farthest point from an arbitrary point. The solution to 
		  // this is a quartic function that has no analytic solution, so we are stuck with a 
		  // maximization problem. Thankfully, this method shouldn't be called that often, in fact
		  // it should only be called when the user modifies the shapes on a body.
		  
		  // We need to translate/rotate the point so that this ellipse is considered centered 
		  // at the origin with it's semi-major axis aligned with the x-axis and its semi-minor axis 
		  // aligned with the y-axis.
		  Var p As PKVector2 = center.Difference(Self.Center).InverseRotate(Self.Rotation)
		  
		  // Get the farthest point.
		  Var fp As PKVector2 = PKEllipse.GetFarthestPointOnEllipse(Self.HalfWidth, Self.HalfHeight, p)
		  
		  // Get the distance between the two points. The distance will be the same if we 
		  // translate/rotate the points back to the real position and rotation, so don't bother.
		  Return p.Distance(fp)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120636F7079206F662074686520726F746174696F6E206F626A656374207468617420726570726573656E747320746865206C6F63616C20726F746174696F6E2E
		Function GetRotation() As PKRotation
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
		  ' - Returns: The rotation as a Double (in radians).
		  
		  Return Self.Rotation.ToRadians
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetSquaredDistance(a2 As Double, ba As Double, x As Double, q As PKVector2, p As PKVector2) As Double
		  ///
		  '  Returns the distance from the ellipse at the given x to the given point q.
		  '
		  ' - Parameter a2: The ellipse semi-major axis squared (a * a)
		  ' - Parameter ba: The ellipse semi-minor axis divided by the semi-major axis (b / a)
		  ' - Parameter x: The x of the point on the ellipse.
		  ' - Parameter q: The query point.
		  ' - Parameter p: Output. The point on the ellipse.
		  '
		  ' - Returns: Double.
		  ///
		  
		  // Compute the y value for the given x on the ellipse:
		  // (x^2/a^2) + (y^2/b^2) = 1
		  // y^2 = (1 - (x / a)^2) * b^2
		  // y^2 = b^2/a^2(a^2 - x^2)
		  // y = (b / a) * sqrt(a^2 - x^2)
		  Var a2x2 As Double = a2 - (x * x)
		  If a2x2 < 0 Then
		    // This should never happen, but just in case of numeric instability we'll just set it to zero.
		    a2x2 = 0
		    // x^2/a^2 can never be greater than 1 since a must always be
		    // greater than or equal to the largest x value on the ellipse
		  End If
		  
		  Var sa2x2 As Double = Sqrt(a2x2)
		  Var y As Double = ba * sa2x2
		  
		  // Compute the distance from the ellipse point to the query point.
		  Var xx As Double = (q.X - x)
		  Var yy As Double = (q.Y - y)
		  Var d2 As Double = xx * xx + yy * yy
		  p.X = x
		  p.Y = y
		  
		  // Return the distance.
		  Return d2
		  
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

	#tag Method, Flags = &h0
		Shared Sub Initialise()
		  /// Initalise shared properties.
		  
		  INV_GOLDEN_RATIO = 1.0 / ((Sqrt(5.0) + 1.0) * 0.5)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PKVector2, transform As PKTransform) As PKInterval
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // Get the world space farthest point.
		  Var p1 As PKVector2 = Self.GetFarthestPoint(vector, transform)
		  
		  // Get the centre in world space.
		  Var center As PKVector2 = transform.GetTransformed(Self.Center)
		  
		  // Project the centre onto the axis.
		  Var c As Double = center.Dot(vector)
		  
		  // Project the point onto the axis.
		  Var d As Double = p1.Dot(vector)
		  
		  // Get the interval along the axis.
		  Return New PKInterval(2 * c - d, d)
		  
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
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F66207468697320456C6C697073652E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Ellipse.
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  s.AddRow("Ellipse[")
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
		Shared Function Validate(width As Double, height As Double) As Boolean
		  ///
		  ' Validates the constructor input returning True if valid or raising an exception if invalid.
		  '
		  ' - Parameter width: The bounding rectangle width.
		  ' - Parameter height: The bounding rectangle height.
		  '
		  ' - Returns: True.
		  '
		  ' - Raises: InvalidArgumentException if either the width or height Is less than or equal To zero.
		  ///
		  
		  // Validate the width and height.
		  If width <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_ELLIPSE_INVALID_WIDTH)
		  If height <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_ELLIPSE_INVALID_HEIGHT)
		  
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of an Ellipse Convex Shape.
		 
		An ellipse must have a width and height greater than zero.
		 
		This shape is only supported by the GJK collision detection algorithm.
		
		`UnsupportedOperationException` is raised when this shape is used with SAT.  If you 
		are using or are planning on using the SAT collision detection algorithm, you can use the 
		`Geometry.CreatePolygonalEllipse(int, double, double)` method to create a half ellipse
		Polygon approximation. Another option is to use the GJK or your own collision detection
		algorithm for this shape only and use SAT on others.
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 5468652068616C662D6865696768742E
		HalfHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652068616C662D77696474682E
		HalfWidth As Double
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 54686520696E7665727365206F662074686520676F6C64656E20726174696F2E
		Private Shared INV_GOLDEN_RATIO As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206C6F63616C20726F746174696F6E2E
		Rotation As PKRotation
	#tag EndProperty


	#tag Constant, Name = FARTHEST_POINT_EPSILON, Type = Double, Dynamic = False, Default = \"1.0e-8", Scope = Private, Description = 546865206465736972656420616363757261637920666F722074686520666172746865737420706F696E742E
	#tag EndConstant

	#tag Constant, Name = FARTHEST_POINT_MAX_ITERATIONS, Type = Double, Dynamic = False, Default = \"50", Scope = Private, Description = 546865206D6178696D756D206E756D626572206F6620697465726174696F6E7320746F20706572666F726D207768656E2066696E64696E672074686520666172746865737420706F696E742E
	#tag EndConstant


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
			Name="HalfHeight"
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
	#tag EndViewBehavior
End Class
#tag EndClass
