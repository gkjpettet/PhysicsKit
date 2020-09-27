#tag Class
Protected Class AbstractCollisionItemTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  ///
		  ' Sets up the tests.
		  ///
		  
		  Self.f1a = New PKFixture(PKGeometry.CreateCircle(1.0))
		  Self.f1b = New PKFixture(PKGeometry.CreateCircle(1.0))
		  Self.f2 = New PKFixture(PKGeometry.CreateCircle(2.0))
		  
		  Self.cb1 = New TestCollisionBody(Self.f1a) 
		  Call Self.cb1.AddFixture(Self.f1b)
		  Self.cb2 = New TestCollisionBody(Self.f2)
		  
		  Self.item1a = New PKBasicCollisionItem(Self.cb1, Self.f1a)
		  Self.item1b = New PKBasicCollisionItem(Self.cb1, Self.f1b)
		  Self.item2 = New PKBasicCollisionItem(Self.cb2, Self.f2)
		  
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
		  
		  Using TestSupportClasses
		  
		  Assert.IsTrue(PKAbstractCollisionItem.Equals(Self.item1a, Self.item1a))
		  Assert.IsTrue(PKAbstractCollisionItem.Equals(Self.item1b, Self.item1b))
		  Assert.IsTrue(PKAbstractCollisionItem.Equals(Self.item2, Self.item2))
		  
		  Assert.IsFalse(PKAbstractCollisionItem.Equals(Self.item1a, Self.item1b))
		  Assert.IsFalse(PKAbstractCollisionItem.Equals(Self.item1a, Self.item2))
		  Assert.IsFalse(PKAbstractCollisionItem.Equals(Self.item1b, Self.item2))
		  
		  Assert.IsFalse(PKAbstractCollisionItem.Equals(Self.item1b, Self.item1a))
		  Assert.IsFalse(PKAbstractCollisionItem.Equals(Self.item2, Self.item1a))
		  Assert.IsFalse(PKAbstractCollisionItem.Equals(Self.item2, Self.item1b))
		  
		  Assert.IsFalse(PKAbstractCollisionItem.Equals(Self.item2, Nil))
		  Assert.IsFalse(PKAbstractCollisionItem.Equals(Nil, Self.item2))
		  Assert.IsTrue(PKAbstractCollisionItem.Equals(Nil, Nil))
		  
		  Assert.IsFalse(PKAbstractCollisionItem.Equals(Self.item2, New ComparableObject))
		  Assert.IsFalse(PKAbstractCollisionItem.Equals(Nil, New ComparableObject))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HashCodeTest()
		  ///
		  ' Tests the HashCode method.
		  ///
		  
		  // HashCode must be the same for the same input, but could be the same for different input.
		  Var h1 As Integer = PKAbstractCollisionItem.GetHashCode(Self.cb1, Self.f1a)
		  Var h2 As Integer = PKAbstractCollisionItem.GetHashCode(Self.cb1, Self.f1a)
		  
		  Assert.AreEqual(h1, h2)
		  
		  h1 = PKAbstractCollisionItem.GetHashCode(Self.cb2, Self.f1b)
		  h2 = PKAbstractCollisionItem.GetHashCode(Self.cb2, Self.f1b)
		  
		  Assert.AreEqual(h1, h2)
		  
		  h1 = PKAbstractCollisionItem.GetHashCode(Self.cb1, Self.f1a)
		  h2 = PKAbstractCollisionItem.GetHashCode(Self.cb1, Self.f1b)
		  
		  Assert.IsFalse(h1 = h2)
		  
		  h1 = PKAbstractCollisionItem.GetHashCode(Self.cb1, Self.f1a)
		  h2 = PKAbstractCollisionItem.GetHashCode(Self.cb2, Self.f2)
		  
		  Assert.IsFalse(h1 = h2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MapTest()
		  ///
		  ' Tests the HashCode / Equals method in a FKMap implementation.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var map As FKHashMap = New FKHashMap
		  
		  Var o1 As DateTime = DateTime.Now
		  Var o2 As String  = "o2"
		  Var o3 As ComparableObject = New ComparableObject
		  
		  map.Put(Self.item1a, o1)
		  map.Put(Self.item1b, o2)
		  map.Put(Self.item2, o3)
		  
		  Var test As Variant = map.Get(Self.item1a)
		  Assert.IsTrue(o1 = test)
		  
		  test = map.Get(Self.item1b)
		  Assert.IsTrue(o2 = test)
		  
		  test = map.Get(Self.item2)
		  Assert.IsTrue(o3 = test)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private cb1 As TestCollisionBody
	#tag EndProperty

	#tag Property, Flags = &h21
		Private cb2 As TestCollisionBody
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
		Private item1a As PKCollisionItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private item1b As PKCollisionItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private item2 As PKCollisionItem
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
