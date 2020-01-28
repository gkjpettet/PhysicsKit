#tag Class
Protected Class MassTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  Prop2 = Prop2 + 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TearDown()
		  Prop2 = Prop2 - 1
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(err As RuntimeException, methodName As Text) As Boolean
		  #pragma unused err
		  
		  Const kMethodName As Text = "UnhandledException"
		  
		  If methodName.Length >= kMethodName.Length And methodName.Left(kMethodName.Length) = kMethodName Then
		    Assert.Pass("Exception was handled")
		    Return True
		  End If
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CreateArrayEmptyTest()
		  ///
		  ' Test the create method accepting an empty array.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Using PhysicsKit
		  
		  Try
		    Var masses() As Mass
		    Var m As Mass = Mass.Create(masses)
		    #Pragma Unused m
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateArrayInfiniteTest()
		  ///
		  ' Test the create method accepting an array of infinite Mass objects.
		  ///
		  
		  Using PhysicsKit
		  
		  Var m1 As Mass = New Mass
		  Var m2 As Mass = New Mass
		  Var m3 As Mass = New Mass
		  Var masses() As Mass
		  masses.AddRow(m1)
		  masses.AddRow(m2)
		  masses.AddRow(m3)
		  Var m As Mass = Mass.Create(masses)
		  
		  Var c As Vector2 = m.GetCenter
		  Assert.IsTrue(m.IsInfinite)
		  Assert.AreEqual(0.000, c.x, 1.0e-3)
		  Assert.AreEqual(0.000, c.y, 1.0e-3)
		  Assert.AreEqual(0.000, m.GetMass, 1.0e-3)
		  Assert.AreEqual(0.000, m.GetInertia, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateArrayNilElementTest()
		  ///
		  ' Test the create method accepting an array of masses where one is Nil.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Using PhysicsKit
		  
		  Try
		    Var m1 As Mass = New Mass(New Vector2, 1.0, 2.0)
		    Var m2 As Mass = New Mass(New Vector2, 2.0, 7.0)
		    Var masses() As Mass
		    masses.AddRow(m1)
		    masses.AddRow(Nil)
		    masses.AddRow(m2)
		    Call Mass.Create(masses)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateArrayNilTest()
		  ///
		  ' Tests the create method accepting a Nil array.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Using PhysicsKit
		  
		  Try
		    Var m As Mass = Mass.Create(Nil)
		    #Pragma Unused m
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateArrayOneElementTest()
		  ///
		  ' Tests the create method accepting an array of one Mass.
		  ///
		  
		  Using PhysicsKit
		  
		  Var m1 As Mass = New Mass(New Vector2, 1.0, 2.0)
		  Var masses() As Mass
		  masses.AddRow(m1)
		  Var m As Mass = Mass.Create(masses)
		  
		  Var c As Vector2 = m.GetCenter
		  Assert.IsFalse(m.IsInfinite)
		  Assert.AreDifferent(m1, m)
		  Assert.AreEqual(0.000, c.x, 1.0e-3)
		  Assert.AreEqual(0.000, c.y, 1.0e-3)
		  Assert.AreEqual(1.000, m.GetMass, 1.0e-3)
		  Assert.AreEqual(2.000, m.GetInertia, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateArrayOneNilElementTest()
		  ///
		  ' Test the create method accepting a list of one Nil element.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Using PhysicsKit
		  
		  Try
		    Var masses() As Mass
		    masses.AddRow(Nil)
		    Var m As mass = Mass.Create(masses)
		    #Pragma Unused m
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateArrayTest()
		  ///
		  ' Tests the create method accepting an array of Mass objects.
		  ///
		  
		  Using PhysicsKit
		  
		  Var m1 As Mass = New Mass(New Vector2( 1.0,  1.0), 3.00, 1.00)
		  Var m2 As Mass = New Mass(New Vector2(-1.0,  0.0), 0.50, 0.02)
		  Var m3 As Mass = New Mass(New Vector2( 1.0, -2.0), 2.00, 3.00)
		  Var masses() As Mass
		  masses.AddRow(m1)
		  masses.AddRow(m2)
		  masses.AddRow(m3)
		  Var m As Mass = Mass.Create(masses)
		  
		  Var c As Vector2 = m.GetCenter
		  Assert.AreEqual( 0.818, c.x, 1.0e-3)
		  Assert.AreEqual(-0.181, c.y, 1.0e-3)
		  Assert.AreEqual( 5.500, m.GetMass, 1.0e-3)
		  Assert.AreEqual(16.656, m.GetInertia, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCircleTest()
		  ///
		  ' Test case for the circle create method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var c As Circle = New Circle(3.0)
		  Var m As Mass = c.CreateMass(2.0)
		  
		  // The mass should be π * r * r * d
		  Assert.AreEqual(56.548, m.GetMass, 1.0e-3)
		  
		  // I should be m * r * r / 2
		  Assert.AreEqual(254.469, m.GetInertia, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCopyNilTest()
		  ///
		  ' Tests the create method.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Using PhysicsKit
		  
		  Try
		    Var m As Mass = New Mass(Nil)
		    #Pragma Unused m
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected NilObjectException because the Mass to copy is Nil.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCopyTest()
		  ///
		  ' Tests the create method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var m As Mass = New Mass(New Vector2(1.0, 0.0), 2.0, 1.0)
		  Var m2 As Mass = New Mass(m)
		  
		  Assert.AreDifferent(m, m2)
		  Assert.AreDifferent(m.Center, m2.Center)
		  Assert.AreEqual(m.Center.x, m2.Center.x)
		  Assert.AreEqual(m.Center.y, m2.Center.y)
		  Assert.AreEqual(m.GetMass, m2.GetMass)
		  Assert.AreEqual(m.GetInertia, m2.GetInertia)
		  Assert.IsTrue(m.GetType = m2.GetType)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateFixedAngularVelocityTest()
		  ///
		  ' Tests the create fixed angular velocity method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var m As Mass = New Mass(New Vector2, 1.0, 0.0)
		  Assert.IsFalse(m.IsInfinite)
		  Assert.IsTrue(m.GetType = MassTypes.FixedAngularVelocity)
		  Assert.IsTrue(m.GetCenter.Equals(New Vector2))
		  Assert.AreEqual(m.GetMass, 1.0)
		  Assert.AreEqual(m.GetInertia, 0.0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateFixedLimnearVelocityTest()
		  ///
		  ' Tests the create fixed linear velocity method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var m As Mass = New Mass(New Vector2, 0, 1.0)
		  Assert.IsFalse(m.IsInfinite)
		  Assert.IsTrue(m.GetType = MassTypes.FixedLinearVelocity)
		  Assert.IsTrue(m.GetCenter.Equals(New Vector2))
		  Assert.AreEqual(m.GetMass, 0.0)
		  Assert.AreEqual(m.GetInertia, 1.0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateInfiniteTest()
		  ///
		  ' Tests the create method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var m As Mass = New Mass(New Vector2, 0, 0)
		  Assert.IsTrue(m.IsInfinite)
		  Assert.IsTrue(m.GetCenter.Equals(New Vector2))
		  Assert.AreEqual(m.GetMass, 0.0)
		  Assert.AreEqual(m.GetInertia, 0.0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeInertiaTest()
		  ///
		  ' Tests the create method.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Using PhysicsKit
		  
		  Try
		    Var m As Mass = New Mass(New Vector2, 1.0, -1.0)
		    #Pragma Unused m
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException because the inertia tensor must be > 0")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeMassTest()
		  ///
		  ' Test the create method.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Using PhysicsKit
		  
		  Try
		    Var m As Mass = New Mass(New Vector2, -1.0, 1.0)
		    #Pragma Unused m
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException because mass must be > 0.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonTest()
		  ///
		  ' Tesys case for the polygon create method.
		  ///
		  
		  #Pragma Warning "Implement once the Polygon class has been ported."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateRectangleTest()
		  //
		  ' Test case for the Rectangle create method.
		  ///
		  
		  #Pragma Warning "Implement once the Rectangle class has been ported."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSegmentTest()
		  ///
		  ' Test case for the Segment create method.
		  ///
		  
		  #Pragma Warning "Implement once the Segment class has been ported."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSuccessTest()
		  ///
		  ' Test the create method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var m As Mass = New Mass(New Vector2, 1.0, 1.0)
		  Assert.IsTrue(m.GetCenter.Equals(New Vector2))
		  Assert.AreEqual(m.GetMass, 1.0)
		  Assert.AreEqual(m.GetInertia, 1.0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NilObjectExceptionTest()
		  ///
		  ' Tests the create method.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Using PhysicsKit
		  
		  Try
		    Var m As Mass = New Mass(Nil, 1.0, 1.0)
		    #Pragma Unused m
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException because the center is Nil.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PolygonInertiaAndCOMTest()
		  ///
		  ' Tests the inertia and COM calculatons for polygon shapes.
		  ///
		  
		  #Pragma Warning "Implement once Polygon class ported."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PolygonInertiaAndMassTest()
		  ///
		  ' Make sure the centre of mass does not effect the mass or inertia.
		  ///
		  
		  #Pragma Warning "Implement once the Polygon class has been ported."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTypeTest()
		  ///
		  ' Tests setting the type of the Mass.
		  ///
		  
		  Using PhysicsKit
		  
		  Var c As Circle = Geometry.CreateCircle(2.0)
		  Var mi As Mass = c.CreateMass(1.0)
		  
		  // Setting the type should not alter the mass values.
		  mi.SetType(MassTypes.Infinite)
		  Assert.IsTrue(mi.IsInfinite)
		  Assert.IsFalse(0.0 = mi.Mass)
		  Assert.IsFalse(0.0 = mi.InvMass)
		  Assert.IsFalse(0.0 = mi.Inertia)
		  Assert.IsFalse(0.0 = mi.InvInertia)
		  
		  // The get methods should return 0.
		  Assert.AreEqual(0.0, mi.GetMass)
		  Assert.AreEqual(0.0, mi.GetInverseMass)
		  Assert.AreEqual(0.0, mi.GetInertia)
		  Assert.AreEqual(0.0, mi.GetInverseInertia)
		  
		  mi.SetType(MassTypes.FixedAngularVelocity)
		  Assert.IsFalse(0.0 = mi.Mass)
		  Assert.IsFalse(0.0 = mi.InvMass)
		  Assert.IsFalse(0.0 = mi.Inertia)
		  Assert.IsFalse(0.0 = mi.InvInertia)
		  Assert.AreEqual(0.0, mi.GetInertia)
		  Assert.AreEqual(0.0, mi.GetInverseInertia)
		  
		  mi.SetType(MassTypes.FixedLinearVelocity)
		  Assert.IsFalse(0.0 = mi.Mass)
		  Assert.IsFalse(0.0 = mi.InvMass)
		  Assert.IsFalse(0.0 = mi.Inertia)
		  Assert.IsFalse(0.0 = mi.InvInertia)
		  Assert.AreEqual(0.0, mi.GetMass)
		  Assert.AreEqual(0.0, mi.GetInverseMass)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Prop1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Prop2 As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotImplementedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StopTestOnFail"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
