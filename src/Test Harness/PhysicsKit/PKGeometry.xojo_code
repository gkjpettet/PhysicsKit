#tag Class
Protected Class PKGeometry
	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720617272617920636F6E7461696E696E67207468652027636C65616E736564272076657273696F6E206F662074686520676976656E206C697374696E67206F6620706F6C79676F6E20706F696E74732E20456E73757265732074686520706F6C79676F6E20686173204343572077696E64696E672C2072656D6F76657320636F6C696E6561722076657274696365732C20616E642072656D6F76657320636F696E636964656E742076657274696365732E
		Shared Function Cleanse(points() As PKVector2) As PKVector2()
		  ///
		  ' Returns a new array containing the 'cleansed' version of the given listing of polygon points.
		  '
		  ' This method ensures the polygon has CCW winding, removes colinear vertices, and 
		  ' removes coincident vertices.
		  '
		  ' If the given array is empty, the array is returned.
		  '
		  ' - Parameter points: The list polygon points.
		  '
		  ' - Returns: The same array, cleansed.
		  '
		  ' - Raises: NilObjectException if `points` is Nil or if points contains Nil elements.
		  ///
		  
		  // Check for Nil array.
		  If points = Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_POINT_ARRAY)
		  
		  // Get the size of the points array.
		  Var size As Integer = points.Count
		  
		  // Check the size.
		  If size = 0 Then Return points
		  
		  // Create a result array.
		  Var result() As PKVector2
		  
		  Var winding As Double = 0
		  
		  // Loop over the points
		  Var iLimit As Integer = size - 1
		  For i As Integer = 0 To iLimit
		    // Get the current point.
		    Var point As PKVector2 = points(i)
		    
		    // Get the adjacent points.
		    Var prevPoint As PKVector2 = points(If(i - 1 < 0, size - 1, i - 1))
		    Var nextPoint As PKVector2 = points(If(i + 1 = size, 0, i + 1))
		    
		    // Check for Nil.
		    If point Is Nil Or prevPoint Is Nil Or nextPoint Is Nil Then
		      Raise New NilObjectException(PKMessages.GEOMETRY_NIL_POINT_ARRAY_ELEMENTS)
		    End If
		    
		    // Is this point equal to the next?
		    Var diff As PKVector2 = point.Difference(nextPoint)
		    If diff.IsZero Then Continue // Skip this point.
		    
		    // Create the edge vectors.
		    Var prevToPoint As PKVector2 = prevPoint.Towards(point)
		    Var pointToNext As PKVector2 = point.Towards(nextPoint)
		    
		    // Check if the previous point is equal to this point.
		    // Since the next point is not equal to this point, if this is true we still need 
		    // to add the point because it is the last of a string of coincident vertices.
		    If Not prevToPoint.IsZero Then
		      // Compute the cross product.
		      Var cross As Double = prevToPoint.Cross(pointToNext)
		      
		      // If the cross product is near zero then point is a colinear point.
		      If Abs(cross) <= PKEpsilon.E Then Continue
		    End If
		    
		    // Sum the current signed area.
		    winding = winding + point.Cross(nextPoint)
		    
		    // Otherwise the point is valid.
		    result.AddRow(point)
		  Next i
		  
		  // Check the winding.
		  If winding < 0 Then PKGeometry.ReverseWinding(result)
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E65772043617073756C6520626F756E6465642062792074686520676976656E2072656374616E676C6520776964746820616E64206865696768742E205468652063617073756C652077696C6C20626520617869732D616C69676E656420616E642063656E7465726564206F6E20746865206F726967696E2077697468207468652063617073206F6E2074686520656E6473206F6620746865206C6172676573742064696D656E73696F6E2E
		Shared Function CreateCapsule(width As Double, height As Double) As PKCapsule
		  ///
		  ' Creates a new Capsule bounded by the given rectangle width and height.
		  '
		  ' The capsule will be axis-aligned and centered on the origin with the caps on the
		  ' ends of the largest dimension.
		  '
		  ' If width and height are equal use a Circle shape instead.
		  '
		  ' - Parameter width: The bounding rectangle width.
		  ' - Parameter height: The bounding rectangle height.
		  '
		  ' - Returns: A new Capsule.
		  '
		  ' - Raises: InvalidArgumentException if `width` or `height` are less than or equal to zero.
		  ///
		  
		  Return New PKCapsule(width, height)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720436972636C6520776974682074686520676976656E207261646975732063656E7465726564206F6E20746865206F726967696E2E205468726F777320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function CreateCircle(radius As Double) As PKCircle
		  ///
		  ' Returns a new Circle with the given radius centered on the origin.
		  '
		  ' - Parameter radius: The radius in metres.
		  '
		  ' - Returns: A new Circle instance.'
		  ' 
		  ' - Raises: InvalidArgumentException if radius is less than or equal to zero.
		  ///
		  
		  Return New PKCircle(radius)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateEllipse(width As Double, height As Double) As PKEllipse
		  ///
		  ' Creates a new Ellipse bounded by the given rectangle width and height.
		  '
		  ' The ellipse will be axis-aligned and centered on the origin.
		  ' If width and height are equal use a Circle shape instead.
		  '
		  ' - Parameter width: The bounding rectangle width.
		  ' - Parameter height: The bounding rectangle height.
		  '
		  ' - Returns: A new Ellipse.
		  '
		  ' - Raises: InvalidArgumentException if width or height are less than or equal to zero.
		  ///
		  
		  Return New PKEllipse(width, height)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E20657175696C61746572616C20547269616E676C652077697468207468652063656E74726520617420746865206F726967696E2E2052616973657320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function CreateEquilateralTriangle(height As Double) As PKTriangle
		  ///
		  ' Creates an equilateral Triangle with the centre at the origin.
		  '
		  ' - Parameter height: The height of the triangle in metres.
		  '
		  ' - Returns: A new Triangle.
		  '
		  ' - Raises: InvalidArgumentException if height is less than or equal to zero.
		  ///
		  
		  // Check the size.
		  If height <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_SIZE)
		  
		  // Compute `a` where height = a * sqrt(3) / 2.0 (a is the width of the base).
		  Var a As Double = 2.0 * height * INV_SQRT_3
		  
		  // Create the triangle.
		  Return PKGeometry.CreateIsoscelesTriangle(a, height)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateHalfEllipse(width As Double, height As Double) As PKHalfEllipse
		  ///
		  ' Creates a new HalfEllipse bounded by the given rectangle width and height.
		  '
		  ' The ellipse will be axis-aligned with the base of the half ellipse on the x-axis. The given height
		  ' is the height of the half, not the height of the full ellipse.
		  '
		  ' If width and height are equal use a Slice shape with `theta = MathsKit.PI` instead.
		  '
		  ' - Parameter width: The bounding rectangle width.
		  ' - Parameter height: The bounding rectangle height.
		  '
		  ' - Returns: A new HalfEllipse.
		  '
		  ' - Raises: InvalidArgumentException if width or height are less than or equal to zero.
		  ///
		  
		  Return New PKHalfEllipse(width, height)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateHalfEllipseAtOrigin(width As Double, height As Double) As PKHalfEllipse
		  ///
		  ' Creates a new HalfEllipse bounded by the given rectangle width and height.
		  '
		  ' The ellipse will be axis-aligned with the base of the half ellipse on the x-axis. The given height
		  ' is the height of the half, not the height of the full ellipse.
		  '
		  ' If width and height are equal use a Slice shape with `theta = MathsKit.PI` instead.
		  '
		  ' - Parameter width: The bounding rectangle width.
		  ' - Parameter height: The bounding rectangle height.
		  '
		  ' - Returns: A new HalfEllipse.
		  '
		  ' - Raises: InvalidArgumentException if width or height are less than or equal to zero
		  ///
		  
		  Var half As PKHalfEllipse = New PKHalfEllipse(width, height)
		  Var c As PKVector2 = half.GetCenter
		  half.Translate(-c.X, -c.Y)
		  Return half
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577205365676D656E7420776974682074686520676976656E206C656E6774682077697468207468652063656E74726520617420746865206F726967696E2E2052616973657320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function CreateHorizontalSegment(length As Double) As PKSegment
		  ///
		  ' Creates a new Segment with the given length with the centre at the origin.
		  '
		  ' - Parameter length: The length of the segment in metres.
		  '
		  ' - Returns: A new Segment.
		  '
		  ' - Raises: InvalidArgumentException if length is less than or equal to zero.
		  ///
		  
		  // Check the length.
		  If length <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_LENGTH)
		  
		  Var startV As PKVector2 = New PKVector2(-length * 0.5, 0.0)
		  Var endV As PKVector2 = New PKVector2(length * 0.5, 0.0)
		  
		  Return New PKSegment(startV, endV)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E2069736F7363656C657320547269616E676C652077697468207468652063656E74726520617420746865206F726967696E2E2052616973657320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function CreateIsoscelesTriangle(width As Double, height As Double) As PKTriangle
		  ///
		  ' Creates an isosceles Triangle with the centre at the origin.
		  '
		  ' - Parameter width: The width of the base in metres.
		  ' - Parameter height: The height in metres.
		  '
		  ' - Returns: A new Triangle.
		  '
		  ' - Raises: InvalidArgumentException if width or height is less than or equal to zero.
		  ///
		  
		  // Check the width.
		  If width <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_WIDTH)
		  
		  // Check the height.
		  If height <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_HEIGHT)
		  
		  Var top As PKVector2 = New PKVector2(0.0, height)
		  Var left As PKVector2 = New PKVector2(-width * 0.5, 0.0)
		  Var right As PKVector2 = New PKVector2(width * 0.5, 0.0)
		  
		  // Create the triangle
		  Var t As PKTriangle = New PKTriangle(top, left, right)
		  Var center As PKVector2 = t.GetCenter
		  t.Translate(-center.X, -center.Y)
		  
		  Return t
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206C697374206F66204C696E6B7320666F722074686520676976656E2076657274696365732E2049662060636C6F7365646020697320547275652C20616E206578747261206C696E6B2069732063726561746564206A6F696E696E6720746865206C61737420616E6420666972737420766572746963657320696E207468652061727261792E
		Shared Function CreateLinks(vertices() As PKVector2, closed As Boolean) As PKLink()
		  ///
		  ' Creates a list of Links for the given vertices.
		  '
		  ' If the `closed` parameter is True, an extra link is created joining the last and first
		  ' vertices in the array.
		  '
		  ' - Parameter vertices: The poly-line vertices.
		  ' - Parameter closed: True if the shape should be enclosed.
		  '
		  ' - Returns: An array of Link objects.
		  '
		  ' - Raises: NilObjectException if the array of vertices is Nil or 
		  '           an element of the vertex array is Nil.
		  ' - Raises: InvalidArgumentException if the array of vertices doesn't contain two or more elements.
		  ///
		  
		  // Check the vertex array.
		  If vertices Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_POINT_ARRAY)
		  
		  // Get the vertex length.
		  Var size As Integer = vertices.Count
		  
		  // The size must be larger than 1 (2 or more).
		  If size < 2 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_SIZE_POINT_ARRAY2)
		  
		  // Generate the links.
		  Var links() As PKLink
		  
		  Var iLimit As Integer = size - 2
		  For i As Integer = 0 To iLimit
		    Var p1 As PKVector2 = vertices(i).Copy
		    Var p2 As PKVector2 = vertices(i + 1).Copy
		    
		    // Check for Nil segment vertices.
		    If p1 Is Nil Or p2 Is Nil Then
		      Raise New NilObjectException(PKMessages.GEOMETRY_NIL_POINT_ARRAY_ELEMENTS)
		    End If
		    
		    Var link As PKLink = New PKLink(p1, p2)
		    
		    // Link up the previous and this link.
		    If i > 0 Then
		      Var prev As PKLink = links(i - 1)
		      link.SetPrevious(prev)
		    End If
		    
		    // Add link to the array of links.
		    links.AddRow(link)
		  Next i
		  
		  If closed Then
		    // Create a link to span the first and last vertex.
		    Var p1 As PKVector2 = vertices(0).Copy
		    Var p2 As PKVector2 = vertices(size - 1).Copy
		    Var link As PKLink = New PKLink(p1, p2)
		    
		    // Wire it up.
		    Var prev As PKLink = links(links.Count - 1)
		    Var nextLink As PKLink = links(0)
		    link.SetPrevious(prev)
		    link.SetNext(nextLink)
		    links.AddRow(link)
		  End If
		  
		  Return links
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreatePolygon(vertices() As PKVector2) As PKPolygon
		  ///
		  ' Returns a new Polygon with the given vertices.
		  '
		  ' This method makes a copy of both the array and the vertices within the array to 
		  ' create the new Polygon.
		  '
		  ' The centre of the Polygon will be computed using the area weighted method.
		  '
		  ' - Parameter vertices: The array of vertices.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: NilObjectException if `vertices` is Nil or an element of `vertices` is Nil.
		  ' - Raises: InvalidArgumentException if `vertices` contains less than 3 non-Nil vertices.
		  ///
		  
		  // Check the vertices array.
		  If vertices = Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_VERTICES_ARRAY)
		  
		  // Loop over the points and copy them.
		  Var verts() As PKVector2
		  For Each vertex As PKVector2 In vertices
		    // Check for Nil points.
		    If vertex <> Nil Then
		      verts.AddRow(vertex.Copy)
		    Else
		      Raise New NilObjectException(PKMessages.GEOMETRY_NIL_POLYGON_POINT)
		    End If
		  Next vertex
		  
		  Return New PKPolygon(verts)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720506F6C79676F6E20696E20746865207368617065206F6620612063617073756C65207573696E672060636F756E7460206E756D626572206F66207665727469636573206F6E2065616368206361702C2063656E7465726564206F6E20746865206F726967696E2E202054686520636170732077696C6C206265206F6E2074686520656E6473206F6620746865206C6172676573742064696D656E73696F6E2E205468652072657475726E656420706F6C79676F6E2077696C6C2068617665206034202B2032202A20636F756E7460206E756D626572206F662076657274696365732E
		Shared Function CreatePolygonalCapsule(count As Integer, width As Double, height As Double) As PKPolygon
		  ///
		  ' Creates a new Polygon in the shape of a capsule using `count` number of vertices on each
		  ' cap, centered on the origin.  The caps will be on the ends of the largest dimension.
		  '
		  ' The returned polygon will have `4 + 2 * count` number of vertices.
		  '
		  ' - Parameter count: The number of vertices to use for one cap. Must be >= 1.
		  ' - Parameter width: The bounding rectangle width.
		  ' - Parameter height: The bounding rectangle height.
		  '
		  ' - Returns: A new Polygon.
		  ///
		  
		  // Validate the input.
		  If count < 1 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_CAPSULE_INVALID_COUNT)
		  If width <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_CAPSULE_INVALID_WIDTH)
		  If height <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_CAPSULE_INVALID_HEIGHT)
		  
		  // If the width and height are close enough to being equal, just return a circle.
		  If Abs(width - height) < PKEpsilon.E Then
		    Return PKGeometry.CreatePolygonalCircle(count, width)
		  End If
		  
		  // Compute the angular increment.
		  Var pin As Double = MathsKit.PI / (count + 1)
		  
		  // 4 rect verts plus 2 * circle half verts.
		  Var vertices() As PKVector2
		  vertices.ResizeTo((4 + 2 * count) - 1)
		  
		  Var c As Double = Cos(pin)
		  Var s As Double = Sin(pin)
		  Var t As Double = 0
		  
		  // Get the major and minor axes.
		  Var major As Double = width
		  Var minor As Double = height
		  Var vertical As Boolean = False
		  If width < height Then
		    major = height
		    minor = width
		    vertical = True
		  End If
		  
		  // Get the radius from the minor axis.
		  Var radius As Double = minor * 0.5
		  
		  // Compute the x/y offsets.
		  Var offset As Double = major * 0.5 - radius
		  Var ox As Double = 0
		  Var oy As Double = 0
		  If vertical Then
		    // Aligned to the y.
		    oy = offset
		  Else
		    // Aligned to the x.
		    ox = offset
		  End If
		  
		  Var n As Integer = 0
		  
		  // Right cap.
		  Var ao As Double = If(vertical, 0, MathsKit.PI * 0.5)
		  Var x As Double = radius * Cos(pin - ao)
		  Var y As Double = radius * Sin(pin - ao)
		  
		  Var iLimit As Integer = count - 1
		  For i As Integer = 0 To iLimit
		    vertices(n) = New PKVector2(x + ox, y + oy)
		    n = n + 1
		    
		    // Apply the rotation matrix.
		    t = x
		    x = c * x - s * y
		    y = s * t + c * y
		  Next i
		  
		  // Add in top/left vertices.
		  If vertical Then
		    vertices(n) = New PKVector2(-radius,  oy)
		    n =n + 1
		    vertices(n) = New PKVector2(-radius, -oy)
		    n = n + 1
		  Else
		    vertices(n) = New PKVector2(ox, radius)
		    n = n + 1
		    vertices(n) = New PKVector2(-ox, radius)
		    n =n + 1
		  End If
		  
		  // Left cap.
		  ao = If(vertical, MathsKit.PI, MathsKit.PI * 0.5)
		  x = radius * Cos(pin + ao)
		  y = radius * Sin(pin + ao)
		  iLimit = count - 1
		  For i As Integer = 0 To iLimit
		    vertices(n) = New PKVector2(x - ox, y - oy)
		    n = n + 1
		    
		    // Apply the rotation matrix.
		    t = x
		    x = c * x - s * y
		    y = s * t + c * y
		  Next i
		  
		  // Add in bottom/right vertices.
		  If vertical Then
		    vertices(n) = New PKVector2(radius, -oy)
		    n =n + 1
		    vertices(n) = New PKVector2(radius,  oy)
		    n =n + 1
		  Else
		    vertices(n) = New PKVector2(-ox, -radius)
		    n = n + 1
		    vertices(n) = New PKVector2(ox, -radius)
		    n = n + 1
		  End If
		  
		  Return New PKPolygon(vertices)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720506F6C79676F6E20696E20746865207368617065206F66206120636972636C65207769746820636F756E74206E756D626572206F662076657274696365732063656E7465726564206F6E20746865206F726967696E2E
		Shared Function CreatePolygonalCircle(count As Integer, radius As Double) As PKPolygon
		  ///
		  ' Creates a new Polygon in the shape of a circle with count number of vertices centered
		  ' on the origin.
		  '
		  ' - Parameter count: The number of vertices to use. Must be greater than 2.
		  ' - Parameter radius: The radius of the circle. Must be greater than zero.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: InvalidArgumentException if `count` < 3 or `radius` <= 0.
		  ///
		  
		  Return PKGeometry.CreatePolygonalCircle(count, radius, 0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720506F6C79676F6E20696E20746865207368617065206F66206120636972636C65207769746820636F756E74206E756D626572206F662076657274696365732063656E7465726564206F6E20746865206F726967696E2E
		Shared Function CreatePolygonalCircle(count As Integer, radius As Double, theta As Double) As PKPolygon
		  ///
		  ' Creates a new Polygon in the shape of a circle with count number of vertices centered
		  ' on the origin.
		  '
		  ' - Parameter count: The number of vertices to use. Must be greater than or equal to 3.
		  ' - Parameter radius: The radius of the circle. Must be greater than zero.
		  ' - Parameter theta: The radial offset for the points in radians.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: InvalidArgumentException if `count` < 3 or `radius` <= 0.
		  ///
		  
		  // Validate the input.
		  If count < 3 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_CIRCLE_INVALID_COUNT)
		  If radius <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_CIRCLE_INVALID_RADIUS)
		  
		  // Compute the angular increment.
		  Var pin As Double= PKGeometry.TWO_PI / count
		  
		  // Make sure the resulting output is an even number of vertices.
		  Var vertices() As PKVector2
		  vertices.ResizeTo(count - 1)
		  
		  Var c As Double = Cos(pin)
		  Var s As Double = Sin(pin)
		  Var t As Double = 0
		  
		  Var x As Double = radius
		  Var y As Double = 0
		  
		  // Initialise at theta if necessary.
		  If theta <> 0 Then
		    x = radius * Cos(theta)
		    y = radius * Sin(theta)
		  End If
		  
		  Var iLimit As Integer = vertices.LastRowIndex
		  For i As Integer = 0 To iLimit
		    vertices(i) = New PKVector2(x, y)
		    
		    // Apply the rotation matrix.
		    t = x
		    x = c * x - s * y
		    y = s * t + c * y
		  Next i
		  
		  Return New PKPolygon(vertices)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720506F6C79676F6E20696E20746865207368617065206F6620616E20656C6C6970736520776974682060636F756E7460206E756D626572206F662076657274696365732063656E7465726564206F6E20746865206F726967696E2E2060636F756E7460206D757374206265203E3D203420616E64206576656E2E
		Shared Function CreatePolygonalEllipse(count As Integer, width As Double, height As Double) As PKPolygon
		  ///
		  ' Creates a new Polygon in the shape of an ellipse with `count` number of vertices centered
		  ' on the origin.
		  '
		  ' - Parameter count: The number of vertices to use. Must be >= 4. 
		  '                    Should be even, if not, count - 1 vertices will be generated.
		  ' - Parameter width: The width of the ellipse.
		  ' - Parameter height: The height of the ellipse.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: InvalidlArgumentException if `count` < 4 or `width` <= 0 or `height` <= 0.
		  ///
		  
		  // Validate the input.
		  If count < 4 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_ELLIPSE_INVALID_COUNT)
		  If width <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_ELLIPSE_INVALID_WIDTH)
		  If height <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_ELLIPSE_INVALID_HEIGHT)
		  
		  Var a As Double = width * 0.5
		  Var b As Double = height * 0.5
		  
		  Var n2 As Integer = count / 2
		  // Compute the angular increment.
		  Var pin2 As Double = MathsKit.PI / n2
		  
		  // Make sure the resulting output is an even number of vertices.
		  Var vertices() As PKVector2
		  vertices.ResizeTo((n2 * 2) - 1)
		  
		  // Use the parametric equations:
		  // x = a * cos(t)
		  // y = b * sin(t)
		  Var j As Integer = 0
		  For i As Integer = 0 To n2
		    Var t As Double = pin2 * i
		    // Since the under side of the ellipse is the same as the top side, only with a 
		    // negated y, lets save some time by creating the under side at the same time.
		    Var x As Double = a * Cos(t)
		    Var y As Double = b * Sin(t)
		    If i > 0 Then vertices(vertices.Count - j) = New PKVector2(x, -y)
		    vertices(j) = New PKVector2(x, y)
		    j = j + 1
		  Next i
		  
		  Return New PKPolygon(vertices)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720506F6C79676F6E20696E20746865207368617065206F6620612068616C6620656C6C6970736520776974682060636F756E7460206E756D626572206F66207665727469636573207769746820746865206261736520617420746865206F726967696E2E2052657475726E73206120706F6C79676F6E20776974682060636F756E74202B2032602076657274696365732E
		Shared Function CreatePolygonalHalfEllipse(count As Integer, width As Double, height As Double) As PKPolygon
		  ///
		  ' Creates a new Polygon in the shape of a half ellipse with `count` number of vertices with the
		  ' base at the origin.
		  '
		  ' Returns a polygon with `count + 2` vertices.
		  '
		  ' The height is the total height of the half not the half height.
		  '
		  ' - Prameter count: The number of vertices to use. Must be >= 1.
		  ' - Parameter width: The width of the half ellipse.
		  ' - Parameter height: The height of the half ellipse. Should be the total height.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: InvalidArgumentException if `count` < 1 or `width` <= 0 or `height` <= 0.
		  ///
		  
		  // Validate the input.
		  If count < 1 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_HALF_ELLIPSE_INVALID_COUNT)
		  If width <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_HALF_ELLIPSE_INVALID_WIDTH)
		  If height <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_HALF_ELLIPSE_INVALID_HEIGHT)
		  
		  Var a As Double = width * 0.5
		  Var b As Double = height * 0.5
		  
		  // Compute the angular increment.
		  Var inc As Double = MathsKit.PI / (count + 1)
		  
		  // Make sure the resulting output is an even number of vertices.
		  Var vertices() As PKVector2
		  vertices.ResizeTo(count + 1)
		  
		  // Set the start and end vertices.
		  vertices(0) = New PKVector2(a, 0)
		  vertices(count + 1) = New PKVector2(-a, 0)
		  
		  // Use the parametric equations:
		  // x = a * cos(t)
		  // y = b * sin(t)
		  
		  For i As Integer = 1 To count
		    Var t As Double = inc * i
		    // Since the under side of the ellipse is the same as the top side, only with a 
		    // negated y, lets save some time by creating the under side at the same time.
		    Var x As Double = a * Cos(t)
		    Var y As Double = b * Sin(t)
		    vertices(i) = New PKVector2(x, y)
		  Next i
		  
		  Return New PKPolygon(vertices)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720506F6C79676F6E20696E20746865207368617065206F6620612068616C6620656C6C69707365207769746820636F756E74206E756D626572206F662076657274696365732063656E7465726564206F6E20746865206F726967696E2E2052657475726E73206120706F6C79676F6E20776974682060636F756E74202B2032602076657274696365732E
		Shared Function CreatePolygonalHalfEllipseAtOrigin(count As Integer, width As Double, height As Double) As PKPolygon
		  ///
		  ' Creates a new Polygon in the shape of a half ellipse with count number of vertices centered
		  ' on the origin.
		  '
		  ' Returns a polygon with `count + 2` vertices.
		  ' The height is the total height of the half not the half height.
		  '
		  ' - Parameter count: The number of vertices to use. 
		  '                    Should be even, if not, `count - 1` vertices will be generated.
		  ' - Parameter width:The width of the half ellipse.
		  ' - Parameter height: The height of the half ellipse. Should be the total height.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: InvalidArgumentException if `count` < 1 or `width` <= 0 or `height` <= 0.
		  ///
		  
		  Var polygon As PKPolygon= PKGeometry.CreatePolygonalHalfEllipse(count, width, height)
		  Var center As PKVector2 = polygon.GetCenter
		  polygon.Translate(-center.X, -center.Y)
		  Return polygon
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720506F6C79676F6E20696E20746865207368617065206F66206120536C69636520776974682060636F756E7460206E756D626572206F6620766572746963657320776974682074686520636972636C652063656E747265642063656E7465726564206F6E20746865206F726967696E2E
		Shared Function CreatePolygonalSlice(count As Integer, radius As Double, theta As Double) As PKPolygon
		  ///
		  ' Creates a new Polygon in the shape of a Slice with `count` number of vertices with the
		  ' circle centred centered on the origin.
		  '
		  ' This method returns a polygon with count + 3 vertices.
		  '
		  ' - Parameter count: The number of vertices to use. Must be >= 1.
		  ' - Parameter radius: The radius of the circle. Must be > 0.
		  ' - Parameter theta: The arc length of the slice in radians. Must be > 0.
		  '
		  ' - Returns: A new Polygon.
		  '
		  '- Raises: InvalidArgumentException thrown if `count` < 1 or `radius` <= 0 or or `theta` <= 0.
		  ///
		  
		  // Validate the input.
		  If count < 1 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_SLICE_INVALID_COUNT)
		  If radius <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_SLICE_INVALID_RADIUS)
		  If theta <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_SLICE_INVALID_THETA)
		  
		  // Compute the angular increment.
		  Var pin As Double = theta / (count + 1)
		  
		  // Make sure the resulting output is an even number of vertices.
		  Var vertices() As PKVector2
		  vertices.ResizeTo(count + 2)
		  
		  Var c As Double = Cos(pin)
		  Var s As Double = Sin(pin)
		  Var t As Double = 0
		  
		  // Initialise at minus theta.
		  Var x As Double = radius * Cos(-theta * 0.5)
		  Var y As Double = radius * Sin(-theta * 0.5)
		  
		  // Set the first and last points of the arc.
		  vertices(0) = New PKVector2(x, y)
		  vertices(count + 1) = New PKVector2(x, -y)
		  
		  For i As Integer = 1 To count
		    // Apply the rotation matrix.
		    t = x
		    x = c * x - s * y
		    y = s * t + c * y
		    // Add a point.
		    vertices(i) = New PKVector2(x, y)
		  Next i
		  
		  // Finish off by adding the origin.
		  vertices(count + 2) = New PKVector2
		  
		  Return New PKPolygon(vertices)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720506F6C79676F6E20696E20746865207368617065206F66206120536C696365207769746820636F756E74206E756D626572206F662076657274696365732063656E7465726564206F6E20746865206F726967696E2E2052657475726E73206120706F6C79676F6E20776974682060636F756E74202B2033602076657274696365732E
		Shared Function CreatePolygonalSliceAtOrigin(count As Integer, radius As Double, theta As Double) As PKPolygon
		  ///
		  ' Creates a new Polygon in the shape of a Slice with count number of vertices centered on the origin.
		  '
		  ' This method returns a polygon with `count + 3` vertices.
		  '
		  ' - Parameter count: The number of vertices to use. Must be >= 1.
		  ' - Parameter radius: The radius of the circle. Must be > 0.
		  ' - Parameter theta: The arc length of the slice in radians. Must be > 0.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: InvalidArgumentException thrown if `count` < 1 or `radius` <= 0 or `theta` <= 0.
		  ///
		  
		  Var polygon As PKPolygon= PKGeometry.CreatePolygonalSlice(count, radius, theta)
		  Var center As PKVector2 = polygon.GetCenter
		  polygon.Translate(-center.X, -center.Y)
		  Return polygon
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720506F6C79676F6E2C207573696E672074686520676976656E2076657274696365732C2063656E746572656420617420746865206F726967696E2E204D616B6573206120636F7079206F662074686520617272617920616E64207468652076657274696365732077697468696E2074686520617272617920746F2063726561746520746865206E657720506F6C79676F6E2E207468726F7773204E696C4F626A656374457863657074696F6E7320616E6420496E76616C6964417267756D656E74457863657074696F6E732E
		Shared Function CreatePolygonAtOrigin(vertices() As PKVector2) As PKPolygon
		  ///
		  ' Returns a new Polygon, using the given vertices, centered at the origin.
		  '
		  ' This method makes a copy of both the array and the vertices within the array to 
		  ' create the new Polygon.
		  '
		  ' This method translates the Polygon vertices so that the centre is at the origin.
		  '
		  ' - Parameter vertices: The array of vertices.
		  '
		  ' - Returns: A new Polygon.'
		  ' - Raises: NilObjectException if `vertices` is Nil or an element of vertices is Nil.
		  ' - Raises InvalidArgumentException if `vertices` contains less than 3 non-Nill vertices.
		  ///
		  
		  Var p As PKPolygon= PKGeometry.CreatePolygon(vertices)
		  Var center As PKVector2 = p.GetCenter
		  p.Translate(-center.X, -center.Y)
		  
		  Return p
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E65772052656374616E676C6520776974682074686520676976656E20776964746820286D2920616E642068656967687420286D292C202063656E746572656420617420746865206F726967696E2E
		Shared Function CreateRectangle(width As Double, height As Double) As PKRectangle
		  ///
		  ' Creates a new Rectangle with the given width and height centered at the origin.
		  '
		  ' - Parameter width: The width in metres.
		  ' - Parameter height: The height in metres.
		  '
		  ' - Returns: Rectangle.'
		  ' - Raises: InvalidArgumentException if width or height is less than or equal to zero.
		  ///
		  
		  Return New PKRectangle(width, height)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573206120726967687420616E676C6520547269616E676C652077697468207468652063656E74726520617420746865206F726967696E2E206077696474686020616E642060686569676874602061726520696E206D65747265732E2052616973657320496E76616C6964417267756D656E74457863657074696F6E732E
		Shared Function CreateRightTriangle(width As Double, height As Double) As PKTriangle
		  ///
		  ' Creates a right angle Triangle with the centre at the origin.
		  '
		  ' - Parameter width: The width of the base in metres.
		  ' - Parameter height: The height in metres.
		  '
		  ' - Returns: A new Triangle.
		  ' - Raises: InvalidArgumentException if `width` or `height` is less than or equal to zero.
		  ///
		  
		  Return PKGeometry.CreateRightTriangle(width, height, False)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573206120726967687420616E676C6520547269616E676C652077697468207468652063656E74726520617420746865206F726967696E2E206077696474686020616E642060686569676874602061726520696E206D65747265732E2052616973657320496E76616C6964417267756D656E74457863657074696F6E732E
		Shared Function CreateRightTriangle(width As Double, height As Double, mirror As Boolean) As PKTriangle
		  ///
		  ' Creates a right angle Triangle with the centre at the origin.
		  '
		  ' - Parameter width: The width of the base in metres.
		  ' - Parameter height: The height in metres.
		  ' - Parameter mirror: True if the triangle should be mirrored along the y-axis.
		  '
		  ' - Returns: A new Triangle.
		  ' - Raises: InvalidArgumentException if `width` or `height` is less than or equal to zero.
		  ///
		  
		  // Check the width.
		  If width <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_WIDTH)
		  
		  // Check the height.
		  If height <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_HEIGHT)
		  
		  Var top As PKVector2 = New PKVector2(0.0, height)
		  Var left As PKVector2 = New PKVector2(0.0, 0.0)
		  Var right As PKVector2 = New PKVector2(If(mirror, -width, width), 0.0)
		  
		  Var t As PKTriangle
		  If mirror Then
		    // Make sure it has anti-clockwise winding.
		    t = New PKTriangle(top, right, left)
		  Else
		    t = New PKTriangle(top, left, right)
		  End If
		  
		  Var center As PKVector2 = t.GetCenter
		  t.Translate(-center.X, -center.Y)
		  
		  Return t
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577205365676D656E742066726F6D20746865206F726967696E20746F2074686520676976656E20656E6420706F696E742E204D616B6573206120636F7079206F662074686520676976656E20706F696E7420746F2063726561746520746865205365676D656E742E20526169736573204E696C4F626A656374457863657074696F6E732E
		Shared Function CreateSegment(endPoint As PKVector2) As PKSegment
		  ///
		  ' Creates a new Segment from the origin to the given end point
		  '
		  ' This method makes a copy of the given point to create the Segment.
		  '
		  ' - Parameter endPoint: The end point.
		  '
		  ' - Returns: A new Segment.
		  '
		  ' - Raises: NilObjectException if `endPoint` is Nil.
		  ///
		  
		  Return PKGeometry.CreateSegment(New PKVector2, endPoint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577205365676D656E7420776974682074686520676976656E20706F696E74732E204D616B6573206120636F7079206F662074686520676976656E20706F696E747320746F2063726561746520746865205365676D656E742E205468652063656E747265206F6620746865205365676D656E742077696C6C206265207468652061766572616765206F66207468652074776F20706F696E74732E20526169736573204E696C4F626A656374457863657074696F6E732E
		Shared Function CreateSegment(p1 As PKVector2, p2 As PKVector2) As PKSegment
		  ///
		  ' Creates a new Segment with the given points.
		  '
		  ' This method makes a copy of the given points to create the Segment.
		  '
		  ' The centre of the Segment will be the average of the two points.
		  '
		  ' - Parameter p1: The first point.
		  ' - Parameter p2: The second point.
		  '
		  ' - Returns: A new Segment.
		  '
		  ' - Raises: NilObjectException if `p1` or `p2` is Nil.
		  ///
		  
		  If p1 Is Nil Or p2 Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_SEGMENT_POINT)
		  
		  Return New PKSegment(p1.Copy, p2.Copy)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577205365676D656E7420776974682074686520676976656E20706F696E74732E204D616B6573206120636F7079206F662074686520676976656E20706F696E747320746F2063726561746520746865205365676D656E742E20547472616E736C6174657320746865205365676D656E7420766572746963657320736F2074686174207468652063656E74726520697320617420746865206F726967696E2E20526169736573204E696C4F626A656374457863657074696F6E732E
		Shared Function CreateSegmentAtOrigin(p1 As PKVector2, p2 As PKVector2) As PKSegment
		  ///
		  ' Creates a new Segment with the given points.
		  '
		  ' This method makes a copy of the given points to create the Segment.
		  '
		  ' This method translates the Segment vertices so that the centre is at the origin.
		  '
		  ' - Parameter p1: The first point.
		  ' - Parameter p2: The second point.
		  '
		  ' - Returns: A new Segment.
		  '
		  ' - Raises: NilObjectException if `p1` or `p2` is Nil.
		  ///
		  
		  Var s As PKSegment= PKGeometry.createSegment(p1, p2)
		  Var center As PKVector2 = s.GetCenter
		  s.Translate(-center.X, -center.Y)
		  
		  Return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720536C69636520776974682074686520676976656E20636972636C652072616469757320616E6420617263206C656E6774682074686574612028696E2072616469616E73292E
		Shared Function CreateSlice(radius As Double, theta As Double) As PKSlice
		  ///
		  ' Creates a new Slice with the given circle radius and arc length theta.
		  '
		  ' A Slice is an arbitrary slice of a circle. The specified radius is the radius
		  ' 0f the circle. The slice will be positioned With the _circle centre_ on the origin.
		  '
		  ' Theta is the total arc length of the slice specified in radians. Theta is halved, putting
		  ' half the arc length below the x-axis and half above.
		  '
		  ' Theta cannot be greater than π.
		  '
		  ' - Parameter radius: The circle radius.
		  ' - Parameter theta: The total arc length in radians.
		  '
		  ' - Returns: A new Slice.
		  '
		  ' - Raises: InvalidArgumentException if radius is <= 0, if theta <= 0 or theta > π.
		  ///
		  
		  Return New PKSlice(radius, theta)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720536C69636520776974682074686520676976656E20636972636C652072616469757320616E6420617263206C656E6774682074686574612028696E2072616469616E73292E2054686520736C6963652077696C6C20626520706F736974696F6E65642077697468207468652063656E74726F696420617420746865206F726967696E2E
		Shared Function CreateSliceAtOrigin(radius As Double, theta As Double) As PKSlice
		  ///
		  ' Creates a new Slice with the given circle radius and arc length theta.
		  '
		  ' A Slice is an arbitrary slice of a circle. The specified radius is the radius
		  ' of the circle. The slice will be positioned with the _centroid_ at the origin.
		  '
		  ' Theta is the total arc length of the slice specified in radians. Theta is halved, putting
		  ' half the arc length below the x-axis and half above.
		  '
		  ' Theta cannot be greater than π.
		  '
		  ' - Parameter radius: The circle radius.
		  ' - Parameter theta: The total arc length in radians.
		  '
		  ' - Returns: A new Slice.
		  '
		  ' - Raises: InvalidArgumentException if radius <= 0, if theta <= 0 or theta > π.
		  ///
		  
		  Var slice As PKSlice = New PKSlice(radius, theta)
		  slice.Translate(-slice.Center.X, -slice.Center.Y)
		  
		  Return slice
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320612073717561726520776974682074686520676976656E2073697A652028696E206D6574726573292C2063656E746572656420617420746865206F726967696E2E205468726F777320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function CreateSquare(size As Double) As PKRectangle
		  ///
		  ' Creates a square (equal height and width Rectangle) with the given size, centered at the origin.
		  '
		  ' - Parameter size: The size in metres.
		  '
		  ' - Returns: Rectangle.
		  '
		  ' - Raises: InvalidArgumentException if size is less than or equal to zero.
		  ///
		  
		  // Check the size.
		  If size <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_SIZE)
		  
		  Return New PKRectangle(size, size)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720547269616E676C652C207573696E672074686520676976656E20706F696E74732E204D616B6573206120636F7079206F662074686520676976656E20706F696E747320746F206372656174652074686520547269616E676C652E20526169736573204E696C4F626A656374457863657074696F6E732E
		Shared Function CreateTriangle(p1 As PKVector2, p2 As PKVector2, p3 As PKVector2) As PKTriangle
		  ///
		  ' Creates a new Triangle, using the given points.
		  '
		  ' This method makes a copy of the given points to create the Triangle.
		  '
		  ' The centre of the Triangle will be computed using the area weighted method.
		  '
		  ' - Parameter p1: The first point.
		  ' - Parameter p2: The second point.
		  ' - Parameter p3: The third point.
		  '
		  ' - Returns: A new Triangle.
		  '
		  ' - Raises: NiObjectException if `p1`, `p2`, or `p3` is Nil.
		  ///
		  
		  If p1 Is Nil Or p2 Is Nil Or p3 Is Nil Then
		    Raise New NilObjectException(PKMessages.GEOMETRY_NIL_TRIANGLE_POINT)
		  End If
		  
		  Return New PKTriangle(p1.Copy, p2.Copy, p3.Copy)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720547269616E676C6520776974682074686520676976656E20706F696E74732063656E746572656420617420746865206F726967696E2E204D616B6573206120636F7079206F662074686520676976656E20706F696E747320746F206372656174652074686520547269616E676C652E20526169736573204E696C4F626A656374457863657074696F6E732E
		Shared Function CreateTriangleAtOrigin(p1 As PKVector2, p2 As PKVector2, p3 As PKVector2) As PKTriangle
		  ///
		  ' Creates a new Triangle with the given points centered at the origin.
		  '
		  ' This method makes a copy of the given points to create the Triangle.
		  '
		  ' - Parameter p1: The first point.
		  ' - Parameter p2: The second point.
		  ' - Parameter p3: The third point.
		  '
		  ' - Returns: A new Triangle.'
		  ' - Raises: NilObjectException if `p1`, `p2`, or `p3` is Nil.
		  ///
		  
		  Var t As PKTriangle= PKGeometry.CreateTriangle(p1, p2, p3)
		  Var center As PKVector2 = t.GetCenter
		  t.Translate(-center.X, -center.Y)
		  
		  Return t
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E65772020506F6C79676F6E20776974682060636F756E7460206E756D626572206F6620706F696E74732C2077686572652074686520706F696E747320617265206576656E6C792064697374726962757465642061726F756E642074686520756E697420636972636C652E202054686520726573756C74696E6720506F6C79676F6E2077696C6C2062652063656E7465726564206F6E20746865206F726967696E2E
		Shared Function CreateUnitCirclePolygon(count As Integer, radius As Double) As PKPolygon
		  ///
		  ' Returns a new  Polygon with `count` number of points, where the points are 
		  ' evenly distributed around the unit circle.  The resulting Polygon will be centered on the origin.
		  '
		  ' The radius parameter is the distance from the centre of the polygon to each vertex.
		  '
		  ' - Parameter count: The number of vertices.
		  ' - Parameter radius: The radius from the centre to each vertex in meters.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: InvalidArgumentException if `count` < 3 or radius <= 0.
		  ///
		  
		  Return PKGeometry.CreateUnitCirclePolygon(count, radius, 0.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720506F6C79676F6E207769746820636F756E74206E756D626572206F6620706F696E74732C2077686572652074686520706F696E747320617265206576656E6C792064697374726962757465642061726F756E642074686520756E697420636972636C652E2054686520726573756C74696E6720506F6C79676F6E2077696C6C2062652063656E7465726564206F6E20746865206F726967696E2E
		Shared Function CreateUnitCirclePolygon(count As Integer, radius As Double, theta As Double) As PKPolygon
		  ///
		  ' Returns a new Polygon with count number of points, where the points are evenly 
		  ' distributed around the unit circle. The resulting Polygon will be centered on the origin.
		  '
		  ' The `radius` parameter is the distance from the centre of the polygon to each vertex.
		  ' The `theta` parameter is a vertex angle offset used to rotate all the vertices by the given amount.
		  '
		  ' - Parameter count: The number of vertices.
		  ' - Parameter radius: The radius from the centre to each vertex in meters.
		  ' - Parameter theta: The vertex angle offset in radians.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: InvalidArgumentException if `count` < 3 or `radius` <= 0.
		  ///
		  
		  // Check the count.
		  If count < 3 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_VERTICES_SIZE)
		  
		  // Check the radius.
		  If radius <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_RADIUS)
		  
		  // Call the more efficient method here.
		  Return PKGeometry.CreatePolygonalCircle(count, radius, theta)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577205365676D656E7420776974682074686520676976656E206C656E6774682077697468207468652063656E74726520617420746865206F726967696E2E20606C656E6774686020697320696E206D65747265732E2052616973657320496E76616C6964417267756D656E74457863657074696F6E732E
		Shared Function CreateVerticalSegment(length As Double) As PKSegment
		  ///
		  ' Creates a new Segment with the given length with the centre at the origin.
		  '
		  ' - Parameter length: The length of the segment in metres.
		  '
		  ' - Returns: A new Segment.
		  '
		  ' - Raises: InvalidArgumentException if `length` is less than or equal to zero.
		  ///
		  
		  // Check the length.
		  If length <= 0.0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_LENGTH)
		  
		  Var start As PKVector2 = New PKVector2(0.0, -length * 0.5)
		  Var endPoint As PKVector2 = New PKVector2(0.0, length * 0.5)
		  
		  Return New PKSegment(start, endPoint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 466C6970732074686520676976656E20706F6C79676F6E2061626F75742074686520676976656E206C696E6520616E642072657475726E732074686520726573756C742061732061206E657720506F6C79676F6E2E2054686973206D6574686F6420617373756D6573207468617420746865206C696E65206973207468726F75676820746865206F726967696E2E
		Shared Function Flip(polygon As PKPolygon, axis As PKVector2) As PKPolygon
		  ///
		  ' Flips the given polygon about the given line and returns the result as a new Polygon.
		  '
		  ' This method assumes that the line is through the origin.
		  '
		  ' - Parameter polygon: The polygon to flip.
		  ' - Parameter axis:The axis to flip about.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: NilObjectException if the given polygon or axis is Nil.
		  ' - Raises: InvalidArgumentException if the given axis is the zero vector.
		  ///
		  
		  Return PKGeometry.Flip(polygon, axis, Nil)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Flip(polygon As PKPolygon, axis As PKVector2, point As PKVector2) As PKPolygon
		  ///
		  ' Flips the given polygon about the given line and returns the result as a new Polygon.
		  '
		  ' - Parameter polygon: The polygon to flip.
		  ' - Parameter axis: The axis to flip about.
		  ' - Parameter point: The point to flip about. If Nil, the polygon's centre is used.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: NilObjectException if the given polygon or axis is Nil.
		  ' - Raises: InvalidArgumentException if the given axis is the zero vector.
		  ///
		  
		  // Check for valid input.
		  If polygon Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_FLIP_POLYGON)
		  If axis Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_FLIP_AXIS)
		  If axis.IsZero Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_ZERO_FLIP_AXIS)
		  
		  // Just use the centre of the polygon if the given point is Nil.
		  If point Is Nil Then point = polygon.GetCenter
		  
		  // Flip about the axis and point. Make sure the axis is normalised.
		  Call axis.Normalise
		  Var pv() As PKVector2 = polygon.GetVertices
		  Var nv() As PKVector2
		  nv.ResizeTo(pv.Count - 1)
		  Var iLimit As Integer = pv.Count - 1
		  For i As Integer = 0 To iLimit
		    Var v0 As PKVector2 = pv(i)
		    
		    // Centre on the origin.
		    Var v1 As PKVector2 = v0.Difference(point)
		    
		    // Get the projection of the point onto the axis.
		    Var proj As Double = v1.Dot(axis)
		    
		    // Get the point on the axis.
		    Var vp As PKVector2 = axis.Product(proj)
		    
		    // Get the point past the projection.
		    Var rv As PKVector2 = vp.Add(vp.X - v1.X, vp.Y - v1.Y)
		    nv(i) = rv.Add(point)
		  Next i
		  
		  // Check the winding.
		  If PKGeometry.GetWinding(nv) < 0 Then PKGeometry.ReverseWinding(nv)
		  
		  Return New PKPolygon(nv)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 466C6970732074686520676976656E20706F6C79676F6E2061626F7574206974732063656E74657220616C6F6E672074686520782D6178697320616E642072657475726E732074686520726573756C742061732061206E657720506F6C79676F6E2E20417373756D6573207468617420746865206C696E65206973207468726F75676820746865206F726967696E2E
		Shared Function FlipAlongTheXAxis(polygon As PKPolygon) As PKPolygon
		  ///
		  ' Flips the given polygon about its center along the x-axis and returns the result as a new Polygon.
		  '
		  ' This method assumes that the line is through the origin.
		  '
		  ' - Parameter polygon: The polygon to flip.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: NilObjectException if the given polygon is Nil.
		  ///
		  
		  Return PKGeometry.Flip(polygon, PKVector2.X_AXIS, Nil)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 466C6970732074686520676976656E20706F6C79676F6E2061626F75742074686520676976656E20706F696E7420616C6F6E672074686520782D6178697320616E642072657475726E732074686520726573756C742061732061206E657720506F6C79676F6E2E
		Shared Function FlipAlongTheXAxis(polygon As PKPolygon, point As PKVector2) As PKPolygon
		  ///
		  ' Flips the given polygon about the given point along the x-axis and 
		  ' returns the result as a new Polygon.
		  '
		  ' - Parameter polygon: The polygon to flip.
		  ' - Parameter point: The point to flip about.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: NilObjectException if the given polygon is Nil.
		  ///
		  
		  Return PKGeometry.Flip(polygon, PKVector2.X_AXIS, point)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 466C6970732074686520676976656E20706F6C79676F6E2061626F7574206974732063656E74657220616C6F6E672074686520792D6178697320616E642072657475726E732074686520726573756C742061732061206E657720506F6C79676F6E2E20417373756D6573207468617420746865206C696E65206973207468726F75676820746865206F726967696E2E
		Shared Function FlipAlongTheYAxis(polygon As PKPolygon) As PKPolygon
		  ///
		  ' Flips the given polygon about its center along the y-axis and returns the result as a new Polygon.
		  '
		  ' This method assumes that the line is through the origin.
		  '
		  ' - Parameter polygon: The polygon to flip.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: NilObjectException if the given polygon is Nil.
		  ///
		  
		  Return PKGeometry.Flip(polygon, PKVector2.Y_AXIS, Nil)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 466C6970732074686520676976656E20706F6C79676F6E2061626F75742074686520676976656E20706F696E7420616C6F6E672074686520792D6178697320616E642072657475726E732074686520726573756C742061732061206E657720506F6C79676F6E2E
		Shared Function FlipAlongTheYAxis(polygon As PKPolygon, point As PKVector2) As PKPolygon
		  ///
		  ' Flips the given polygon about the given point along the y-axis and
		  ' returns the result as a new Polygon.
		  '
		  ' - Parameter polygon: The polygon to flip.
		  ' - Parameter point: The point To flip about.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: NilObjectException if the given Polygon is Nil.
		  ///
		  
		  Return PKGeometry.Flip(polygon, PKVector2.Y_AXIS, point)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520617265612077656967687465642063656E74726F696420666F722074686520676976656E20706F696E74732E
		Shared Function GetAreaWeightedCenter(points() As PKVector2) As PKVector2
		  ///
		  ' Returns the area weighted centroid for the given points.
		  '
		  ' A Polygon's centroid must be computed by the area weighted method since the
		  ' average method can be bias to one side if there are more points on that one
		  ' side than another.
		  '
		  ' - Parameter points: The Polygon points.
		  ' 
		  ' - Returns: The area weighted centroid as a PKVector2.
		  '
		  ' - Raises: NilObjectException if `points` is Nil or an element of `points` is Nil.
		  ' - Raises: InvalidArgumentException if `points` is empty.
		  ///
		  
		  // Calculate the average centre.
		  // Note that this also performs the necessary checks and raises any exceptions needed.
		  Var ac As PKVector2= PKGeometry.GetAverageCenter(points)
		  Var size As Integer = points.Count
		  
		  // Otherwise perform the computation.
		  Var center As PKVector2 = New PKVector2
		  Var area As Double = 0.0
		  // Loop through the vertices.
		  Var iLimit As Integer = size - 1
		  For i As Integer = 0 To iLimit
		    // Get two vertices.
		    Var p1 As PKVector2 = points(i)
		    Var p2 As PKVector2 = If(i + 1 < size, points(i + 1), points(0))
		    p1 = p1.Difference(ac)
		    p2 = p2.Difference(ac)
		    // Perform the cross product (yi * x(i+1) - y(i+1) * xi)
		    Var d As Double = p1.Cross(p2)
		    // Multiply by half.
		    Var triangleArea As Double = 0.5 * d
		    // Add it to the total area.
		    area = area + triangleArea
		    
		    // Area weighted centroid
		    // (p1 + p2) * (D / 3)
		    // = (x1 + x2) * (yi * x(i+1) - y(i+1) * xi) / 3
		    // We will divide by the total area later.
		    Call center.Add(p1.Add(p2).Multiply(INV_3).Multiply(triangleArea))
		  Next i
		  
		  // Check for zero area.
		  If Abs(area) <= PKEpsilon.E Then
		    // Zero area can only happen if all the points are the same point 
		    // in which case just return a copy of the first.
		    Return points(0).Copy
		  End If
		  
		  // Finish the centroid calculation by dividing by the total area.
		  Call center.Divide(area).Add(ac)
		  
		  // Return the centre.
		  Return center
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652063656E74726F6964206F662074686520676976656E20706F696E747320627920706572666F726D696E6720616E20617665726167652E
		Shared Function GetAverageCenter(points() As PKVector2) As PKVector2
		  ///
		  ' Returns the centroid of the given points by performing an average.
		  '
		  ' - Parameter points: The list of points.
		  '
		  '- Returns: The centroid as a PKVector2.
		  '
		  ' - Raises: NilObjectException if `points` is Nil or an element of `points` is Nil.
		  ' - Raises: InvalidArgumentException if `points` is an empty array.
		  ///
		  
		  // Check for Nil array
		  If points = Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_POINT_ARRAY)
		  
		  // Check for an empty array.
		  If points.Count = 0 Then
		    Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_SIZE_POINT_ARRAY1)
		  End If
		  
		  // Get the size.
		  Var size As Integer = points.Count
		  
		  // Check for an array of one point.
		  If size = 1 Then
		    Var p As PKVector2 = points(0)
		    // Make sure it's not Nil.
		    If p Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_POINT_ARRAY_ELEMENTS)
		    // Return a copy.
		    Return p.Copy
		  End If
		  
		  // Otherwise perform the average.
		  Var ac As PKVector2 = New PKVector2
		  For Each point As PKVector2 In points
		    // Check for Nil.
		    If point Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_POINT_ARRAY_ELEMENTS)
		    Call ac.Add(point)
		  Next point
		  
		  Return ac.Divide(size)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320616E206172726179206F66206E6F726D616C6973656420766563746F727320726570726573656E74696E6720746865206E6F726D616C73206F6620616C6C2074686520656467657320676976656E207468652076657274696365732E
		Shared Function GetCounterClockwiseEdgeNormals(vertices() As PKVector2) As PKVector2()
		  ///
		  ' Returns an array of normalised vectors representing the normals of all the
		  ' edges given the vertices.
		  '
		  ' This method assumes counter-clockwise ordering.
		  '
		  ' - Parameter vertices: The vertices.
		  '
		  ' - Returns PKVector2 array or Nil if the given `vertices` array is Nil or empty.
		  '
		  ' - Raises: NilObjectException if `vertices` contains a Nil element.
		  ///
		  
		  If vertices = Nil Then Return Nil
		  
		  Var size As Integer = vertices.Count
		  If size = 0 Then Return Nil
		  
		  Var normals() As PKVector2
		  normals.ResizeTo(size - 1)
		  Var iLimit As Integer = size - 1
		  For i As Integer = 0 To iLimit
		    // Get the edge points.
		    Var p1 As PKVector2 = vertices(i)
		    Var p2 As PKVector2 = If((i + 1 = size), vertices(0), vertices(i + 1))
		    // Create the edge and get its left perpedicular vector.
		    Var n As PKVector2 = p1.Towards(p2).Left
		    // Normalise it.
		    Call n.Normalise
		    normals(i) = n
		  Next i
		  
		  Return normals
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D6178696D756D20726164697573206F662074686520676976656E20766572746963657320726F74617465642061626F757420746865206F726967696E2E20496620746865207665727469636573206172726179206973204E696C206F7220656D7074792C207A65726F2069732072657475726E65642E
		Shared Function GetRotationRadius(ParamArray vertices As PKVector2) As Double
		  ///
		  ' Returns the maximum radius of the given vertices rotated about the origin.
		  '
		  ' If the vertices array is Nil or empty, zero is returned.
		  '
		  ' - Parameter vertices: The polygon vertices.
		  '
		  '- Returns: Double.
		  ///
		  
		  Return PKGeometry.GetRotationRadius(New PKVector2, vertices)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D6178696D756D20726164697573206F662074686520676976656E20766572746963657320726F74617465642061626F75742074686520676976656E2063656E7472652E204966207468652060766572746963657360206172726179206973204E696C206F7220656D7074792C207A65726F2069732072657475726E65642E204966206063656E74657260206973204E696C20746865206F726967696E2077696C6C206265207573656420696E73746561642E
		Shared Function GetRotationRadius(center As PKVector2, vertices() As PKVector2) As Double
		  ///
		  ' Returns the maximum radius of the given vertices rotated about the given center.
		  '
		  ' If the vertices array is Nil or empty, zero is returned.
		  ' If center is Nil the origin will be used instead.
		  '
		  ' - Parameter center: The center point.
		  ' - Parameter vertices: The polygon vertices.
		  '
		  ' - Returns: Double.
		  ///
		  
		  // Validate the vertices.
		  If vertices = Nil Then Return 0.0
		  
		  // Validate the centre.
		  If center = Nil Then center = New PKVector2
		  
		  // Validate the length.
		  If vertices.Count = 0 Then Return 0.0
		  
		  // Find the maximum radius from the centre.
		  Var r2 As Double = 0.0
		  For Each v As PKVector2 In vertices
		    // Validate each vertex.
		    If v <> Nil Then
		      Var r2t As Double = center.DistanceSquared(v)
		      // Keep the largest.
		      r2 = Max(r2, r2t)
		    End If
		  Next v
		  
		  // Set the radius.
		  Return Sqrt(r2)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652077696E64696E672C20436C6F636B77697365206F7220436F756E7465722D436C6F636B776973652C20666F722074686520676976656E206172726179206F6620706F696E7473206F66206120706F6C79676F6E2E2052657475726E73206E6567617469766520666F7220436C6F636B776973652077696E64696E673B20706F73697469766520666F7220436F756E7465722D436C6F636B776973652077696E64696E672E20526169736573204E696C4F626A656374457863657074696F6E7320616E6420496E76616C6964417267756D656E74457863657074696F6E732E
		Shared Function GetWinding(points() As PKVector2) As Double
		  ///
		  ' Returns the winding, Clockwise or Counter-Clockwise, for the given array of points of a polygon.
		  '
		  ' This method determines the winding by computing a signed "area".
		  '
		  ' - Parameter points: The points of a polygon.
		  '
		  ' - Returns: Negative for Clockwise winding positive for Counter-Clockwise winding.
		  '
		  ' - Raises: NilObjectException if `points` is Nil or an element of points is Nil.
		  ' - Raises: InvalidArgumentException if `points` contains less than 2 elements
		  ///
		  
		  // Check for a Nil array.
		  If points Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_POINT_ARRAY)
		  
		  // Get the size.
		  Var size As Integer = points.Count
		  
		  // the Size must be larger than 1.
		  If size < 2 then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_SIZE_POINT_ARRAY2)
		  
		  // Determine the winding by computing a signed "area".
		  Var area As Double = 0.0
		  Var iLimit As Integer = size - 1
		  For i As Integer = 0 To iLimit
		    // Get the current point and the next point.
		    Var p1 As PKVector2 = points(i)
		    Var p2 As PKVector2 = points(If(i + 1 = size, 0, i + 1))
		    
		    // Check for Nil.
		    If p1 Is Nil Or p2 Is Nil Then
		      Raise New NilObjectException(PKMessages.GEOMETRY_NIL_POINT_ARRAY_ELEMENTS)
		    End If
		    
		    // Add the signed area.
		    area = area + p1.Cross(p2)
		  Next i
		  
		  // Return the area.
		  Return area
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 506572666F726D7320746865204D696E6B6F77736B692053756D206F662074686520676976656E20506F6C79676F6E20616E6420436972636C652E20557365207468652060636F756E746020706172616D6574657220746F207370656369667920746865206E756D626572206F6620766572746963657320746F207573652070657220726F756E6420636F726E65722E
		Shared Function MinkowskiSum(circle As PKCircle, polygon As PKPolygon, count As Integer) As PKPolygon
		  ///
		  ' Performs the Minkowski Sum of the given Polygon and Circle.
		  '
		  ' Use the count parameter to specify the number of vertices to use per round corner.
		  '
		  ' If the given polygon has _n_ number of vertices, the returned polygon will have 
		  ' _n * 2 + n * count_ number of vertices.
		  '
		  ' This method is O(n) where n is the number of vertices in the given polygon.
		  '
		  ' - Parameter polygon: The polygon.
		  ' - Parameter circle: The circle to add to the polygon.
		  ' - Parameter count: The number of vertices to add for each rounded corner. Must be greater than zero.
		  '
		  ' - Returns: Polygon.
		  '
		  ' - Raises: NilObjectException if the given polygon or circle is Nil.
		  ' - Raises: InvalidArgumentException if the given radius or count is less than or equal to zero.
		  ///
		  
		  Return PKGeometry.MinkowskiSum(polygon, circle, count)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720706F6C79676F6E207468617420686173206265656E2072616469616C6C7920657870616E6465642E2054686973206973206571756976616C656E7420746F20746865204D696E6B6F77736B692073756D206F66206120636972636C652C206F662074686520676976656E207261646975732C20616E642074686520676976656E20706F6C79676F6E2E
		Shared Function MinkowskiSum(polygon As PKPolygon, radius As Double, count As Integer) As PKPolygon
		  ///
		  ' Returns a new polygon that has been radially expanded. This is equivalent to the Minkowski sum of
		  ' a circle, of the given radius, and the given polygon.
		  '
		  ' Use the `count` parameter to specify the number of vertices to use per round corner.
		  '
		  ' If the given polygon has _n_ number of vertices, the returned polygon will have 
		  ' _n * 2 + n * count_ number of vertices.
		  '
		  ' This method is O(n) where n is the number of vertices in the given polygon.
		  '
		  ' - Parameter polygon: The polygon to expand radially.
		  ' - Parameter radius: The radial expansion. Must be greater than zero.
		  ' - Parameter count: The number of vertices to add for each rounded corner. Must be greater than zero.
		  '
		  ' - Returns: Polygon.
		  '
		  ' - Raises: NilObjectrException if the given polygon is Nil.
		  ' - Raises: InvalidArgumentException if the given radius or count is less than or equal to zero.
		  ///
		  
		  // check for valid input
		  If polygon Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_MINKOWSKI_SUM_POLYGON)
		  If radius <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_MINKOWSKI_SUM_RADIUS)
		  If count <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_MINKOWSKI_SUM_COUNT)
		  
		  Var vertices() As PKVector2 = polygon.Vertices
		  Var normals() As PKVector2 = polygon.Normals
		  Var size As Integer = vertices.Count
		  
		  Var nVerts() As PKVector2
		  nVerts.ResizeTo((size * 2 + size * count) - 1)
		  
		  // Perform the expansion.
		  Var j As Integer = 0
		  Var iLimit As Integer = size - 1
		  For i As Integer = 0 To iLimit
		    Var v1 As PKVector2 = vertices(i)
		    Var v2 As PKVector2 = vertices(If(i + 1 = size, 0, i + 1))
		    Var normal As PKVector2 = normals(i)
		    Var nv1 As PKVector2 = normal.Product(radius).Add(v1)
		    Var nv2 As PKVector2 = normal.Product(radius).Add(v2)
		    
		    // Generate the previous polygonal arc with count vertices.
		    // Compute (circular) angle between the edges.
		    Var cv1 As PKVector2
		    If i = 0 Then
		      // If it's the first iteration, then we need to compute the last vertex's new position.
		      Var tn As PKVector2 = normals(size - 1)
		      cv1 = v1.Towards(tn.Product(radius).Add(v1))
		    Else
		      cv1 = v1.Towards(nVerts(j - 1))
		    End If
		    Var cv2 As PKVector2 = v1.Towards(nv1)
		    Var theta As Double = cv1.GetAngleBetween(cv2)
		    
		    // Compute the angular increment.
		    Var pin As Double = theta / (count + 1)
		    
		    Var c As Double = Cos(pin)
		    Var s As Double = Sin(pin)
		    Var t As Double = 0
		    
		    // Compute the start theta.
		    Var sTheta As Double = PKVector2.X_AXIS.GetAngleBetween(normals(If(i - 1 < 0, size - 1, i - 1)))
		    If sTheta < 0 Then
		      sTheta = sTheta + PKGeometry.TWO_PI
		    End If
		    
		    // Initialise at minus theta.
		    Var x As Double = radius * Cos(sTheta)
		    Var y As Double = radius * Sin(sTheta)
		    
		    Var kLimit As Integer = count - 1
		    For k As Integer = 0 To kLimit
		      // aAply the rotation matrix.
		      t = x
		      x = c * x - s * y
		      y = s * t + c * y
		      
		      // Add a point.
		      nVerts(j) = New PKVector2(x, y)
		      Call nverts(j).Add(v1)
		      j = j + 1
		    Next k
		    
		    nVerts(j) = nv1
		    j = j + 1
		    nVerts(j) = nv2
		    j = j + 1
		  Next i
		  
		  Return New PKPolygon(nVerts)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 506572666F726D7320746865204D696E6B6F77736B692053756D206F662074686520676976656E20506F6C79676F6E20616E6420436972636C652E20557365207468652060636F756E746020706172616D6574657220746F207370656369667920746865206E756D626572206F6620766572746963657320746F207573652070657220726F756E6420636F726E65722E
		Shared Function MinkowskiSum(polygon As PKPolygon, circle As PKCircle, count As Integer) As PKPolygon
		  ///
		  ' Performs the Minkowski Sum of the given Polygon and Circle.
		  '
		  ' Use the `count` parameter to specify the number of vertices to use per round corner.
		  '
		  ' If the given polygon has _n_ number of vertices, the returned polygon will have 
		  ' _n * 2 + n * count_ number of vertices.
		  '
		  ' This method is O(n) where n is the number of vertices in the given polygon.
		  '
		  ' - Parameter polygon: The polygon.
		  ' - Parameter circle: The circle to add to the polygon.
		  ' - Parameter count: The number of vertices to add for each rounded corner. Must be greater than zero.
		  '
		  ' - Returns: Polygon.
		  '
		  ' - Raises: NilObjectException if the given polygon or circle is Nil.
		  ' - Raises: InvalidArgumentException if the given radius or count is less than or equal to zero.
		  ///
		  
		  If circle Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_MINKOWSKI_SUM_CIRCLE)
		  Return PKGeometry.MinkowskiSum(polygon, circle.Radius, count)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865204D696E6B6F77736B692053756D206F662074686520676976656E20636F6E766578207368617065732E2054686520736861706573204D55535420696D706C656D656E7420626F74682074686520436F6E76657820616E6420576F756E6420696E74657266616365732E
		Shared Function MinkowskiSum(convex1 As Variant, convex2 As Variant) As PKPolygon
		  ///
		  ' Returns the Minkowski Sum of the given convex shapes.
		  '
		  ' This method computes the Minkowski Sum in O(n + m) time where n and m are the number
		  ' of vertices of the first and second convex respectively.
		  '
		  ' This method accepts any Convex Wound shape which basically means Polygons orSegments.
		  '
		  ' This method raises an InvalidArgumentException if two Segments are supplied
		  ' that are colinear (in this case the resulting Minkowski sum would be another segment
		  ' rather than a polygon).
		  '
		  ' - Parameter convex1: The first convex.
		  ' - Parameter convex2: The second convex.
		  ' - Both parameters must implement the Convex AND Wound interfaces.
		  '
		  ' - Returns: Polygon.
		  '
		  ' - Raises: NilObjectException if `convex1` or `convex2` are Nil.
		  ' - Raises: InvalidArgumentException if both `convex1` and `convex2` are Segments and are colinear.
		  ' - Raises: InvalidArgumentException if either `convex1` or `convex2` are NOT both Convex AND Wound.
		  ///
		  
		  If convex1 Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_MINKOWSKI_SUM_CONVEX)
		  If convex2 Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_MINKOWSKI_SUM_CONVEX)
		  
		  // Since Xojo doens't implement generics like Java does, validate the correct 
		  // types have been passed.
		  If convex1 IsA PKConvex = False Or convex1 IsA PKWound = False Then
		    Raise New InvalidArgumentException(PKMessages.GEOMETRY_MINKOWSKI_SUM_INVALID_CONVEX1)
		  End If
		  If convex2 IsA PKConvex = False Or convex2 IsA PKWound = False Then
		    Raise New InvalidArgumentException(PKMessages.GEOMETRY_MINKOWSKI_SUM_INVALID_CONVEX2)
		  End If
		  
		  Var p1v() As PKVector2 = PKWound(convex1).GetVertices
		  Var p2v() As PKVector2 = PKWound(convex2).GetVertices
		  
		  // Check for two segments.
		  If convex1 IsA Segment And convex2 IsA Segment Then
		    // Check if they are colinear.
		    Var s1 As PKVector2 = p1v(0).Towards(p1v(1))
		    Var s2 As PKVector2 = p2v(0).Towards(p2v(1))
		    If s1.Cross(s2) <= PKEpsilon.E Then
		      Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_MINKOWSKI_SUM_SEGMENTS)
		    End If
		  End If
		  
		  Var c1 As Integer = p1v.Count
		  Var c2 As Integer = p2v.Count
		  
		  // Find the minimum y-coordinate vertex in the first polygon.
		  // In the case of a tie, use the minimum x-coordinate vertex.
		  Var i As Integer = 0
		  Var j As Integer = 0
		  Var min As PKVector2 = New PKVector2(MathsKit.DOUBLE_MAX_VALUE, MathsKit.DOUBLE_MAX_VALUE)
		  Var kLimit As Integer = c1 - 1
		  For k As Integer = 0 To kLimit
		    Var v As PKVector2 = p1v(k)
		    If v.Y < min.Y Then
		      Call min.Set(v)
		      i = k
		    Elseif v.Y = Min.Y Then
		      If v.X < Min.X Then
		        Call min.Set(v)
		        i = k
		      End If
		    End If
		  Next k
		  
		  // Find the minimum y-coordinate vertex in the second polygon.
		  // In the case of a tie, use the minimum x-coordinate vertex.
		  Call min.Set(MathsKit.DOUBLE_MAX_VALUE, MathsKit.DOUBLE_MAX_VALUE)
		  kLimit = c2 - 1
		  For k As Integer = 0 To kLimit
		    Var v As PKVector2 = p2v(k)
		    If v.Y < min.Y Then
		      Call min.Set(v)
		      j = k
		    ElseIf v.Y = min.Y Then
		      If v.X < min.X Then
		        Call min.Set(v)
		        j = k
		      End If
		    End If
		  Next k
		  
		  // Iterate through the vertices.
		  Var n1 As Integer = c1 + i
		  Var n2 As Integer = c2 + j
		  
		  // The maximum number of vertices for the output shape is m + n
		  Var sum() As PKVector2
		  While i <= n1 And j <= n2
		    // Get the current edges.
		    Var v1s As PKVector2 = p1v(i Mod c1)
		    Var v1e As PKVector2 = p1v((i + 1) Mod c1)
		    
		    Var v2s As PKVector2 = p2v(j Mod c2)
		    Var v2e As PKVector2 = p2v((j + 1) Mod c2)
		    
		    // Add the vertex to the final output.
		    // On the first iteration we can assume this is a correct
		    // one since we started at the minimum y-coordinate vertices.
		    
		    // On subsequent interations we can assume this is a correct
		    // one since the angle condition was used to increment the vertex index.
		    sum.AddRow(v1s.sum(v2s))
		    
		    // Compute the edge vectors.
		    Var e1 As PKVector2 = v1s.Towards(v1e)
		    Var e2 As PKVector2 = v2s.Towards(v2e)
		    
		    // Get the angles between the x-axis in the range [-π, π].
		    Var a1 As Double = PKVector2.X_AXIS.GetAngleBetween(e1)
		    Var a2 As Double = PKVector2.X_AXIS.GetAngleBetween(e2)
		    
		    // Put the angles in the range [0, 2π].
		    If a1 < 0 Then a1 = a1 + PKGeometry.TWO_PI
		    If a2 < 0 Then a2 = a2 + PKGeometry.TWO_PI
		    
		    // Determine which vertex to use next.
		    If a1 < a2 Then
		      i = i + 1
		    ElseIf a1 > a2 Then
		      j = j + 1
		    Else
		      i = i + 1
		      j = j + 1
		    End If
		  Wend
		  
		  Return New PKPolygon(sum)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526576657273657320746865206F72646572206F662074686520706F6C79676F6E20706F696E74732077697468696E2074686520676976656E2061727261792E20526169736573204E696C4F626A656374457863657074696F6E732E
		Shared Sub ReverseWinding(points() As PKVector2)
		  ///
		  ' Reverses the order of the polygon points within the given array.
		  '
		  ' This method performs a simple array reverse.
		  '
		  ' - Parameter points: The polygon points.
		  '
		  ' - Raises: NilObjectException if `points` is Nil.
		  ///
		  
		  // Check for a Nil array.
		  If points Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_POINT_ARRAY)
		  
		  // Get the length.
		  Var size As Integer = points.Count
		  
		  // Check the size.
		  If size <= 1 Then Return
		  
		  // Otherwise perform the swapping loop.
		  Var i As Integer = 0
		  Var j As Integer = size - 1
		  Var temp As PKVector2
		  
		  While j > i
		    temp = points(j)
		    points(j) = points(i)
		    points(i) = temp
		    
		    j = j - 1
		    i = i + 1
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120286E657729207363616C65642076657273696F6E206F662074686520676976656E2063617073756C652E
		Shared Function Scale(capsule As PKCapsule, scale As Double) As PKCapsule
		  ///
		  ' Returns a scaled version of the given capsule.
		  '
		  ' - Parameter capsule: The capsule.
		  ' - Paramater scale: The scale. Must be greater than zero.
		  '
		  ' - Returns: A new Capsule.
		  '
		  ' - Raises: NilObjectException if the given capsule is Nil.
		  ' - Raises: InvalidArgumentException if the given scale is less than or equal to zero.
		  ///
		  
		  If capsule Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_SHAPE)
		  If scale <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_SCALE)
		  Return New PKCapsule(capsule.GetLength * scale, capsule.GetCapRadius * 2.0 * scale)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120286E657729207363616C65642076657273696F6E206F662074686520676976656E20636972636C652E
		Shared Function Scale(circle As PKCircle, scale As Double) As PKCircle
		  ///
		  ' Returns a scaled version of the given circle.
		  '
		  ' - Parameter circle: The circle.
		  ' - Parameter scale: The scale. Must be greater than zero.
		  '
		  ' - Returns: A new Circle.
		  '
		  ' - Raises: NilObjectException if the given circle is Nil.
		  ' - Raises: InvalidArgumentException if the given scale is less than or equal to zero.
		  ///
		  
		  If circle Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_SHAPE)
		  If scale <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_SCALE)
		  Return New PKCircle(circle.Radius * scale)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120286E657729207363616C65642076657273696F6E206F662074686520676976656E20656C6C697073652E
		Shared Function Scale(ellipse As PKEllipse, scale As Double) As PKEllipse
		  ///
		  ' Returns a scaled version of the given ellipse.
		  '
		  ' - Parameter ellipse: The ellipse.
		  ' - Parameter scale: The scale. Must be greater than zero.
		  '
		  ' - Returnsl: A new Ellipse.
		  '
		  ' - Raises: NilObjectException if the given ellipse is Nil.
		  ' - Raises: InvalidArgumentException if the given scale is less than or equal to zero.
		  ///
		  
		  If ellipse Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_SHAPE)
		  If scale <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_SCALE)
		  Return New PKEllipse(ellipse.GetWidth * scale, ellipse.GetHeight * scale)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120286E657729207363616C65642076657273696F6E206F662074686520676976656E2068616C662D656C6C697073652E
		Shared Function Scale(halfEllipse As PKHalfEllipse, scale As Double) As PKHalfEllipse
		  ///
		  ' Returns a scaled version of the given half-ellipse.
		  '
		  ' - Parameter halfEllipse: The half-ellipse.
		  ' - Parameter scale: The scale. Must be greater than zero.
		  '
		  ' - Returnsl: A new HalfEllipse.
		  '
		  ' - Raises: NilObjectException if the given half-ellipse is Nil.
		  ' - Raises: InvalidArgumentException if the given scale is less than or equal to zero.
		  ///
		  
		  If halfEllipse Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_SHAPE)
		  If scale <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_SCALE)
		  Return New PKHalfEllipse(halfEllipse.GetWidth * scale, halfEllipse.GetHeight * scale)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120286E657729207363616C65642076657273696F6E206F662074686520676976656E20706F6C79676F6E2E
		Shared Function Scale(polygon As PKPolygon, scale As Double) As PKPolygon
		  ///
		  ' Returns a scaled version of the given polygon.
		  '
		  ' - Parameter polygon: The polygon.
		  ' - Parameter scale: The scale. Must be greater than zero.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: NilObjectException if the given polygon is Nil.
		  ' - Raises: InvalidArgumentException if the given scale is less than or equal to zero
		  ///
		  
		  If polygon Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_SHAPE)
		  If scale <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_SCALE)
		  
		  Var oVertices() As PKVector2 = polygon.Vertices
		  Var size As Integer = oVertices.Count - 1
		  
		  Var vertices() As PKVector2
		  vertices.ResizeTo(size)
		  Var center As PKVector2 = polygon.Center
		  For i As Integer = 0 To size
		    vertices(i) = center.Towards(oVertices(i)).Multiply(scale).Add(center)
		  Next i
		  
		  Return New PKPolygon(vertices)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120286E657729207363616C65642076657273696F6E206F662074686520676976656E207365676D656E742E
		Shared Function Scale(segment As PKSegment, scale As Double) As PKSegment
		  ///
		  ' Returns a scaled version of the given segment.
		  '
		  ' - Parameter segment: The segment.
		  ' - Parameter scale: The scale. Must be greater than zero.
		  '
		  ' - Returns: A new Segment.
		  '
		  ' - Raises: NilObjectException if the given segment is Nil.
		  ' - Raises: InvalidArgumentException if the given scale is less than or equal to zero.
		  ///
		  
		  If segment Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_SHAPE)
		  If scale <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_SCALE)
		  
		  Var length As Double = segment.GetLength * scale * 0.5
		  Var n As PKVector2 = segment.Vertices(0).Towards(segment.Vertices(1))
		  Call n.Normalise
		  Call n.Multiply(length)
		  
		  Return New PKSegment(segment.Center.Sum(n.X, n.Y), segment.Center.Difference(n.X, n.Y))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120286E657729207363616C65642076657273696F6E206F662074686520676976656E20736C6963652E
		Shared Function Scale(slice As PKSlice, scale As Double) As PKSlice
		  ///
		  ' Returns a scaled version of the given slice.
		  '
		  ' - Parameter slice: The slice.
		  ' - Parameter scale: The scale. Must be greater than zero.
		  '
		  ' - Returns: A new Slice.
		  '
		  ' - Raises: NilObjectException if the given slice is Nil.
		  ' - Raises:" InvalidArgumentException if the given scale is less than or equal to zero.
		  ///
		  
		  If slice Is Nil Then Raise New NilObjectException(PKMessages.GEOMETRY_NIL_SHAPE)
		  If scale <= 0 Then Raise New InvalidArgumentException(PKMessages.GEOMETRY_INVALID_SCALE)
		  Return New PKSlice(slice.GetSliceRadius * scale, slice.GetTheta)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Contains static methods to perform standard geometric operations.
		
		This class can be used to create Shapes of varying types via the `Create` methods.
		While {@link Shape}s can be created using their constructors as well, the methods here can place their
		centres on the origin and also make copies of the given input to avoid reuse issues.
		
		This class also contains various helper methods for cleaning vector arrays and lists and performing
		various operations on Shapes.
		
	#tag EndNote


	#tag Constant, Name = INV_3, Type = Double, Dynamic = False, Default = \"0.3333333333333333", Scope = Public
	#tag EndConstant

	#tag Constant, Name = INV_SQRT_3, Type = Double, Dynamic = False, Default = \"0.5773502691896258", Scope = Public, Description = 5468652076616C7565206F662074686520696E7665727365206F66207468652073717561726520726F6F74206F6620333A20312F53717274283329
	#tag EndConstant

	#tag Constant, Name = TWO_PI, Type = Double, Dynamic = False, Default = \"6.2831853071800001", Scope = Public, Description = 32202A20E2888F20636F6E7374616E74
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
	#tag EndViewBehavior
End Class
#tag EndClass
