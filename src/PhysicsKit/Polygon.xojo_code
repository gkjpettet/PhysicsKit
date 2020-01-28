#tag Class
Protected Class Polygon
Inherits PhysicsKit.AbstractShape
Implements PhysicsKit.Convex, PhysicsKit.Wound
	#tag Method, Flags = &h21, Description = 56616C69646174656420636F6E7374727563746F722E20437265617465732061206E657720506F6C79676F6E207573696E672074686520676976656E2076657274696365732E20205468652063656E747265206F662074686520706F6C79676F6E2069732063616C63756C61746564207573696E6720616E2061726561207765696768746564206D6574686F642E
		Private Sub Constructor(valid As Boolean, vertices() As PhysicsKit.Vector2, center As PhysicsKit.Vector2)
		  ///
		  ' Validated constructor.
		  '
		  ' Creates a new Polygon using the given vertices.  The centre of the polygon
		  ' is calculated using an area weighted method.
		  '
		  ' - Parameter valid: Always True or this constructor would not be called.
		  ' - Parameter vertices(): The polygon vertices.
		  ' - Parameter center: The center of the polygon.
		  ///
		  
		  Super.Constructor(center, Geometry.GetRotationRadius(center, vertices))
		  
		  // Set the vertices.
		  Self.Vertices = vertices
		  
		  // Create the normals.
		  Self.Normals = Geometry.GetCounterClockwiseEdgeNormals(vertices)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E20437265617465732061206E657720506F6C79676F6E207573696E672074686520676976656E2076657274696365732E205468652063656E746572206F662074686520706F6C79676F6E2069732063616C63756C61746564207573696E6720616E2061726561207765696768746564206D6574686F642E205468726F777320657863657074696F6E732E
		Sub Constructor(ParamArray verts As PhysicsKit.Vector2)
		  ///
		  ' Full constructor.
		  '
		  ' Creates a new Polygon using the given vertices. The center of the polygon
		  ' is calculated using an area weighted method.
		  '
		  ' A polygon must have 3 or more vertices, of which one is not colinear with the other two.
		  '
		  ' A polygon must also be convex and have counter-clockwise winding.
		  '
		  ' - Parameter verts: The array of vertices.
		  '
		  ' - Throws: NilObjectException if vertices is Nil or contains a Nil element.
		  ' - Throws: InvalidArgumentException if vertices contains less than 3 points,
		  '           contains coincident points, is not convex, or has clockwise winding
		  ///
		  
		  Constructor(Validate(verts), verts, Geometry.GetAreaWeightedCenter(verts))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F7220666F7220737562636C61737365732E
		Sub Constructor(center As PhysicsKit.Vector2, radius As Double, vertices() As PhysicsKit.Vector2, normals() As PhysicsKit.Vector2)
		  ///
		  ' Full constructor for subclasses.
		  '
		  ' - Parameter center: The center.
		  ' - Parameter radius: The rotation radius.
		  ' - Paramater vertices(): The vertices.
		  ' - Parameter normals(): The normals.
		  ///
		  
		  Super.Constructor(center, radius)
		  Self.Vertices = vertices
		  Self.Normals = normals
		  
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
		Function GetNormalIterator() As Iterator
		  // Part of the PhysicsKit.Wound interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNormals() As PhysicsKit.Vector2()
		  // Part of the PhysicsKit.Wound interface.
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
		Function GetVertexIterator() As Iterator
		  // Part of the PhysicsKit.Wound interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVertices() As PhysicsKit.Vector2()
		  // Part of the PhysicsKit.Wound interface.
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

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F66207468697320506F6C79676F6E20696E2074686520666F726D3A2022506F6C79676F6E5B49443D69647C43656E7465723D28582C59297C5261646975733D7261646975737C56657274696365733D7B28582C59292C6E7D5D222E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Polygon in the form:
		  ' "Polygon[ID=id|Center=(X,Y)|Radius=radius|Vertices={(X,Y),n}]".
		  '
		  ' - Returns: String
		  ///
		  
		  Var s() As String
		  s.AddRow("Polygon[")
		  s.AddRow(Super.ToString)
		  s.AddRow("|Vertices={")
		  For i As Integer = 0 To Self.Vertices.LastRowIndex
		    If i <> 0 Then s.AddRow(",")
		    s.AddRow(Self.Vertices(i).ToString)
		  Next i
		  s.AddRow("}")
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
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

	#tag Method, Flags = &h0, Description = 56616C6964617465732074686520636F6E7374727563746F7220696E7075742072657475726E696E6720547275652069662076616C6964206F72207468726F77696E6720616E20657863657074696F6E20696620696E76616C69642E
		Shared Function Validate(verts() As PhysicsKit.Vector2) As Boolean
		  ///
		  ' Validates the constructor input returning True if valid or throwing an exception if invalid.
		  '
		  ' - Parameter verts: The array of vertices.
		  '
		  ' - Returns: True or raises an exception.
		  '
		  ' - Throws: NilObjectException if verts is Nil or contains a Nil element.
		  ' - Throws: InvalidArgumentException if verts contains less than 3 points, 
		  '           contains coincident points, is not convex, or has clockwise winding.
		  ///
		  
		  // Check the vertex array.
		  If verts = Nil Then Raise New NilObjectException(Messages.GEOMETRY_POLYGON_NIL_ARRAY)
		  
		  // Get the size.
		  Var size As Integer = verts.Count
		  
		  // Check the size.
		  If size < 3 Then Raise New InvalidArgumentException(Messages.GEOMETRY_POLYGON_LESS_THAN_3_VERTICES)
		  
		  // Check for Nil vertices.
		  For Each v As Vector2 In verts
		    If v Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_POLYGON_NIL_VERTICES)
		  Next v
		  
		  // Check for convex.
		  Var area As Double = 0.0
		  Var sign As Double = 0.0
		  Var limit As Integer = size - 1
		  For i As Integer = 0 to limit
		    Var p0 As Vector2 = If((i - 1 < 0), verts(size - 1), verts(i - 1))
		    Var p1 As Vector2 = verts(i)
		    Var p2 As Vector2 = If((i + 1 = size), verts(0), verts(i + 1))
		    // Check for coincident vertices.
		    If p1.Equals(p2) Then
		      Raise New InvalidArgumentException(Messages.GEOMETRY_POLYGON_COINCIDENT_VERTICES)
		    End If
		    // Check the cross product for CCW winding.
		    Var cross As Double = p0.Towards(p1).Cross(p1.Towards(p2))
		    Var tsign As Double = Maths.Signum(cross)
		    area = area + cross
		    // Check for colinear edges (for now its allowed).
		    If Abs(cross) > Epsilon.E Then
		      // Check for convexity.
		      If sign <> 0.0 And tsign <> sign Then
		        Raise New InvalidArgumentException(Messages.GEOMETRY_POLYGON_NON_CONVEX)
		      End If
		    End If
		    sign = tsign
		  Next i
		  
		  // Don't allow degenerate polygons.
		  If Abs(area) <= Epsilon.E Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_POLYGON_ZERO_AREA)
		  End If
		  
		  // Check for CCW.
		  If area < 0.0 Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_POLYGON_INVALID_WINDING)
		  End If
		  
		  // If we've made it this far then continue.
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 56616C6964617465732074686520636F6E7374727563746F7220696E7075742072657475726E696E6720547275652069662076616C6964206F72207468726F77696E6720616E20657863657074696F6E20696620696E76616C69642E
		Shared Function Validate(ParamArray verts As PhysicsKit.Vector2) As Boolean
		  ///
		  ' Wrapper to facilitate passing a variable number of vertices to the Validate method.
		  ///
		  
		  Return Validate(verts)
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of an arbitrary polygon Convex Shape.
		
		A Polygon must have at least 3 vertices where one of which is not colinear with the other two.
		A Polygon must also be Convex and have counter-clockwise winding of points.
		A polygon cannot have coincident vertices.
		
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 54686520706F6C79676F6E206E6F726D616C732E
		Normals() As PhysicsKit.Vector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520706F6C79676F6E2076657274696365732E
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
			Name="Vertices()"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
