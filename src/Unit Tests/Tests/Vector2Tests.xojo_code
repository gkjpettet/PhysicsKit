#tag Class
Protected Class Vector2Tests
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
		Sub CopyTest()
		  ///
		  ' Tests the `Copy` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As Vector2 = New Vector2(1.0, 3.0)
		  Var vc As Vector2 = v.Copy
		  
		  Assert.IsFalse(v = vc)
		  Assert.AreEqual(v.x, vc.x)
		  Assert.AreEqual(v.y, vc.y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTest()
		  ///
		  ' Tests the `Create` methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As Vector2 = New Vector2
		  Assert.AreEqual(0.0, v1.x)
		  Assert.AreEqual(0.0, v1.y)
		  
		  Var v2 As Vector2 = New Vector2(1.0, 2.0)
		  Assert.AreEqual(1.0, v2.x)
		  Assert.AreEqual(2.0, v2.y)
		  
		  Var v3 As Vector2 = New Vector2(v2)
		  Assert.IsFalse(v3 = v2)
		  Assert.AreEqual(1.0, v3.x)
		  Assert.AreEqual(2.0, v3.y)
		  
		  Var v4 As Vector2 = New Vector2(0.0, 1.0, 2.0, 3.0)
		  Assert.AreEqual(2.0, v4.x)
		  Assert.AreEqual(2.0, v4.y)
		  
		  Var v5 As Vector2 = New Vector2(v2, v1)
		  Assert.AreEqual(-1.0, v5.x)
		  Assert.AreEqual(-2.0, v5.y)
		  
		  Var v6 As Vector2 = Vector2.Create(1.0, Maths.ToRadians(90))
		  Assert.AreEqual( 0.000, v6.x, 1.0e-3)
		  Assert.AreEqual( 1.000, v6.y, 1.0e-3)
		  
		  Var v7 As Vector2 = New Vector2(Maths.ToRadians(30.0))
		  Assert.AreEqual(1.000, v7.GetMagnitude, 1.0e-4)
		  Assert.AreEqual(30.000, Maths.ToDegrees(v7.GetDirection), 1.0e-4)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DistanceTest()
		  ///
		  ' Tests the `Distance` methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v As Vector2 = New Vector2
		  
		  Assert.AreEqual(4.000, v.DistanceSquared(2.0, 0.0), 1.0e-3)
		  Assert.AreEqual(5.000, v.DistanceSquared(2.0, -1.0), 1.0e-3)
		  Assert.AreEqual(2.000, v.Distance(2.0, 0.0), 1.0e-3)
		  Assert.AreEqual(5.000, v.Distance(3.0, 4.0), 1.0e-3)
		  
		  Assert.AreEqual(4.000, v.DistanceSquared(New Vector2(2.0, 0.0)), 1.0e-3)
		  Assert.AreEqual(5.000, v.DistanceSquared(New Vector2(2.0, -1.0)), 1.0e-3)
		  Assert.AreEqual(2.000, v.Distance(New Vector2(2.0, 0.0)), 1.0e-3)
		  Assert.AreEqual(5.000, v.Distance(New Vector2(3.0, 4.0)), 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TripleProductTest()
		  ///
		  ' Tests the `TripleProduct` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var v1 As Vector2 = New Vector2(1.0, 1.0)
		  Var v2 As Vector2 = New Vector2(1.0, -1.0)
		  
		  Var r As Vector2 = Vector2.TripleProduct(v1, v2, v2)
		  
		  // T.he below would be -1.0 if the vectors were normalized.
		  Assert.AreEqual(-2.000, r.x, 1.0e-3)
		  Assert.AreEqual(-2.000, r.y, 1.0e-3)
		  
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
