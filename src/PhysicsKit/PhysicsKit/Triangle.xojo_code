#tag Class
Protected Class Triangle
Inherits PhysicsKit.Polygon
	#tag Method, Flags = &h0, Description = 437265617465732061206E657720747269616E676C65207573696E672074686520676976656E20706F696E74732E205468652063656E7472652077696C6C2062652074686520617265612077656967687465642063656E746572206F662074686520706F696E74732E20526169736573204E696C4F626A656374457863657074696F6E7320616E6420496E76616C6964417267756D656E74457863657074696F6E732E
		Sub Constructor(point1 As PKVector2, point2 As PKVector2, point3 As PKVector2)
		  ///
		  ' Full constructor.
		  '
		  ' Creates a new triangle using the given points. The centre will be the area
		  ' weighted center of the points.
		  '
		  ' A triangle must have 3 non-Nil points of which one is not colinear with the other two.
		  '
		  ' - Parameter point1: The first point.
		  ' - Parameter point2: The second point.
		  ' - Parameter point3: The third point.
		  '
		  ' - Raises: NilObjectException if `point1`, `point2`, or `point3` is Nil.
		  ' - Raises: InvalidArgumentException if `point1`, `point2`, and `point3` contain 
		  '           coincident points or have clockwise winding.
		  ///
		  
		  Super.Constructor(Array(point1, point2, point3))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PKVector2, transform As PhysicsKit.Transform) As Boolean
		  ///
		  ' Returns True if the point is inside the Triangle.
		  '
		  ' The equation of a plane is: `N · (P - A) = 0`
		  ' Where `A` is any point on the plane.
		  '
		  ' Create two axes (PKVector2s). We will choose Vab and Vac.
		  ' ```
		  ' Vac = C - A
		  ' Vab = B - A
		  ' ```
		  ' Where `A`, `B`, and `C` are the vertices of the Triangle.
		  ' From this we can say that you can get to any point on the plane by going 
		  ' some `u` distance on Vac and some `v` distance on Vab where `A` is the origin.
		  ' `P = A + u * Vac + v * Vab`
		  ' Simplifing `P - A`
		  ' `Vpa = u * Vac + v * Vab
		  ' We still need another equation to solve for `u` and `v`:
		  ' Dot the equation by `Vac` to get `Vpa · Vac = (u * Vac + v * Vab) · Vac`
		  ' Dot the equation by `Vab` to get the other `Vpa · Vab = (u * Vac + v * Vab) · Vab`
		  ' Distribute out both equations:
		  ' `Vpa · Vac = u * Vac · Vac + v * Vab · Vac
		  ' `Vpa · Vab = u * Vac · Vab + v * Vab · Vab
		  ' Solving the first equation for `u`:
		  ' `u = (Vpa · Vac - v * Vab · Vac) / (Vac · Vac)</p>
		  ' Substitute one into the other:
		  ' ```
		  ' Vpa · Vab = (Vpa · Vac - v * Vab · Vac) / (Vac · Vac) * Vac · Vab + v * Vab · Vab
		  ' Vpa · Vab = (Vpa · Vac / Vac · Vac) * Vac · Vab - v * (Vab · Vac / Vac · Vac) * Vac · Vab + v * Vab · Vab
		  ' Vpa · Vab = (Vpa · Vac / Vac · Vac) * Vac · Vab + v * (Vab · Vab - (Vab · Vac / Vac · Vac) * Vac · Vab)
		  ' v = (Vpa · Vab - (Vpa · Vac / Vac · Vac) * Vac · Vab) / (Vab · Vab - (Vab · Vac / Vac · Vac) * Vac · Vab)
		  ' ```
		  ' Which reduces to:
		  ' `v = ((Vpa · Vab) * (Vac · Vac) - (Vpa · Vac) * (Vac · Vab)) / ((Vab · Vab) * (Vac · Vac) - (Vab · Vac) * (Vac · Vab))`
		  ' Once `v` is obtained use either equation to obtain `u`:
		  ' `u = (v * Vab · Vab - Vpa · Vab) / Vac · Vab`
		  ' We know that the point is inside the Triangle if `u` and `v` are greater than zero 
		  ' and `u + v` is less than one.
		  '
		  ' - Parameter point: World space point.
		  ' - Parameter transform: The Shape's transform.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Var u, v As Double
		  
		  // Put the point into local coordinates.
		  Var p As PKVector2 = transform.GetInverseTransformed(point)
		  
		  // Get the vertices.
		  Var p1 As PKVector2 = Self.Vertices(0)
		  Var p2 As PKVector2 = Self.Vertices(1)
		  Var p3 As PKVector2 = Self.Vertices(2)
		  
		  // Create a vector representing edge ab.
		  Var ab As PKVector2 = p1.Towards(p2)
		  
		  // Create a vector representing edge ac.
		  Var ac As PKVector2 = p1.Towards(p3)
		  
		  // Create a vector from a to the point.
		  Var pa As PKVector2 = p1.towards(p)
		  
		  Var dot00 As Double = ac.Dot(ac)
		  Var dot01 As Double = ac.Dot(ab)
		  Var dot02 As Double = ac.Dot(pa)
		  Var dot11 As Double = ab.Dot(ab)
		  Var dot12 As Double = ab.Dot(pa)
		  
		  Var denominator As Double = dot00 * dot11 - dot01 * dot01
		  Var invD As Double = 1.0 / denominator
		  u = (dot11 * dot02 - dot01 * dot12) * invD
		  
		  // Don't bother going any farther if u is less than zero.
		  If u <= 0 Then Return False
		  
		  v = (dot00 * dot12 - dot01 * dot02) * invD
		  
		  Return v > 0 And (u + v <= 1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Triangle instance.
		  ///
		  
		  Var s() As String
		  s.AddRow("Triangle[")
		  s.AddRow(Super.ToString)
		  s.AddRow("]")
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Implementation of a Triangle Convex Shape.
		
		A Triangle must have one vertex which is not colinear with the other two.
		
		This class is provided to enhance performance of some of the methods contained in
		the Convex and Shape interfaces.
		
		
	#tag EndNote


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
