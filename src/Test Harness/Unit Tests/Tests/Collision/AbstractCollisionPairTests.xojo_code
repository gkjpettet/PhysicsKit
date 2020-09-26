#tag Class
Protected Class AbstractCollisionPairTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  ///
		  ' Sets up the tests.
		  ///
		  
		  Self.f1a = New PKFixture(PKGeometry.CreateCircle(1.0))
		  Self.f1b = New PKFixture(PKGeometry.CreateCircle(1.0))
		  Self.f2 = New PKFixture(PKGeometry.CreateCircle(2.0))
		  Self.f3 = New PKFixture(PKGeometry.CreateCircle(3.0))
		  
		  Self.cb1 = New TestCollisionBody(Self.f1a)
		  Call Self.cb1.AddFixture(Self.f1b)
		  Self.cb2 = New TestCollisionBody(Self.f2)
		  Self.cb3 = New TestCollisionBody(Self.f3)
		  
		  Self.pair_1a_to_2 = New PKBasicCollisionPair(Self.cb1, Self.f1a, Self.cb2, Self.f2)
		  Self.pair_2_to_1a = New PKBasicCollisionPair(Self.cb2, Self.f2, Self.cb1, Self.f1a)
		  Self.pair_1b_to_2 = New PKBasicCollisionPair(Self.cb1, Self.f1b, Self.cb2, Self.f2)
		  Self.pair_2_to_1b = New PKBasicCollisionPair(Self.cb2, Self.f2, Self.cb1, Self.f1b)
		  Self.pair_2_to_3 = New PKBasicCollisionPair(Self.cb2, Self.f2, Self.cb3, Self.f3)
		  Self.pair_3_to_2 = New PKBasicCollisionPair(Self.cb3, Self.f3, Self.cb2, Self.f2)
		  
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
		Sub EqualsTest()
		  ///
		  ' Tests the Equals method.
		  ///
		  
		  Assert.IsTrue(PKAbstractCollisionPair.Equals(Self.pair_1a_to_2, Self.pair_1a_to_2))
		  Assert.IsTrue(PKAbstractCollisionPair.Equals(Self.pair_1a_to_2, Self.pair_2_to_1a))
		  
		  Assert.IsFalse(PKAbstractCollisionPair.Equals(Self.pair_1a_to_2, Self.pair_1b_to_2))
		  Assert.IsFalse(PKAbstractCollisionPair.Equals(Self.pair_1b_to_2, Self.pair_1a_to_2))
		  
		  Assert.IsFalse(PKAbstractCollisionPair.Equals(Self.pair_1a_to_2, Self.pair_2_to_1b))
		  Assert.IsFalse(PKAbstractCollisionPair.Equals(Self.pair_2_to_1b, Self.pair_1a_to_2))
		  
		  Assert.IsTrue(PKAbstractCollisionPair.Equals(Self.pair_2_to_3, Self.pair_2_to_3))
		  Assert.IsTrue(PKAbstractCollisionPair.Equals(Self.pair_2_to_3, Self.pair_3_to_2))
		  Assert.IsTrue(PKAbstractCollisionPair.Equals(Self.pair_3_to_2, Self.pair_2_to_3))
		  Assert.IsTrue(PKAbstractCollisionPair.Equals(Self.pair_3_to_2, Self.pair_3_to_2))
		  
		  Assert.IsFalse(PKAbstractCollisionPair.Equals(Self.pair_1a_to_2, Nil))
		  Assert.IsFalse(PKAbstractCollisionPair.Equals(Nil, Self.pair_2_to_1a))
		  Assert.IsTrue(PKAbstractCollisionPair.Equals(Nil, Nil))
		  
		  Var obj1 As PKCircle = PKGeometry.CreateCircle(5)
		  Var obj2 As PKCircle = PKGeometry.CreateCircle(1)
		  Assert.IsFalse(PKAbstractCollisionPair.Equals(Self.pair_1a_to_2, obj1))
		  Assert.IsFalse(PKAbstractCollisionPair.Equals(Nil, obj2))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HashCodeTest()
		  ///
		  ' Tests the HashCode method.
		  ///
		  
		  // HashCode must be the same for the same input, but could be the same for different input
		  // in this particular case, the hashcode for re-ordered body/fixtures should be the same
		  Var h1 As Integer = PKAbstractCollisionPair.GetHashCode(Self.cb1, Self.f1a, Self.cb2, Self.f2)
		  Var h2 As Integer = PKAbstractCollisionPair.GetHashCode(Self.cb2, Self.f2, Self.cb1, Self.f1a)
		  
		  Assert.AreEqual(h1, h2)
		  
		  h2 = Self.pair_1a_to_2.HashCode
		  
		  Assert.AreEqual(h1, h2)
		  
		  h2 = Self.pair_2_to_1a.HashCode
		  
		  Assert.AreEqual(h1, h2)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private cb1 As TestCollisionBody
	#tag EndProperty

	#tag Property, Flags = &h21
		Private cb2 As TestCollisionBody
	#tag EndProperty

	#tag Property, Flags = &h21
		Private cb3 As TestCollisionBody
	#tag EndProperty

	#tag Property, Flags = &h21
		Private f1a As PKFixture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private f1b As PKFixture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private f2 As PKFixture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private f3 As PKFixture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pair_1a_to_2 As PKCollisionPair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pair_1b_to_2 As PKCollisionPair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pair_2_to_1a As PKCollisionPair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pair_2_to_1b As PKCollisionPair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pair_2_to_3 As PKCollisionPair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pair_3_to_2 As PKCollisionPair
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
