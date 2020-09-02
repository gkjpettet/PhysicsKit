#tag Class
Protected Class PKAbstractShape
Implements  PKTransformable,   PKDataContainer,  PKShape
	#tag Method, Flags = &h0, Description = 4D696E696D616C20636F6E7374727563746F722E
		Sub Constructor(radius As Double)
		  ///
		  ' Minimal constructor.
		  '
		  ' - Parameter radius: The rotation radius. Must be greater than zero.
		  '
		  ' - Raises: InvalidlArgumentException if radius is zero or less.
		  ///
		  
		  mID = New PKUUID
		  
		  Constructor(New PKVector2, radius)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E
		Sub Constructor(center As PKVector2, radius As Double)
		  ///
		  ' Full constructor.
		  '
		  ' - Parameter center: The center.
		  ' - Parameter radius: The rotation radius. Must be greater than zero.
		  '
		  ' - Raises: InvalidArgumentException if radius is zero or less.
		  ' - Raises: NilObjectException if center is Nil.
		  ///
		  
		  If mID Is Nil Then mID = New PKUUID
		  
		  Self.Center = center
		  Self.Radius = radius
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PKVector2) As Boolean
		  // Part of the PhysicsKit.Shape interface.
		  
		  Return Self.Contains(point, IDENTITY)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PKVector2, transform As PKTransform) As Boolean
		  // Part of the PhysicsKit.Shape interface.
		  
		  #Pragma Unused point
		  #Pragma Unused transform
		  
		  Raise New UnsupportedOperationException(_
		  "The Contains(PKVector2, Transform) method must be implemented by the AbstractShape subclass.")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB() As PKAABB
		  // Part of the PhysicsKit.Shape interface.
		  
		  Return Self.CreateAABB(IDENTITY)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB(transform As PKTransform) As PKAABB
		  // Part of the PhysicsKit.Shape interface.
		  
		  #Pragma Unused transform
		  
		  Raise New UnsupportedOperationException(_
		  "The CreateAABB(Transform) method must be implemented by the AbstractShape subclass.")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateMass(density As Double) As PKMass
		  // Part of the PhysicsKit.Shape interface.
		  
		  #Pragma Unused density
		  
		  Raise New UnsupportedOperationException(_
		  "The CreateMass(Double) method must be implemented by the AbstractShape subclass.")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCenter() As PKVector2
		  // Part of the PhysicsKit.Shape interface.
		  
		  Return Self.Center
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetID() As PKUUID
		  // Part of the PhysicsKit.Shape interface.
		  
		  Return mID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius() As Double
		  // Part of the PhysicsKit.Shape interface.
		  
		  Return Self.Radius
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius(center As PKVector2) As Double
		  // Part of the PhysicsKit.Shape interface.
		  
		  #Pragma Unused center
		  
		  Raise New UnsupportedOperationException(_
		  "The GetRadius(PKVector2) method must be implemented by the AbstractShape subclass.")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUserData() As Variant
		  // Part of the PhysicsKit.DataContainer interface.
		  
		  Return Self.UserData
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E697469616C69736573207368617265642070726F706572746965732E
		Shared Sub Initialise()
		  ///
		  ' Intialises shared properties.
		  ///
		  
		  IDENTITY = New PKTransform
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PKVector2) As PKInterval
		  // Part of the PhysicsKit.Shape interface.
		  
		  Return Self.Project(vector, IDENTITY)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(vector As PKVector2, transform As PKTransform) As PKInterval
		  // Part of the PhysicsKit.Shape interface.
		  
		  #Pragma Unused vector
		  #Pragma Unused transform
		  
		  Raise New UnsupportedOperationException(_
		  "The Project(PKVector2, Transform) method must be implemented by the AbstractShape subclass.")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double)
		  // Part of the PKRotatable interface.
		  
		  Self.Rotate(theta, 0.0, 0.0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double, x As Double, y As Double)
		  // Part of the PKRotatable interface.
		  
		  Self.Rotate(New PKRotation(theta), x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(theta As Double, point As PKVector2)
		  // Part of the PKRotatable interface.
		  
		  Self.Rotate(theta, point.X, point.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PKRotation)
		  // Part of the PKRotatable interface.
		  
		  Self.Rotate(r, 0.0, 0.0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PKRotation, x As Double, y As Double)
		  // Part of the PKRotatable interface.
		  
		  ///
		  ' Subclasses of AbstractShape should override just this method 
		  ' if they need to perform additional operations on rotations.
		  ///
		  
		  // Only rotate the center if the point about which we are rotating is not the center.
		  If Not Self.Center.Equals(x, y) Then Call Self.Center.Rotate(r, x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate(r As PKRotation, point As PKVector2)
		  // Part of the PKRotatable interface.
		  
		  Self.Rotate(r, point.X, point.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateAboutCenter(theta As Double)
		  // Part of the PhysicsKit.Shape interface.
		  
		  Self.Rotate(theta, Self.Center.X, Self.Center.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetUserData(data As Variant)
		  // Part of the PhysicsKit.DataContainer interface.
		  
		  Self.UserData = data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E20696E2074686520666F726D3A202249443D69647C43656E7465723D28582C59297C5261646975733D726164697573222E
		Function ToString() As String
		  ///
		  ' Returns a String representation in the form: "ID=id|Center=(X,Y)|Radius=radius".
		  ///
		  
		  Var s() As STring
		  s.AddRow("ID=")
		  s.AddRow(Self.ID.ToString)
		  s.AddRow("|Center=")
		  s.AddRow(Self.Center.ToString)
		  s.AddRow("|Radius=")
		  s.AddRow(Self.Radius.ToString)
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(x As Double, y As Double)
		  // Part of the PhysicsKit.Translatable interface.
		  
		  Call Self.Center.Add(x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Translate(vector As PKVector2)
		  // Part of the PhysicsKit.Translatable interface.
		  
		  Self.Translate(vector.X, vector.Y)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 5468652063656E746572206F6620746869732053686170652E
		Center As PKVector2
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return mID
			End Get
		#tag EndGetter
		Private ID As PKUUID
	#tag EndComputedProperty

	#tag Property, Flags = &h21, Description = 4964656E74697479205472616E73666F726D20696E7374616E63652E
		Private Shared IDENTITY As PKTransform
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 546865207368617065277320756E69717565206964656E7469666965722E
		Private mID As PKUUID
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D6178696D756D207261646975732E
		Radius As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 437573746F6D20757365722064617461206F626A6563742E
		UserData As Variant
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
	#tag EndViewBehavior
End Class
#tag EndClass
