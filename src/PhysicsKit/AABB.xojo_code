#tag Class
Protected Class AABB
Implements PhysicsKit.Translatable
	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E
		Sub Constructor(radius As Double)
		  ///
		  ' Full constructor.
		  '
		  ' - Parameter radius: The radius of a circle fitting inside an AABB.
		  ///
		  
		  Constructor(Nil, radius)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E
		Sub Constructor(minX As Double, minY As Double, maxX As Double, maxY As Double)
		  ///
		  ' Full constructor.
		  ' 
		  ' - Parameter minX: The minimum x extent.
		  ' - Parameter minY: The minimum y extent.
		  ' - Parameter maxX: The maximum x extent.
		  ' - Parameter maxY: The maximum y extent.
		  '
		  ' - Throws: InvalidArgumentException if minX or minY are greater than the permitted maximum.
		  ///
		  
		  // Check the min and max.
		  If minX > maxX Or minY > maxY Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_AABB_INVALID_MIN_MAX)
		  End If
		  
		  Self.MinX = minX
		  Self.MinY = minY
		  Self.MaxX = maxX
		  Self.MaxY = maxY
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F707920636F6E7374727563746F722E
		Sub Constructor(aabb As PhysicsKit.AABB)
		  ///
		  ' Copy constructor.
		  '
		  ' - Parameter aabb: The AABB to copy.
		  ///
		  
		  Self.MinX = aabb.MinX
		  Self.MinY = aabb.MinY
		  Self.MaxX = aabb.MaxX
		  Self.MaxY = aabb.MaxY
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E204141424220666F72206120636972636C6520776974682074686520676976656E2063656E74657220616E64207261646975732E
		Sub Constructor(center As PhysicsKit.Vector2, radius As Double)
		  ///
		  ' Full constructor.
		  ' Creates an AABB for a circle with the given center and radius.
		  '
		  ' - Parameter center: The center of the circle.
		  ' - Parameter radius: The radius of the circle.
		  '
		  ' - Throws: InvalidArgumentException if the given radius is less than zero.
		  ///
		  
		  If radius < 0 Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_AABB_INVALID_RADIUS)
		  End If
		  
		  If center Is Nil Then
		    Self.MinX = -radius
		    Self.MinY = -radius
		    Self.MaxX =  radius
		    Self.MaxY =  radius
		  Else
		    Self.MinX = center.X - radius
		    Self.MinY = center.Y - radius
		    Self.MaxX = center.X + radius
		    Self.MaxY = center.Y + radius
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E
		Sub Constructor(min As PhysicsKit.Vector2, max As PhysicsKit.Vector2)
		  ///
		  ' Full constructor.
		  '
		  ' - Parameter min: The minimum extent.
		  ' - Parameter max: The maximum extent.
		  '
		  ' - Throws: InvalidArgumentException if either coordinate of the given min is greater 
		  '           than the given max.
		  ///
		  
		  Constructor(min.X, min.Y, max.X, max.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(x As Double, y As Double) As Boolean
		  ///
		  ' Returns True if the given point's coordinates are contained within this AABB.
		  '
		  ' - Parameter x: The x coordinate of the point.
		  ' - Parameter y: The y coordinate of the point.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Self.MinX <= x And _
		  Self.MaxX >= x And _
		  Self.MinY <= y And _
		  Self.MaxY >= y
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(aabb As PhysicsKit.AABB) As Boolean
		  ///
		  ' Returns True if the given AABB is contained within this AABB.
		  '
		  ' - Parameter aabb: The AABB to test.
		  ' - Returns: Boolean.
		  ///
		  
		  Return Self.MinX <= aabb.MinX And _
		  Self.MaxX >= aabb.MaxX And _
		  Self.MinY <= aabb.MinY And _
		  Self.MaxY >= aabb.MaxY
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E20706F696E7420697320636F6E7461696E65642077697468696E207468697320414142422E
		Function Contains(point As PhysicsKit.Vector2) As Boolean
		  ///
		  ' Returns True if the given point is contained within this AABB.
		  '
		  ' - Parameter point: The point to test.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Self.Contains(point.X, point.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120636F7079206F66207468697320414142422E
		Function Copy() As PhysicsKit.AABB
		  ///
		  ' Returns a copy of this AABB.
		  '
		  ' - Returns: A new AABB.
		  ///
		  
		  Return New AABB(Self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573207468652076616C6964204141424220646566696E6564206279207468652074776F20706F696E74733A204128706F696E7431782C20706F696E7431792920616E64204228706F696E7432782C20706F696E743279292E
		Shared Function CreateAABBFromPoints(point1X As Double, point1Y As Double, point2X As Double, point2Y As Double) As PhysicsKit.AABB
		  ///
		  ' Creates the valid AABB defined by the two points: A(point1x, point1y) and B(point2x, point2y).
		  '
		  ' - Parameter point1x: The x coordinate of point A.
		  ' - Parameter point1y: The y coordinate of point A.
		  ' - Parameter point2x: The x coordinate of point B.
		  ' - Parameter point2y: The y coordinate of point B.
		  '
		  ' - Returns: The one and only one valid AABB formed by A and B.
		  ///
		  
		  If point2x < point1x Then
		    Var temp As Double = point1x
		    point1x = point2x
		    point2x = temp
		  End If
		  
		  If point2y < point1y then
		    Var temp As double = point1y
		    point1y = point2y
		    point2y = temp
		  End If
		  
		  Return New AABB(point1x, point1y, point2x, point2y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573207468652076616C6964204141424220646566696E6564206279207468652074776F20706F696E74732060706F696E74316020616E642060706F696E7432602E
		Shared Function CreateAABBFromPoints(point1 As PhysicsKit.Vector2, point2 As PhysicsKit.Vector2) As PhysicsKit.AABB
		  ///
		  ' Creates the valid AABB defined by the two points `point1` and `point2`.
		  '
		  ' - Parameter point1: The first point.
		  ' - Parameter point2: The second point.
		  '
		  ' - Returns: The one and only one valid AABB formed by 'point1' and 'point2'.
		  ///
		  
		  Return CreateAABBFromPoints(point1.X, point1.Y, point2.X, point2.Y)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 457870616E6473207468697320414142422062792068616C662074686520676976656E20657870616E73696F6E20696E206561636820646972656374696F6E20616E64207468656E2072657475726E73207468697320414142422E
		Function Expand(expansion As Double) As PhysicsKit.AABB
		  ///
		  ' Expands this AABB by half the given expansion in each direction and
		  ' then returns this AABB.
		  '
		  ' The expansion can be negative to shrink the AABB.  However, if the expansion is
		  ' greater than the current width/height, the AABB can become invalid.  In this 
		  ' case, the AABB will become a degenerate AABB at the mid point of the min and max for 
		  ' the respective coordinates.
		  '
		  ' - Parameter expansion: The expansion amount.
		  '
		  ' - Returns: This AABB.
		  ///
		  
		  Var e As Double = expansion * 0.5
		  Self.MinX = Self.MinX - e
		  Self.MinY = Self.MinY - e
		  Self.MaxX = Self.MaxX + e
		  Self.MaxY = Self.MaxY + e
		  
		  // We only need to verify the new AABB if the expansion was inwardly.
		  If expansion < 0 Then
		    // If the aabb is invalid then set the min/max(es) to the middle value of their current values.
		    If Self.MinX > Self.MaxX Then
		      Var mid As Double = (Self.MinX + Self.MaxX) * 0.5
		      Self.MinX = mid
		      Self.MaxX = mid
		    End If
		    
		    If Self.MinY > Self.MaxY Then
		      Var mid As Double = (Self.MinY + Self.MaxY) * 0.5
		      Self.MinY = mid
		      Self.MaxY = mid
		    End If
		  End If
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetArea() As Double
		  ///
		  ' Returns the area of this AABB.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return (Self.MaxX - Self.MinX) * (Self.MaxY - Self.MinY)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E65772041414242206F662074686973204141424220657870616E6465642062792068616C662074686520676976656E20657870616E73696F6E20696E20626F746820746865207820616E64207920646972656374696F6E732E
		Function GetExpanded(expansion As Double) As PhysicsKit.AABB
		  ///
		  ' Returns a new AABB of this AABB expanded by half the given expansion
		  ' in both the x and y directions.
		  '
		  ' The expansion can be negative to shrink the AABB.  However, if the expansion is
		  ' greater than the current width/height, the AABB can become invalid.  In this 
		  ' case, the AABB will become a degenerate AABB at the mid point of the min and max for 
		  ' the respective coordinates.
		  '
		  ' - Parameter expansion: The expansion amount.
		  '
		  ' - Returns: A new AABB.
		  ///
		  
		  Return Self.Copy.Expand(expansion)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520686569676874206F66207468697320414142422E
		Function GetHeight() As Double
		  ///
		  ' Returns the height of this AABB.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.MaxY - Self.MinY
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 506572666F726D732074686520696E74657273656374696F6E206F662074686973204141424220616E642074686520676976656E20414142422072657475726E696E672074686520726573756C7420696E2061206E657720414142422E
		Function GetIntersection(aabb As PhysicsKit.AABB) As PhysicsKit.AABB
		  ///
		  ' Performs the intersection of this AABB and the given AABB returning
		  ' the result in a new AABB.
		  '
		  ' If the given AABB does not overlap this AABB, a zero AABB is returned.
		  '
		  ' - Parameter aabb: The AABB to intersect.
		  '
		  ' - Returns: A new AABB.
		  ///
		  
		  Return Self.Copy.Intersection(aabb)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMaxX() As Double
		  ///
		  ' Returns the maximum x extent.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.MaxX
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D6178696D756D207920657874656E742E
		Function GetMaxY() As Double
		  ///
		  ' Returns the maximum y extent.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.MaxY
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D696E696D756D207820657874656E742E
		Function GetMinX() As Double
		  ///
		  ' Returns the minimum x extent.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.MinX
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMinY() As Double
		  ///
		  ' Returns the minimum y extent.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.MinY
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPerimeter() As Double
		  ///
		  ' Returns the perimeter of this AABB.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return 2 * (Self.MaxX - Self.MinX + Self.MaxY - Self.MinY)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E65772041414242206F6620746869732041414242207472616E736C617465642062792074686520676976656E207472616E736C6174696F6E20616D6F756E742E
		Function GetTranslated(translation As PhysicsKit.Vector2) As PhysicsKit.AABB
		  ///
		  ' Returns a new AABB of this AABB translated by the given translation amount.
		  '
		  ' - Parameter translation: The translation.
		  '
		  ' - Returns: A new AABB.
		  ///
		  
		  Return New AABB(_
		  Self.MinX + translation.X, _
		  Self.MinY + translation.Y, _
		  Self.MaxX + translation.X, _
		  Self.MaxY + translation.Y)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 506572666F726D73206120756E696F6E206F662074686973204141424220616E642074686520676976656E20414142422072657475726E696E672061206E6577204141424220636F6E7461696E696E672074686520726573756C742E
		Function GetUnion(aabb As PhysicsKit.AABB) As PhysicsKit.AABB
		  ///
		  ' Performs a union of this AABB and the given AABB returning
		  ' a new AABB containing the result.
		  '
		  ' - Parameter aabb: The AABB to union.
		  '
		  ' - Returns: The resulting union as a new AABB.
		  ///
		  
		  Return Self.Copy.Union(aabb)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207769647468206F66207468697320414142422E
		Function GetWidth() As Double
		  ///
		  ' Returns the width of this AABB.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.MaxX - Self.MinX
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 506572666F726D732074686520696E74657273656374696F6E206F662074686973204141424220616E642074686520676976656E204141424220706C6163696E672074686520726573756C7420696E746F2074686973204141424220616E64207468656E2072657475726E73207468697320414142422E
		Function Intersection(aabb As PhysicsKit.AABB) As PhysicsKit.AABB
		  ///
		  ' Performs the intersection of this AABB and the given AABB placing
		  ' the result into this AABB and then returns this AABB.
		  '
		  ' If the given AABB does not overlap this AABB, this AABB is set to a zero AABB.
		  '
		  ' - Parameter aabb: The AABB to intersect.
		  '
		  ' - Returns: This AABB.
		  ///
		  
		  Self.MinX = Max(Self.MinX, aabb.MinX)
		  Self.MinY = Max(Self.MinY, aabb.MinY)
		  Self.MaxX = Min(Self.MaxX, aabb.MaxX)
		  Self.MaxY = Min(Self.MaxY, aabb.MaxY)
		  
		  // Check for a bad AABB.
		  If Self.minX > Self.maxX Or Self.minY > Self.maxY Then
		    // The two AABBs were not overlapping. Set this AABB to a degenerate one.
		    Self.MinX = 0.0
		    Self.MinY = 0.0
		    Self.MaxX = 0.0
		    Self.MaxY = 0.0
		  End If
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686973204141424220697320646567656E65726174652E
		Function IsDegenerate() As Boolean
		  ///
		  ' Returns True if this AABB is degenerate.
		  '
		  ' A degenerate AABB is one where its min and max x or y coordinates are equal.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Self.MinX = Self.MaxX Or Self.MinY = Self.MaxY
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686973204141424220697320646567656E657261746520676976656E2074686520737065636966696564206572726F722E
		Function IsDegenerate(error As Double) As Boolean
		  ///
		  ' Returns True if this AABB is degenerate given the specified error.
		  '
		  ' An AABB is degenerate given some error if:
		  ' max - min <= error for either the x or y coordinate.
		  '
		  ' - Parameter error: The allowed error.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Abs(Self.MaxX - Self.MinX) <= error Or Abs(Self.MaxY - Self.MinY) <= error
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E204141424220616E6420746869732041414242206F7665726C61702E
		Function Overlaps(aabb As PhysicsKit.AABB) As Boolean
		  ///
		  ' Returns True if the given AABB and this AABB overlap.
		  '
		  ' - Parameter aabb: The AABB to test.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Self.MinX <= aabb.MaxX And _
		  Self.MaxX >= aabb.MinX And _
		  Self.MinY <= aabb.MaxY And _
		  Self.MaxY >= aabb.MinY
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686973204141424220746F2074686520676976656E204141424227732076616C756520616E642072657475726E73207468697320414142422E
		Function Set(aabb As PhysicsKit.AABB) As PhysicsKit.AABB
		  ///
		  ' Sets this AABB to the given AABB's value and returns this AABB.
		  '
		  ' - Parameter aabb: The AABB to copy.
		  '
		  ' - Returns: This AABB.
		  ///
		  
		  Self.MinX = aabb.MinX
		  Self.MinY = aabb.MinY
		  Self.MaxX = aabb.MaxX
		  Self.MaxY = aabb.MaxY
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F662074686973204141424220696E2074686520666F726D61743A2022414142425B4D696E3D28782C79297C4D61783D28782C79295D222E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this AABB in the format: "AABB[Min=(x,y)|Max=(x,y)]".
		  ///
		  
		  Var s() As String
		  s.AddRow("AABB[Min=")
		  s.AddRow("(")
		  s.AddRow(Self.MinX.ToString)
		  s.AddRow(", ")
		  s.AddRow(Self.MinY.ToString)
		  s.AddRow(")")
		  s.AddRow("|Max=")
		  s.AddRow("(")
		  s.AddRow(Self.MaxX.ToString)
		  s.AddRow(", ")
		  s.AddRow(Self.MaxY.ToString)
		  s.AddRow(")")
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(x As Double, y As Double)
		  // Part of the PhysicsKit.Translatable interface.
		  
		  Self.MinX = Self.MinX + x
		  Self.MinY = Self.MinY + y
		  Self.MaxX = Self.MaxX + x
		  Self.MaxY = Self.MaxY + y
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(vector As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Translatable interface.
		  
		  Translate(vector.X, vector.Y)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 506572666F726D73206120756E696F6E206F662074686973204141424220616E642074686520676976656E204141424220706C6163696E672074686520726573756C74206F662074686520756E696F6E20696E746F2074686973204141424220616E64207468656E2072657475726E73207468697320414142422E
		Function Union(aabb As PhysicsKit.AABB) As PhysicsKit.AABB
		  ///
		  ' Performs a union of this AABB and the given AABB placing
		  ' the result of the union into this AABB and then returns this AABB.
		  '
		  ' - Parameter aabb: The AABB to union.
		  '
		  ' - Returns: This AABB.
		  ///
		  
		  Self.MinX = Min(Self.MinX, aabb.MinX)
		  Self.MinY = Min(Self.MinY, aabb.MinY)
		  Self.MaxX = Max(Self.MaxX, aabb.MaxX)
		  Self.MaxY = Max(Self.MaxY, aabb.MaxY)
		  
		  Return Self
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of an Axis-Aligned Bounding Box.
		
		An AABB has minimum and maximum coordinates that define the box.
		
		An AABB can be unioned or intersected with other AABBs to combine them into 
		another AABB. If an intersection produces no result, a degenerate AABB is returned.
		A degenerate AABB can be tested by the `IsDegenerate()` methods and 
		is defined as an AABB who's maximum and minimum are equal.
		
		AABBs can also be tested for overlap and (full) containment using the `Overlaps(AABB)`
		and `Contains(AABB)` method.
		
		The `Expand(Double)` method can be used to expand the bounds of the AABB by some amount.
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 546865206D6178696D756D20657874656E7420616C6F6E672074686520782D61786973
		MaxX As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D6178696D756D20657874656E7420616C6F6E672074686520792D61786973
		MaxY As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D696E696D756D20657874656E7420616C6F6E672074686520782D617869732E
		MinX As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D696E696D756D20657874656E7420616C6F6E672074686520792D61786973
		MinY As Double
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
			Name="MinX"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
