#tag Class
Protected Class ReferenceTests
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
		Sub CreateTest()
		  ///
		  ' Tests the constructors.
		  ///
		  
		  // Neither should raise an exception.
		  Try
		    Var r1 As PKReference = New PKReference
		    Var r2 As PKReference = New PKReference(5)
		    #Pragma Unused r1
		    #Pragma Unused r2
		    Assert.Pass
		    Return
		  Catch e
		    Assert.Fail("Should not have raised an exception")
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EqualsTest()
		  ///
		  ' Tests the `Equals` method.
		  ///
		  
		  Var test As PKReference = New PKReference(5)
		  
		  Var r1 As PKReference = New PKReference
		  Var r2 As PKReference = New PKReference
		  Assert.IsTrue(r1.Equals(r2))
		  
		  Var r3 As PKReference = New PKReference(5)
		  Var r4 As PKReference = New PKReference(5)
		  Assert.IsTrue(r3.Equals(r4))
		  
		  Var r5 As PKReference = New PKReference(5)
		  Assert.IsTrue(test.Equals(r5))
		  Assert.IsTrue(test.Equals(test))
		  
		  Var obj As PKObject = New PKObject
		  Var test2 As PKReference = New PKReference(obj)
		  
		  Var r7 As PKReference = New PKReference(obj)
		  Var r8 As PKReference = New PKReference(obj)
		  Assert.IsTrue(r7.Equals(r8))
		  
		  Var r9 As PKReference = New PKReference(obj)
		  Assert.IsTrue(test2.Equals(r9))
		  Assert.IsTrue(test2.Equals(test2))
		  
		  Var r10 As PKReference = New PKReference(1)
		  Var r11 As PKReference = New PKReference
		  Assert.IsFalse(r10.Equals(r11))
		  
		  Var r12 As PKReference = New PKReference
		  Var r13 As PKReference = New PKReference(1)
		  Assert.IsFalse(r12.Equals(r13))
		  
		  Var r14 As PKReference = New PKReference(1)
		  Var r15 As PKReference = New PKReference(5)
		  Assert.IsFalse(r14.Equals(r15))
		  
		  Var r16 As PKReference = New PKReference(4)
		  Assert.IsFalse(test.Equals(r16))
		  Assert.IsFalse(test.Equals(Nil))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HashCodeTest()
		  ///
		  ' Tests the `HashCode` method.
		  ///
		  
		  Var test As PKReference = New PKReference(5)
		  
		  Var r1 As PKReference = New PKReference
		  Var r2 As PKReference = New PKReference
		  Assert.AreEqual(r1.HashCode, r2.HashCode)
		  
		  Var r3 As PKReference = New PKReference(5)
		  Var r4 As PKReference = New PKReference(5)
		  Assert.AreEqual(r3.HashCode, r4.HashCode)
		  
		  Var r5 As PKReference = New PKReference(5)
		  Assert.AreEqual(test.HashCode, r5.HashCode)
		  Assert.AreEqual(test.HashCode, test.HashCode)
		  
		  Var obj As PKObject = New PKObject
		  Var test2 As PKReference = New PKReference(obj)
		  
		  Var r6 As PKReference = New PKReference
		  Var r7 As PKReference = New PKReference
		  Assert.AreEqual(r6.HashCode, r7.HashCode)
		  
		  Var r8 As PKReference = New PKReference(obj)
		  Var r9 As PKReference = New PKReference(obj)
		  Assert.AreEqual(r8.HashCode, r9.HashCode)
		  
		  Var r10 As PKReference = New PKReference(obj)
		  Assert.AreEqual(test2.HashCode, r10.HashCode)
		  Assert.AreEqual(test2.HashCode, test2.HashCode)
		  
		  Var r11 As PKReference = New PKReference(1)
		  Var r12 As PKReference = New PKReference
		  Assert.IsFalse(r11.HashCode = r12.HashCode)
		  
		  Var r13 As PKReference = New PKReference
		  Var r14 As PKReference = New PKReference(1)
		  Assert.IsFalse(r13.HashCode = r14.HashCode)
		  
		  Var r15 As PKReference = New PKReference(1)
		  Var r16 As PKReference = New PKReference(5)
		  Assert.IsFalse(r15.HashCode = r16.HashCode)
		  
		  Var r17 As PKReference = New PKReference(4)
		  Assert.IsFalse(test.HashCode = r17.HashCode)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToStringTest()
		  ///
		  ' Tests the `ToString` method.
		  ///
		  
		  Var r1 As PKReference = New PKReference
		  Assert.AreEqual("Nil", r1.ToString)
		  Var i As Integer = 5
		  Var r2 As PKReference = New PKReference(5)
		  Assert.AreEqual(i.ToString, r2.ToString)
		  
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
