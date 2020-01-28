#tag Class
Protected Class Segment
Inherits PhysicsKit.AbstractShape
Implements PhysicsKit.Convex, PhysicsKit.Wound
	#tag Method, Flags = &h21, Description = 56616C69646174656420636F6E7374727563746F722E20437265617465732061206E6577207365676D656E74207573696E672074686520676976656E20706F696E74732E20205468652063656E7465722077696C6C206265207468652061766572616765206F662074686520706F696E74732E
		Private Sub Constructor(valid As Boolean, vertices() As PhysicsKit.Vector2, segment As PhysicsKit.Vector2, length As Double)
		  ///
		  ' Validated constructor.
		  '
		  ' Creates a new segment using the given points.  The center will be the average of the points.
		  '
		  ' - Parameter valid: Always True or this constructor would not be called.
		  ' - Parameter point1: The first point.
		  ' - Parameter point2: The second point.
		  ///
		  
		  Super.Constructor(Geometry.GetAverageCenter(vertices), length * 0.5)
		  
		  // Assign the verices.
		  Self.Vertices = vertices
		  
		  // Create the normals.
		  Self.Normals.ResizeTo(1)
		  Self.Normals(0) = segment.Copy
		  Call Self.Normals(0).Normalise
		  Self.Normals(1) = segment.Right
		  Call Self.Normals(1).Normalise
		  
		  // Compute the length.
		  Self.Length = length
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577207365676D656E74207573696E672074686520676976656E20706F696E74732E20205468652063656E7465722077696C6C206265207468652061766572616765206F662074686520706F696E74732E2041207365676D656E74277320706F696E74732063616E6E6F74206265204E696C206F72207468652073616D6520706F696E742E205468726F77732E
		Sub Constructor(point1 As PhysicsKit.Vector2, point2 As PhysicsKit.Vector2)
		  ///
		  ' Full constructor.
		  '
		  ' Creates a new segment using the given points.  The center will be the average of the points.
		  ' A segment's points cannot be Nil or the same point.
		  '
		  ' - Parameter point1: The first point.
		  ' - Parameter point2: The second point.
		  '
		  ' - Throws: NilObjectException if `point1` or `point2` is Nil.
		  ' - Throws: InvalidArgumentException if `point1` = `point2`.
		  ///
		  
		  Constructor(Validate(point1, point2), Array(point1, point2), _
		  point1.Towards(point2), point1.Distance(point2))
		  
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

	#tag Method, Flags = &h21, Description = 56616C6964617465732074686520636F6E7374727563746F7220696E7075742072657475726E696E6720547275652069662076616C6964206F72207468726F77696E6720616E20657863657074696F6E20696620696E76616C69642E
		Private Shared Function Validate(point1 As PhysicsKit.Vector2, point2 As PhysicsKit.Vector2) As Boolean
		  ///
		  ' Validates the constructor input returning True if valid or throwing an exception if invalid.
		  '
		  ' - Parameter point1: The first point.
		  ' - Parameter point2: The second point.
		  '
		  ' - Returns: True or throws.
		  '
		  ' - Throws: NilObjectException if `point1` or `point2` is Nil.
		  ' - Throws: InvalidArgumentException if `point1` = `point2`.
		  ///
		  
		  // Make sure either point is not Nil.
		  If point1 = Nil Then Raise New NilObjectException(Messages.GEOMETRY_SEGMENT_NIL_POINT1)
		  If point2 = Nil Then Raise New NilObjectException(Messages.GEOMETRY_SEGMENT_NIL_POINT2)
		  
		  // Make sure the two points are not coincident.
		  If point1.Equals(point2) Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_SEGMENT_SAME_POINT)
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of a Line Segment Convex Shape.
		This class represents a line segment that is infinitely thin.
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 546865207365676D656E74206C656E6774682E
		Length As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865207365676D656E74206E6F726D616C732E
		Normals() As PhysicsKit.Vector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865207365676D656E742076657274696365732E
		Vertices() As PhysicsKit.Vector2
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
