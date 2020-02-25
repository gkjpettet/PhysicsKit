#tag Class
Protected Class Vector3Tests
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
		Sub AddTest()
		  ///
		  ' Tests the add and sum methods.
		  ///
		  
		  Var v1 As Vector3 = New Vector3(1.0, 2.0, 3.0)
		  Var v2 As Vector3 = New Vector3(-2.0, 1.0, -1.0)
		  
		  Var v3 As Vector3 = v1.Sum(v2)
		  Assert.AreEqual(-1.0, v3.x)
		  Assert.AreEqual( 3.0, v3.y)
		  Assert.AreEqual( 2.0, v3.z)
		  
		  v3 = v1.Sum(3.0, -7.5, 2.0)
		  Assert.AreEqual( 4.0, v3.x)
		  Assert.AreEqual(-5.5, v3.y)
		  Assert.AreEqual( 5.0, v3.z)
		  
		  Call v1.Add(v2)
		  Assert.AreEqual(-1.0, v1.x)
		  Assert.AreEqual( 3.0, v1.y)
		  Assert.AreEqual( 2.0, v1.z)
		  
		  Call v1.Add(-2.0, 1.0, 0.0)
		  Assert.AreEqual(-3.0, v1.x)
		  Assert.AreEqual( 4.0, v1.y)
		  Assert.AreEqual( 2.0, v1.z)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyTest()
		  ///
		  ' Tests the Copy method.
		  ///
		  
		  Var v As Vector3 = New Vector3(1.0, 3.0, 2.0)
		  Var vc As Vector3 = v.Copy
		  
		  Assert.IsFalse(v = vc)
		  Assert.AreEqual(v.x, vc.x)
		  Assert.AreEqual(v.y, vc.y)
		  Assert.AreEqual(v.z, vc.z)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTest()
		  ///
		  ' Tests the create methods.
		  ///
		  
		  Var v1 As Vector3 = New Vector3
		  
		  // Should default to zero.
		  Assert.AreEqual(0.0, v1.x)
		  Assert.AreEqual(0.0, v1.y)
		  Assert.AreEqual(0.0, v1.z)
		  
		  Var v2 As Vector3 = New Vector3(1.0, 2.0, 3.0)
		  Assert.AreEqual(1.0, v2.x)
		  Assert.AreEqual(2.0, v2.y)
		  Assert.AreEqual(3.0, v2.z)
		  
		  Var v3 As Vector3 = New Vector3(v2)
		  Assert.IsFalse(v3 = v2)
		  Assert.AreEqual(1.0, v3.x)
		  Assert.AreEqual(2.0, v3.y)
		  Assert.AreEqual(3.0, v3.z)
		  
		  Var v4 As Vector3 = New Vector3(0.0, 1.0, 1.0, 2.0, 3.0, 1.0)
		  Assert.AreEqual(2.0, v4.x)
		  Assert.AreEqual(2.0, v4.y)
		  Assert.AreEqual(0.0, v4.z)
		  
		  Var v5 As Vector3 = New Vector3(v2, v1)
		  Assert.AreEqual(-1.0, v5.x)
		  Assert.AreEqual(-2.0, v5.y)
		  Assert.AreEqual(-3.0, v5.z)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CrossTest()
		  ///
		  ' Tests the cross product methods.
		  ///
		  
		  Var v1 As Vector3 = New Vector3(1.0, 1.0, 0.0)
		  Var v2 As Vector3 = New Vector3(0.0, 1.0, -1.0)
		  
		  Var r As Vector3 = v1.Cross(v1)
		  Assert.AreEqual(0.0, r.x)
		  Assert.AreEqual(0.0, r.y)
		  Assert.AreEqual(0.0, r.z)
		  
		  r = v1.Cross(v2)
		  Assert.AreEqual(-1.0, r.x)
		  Assert.AreEqual( 1.0, r.y)
		  Assert.AreEqual( 1.0, r.z)
		  
		  r = v1.Cross(1.0, 1.0, 0.0)
		  Assert.AreEqual(0.0, r.x)
		  Assert.AreEqual(0.0, r.y)
		  Assert.AreEqual(0.0, r.z)
		  
		  r = v1.Cross(0.0, 1.0, 1.0)
		  Assert.AreEqual( 1.0, r.x)
		  Assert.AreEqual(-1.0, r.y)
		  Assert.AreEqual( 1.0, r.z)
		  
		  r = v1.Cross(-1.0, 1.0, -1.0)
		  Assert.AreEqual(-1.0, r.x)
		  Assert.AreEqual( 1.0, r.y)
		  Assert.AreEqual( 2.0, r.z)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DistanceTest()
		  ///
		  ' Tests the distance methods.
		  ///
		  
		  Var v As Vector3 = New Vector3
		  
		  Assert.AreEqual(4.000, v.DistanceSquared(2.0, 0.0, 0.0), 1.0e-3)
		  Assert.AreEqual(9.000, v.DistanceSquared(2.0, -1.0, 2.0), 1.0e-3)
		  Assert.AreEqual(2.000, v.Distance(2.0, 0.0, 0.0), 1.0e-3)
		  Assert.AreEqual(3.000, v.Distance(2.0, -1.0, 2.0), 1.0e-3)
		  
		  Assert.AreEqual(4.000, v.DistanceSquared(New Vector3(2.0, 0.0, 0.0)), 1.0e-3)
		  Assert.AreEqual(9.000, v.DistanceSquared(New Vector3(2.0, -1.0, 2.0)), 1.0e-3)
		  Assert.AreEqual(2.000, v.Distance(New Vector3(2.0, 0.0, 0.0)), 1.0e-3)
		  Assert.AreEqual(3.000, v.Distance(New Vector3(2.0, -1.0, 2.0)), 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DotTest()
		  ///
		  ' Tests the Dot method.
		  ///
		  
		  Var v1 As Vector3 = New Vector3(1.0, 1.0, -1.0)
		  Var v2 As Vector3 = New Vector3(0.0, 1.0, 0.0)
		  
		  Assert.AreEqual(1.0, v1.Dot(v2))
		  
		  Assert.AreEqual(1.0, v1.Dot(0.0, 1.0, 0.0))
		  
		  // Test a perpendicular vector.
		  Assert.AreEqual(0.0, v1.Dot(-1.0, 1.0, 0.0))
		  
		  Assert.AreEqual(2.0, v1.Dot(1.0, 1.0, 0.0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EqualsTest()
		  ///
		  ' Tests the Equals method.
		  ///
		  
		  Var v As Vector3 = New Vector3(1.0, 2.0, -1.0)
		  
		  Assert.IsTrue(v.Equals(v))
		  Assert.IsTrue(v.Equals(v.Copy))
		  Assert.IsTrue(v.Equals(New Vector3(1.0, 2.0, -1.0)))
		  Assert.IsTrue(v.Equals(1.0, 2.0, -1.0))
		  
		  Assert.IsFalse(v.Equals(v.Copy.Set(2.0, 1.0, -1.0)))
		  Assert.IsFalse(v.Equals(2.0, 2.0, 3.0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetTest()
		  ///
		  ' Tests the get methods.
		  ///
		  
		  Var v As Vector3 = New Vector3(2.0, 1.0, -2.0)
		  
		  Var x As Vector3 = v.GetXComponent
		  Var y As Vector3 = v.GetYComponent
		  Var z As Vector3 = v.GetZComponent
		  
		  Assert.AreEqual(2.0, x.x)
		  Assert.AreEqual(0.0, x.y)
		  Assert.AreEqual(0.0, x.z)
		  
		  Assert.AreEqual(0.0, y.x)
		  Assert.AreEqual(1.0, y.y)
		  Assert.AreEqual(0.0, y.z)
		  
		  Assert.AreEqual( 0.0, z.x)
		  Assert.AreEqual( 0.0, z.y)
		  Assert.AreEqual(-2.0, z.z)
		  
		  Assert.AreEqual(3.000, v.GetMagnitude, 1.0e-3)
		  Assert.AreEqual(9.000, v.GetMagnitudeSquared, 1.0e-3)
		  
		  Var v2 As Vector3 = v.GetNegative
		  Assert.AreEqual(-2.0, v2.x)
		  Assert.AreEqual(-1.0, v2.y)
		  Assert.AreEqual( 2.0, v2.z)
		  
		  v2 = v.GetNormalised
		  Assert.AreEqual( 0.666, v2.x, 1.0e-3)
		  Assert.AreEqual( 0.333, v2.y, 1.0e-3)
		  Assert.AreEqual(-0.666, v2.z, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsOrthogonalTest()
		  ///
		  ' Tests the IsOrthogonal method.
		  ///
		  
		  Var v1 As Vector3 = New Vector3(1.0, 1.0, 0.0)
		  Var v2 As Vector3 = New Vector3(0.0, 1.0, 2.0)
		  
		  Assert.IsFalse(v1.IsOrthogonal(v2))
		  Assert.IsFalse(v1.IsOrthogonal(v1))
		  
		  Assert.IsFalse(v1.IsOrthogonal(0.0, 1.0, 0.0))
		  Assert.IsTrue(v1.IsOrthogonal(1.0, -1.0, 0.0))
		  Assert.IsTrue(v1.IsOrthogonal(-1.0, 1.0, 0.0))
		  Assert.IsFalse(v1.IsOrthogonal(1.0, 1.0, 0.0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsZeroTest()
		  ///
		  ' Tests the IsZero method.
		  ///
		  
		  Var v As Vector3 = New Vector3
		  
		  Assert.IsTrue(v.IsZero)
		  
		  Call v.Set(1.0, 0.0, 0.0)
		  Assert.IsFalse(v.IsZero)
		  
		  Call v.set(1.0, 1.0, 0.0)
		  Assert.IsFalse(v.IsZero)
		  
		  Call v.set(0.0, 1.0, 1.0)
		  Assert.IsFalse(v.IsZero)
		  
		  Call v.set(0.0, 0.0, 1.0)
		  Assert.IsFalse(v.IsZero)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MultiplyTest()
		  ///
		  ' Tests the multiply and product methods.
		  ///
		  
		  Var v1 As Vector3 = New Vector3(2.0, 1.0, -1.0)
		  
		  Var r As Vector3 = v1.Product(-1.5)
		  Assert.AreEqual(-3.0, r.x)
		  Assert.AreEqual(-1.5, r.y)
		  Assert.AreEqual( 1.5, r.z)
		  
		  Call v1.Multiply(-1.5)
		  Assert.AreEqual(-3.0, v1.x)
		  Assert.AreEqual(-1.5, v1.y)
		  Assert.AreEqual( 1.5, v1.z)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NegateTest()
		  ///
		  ' Tests the Negate method.
		  ///
		  
		  Var v As Vector3 = New Vector3(1.0, -6.0, 2.0)
		  
		  Call v.Negate
		  Assert.AreEqual(-1.0, v.x)
		  Assert.AreEqual( 6.0, v.y)
		  Assert.AreEqual(-2.0, v.z)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NormaliseTest()
		  ///
		  ' Tests the Normalise method.
		  ///
		  
		  Var v As Vector3 = New Vector3(2.0, 1.0, 2.0)
		  Call v.Normalise
		  
		  Assert.AreEqual( 2.0 / 3.0, v.x, 1.0e-3)
		  Assert.AreEqual( 1.0 / 3.0, v.y, 1.0e-3)
		  Assert.AreEqual( 2.0 / 3.0, v.z, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProjectTest()
		  ///
		  ' Tests the Project method.
		  ///
		  
		  Var v1 As Vector3 = New Vector3(1.0, 1.0, 0.0)
		  Var v2 As Vector3 = New Vector3(0.5, 1.0, 1.0)
		  
		  Var r As Vector3 = v1.Project(v2)
		  
		  Assert.AreEqual( 0.333, r.x, 1.0e-3)
		  Assert.AreEqual( 0.666, r.y, 1.0e-3)
		  Assert.AreEqual( 0.666, r.z, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTest()
		  ///
		  ' Tests the set methods.
		  ///
		  
		  Var v As Vector3 = New Vector3
		  
		  Var v2 As Vector3 = New Vector3(1.0, -3.0, 2.0)
		  Call v.Set(v2)
		  
		  Assert.IsFalse(v = v2)
		  Assert.AreEqual(1.0, v.x)
		  Assert.AreEqual(-3.0, v.y)
		  Assert.AreEqual(2.0, v.z)
		  
		  Call v.Set(-1.0, 0.0, 0.0)
		  Assert.AreEqual(-1.0, v.x)
		  Assert.AreEqual( 0.0, v.y)
		  Assert.AreEqual( 0.0, v.z)
		  
		  Call v.SetMagnitude(3.0)
		  Assert.AreEqual(-3.0, v.x, 1.0e-3)
		  Assert.AreEqual( 0.0, v.y)
		  Assert.AreEqual( 0.0, v.z)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SubtractTest()
		  ///
		  ' Tests the subtract and difference methods.
		  ///
		  
		  Var v1 As Vector3 = New Vector3(1.0, 2.0, 3.0)
		  Var v2 As Vector3 = New Vector3(-2.0, 1.0, -1.0)
		  
		  Var v3 As Vector3 = v1.Difference(v2)
		  Assert.AreEqual(3.0, v3.x)
		  Assert.AreEqual(1.0, v3.y)
		  Assert.AreEqual(4.0, v3.z)
		  
		  v3 = v1.Difference(3.0, -7.5, 2.0)
		  Assert.AreEqual(-2.0, v3.x)
		  Assert.AreEqual( 9.5, v3.y)
		  Assert.AreEqual( 1.0, v3.z)
		  
		  Call v1.Subtract(v2)
		  Assert.AreEqual(3.0, v1.x)
		  Assert.AreEqual(1.0, v1.y)
		  Assert.AreEqual(4.0, v1.z)
		  
		  Call v1.Subtract(-2.0, 1.0, 0.0)
		  Assert.AreEqual(5.0, v1.x)
		  Assert.AreEqual(0.0, v1.y)
		  Assert.AreEqual(4.0, v1.z)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TowardsTest()
		  ///
		  ' Tests the Towards method.
		  ///
		  
		  Var p1 As Vector3 = New Vector3(1.0, 1.0, 1.0)
		  Var p2 As Vector3 = New Vector3(0.0, 1.0, 0.0)
		  
		  Var r As Vector3 = p1.Towards(p2)
		  
		  Assert.AreEqual(-1.0, r.x)
		  Assert.AreEqual( 0.0, r.y)
		  Assert.AreEqual(-1.0, r.z)
		  
		  r = p1.Towards(2.0, 0.0, -1.0)
		  
		  Assert.AreEqual( 1.0, r.x)
		  Assert.AreEqual(-1.0, r.y)
		  Assert.AreEqual(-2.0, r.z)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TripleProductTest()
		  ///
		  ' Tests the TripleProduct method.
		  ///
		  
		  Var v1 As Vector3 = New Vector3(1.0, 1.0, 0.0)
		  Var v2 As Vector3 = New Vector3(0.0, -1.0, 1.0)
		  
		  Var r As Vector3 = Vector3.TripleProduct(v1, v2, v2)
		  
		  Assert.AreEqual(-2.000, r.x, 1.0e-3)
		  Assert.AreEqual(-1.000, r.y, 1.0e-3)
		  Assert.AreEqual(-1.000, r.z, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ZeroTest()
		  ///
		  ' Tests the Zero method.
		  ///
		  
		  Var v As Vector3 = New Vector3(1.0, -2.0, 3.0)
		  
		  Call v.Zero
		  Assert.AreEqual( 0.0, v.x)
		  Assert.AreEqual( 0.0, v.y)
		  Assert.AreEqual( 0.0, v.z)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Prop1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Prop2 As Integer
	#tag EndProperty


	#tag Using, Name = PhysicsKit
	#tag EndUsing


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
