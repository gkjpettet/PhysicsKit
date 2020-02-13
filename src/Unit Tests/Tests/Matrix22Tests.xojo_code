#tag Class
Protected Class Matrix22Tests
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
		  ' Tests the Add method.
		  ///
		  
		  Var m1 As Matrix22 = New Matrix22(0.0, 2.0, 3.5, 1.2)
		  Var m2 As Matrix22 = New Matrix22(1.3, 0.3, 0.0, 4.5)
		  
		  Call m1.Add(m2)
		  
		  // Test the values.
		  Assert.AreEqual(1.3, m1.m00)
		  Assert.AreEqual(2.3, m1.m01)
		  Assert.AreEqual(3.5, m1.m10)
		  Assert.AreEqual(5.7, m1.m11)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyTest()
		  ///
		  ' Tests the copy constructor.
		  ///
		  
		  Var m1 As Matrix22 = New Matrix22
		  m1.m00 = 0
		  m1.m01 = 2
		  m1.m10 = 1
		  m1.m11 = 3
		  
		  // Make a copy.
		  Var m2 As Matrix22 = New Matrix22(m1)
		  
		  // Test the values.
		  Assert.AreEqual(m1.m00, m2.m00)
		  Assert.AreEqual(m1.m01, m2.m01)
		  Assert.AreEqual(m1.m10, m2.m10)
		  Assert.AreEqual(m1.m11, m2.m11)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateFullArrayTest()
		  ///
		  ' Test the creation method passing a Double array.
		  ///
		  
		  Var m As Matrix22 = New Matrix22(Array(1.0, 2.0, -3.0, 8.0))
		  Assert.AreEqual(1.0, m.m00)
		  Assert.AreEqual(2.0, m.m01)
		  Assert.AreEqual(-3.0, m.m10)
		  Assert.AreEqual(8.0, m.m11)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateFullTest()
		  ///
		  ' Tests the creation method passing four Doubles.
		  ///
		  
		  Var m As Matrix22 = New Matrix22(1.0, 2.0, -3.0, 8.0)
		  Assert.AreEqual(1.0, m.m00)
		  Assert.AreEqual(2.0, m.m01)
		  Assert.AreEqual(-3.0, m.m10)
		  Assert.AreEqual(8.0, m.m11)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SubtractTest()
		  ///
		  ' Tests the Subtract method.
		  ///
		  
		  Var m1 As Matrix22 = New Matrix22(0.0, 2.0, 3.5, 1.2)
		  Var m2 As Matrix22 = New Matrix22(1.3, 0.3, 0.0, 4.5)
		  
		  Call m1.Subtract(m2)
		  
		  // Test the values.
		  Assert.AreEqual(-1.3, m1.m00)
		  Assert.AreEqual(1.7, m1.m01)
		  Assert.AreEqual(3.5, m1.m10)
		  Assert.AreEqual(-3.3, m1.m11)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SumTest()
		  ///
		  ' Tests the Sum method.
		  ///
		  
		  Var m1 As Matrix22 = New Matrix22(0.0, 2.0, 3.5, 1.2)
		  Var m2 As Matrix22 = New Matrix22(1.3, 0.3, 0.0, 4.5)
		  
		  Var m3 As Matrix22  = m1.Sum(m2)
		  
		  // Test the values.
		  Assert.AreEqual(1.3, m3.m00)
		  Assert.AreEqual(2.3, m3.m01)
		  Assert.AreEqual(3.5, m3.m10)
		  Assert.AreEqual(5.7, m3.m11)
		  
		  // Make sure we didn't modify the first matrix.
		  Assert.IsFalse(m1.Equals(m3))
		  
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
