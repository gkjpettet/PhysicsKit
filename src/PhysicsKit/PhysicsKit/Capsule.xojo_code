#tag Class
Protected Class Capsule
Inherits PhysicsKit.AbstractShape
Implements PhysicsKit.Convex
	#tag Method, Flags = &h0
		Sub Constructor(valid As Boolean, width As Double, height As Double)
		  ///
		  ' Validated constructor.
		  '
		  ' Creates an axis-aligned capsule centered on the origin with the caps on ends 
		  ' of the larger dimension.
		  '
		  ' - Parameter valid: Always True or this constructor would not be called.
		  ' - Parameter width: The bounding rectangle width.
		  ' - Parameter height: The bounding rectangle height.
		  ///
		  
		  #Pragma Unused valid
		  
		  Super.Constructor(Max(width, height) * 0.5)
		  
		  // Determine the major and minor axis.
		  Var major As Double = width
		  Var minor As Double = height
		  Var vertical As Boolean = False
		  
		  If width < height Then
		    major = height
		    minor = width
		    vertical = True
		  End If
		  
		  // Set the width.
		  Self.Length = major
		  
		  // The cap radius is half the height.
		  Self.CapRadius = minor * 0.5
		  
		  // Generate the cap focal points on the major axis.
		  Var f As Double = (major - minor) * 0.5
		  Self.Foci.ResizeTo(1)
		  If vertical Then
		    Self.Foci(0) = New PKVector2(0, -f)
		    Self.Foci(1) = New PKVector2(0,  f)
		    
		    // Set the local x-axis (to the y-axis).
		    Self.LocalXAxis = New PKVector2(0.0, 1.0)
		  Else
		    Self.Foci(0) = New PKVector2(-f, 0)
		    Self.foci(1) = New PKVector2( f, 0)
		    
		    // Set the local x-axis.
		    Self.LocalXAxis = New PKVector2(1.0, 0.0)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(width As Double, height As Double)
		  ///
		  ' Minimal constructor.
		  '
		  ' Creates an axis-aligned capsule centered on the origin with the caps on ends 
		  ' of the larger dimension.
		  '
		  ' - Parameter width: The bounding rectangle width.
		  ' - Parameter height: The bounding rectangle height.
		  '
		  ' - Raises: InvalidArgumentException thrown if `width` or `height` are less than or equal to zero or 
		  '           if the `width` and `height` are near equal.
		  ///
		  
		  Constructor(Validate(width, height), width, height)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PKVector2, transform As PhysicsKit.Transform) As Boolean
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // A capsule is just a radially expanded line segment.
		  Var p As PKVector2 = Segment.GetPointOnSegmentClosestToPoint(point, _
		  transform.GetTransformed(Self.Foci(0)), transform.GetTransformed(Self.Foci(1)))
		  
		  Var r2 As Double = Self.CapRadius * Self.CapRadius
		  Var d2 As Double = p.DistanceSquared(point)
		  
		  Return d2 <= r2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB(transform As PhysicsKit.Transform) As PKAABB
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // Inlined projection of x axis.
		  Var p1 As PKVector2 = Self.getFarthestPoint(PKVector2.X_AXIS, transform)
		  Var c As Double = transform.GetTransformedX(Self.Center)
		  Var minX As Double = 2 * c - p1.x
		  Var maxX As Double = p1.x
		  
		  // Inlined projection of y axis
		  p1 = Self.GetFarthestPoint(PKVector2.Y_AXIS, transform)
		  c = transform.GetTransformedY(Self.Center)
		  Var minY As Double = 2 * c - p1.Y
		  Var maxY As Double = p1.Y
		  
		  Return New PKAABB(minX, minY, maxX, maxY)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateMass(density As Double) As PhysicsKit.Mass
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  // The mass of a capsule is the mass of the rectangular section plus the mass
		  // of two half circles (really just one circle).
		  
		  Var h As Double = Self.CapRadius * 2.0
		  Var w As Double = Self.Length - h
		  Var r2 As Double = Self.CapRadius * Self.CapRadius
		  
		  // Compute the rectangular area.
		  Var ra As Double = w * h
		  
		  // Compuate the circle area.
		  Var ca As Double = r2 * MathsKit.PI
		  Var rm As Double = density * ra
		  Var cm As Double = density * ca
		  Var m As Double = rm + cm
		  
		  // The inertia is slightly different. It's the inertia of the rectangular
		  // region plus the inertia of half a circle moved from the centre.
		  Var d As Double = w * 0.5
		  
		  // Parallel axis theorem I2 = Ic + m * d^2
		  Var cI As Double = 0.5 * cm * r2 + cm * d * d
		  Var rI As Double = rm * (h * h + w * w) / 12.0
		  
		  // Add the rectangular inertia and cicle inertia.
		  Var I As Double = rI + cI
		  
		  Return New Mass(Self.Center, m, I)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAxes(foci() As PKVector2, transform As PhysicsKit.Transform) As PKVector2()
		  /// 
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  // Check for given foci.
		  If foci <> Nil Then
		    // We need to include the shortest vector from foci to foci.
		    Var axes() As PKVector2
		    axes.ResizeTo(foci.Count + 1)
		    
		    axes(0) = transform.GetTransformedR(Self.LocalXAxis)
		    axes(1) = transform.GetTransformedR(Self.LocalXAxis.GetRightHandOrthogonalVector)
		    
		    Var f1 As PKVector2 = transform.GetTransformed(Self.Foci(0))
		    Var f2 As PKVector2 = transform.GetTransformed(Self.foci(1))
		    Var iLimit As Integer = foci.Count - 1
		    For i as Integer = 0 To iLimit
		      // Get the one closest to the given focus.
		      Var d1 As Double = f1.DistanceSquared(foci(i))
		      Var d2 As Double = f2.DistanceSquared(foci(i))
		      
		      Var v As PKVector2
		      If d1 < d2 Then
		        v = f1.towards(foci(i))
		      Else
		        v = f2.Towards(foci(i))
		      End If
		      
		      Call v.Normalise
		      axes(2 + i) = v
		    Next i
		    
		    Return axes
		  End If
		  // If there were no foci given then just return the normal axes for the rectangular region.
		  Return Array(_
		  transform.GetTransformedR(Self.LocalXAxis), _
		  transform.GetTransformedR(Self.LocalXAxis.GetRightHandOrthogonalVector))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520656E6420636170207261646975732E
		Function GetCapRadius() As Double
		  ///
		  ' Returns the end cap radius.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.CapRadius
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestFeature(vector As PKVector2, transform As PhysicsKit.Transform) As PhysicsKit.Feature
		  ///
		  ' Part of the PhysicsKit.Convex interface.
		  ///
		  
		  // Test whether the given direction is within a certain angle of the
		  // local x axis. if so, use the edge feature rather than the point.
		  Var localAxis As PKVector2 = transform.GetInverseTransformedR(vector)
		  Var n1 As PKVector2 = Self.LocalXAxis.GetLeftHandOrthogonalVector
		  
		  // Get the squared length of the localaxis and add the fudge factor
		  // should always 1.0 * factor since localaxis is normalised.
		  Var d As Double = localAxis.Dot(localAxis) * Capsule.EDGE_FEATURE_SELECTION_CRITERIA
		  
		  // Project the normal onto the localaxis normal.
		  Var d1 As Double= localAxis.Dot(n1)
		  
		  // We only need to test one normal since we only care about its projection length.
		  // We can later determine which direction by the sign of the projection.
		  If Abs(d1) < d Then
		    // It's the farthest point.
		    Var point As PKVector2 = Self.GetFarthestPoint(vector, transform)
		    Return New PointFeature(point)
		  Else
		    // Compute the vector to add/sub from the foci.
		    Var v As PKVector2 = n1.Multiply(Self.CapRadius)
		    
		    // Compute an expansion amount based on the width of the shape.
		    Var e As PKVector2 = Self.LocalXAxis.Product(Self.Length * 0.5 * EDGE_FEATURE_EXPANSION_FACTOR)
		    If d1 > 0 Then
		      Var p1 As PKVector2 = Self.Foci(0).Sum(v).Subtract(e)
		      Var p2 As PKVector2 = Self.Foci(1).Sum(v).Add(e)
		      
		      // Return the full bottom side.
		      Return Segment.GetFarthestFeature(p1, p2, vector, transform)
		    Else
		      Var p1 As PKVector2 = Self.Foci(0).Difference(v).Subtract(e)
		      Var p2 As PKVector2 = Self.Foci(1).Difference(v).Add(e)
		      Return Segment.GetFarthestFeature(p1, p2, vector, transform)
		    End If
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestPoint(vector As PKVector2, transform As PhysicsKit.Transform) As PKVector2
		  /// 
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  // Make sure the given direction is normalised.
		  Call vector.Normalise
		  
		  // A capsule is just a radially expanded line segment.
		  Var p As PKVector2 = Segment.GetFarthestPoint(Self.Foci(0), Self.Foci(1), vector, transform)
		  
		  // Apply the radial expansion.
		  Return p.Add(vector.Product(Self.CapRadius))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFoci(transform As PhysicsKit.Transform) As PKVector2()
		  ///
		  ' - Note: Part of the PhysicsKit.Convex interface.
		  ///
		  
		  // Return the cap foci.
		  Return Array(transform.GetTransformed(Self.Foci(0)), transform.GetTransformed(Self.Foci(1)))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206C6172676573742064696D656E73696F6E206F66207468652063617073756C65277320626F756E64696E672072656374616E676C652E
		Function GetLength() As Double
		  ///
		  ' Returns the length of the capsule.
		  '
		  ' The length is the largest dimension of the capsule's bounding rectangle.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Length
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius(center As PKVector2) As Double
		  /// 
		  ' - Note: Part of the PhysicsKit.Shape interface.
		  ///
		  
		  Return Geometry.GetRotationRadius(center, Self.Foci) + Self.CapRadius
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520526F746174696F6E206F626A656374207468617420726570726573656E747320746865206C6F63616C20726F746174696F6E2E
		Function GetRotation() As PhysicsKit.Rotation
		  ///
		  ' - Returns: The Rotation object that represents the local rotation.
		  ///
		  
		  // localXAxis is already a unit vector so we can just return it as a Rotation.
		  Return New Rotation(Self.LocalXAxis.X, Self.LocalXAxis.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520726F746174696F6E2061626F757420746865206C6F63616C2063656E74657220696E2072616469616E7320696E207468652072616E6765205B2DCF802C20CF805D2E
		Function GetRotationAngle() As Double
		  ///
		  ' Returns the rotation about the local center in radians in the range [-π, π].
		  '
		  ' - Returns: The rotation in radians.
		  ///
		  
		  Return ATan2(Self.LocalXAxis.Y, Self.LocalXAxis.X)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PKVector2, transform As PhysicsKit.Transform) As PhysicsKit.Interval
		  // Get the world space farthest point.
		  Var p1 As PKVector2 = Self.GetFarthestPoint(vector, transform)
		  
		  // Get the center in world space.
		  Var center As PKVector2 = transform.GetTransformed(Self.Center)
		  
		  // Project the center onto the axis.
		  Var c As Double = center.Dot(vector)
		  
		  // Project the point onto the axis.
		  Var d As Double = p1.Dot(vector)
		  
		  // Get the interval along the axis.
		  Return New Interval(2 * c - d, d)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation, x As Double, y As Double)
		  ///
		  ' - Note: Part of the PhysicsKit.Rotatable interface.
		  ///
		  
		  Super.Rotate(r, x, y)
		  
		  // Rotate the foci.
		  Call Self.Foci(0).Rotate(r, x, y)
		  Call Self.foci(1).Rotate(r, x, y)
		  
		  // Rotate the local x-axis.
		  Call Self.LocalXAxis.Rotate(r)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F6620746869732043617073756C652E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Capsule.
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() as String
		  s.AddRow("Capsule[")
		  s.AddRow(Super.ToString)
		  s.AddRow("|Width=")
		  s.AddRow(Self.Length.ToString)
		  s.AddRow("|CapRadius=")
		  s.AddRow(Self.CapRadius.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(x As Double, y As Double)
		  /// 
		  ' - Note: Part of the PhysicsKit.Translatable interface.
		  ///
		  
		  Super.Translate(x, y)
		  
		  // Translate the foci.
		  Call Self.Foci(0).Add(x, y)
		  Call Self.Foci(1).Add(x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 56616C6964617465732074686520636F6E7374727563746F7220696E7075742072657475726E696E6720747275652069662076616C6964206F72207468726F77696E6720616E20657863657074696F6E20696620696E76616C69642E2052616973657320496E76616C6964417267756D656E74457863657074696F6E732E
		Shared Function Validate(width As Double, height As Double) As Boolean
		  ///
		  ' Validates the constructor input returning true if valid or throwing an exception if invalid.
		  '
		  ' - Parameter width: The bounding rectangle width.
		  ' - Parameter height: The bounding rectangle height.
		  '
		  ' - Returns: True.
		  '
		  ' - Raises: InvalidArgumentException if `width` or `height` are less than or equal to zero or 
		  '           if the `width` and `height` are near equal.
		  ///
		  
		  // Validate the width and height.
		  If width <= 0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_CAPSULE_INVALID_WIDTH)
		  If height <= 0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_CAPSULE_INVALID_HEIGHT)
		  
		  // Check for basically a circle.
		  If Abs(width - height) < Epsilon.E Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_CAPSULE_DEGENERATE)
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of a Capsule Convex Shape.
		
		A capsule can be described as a rectangle with two half circle caps on both ends. A capsule is created
		by specifying the bounding rectangle of the entire Shape.
		
		If the height is larger than the width the caps will be on the top and bottom of the shape. Otherwise
		the caps are on the left and right ends of the shape.
		
		A capsule's width and height must be larger than zero and cannot be equal. A Circle should be used
		instead of an equal width/height capsule for both performance and stability.
		
		EDGE_FEATURE_SELECTION_CRITERIA
		-------------------------------
		The Capsule shape has two edge features which could be returned from the 
		`GetFarthestFeature(PKVector2, Transform)` method. Under normal floating point conditions 
		the edges will never be selected as the farthest features. Due to this,
		stacking of capsule shapes is very unstable (or any resting contact that involves the edge). 
		We introduce this factor (% of projected normal) to help select the edge in cases where 
		the collision normal is nearly parallel to the edge normal.
		
		EDGE_FEATURE_EXPANSION_FACTOR
		-----------------------------
		Because we are selecting an edge even when the farthest feature should be a vertex, when the 
		edges are clipped against each other (in the ClippingManifoldSolver) they will not overlap. 
		Due to this, we introduce an expansion value (% of the width) that expands the edge feature 
		so that in these cases a collision manifold is still generated.
	#tag EndNote


	#tag Property, Flags = &h0, Description = 54686520656E6420636170207261646975732E
		CapRadius As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520666F63616C20706F696E747320666F722074686520636170732E
		Foci() As PKVector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520626F756E64696E672072656374616E676C652077696474682E
		Length As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206C6F63616C20782D617869732E
		LocalXAxis As PKVector2
	#tag EndProperty


	#tag Constant, Name = EDGE_FEATURE_EXPANSION_FACTOR, Type = Double, Dynamic = False, Default = \"0.1", Scope = Protected, Description = 5768656E207468652065646765732061726520636C697070656420616761696E73742065616368206F746865722028696E2074686520436C697070696E674D616E69666F6C64536F6C766572292074686579206D6179206E6F74206F7665726C61702E205468697320657870616E6473207468652065646765206665617475726520736F2074686174206120636F6C6C6973696F6E206D616E69666F6C64206973207374696C6C2067656E6572617465642E
	#tag EndConstant

	#tag Constant, Name = EDGE_FEATURE_SELECTION_CRITERIA, Type = Double, Dynamic = False, Default = \"0.98", Scope = Protected, Description = 48656C70732073656C65637420746865206564676520696E2063617365732077686572652074686520636F6C6C6973696F6E206E6F726D616C206973206E6561726C7920706172616C6C656C20746F207468652065646765206E6F726D616C2E
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
			Name="CapRadius"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Length"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
