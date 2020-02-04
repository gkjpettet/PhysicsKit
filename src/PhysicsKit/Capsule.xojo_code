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
		    Self.Foci(0) = New Vector2(0, -f)
		    Self.Foci(1) = New Vector2(0,  f)
		    
		    // Set the local x-axis (to the y-axis).
		    Self.LocalXAxis = New Vector2(0.0, 1.0)
		  Else
		    Self.Foci(0) = New Vector2(-f, 0)
		    Self.foci(1) = New Vector2( f, 0)
		    
		    // Set the local x-axis.
		    Self.LocalXAxis = New Vector2(1.0, 0.0)
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
		Function Contains(point As PhysicsKit.Vector2) As Boolean
		  // Part of the PhysicsKit.Shape interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As Boolean
		  // Part of the PhysicsKit.Shape interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB() As PhysicsKit.AABB
		  // Part of the PhysicsKit.Shape interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB(transform As PhysicsKit.Transform) As PhysicsKit.AABB
		  // Part of the PhysicsKit.Shape interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateMass(density As Double) As PhysicsKit.Mass
		  // Part of the PhysicsKit.Shape interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAxes(foci() As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Vector2()
		  // Part of the PhysicsKit.Convex interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCenter() As PhysicsKit.Vector2
		  // Part of the PhysicsKit.Shape interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestFeature(vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Feature
		  // Part of the PhysicsKit.Convex interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFarthestPoint(vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Vector2
		  // Part of the PhysicsKit.Convex interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFoci(transform As PhysicsKit.Transform) As PhysicsKit.Vector2()
		  // Part of the PhysicsKit.Convex interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetID() As PhysicsKit.UUID
		  // Part of the PhysicsKit.Shape interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius() As Double
		  // Part of the PhysicsKit.Shape interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius(center As PhysicsKit.Vector2) As Double
		  // Part of the PhysicsKit.Shape interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUserData() As Variant
		  // Part of the PhysicsKit.DataContainer interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PhysicsKit.Vector2) As PhysicsKit.Interval
		  // Part of the PhysicsKit.Shape interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PhysicsKit.Vector2, transform As PhysicsKit.Transform) As PhysicsKit.Interval
		  // Part of the PhysicsKit.Shape interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double)
		  // Part of the PhysicsKit.Rotatable interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double, x As Double, y As Double)
		  // Part of the PhysicsKit.Rotatable interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double, point As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Rotatable interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation)
		  // Part of the PhysicsKit.Rotatable interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation, x As Double, y As Double)
		  // Part of the PhysicsKit.Rotatable interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PhysicsKit.Rotation, point As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Rotatable interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateAboutCenter(theta As Double)
		  // Part of the PhysicsKit.Shape interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetUserData(data As Variant)
		  // Part of the PhysicsKit.DataContainer interface.
		  
		  
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
		  // Part of the PhysicsKit.Translatable interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(vector As PhysicsKit.Vector2)
		  // Part of the PhysicsKit.Translatable interface.
		  
		  
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
		`GetFarthestFeature(Vector2, Transform)` method. Under normal floating point conditions 
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
		Foci() As PhysicsKit.Vector2
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520626F756E64696E672072656374616E676C652077696474682E
		Length As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206C6F63616C20782D617869732E
		LocalXAxis As PhysicsKit.Vector2
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
	#tag EndViewBehavior
End Class
#tag EndClass
