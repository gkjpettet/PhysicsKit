#tag Class
Protected Class BasicCollisionPairTests
Inherits TestGroup
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
		  ' Tests the copy method.
		  ///
		  
		  Var body1 As TestCollisionBody = New TestCollisionBody
		  Var fixture1 As PKFixture = New PKFixture(PKGeometry.CreateCircle(0.5))
		  Var body2 As TestCollisionBody = New TestCollisionBody
		  Var fixture2 As PKFixture = New PKFixture(PKGeometry.CreateCircle(0.5))
		  
		  Var pair As PKBasicCollisionPair = New PKBasicCollisionPair(body1, fixture1, body2, fixture2)
		  Var copy As PKBasicCollisionPair = pair.Copy
		  
		  Assert.IsTrue(pair.GetBody1 = copy.GetBody1)
		  Assert.IsTrue(pair.GetFixture1 = copy.GetFixture1)
		  Assert.IsTrue(pair.GetBody2 = copy.GetBody2)
		  Assert.IsTrue(pair.GetFixture2 = copy.GetFixture2)
		  Assert.AreEqual(pair.HashCode, copy.HashCode)
		  Assert.IsFalse(pair = copy)
		  Assert.IsTrue(pair.Equals(copy))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTest()
		  ///
		  ' Tests the create method.
		  ///
		  
		  Var body1 As TestCollisionBody = New TestCollisionBody
		  Var fixture1 As PKFixture = New PKFixture(PKGeometry.CreateCircle(0.5))
		  Var body2 As TestCollisionBody = New TestCollisionBody
		  Var fixture2 As PKFixture = New PKFixture(PKGeometry.CreateCircle(0.5))
		  
		  Var pair As PKBasicCollisionPair = New PKBasicCollisionPair(body1, fixture1, body2, fixture2)
		  
		  Assert.IsTrue(body1 = pair.GetBody1)
		  Assert.IsTrue(fixture1 = pair.GetFixture1)
		  Assert.IsTrue(body2 = pair.GetBody2)
		  Assert.IsTrue(fixture2 = pair.GetFixture2)
		  
		  Assert.IsTrue(body1 = pair.GetBody(body1))
		  Assert.IsTrue(body2 = pair.GetBody(body2))
		  Assert.IsTrue(fixture1 = pair.GetFixture(body1))
		  Assert.IsTrue(fixture2 = pair.GetFixture(body2))
		  
		  Assert.IsTrue(body2 = pair.GetOtherBody(body1))
		  Assert.IsTrue(body1 = pair.GetOtherBody(body2))
		  Assert.IsTrue(fixture2 = pair.GetOtherFixture(body1))
		  Assert.IsTrue(fixture1 = pair.GetOtherFixture(body2))
		  
		  Var body3 As TestCollisionBody = New TestCollisionBody
		  
		  Assert.IsNil(pair.GetBody(body3))
		  Assert.IsNil(pair.GetFixture(body3))
		  Assert.IsNil(pair.GetOtherBody(body3))
		  Assert.IsNil(pair.GetOtherFixture(body3))
		  
		  Assert.IsNil(pair.GetBody(Nil))
		  Assert.IsNil(pair.GetFixture(Nil))
		  Assert.IsNil(pair.GetOtherBody(Nil))
		  Assert.IsNil(pair.GetOtherFixture(Nil))
		  
		  Assert.IsFalse(0 = pair.HashCode)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HashCodeEqualsTest()
		  ///
		  ' Tests the HashCode and Equals methods.
		  ///
		  
		  Var body1 As TestCollisionBody = New TestCollisionBody
		  Var fixture1 As PKFixture = New PKFixture(PKGeometry.CreateCircle(0.5))
		  Var body2 As TestCollisionBody = New TestCollisionBody
		  Var fixture2 As PkFixture = New PKFixture(PKGeometry.CreateCircle(0.5))
		  
		  Var pair1 As PKBasicCollisionPair = New PKBasicCollisionPair(body1, fixture1, body2, fixture2)
		  Var pair2 As PKBasicCollisionPair = New PKBasicCollisionPair(body2, fixture2, body1, fixture1)
		  Var pair3 As PKBasicCollisionPair = New PKBasicCollisionPair(body1, fixture1, body1, fixture1)
		  
		  Assert.AreEqual(pair1.HashCode, pair2.HashCode)
		  Assert.IsTrue(pair1.Equals(pair1))
		  Assert.IsTrue(pair1.Equals(pair2))
		  Assert.IsFalse(pair1.Equals(pair3))
		  Assert.IsFalse(pair3.HashCode = pair2.HashCode)
		  
		End Sub
	#tag EndMethod


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
