#tag Class
Protected Class RotationTests
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
		Sub CreateTest()
		  ///
		  ' Tests the `Create` method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var r1 As Rotation = New Rotation
		  // Should default to zero angle.
		  Assert.AreEqual(1.0, r1.cost, 1.0e-6)
		  Assert.AreEqual(0.0, r1.sint, 1.0e-6)
		  
		  Var r2 As Rotation = New Rotation(Maths.PI)
		  Assert.AreEqual(-1.0, r2.cost, 1.0e-6)
		  Assert.AreEqual(0.0, r2.sint, 1.0e-6)
		  
		  Var r3 As Rotation = New Rotation(-1.0, 0.0)
		  Assert.AreEqual(-1.0, r3.cost)
		  Assert.AreEqual(0.0, r3.sint)
		  
		  Var r4 As Rotation = New Rotation(1.0)
		  Assert.AreEqual(Cos(1.0), r4.cost, 1.0e-6)
		  Assert.AreEqual(Sin(1.0), r4.sint, 1.0e-6)
		  
		  Var r5 As Rotation = New Rotation(r4)
		  Assert.AreEqual(Cos(1.0), r5.cost, 1.0e-6)
		  Assert.AreEqual(Sin(1.0), r5.sint, 1.0e-6)
		  
		  Var r6 As Rotation = Rotation.of_(2.5)
		  Assert.AreEqual(Cos(2.5), r6.cost, 1.0e-6)
		  Assert.AreEqual(Sin(2.5), r6.sint, 1.0e-6)
		  
		  Var v1 As Vector2 = New Vector2(5, -5)
		  
		  Var r7 As Rotation = Rotation.of_(v1)
		  Assert.AreEqual(Cos(Maths.ToRadians(-45)), r7.cost, 1.0e-6)
		  Assert.AreEqual(Sin(Maths.ToRadians(-45)), r7.sint, 1.0e-6)
		  
		  Var t1 As Transform = New Transform
		  Call t1.SetRotation(-1.0)
		  t1.Translate(-10, -20) // Translation should not affect the result.
		  
		  Var r8 As Rotation = Rotation.of_(t1)
		  Assert.AreEqual(Cos(-1.0), r8.cost, 1.0e-6)
		  Assert.AreEqual(Sin(-1.0), r8.sint, 1.0e-6)
		  
		  // Test static methods for creation of common angles.
		  Var r0 As Rotation = Rotation.Rotation0
		  Assert.AreEqual(Cos(Maths.ToRadians(0.0)), r0.cost, 1.0e-6)
		  Assert.AreEqual(Sin(Maths.ToRadians(0.0)), r0.sint, 1.0e-6)
		  
		  Var r90 As Rotation = Rotation.Rotation90
		  Assert.AreEqual(Cos(Maths.ToRadians(90.0)), r90.cost, 1.0e-6)
		  Assert.AreEqual(Sin(Maths.ToRadians(90.0)), r90.sint, 1.0e-6)
		  
		  Var r180 As Rotation = Rotation.Rotation180
		  Assert.AreEqual(Cos(Maths.ToRadians(180.0)), r180.cost, 1.0e-6)
		  Assert.AreEqual(Sin(Maths.ToRadians(180.0)), r180.sint, 1.0e-6)
		  
		  Var r270 As Rotation = Rotation.Rotation270
		  Assert.AreEqual(Cos(Maths.ToRadians(270.0)), r270.cost, 1.0e-6)
		  Assert.AreEqual(Sin(Maths.ToRadians(270.0)), r270.sint, 1.0e-6)
		  
		  Var r45 As Rotation = Rotation.Rotation45
		  Assert.AreEqual(Cos(Maths.ToRadians(45.0)), r45.cost, 1.0e-6)
		  Assert.AreEqual(Sin(Maths.ToRadians(45.0)), r45.sint, 1.0e-6)
		  
		  Var r135 As Rotation = Rotation.Rotation135
		  Assert.AreEqual(Cos(Maths.ToRadians(135.0)), r135.cost, 1.0e-6)
		  Assert.AreEqual(Sin(Maths.ToRadians(135.0)), r135.sint, 1.0e-6)
		  
		  Var r225 As Rotation = Rotation.Rotation225
		  Assert.AreEqual(Cos(Maths.ToRadians(225.0)), r225.cost, 1.0e-6)
		  Assert.AreEqual(Sin(Maths.ToRadians(225.0)), r225.sint, 1.0e-6)
		  
		  Var r315 As Rotation = Rotation.Rotation315
		  Assert.AreEqual(Cos(Maths.ToRadians(315.0)), r315.cost, 1.0e-6)
		  Assert.AreEqual(Sin(Maths.ToRadians(315.0)), r315.sint, 1.0e-6)
		  
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
