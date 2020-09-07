#tag Class
Protected Class PKAdaptiveDecimalTests
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
		Sub AppendTest()
		  ///
		  ' Tests for appending new components to anPKAdaptiveDecimal.
		  ///
		  
		  Var ed As PKAdaptiveDecimal = New PKAdaptiveDecimal(5)
		  
		  Call ed.Append(1.0)
		  Assert.AreEqual(1, ed.Size)
		  Assert.AreEqual(1.0, ed.Get(0))
		  
		  Call ed.Append(15.5)
		  Assert.AreEqual(2, ed.Size)
		  Assert.AreEqual(15.5, ed.Get(1))
		  
		  Call ed.AppendNonZero(0.0)
		  Assert.AreEqual(2, ed.Size)
		  
		  Call ed.AppendNonZero(111.0)
		  Assert.AreEqual(3, ed.Size)
		  Assert.AreEqual(111.0, ed.Get(2))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckInvariantsTest()
		  ///
		  ' Test the methods that checks whether a particular PKAdaptiveDecimal honors the
		  ' invariants described in the corresponding class.
		  ' Also checks that the result of various operations continues to satisfy those 
		  ' invariants (as they should).
		  ///
		  
		  Var ed1 As PKAdaptiveDecimal = New PKAdaptiveDecimal(3)
		  Call ed1.Append(1.0).Append(0.0).Append(0.2)
		  Assert.IsFalse(ed1.CheckInvariants)
		  
		  Var ed2 As PKAdaptiveDecimal = New PKAdaptiveDecimal(5)
		  Call ed2.Append(-1.0).Append(0.0).Append(0.0).Append(0.2).Append(0.0)
		  Assert.IsFalse(ed2.CheckInvariants)
		  
		  Var ed3 As PKAdaptiveDecimal = New PKAdaptiveDecimal(2)
		  Call ed3.Append(1.0e-2).Append(1.0e2 + 1.0e-2)
		  Assert.IsFalse(ed3.CheckInvariants)
		  
		  Var ed4 As PKAdaptiveDecimal = New PKAdaptiveDecimal(5)
		  Call ed4.Append(-1.0 / 4.0).Append(0.0).Append(0.0).Append(4.0 + 1.0 / 4.0).Append(0.0)
		  Assert.IsFalse(ed4.CheckInvariants)
		  
		  Var ed5 As PKAdaptiveDecimal = New PKAdaptiveDecimal(5)
		  Call ed5.Append(0.0).Append(1.0 / 4.0).Append(0.0).Append(4.0 + 32.0).Append(32.0 * 32.0)
		  Assert.IsTrue(ed5.CheckInvariants)
		  ed5.EnsureInvariants
		  
		  Var ed6 As PKAdaptiveDecimal = New PKAdaptiveDecimal(3)
		  Call ed6.Append(0.0).Append(0.0).Append(0.0)
		  Assert.IsTrue(ed6.CheckInvariants)
		  ed5.EnsureInvariants
		  
		  // Constant seed so we always get the same sequence of randoms.
		  System.Random.Seed = SEED
		  Var iterations As Integer = 1000
		  
		  Var acc As PKAdaptiveDecimal = PKAdaptiveDecimal.ValueOf(0)
		  
		  For i As Integer = 1 To iterations
		    Var test As PKAdaptiveDecimal = PKAdaptiveDecimal.ValueOf(System.Random.Number * 10 - 5)
		    acc = acc.Sum(test)
		    
		    Assert.IsTrue(acc.CheckInvariants)
		  Next i
		  
		  For i As Integer = 1 To iterations
		    Var a As Double = System.Random.Number * 10 - 5
		    Var b As Double = System.Random.Number * 10 - 5
		    Var test As PKAdaptiveDecimal
		    
		    test = PKAdaptiveDecimal.FromSum(a, b)
		    Assert.IsTrue(test.CheckInvariants)
		    
		    test = PKAdaptiveDecimal.FromDiff(a, b)
		    Assert.IsTrue(test.CheckInvariants)
		    
		    test = PKAdaptiveDecimal.FromProduct(a, b)
		    Assert.IsTrue(test.CheckInvariants)
		    
		    Var c As Double = System.Random.Number * 10 - 5
		    Var d As Double = System.Random.Number * 10 - 5
		    
		    // Also check with the related `PKRobustGeometry.Cross` method.
		    test = PKRobustGeometry.Cross(a, b, c, d)
		    Assert.IsTrue(test.CheckInvariants, "PKRobustGeometry.Cross")
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearTest()
		  ///
		  ' Tests the Clear method.
		  ///
		  
		  Var ed As PKAdaptiveDecimal = New PKAdaptiveDecimal(2)
		  Call ed.Append(0.1).Append(15.0)
		  
		  Assert.AreEqual(2, ed.Size)
		  
		  Call ed.Clear
		  
		  Assert.AreEqual(0, ed.Size)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyTest()
		  ///
		  ' Tests the various ways to copy PKAdaptiveDecimals.
		  ///
		  
		  Var ed As PKAdaptiveDecimal = New PKAdaptiveDecimal(2)
		  Call ed.Append(0.1).Append(15.0)
		  
		  Var copy As PKAdaptiveDecimal = ed.Copy
		  
		  Assert.AreEqual(0.1, copy.Get(0))
		  Assert.AreEqual(15.0, copy.Get(1))
		  
		  Call copy.Clear
		  Call copy.Append(0.2)
		  
		  Assert.AreEqual(0.1, ed.Get(0))
		  Assert.AreEqual(15.0, ed.Get(1))
		  
		  Var copy2 As PKAdaptiveDecimal = New PKAdaptiveDecimal(5)
		  copy2.CopyFrom(ed)
		  
		  Assert.AreEqual(0.1, copy2.Get(0))
		  Assert.AreEqual(15.0, copy2.Get(1))
		  Assert.AreEqual(5, copy2.Capacity)
		  
		  Call copy2.Clear
		  Call copy2.Append(0.2)
		  
		  Assert.AreEqual(0.1, ed.Get(0))
		  Assert.AreEqual(15.0, ed.Get(1))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTest()
		  ///
		  ' Test the various ways to create new PKAdaptiveDecimal instances.
		  ///
		  
		  Var ed As PKAdaptiveDecimal = New PKAdaptiveDecimal(2)
		  Assert.AreEqual(0, ed.Size)
		  Assert.AreEqual(2, ed.Capacity)
		  
		  Call ed.Append(1.0)
		  
		  Var ed2 As PKAdaptiveDecimal = New PKAdaptiveDecimal(ed)
		  Assert.AreEqual(1, ed.Size)
		  Assert.AreEqual(2, ed.Capacity)
		  
		  Call ed2.Clear
		  Call ed2.Append(2.0)
		  
		  Assert.AreEqual(1.0, ed.Get(0))
		  
		  Var ed3 As PKAdaptiveDecimal = PKAdaptiveDecimal.ValueOf(10.0)
		  Assert.AreEqual(10.0, ed3.Get(0))
		  
		  Var ed4 As PKAdaptiveDecimal = PKAdaptiveDecimal.FromSum(0.1, 0.2)
		  Assert.AreEqual(0.1 + 0.2, ed4.GetEstimation)
		  
		  Var ed5 As PKAdaptiveDecimal = PKAdaptiveDecimal.FromDiff(0.1, 0.2)
		  Assert.AreEqual(0.1 - 0.2, ed5.GetEstimation)
		  
		  Var ed6 As PKAdaptiveDecimal = PKAdaptiveDecimal.FromProduct(0.1, 0.2)
		  Assert.AreEqual(0.1 * 0.2, ed6.GetEstimation)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetEstimationTest()
		  ///
		  ' Test the method that estimates an PKAdaptiveDecimal's value with a Double.
		  ///
		  
		  Var ed As PKAdaptiveDecimal = New PKAdaptiveDecimal(5)
		  
		  Assert.AreEqual(0.0, ed.GetEstimation)
		  
		  Call ed.Append(0.0)
		  ed = ed.Sum(PKAdaptiveDecimal.ValueOf(1.0e-5))
		  ed = ed.Sum(PKAdaptiveDecimal.ValueOf(1.0e2))
		  ed = ed.Sum(PKAdaptiveDecimal.ValueOf(1.0e100))
		  
		  Assert.AreEqual(1.0e100, ed.GetEstimation)
		  
		  Call ed.Clear
		  Call ed.Append(1.0)
		  ed = ed.Sum(PKAdaptiveDecimal.ValueOf(2.0))
		  ed = ed.Sum(PKAdaptiveDecimal.ValueOf(3.0))
		  ed = ed.Sum(PKAdaptiveDecimal.ValueOf(-5.0))
		  
		  Assert.AreEqual(1.0, ed.GetEstimation)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NegateTest()
		  ///
		  ' Test the method that negates the value of an PKAdaptiveDecimal.
		  ///
		  
		  Var ed As PKAdaptiveDecimal = New PKAdaptiveDecimal(5)
		  
		  Call ed.Negate
		  
		  Call ed.Append(1.0)
		  ed = ed.Sum(PKAdaptiveDecimal.ValueOf(2.0))
		  ed = ed.Sum(PKAdaptiveDecimal.ValueOf(3.0))
		  ed = ed.Sum(PKAdaptiveDecimal.ValueOf(5.0))
		  Call ed.Negate
		  
		  Assert.AreEqual(-11.0, ed.GetEstimation)
		  
		  Call ed.Clear
		  Call ed.Append(-1.0)
		  ed = ed.Sum(PKAdaptiveDecimal.ValueOf(-2.0))
		  ed = ed.Sum(PKAdaptiveDecimal.ValueOf(-7.0))
		  Call ed.Negate
		  
		  Assert.AreEqual(10.0, ed.GetEstimation)
		  Call ed.Negate
		  Assert.AreEqual(-10.0, ed.GetEstimation)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NormaliseTest()
		  ///
		  ' Test the normalise method that ensures an PKAdaptiveDecimal has at least one component.
		  ///
		  
		  Var ed As PKAdaptiveDecimal = New PKAdaptiveDecimal(2)
		  Assert.AreEqual(0, ed.Size)
		  Call ed.Normalise
		  
		  Assert.AreEqual(1, ed.Size)
		  
		  Var ed2 As PKAdaptiveDecimal = New PKAdaptiveDecimal(2)
		  Call ed2.Append(1.0).Append(-4.0)
		  Call ed2.Normalise
		  
		  Assert.AreEqual(2, ed2.Size)
		  Assert.AreEqual(1.0, ed2.Get(0))
		  Assert.AreEqual(-4.0, ed2.Get(1))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveZerosTest()
		  ///
		  ' Test the method that removes unnecessary zeros from an PKAdaptiveDecimal.
		  ///
		  
		  Var ed As PKAdaptiveDecimal = New PKAdaptiveDecimal(6)
		  
		  Call ed.RemoveZeros
		  Assert.AreEqual(0, ed.Size)
		  
		  Call ed.Append(0.0)
		  Call ed.RemoveZeros
		  Assert.AreEqual(0, ed.Size)
		  
		  Call ed.Append(0.1).Append(2.0).Append(0.0).Append(10.5).Append(0.0)
		  Call ed.RemoveZeros
		  Assert.AreEqual(3, ed.Size)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SizeTest()
		  ///
		  ' Tests for methods that check the logical/physical size of an PKAdaptiveDecimal.
		  ///
		  
		  Var ed As PKAdaptiveDecimal = New PKAdaptiveDecimal(2)
		  Assert.AreEqual(0, ed.Size)
		  Assert.AreEqual(2, ed.Capacity)
		  
		  Call ed.Append(1.0)
		  Assert.AreEqual(1, ed.Size)
		  Assert.AreEqual(2, ed.Capacity)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SumTest()
		  ///
		  ' Test the addition method. The Sum method is also throughly elsewhere
		  ' with more randomised tests.
		  ///
		  
		  Var ed1 As PKAdaptiveDecimal = PKAdaptiveDecimal.ValueOf(10.0)
		  Var ed2 As PKAdaptiveDecimal = PKAdaptiveDecimal.ValueOf(3.0)
		  
		  Var result As PKAdaptiveDecimal = ed1.Sum(ed2)
		  Assert.AreEqual(13.0, result.GetEstimation, 1.0e-9)
		  
		  Var ed3 As PKAdaptiveDecimal = PKAdaptiveDecimal.ValueOf(0.35)
		  
		  Var result2 As PKAdaptiveDecimal = result.Sum(ed3)
		  Assert.AreEqual(13.35, result2.GetEstimation, 1.0e-9)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestArgument1Test()
		  ///
		  ' Check InvalidArgumentException for creating an PKAdaptiveDecimal with negative capacity.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var ad As PKAdaptiveDecimal = New PKAdaptiveDecimal(-5)
		    #Pragma Unused ad
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException for attempting to create an PKAdaptiveDecimal " + _
		  "with a negative capacity.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestArgument2Test()
		  ///
		  ' Check InvalidArgumentException for creating an PKAdaptiveDecimal with zero capacity.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var ad As PKAdaptiveDecimal = New PKAdaptiveDecimal(0)
		    #Pragma Unused ad
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException for attempting to create an PKAdaptiveDecimal " + _
		  "with zero capacity.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestIndex1Test()
		  ///
		  ' Check OutOfBoundsException for negative index.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var ad As PKAdaptiveDecimal = New PKAdaptiveDecimal(1)
		    Var d As Double = ad.Get(-1)
		    #Pragma Unused d
		  Catch e As OutOfBoundsException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an OutOfBoundsException for a negative index.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestIndex2Test()
		  ///
		  ' Check OutOfBoundsException for index bigger than capacity.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var ad As PKAdaptiveDecimal = New PKAdaptiveDecimal(2)
		    Var d As Double = ad.Get(2)
		    #Pragma Unused d
		  Catch e As OutOfBoundsException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected OutOfBoundsException as index bigger than capacity.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestIndex3Test()
		  ///
		  ' Check OutOfBoundsException for adding more components than the capacity.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var ad As PKAdaptiveDecimal = New PKAdaptiveDecimal(2)
		    Call ad.Append(0.0).Append(0.0).Append(0.0)
		    #Pragma Unused ad
		  Catch e As OutOfBoundsException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected OutOfBoundsException as attempted to add more components " + _
		  "than capacity available.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestStateTest()
		  ///
		  ' Check that `EnsureInvariants` raises a RuntimeException if 
		  ' the invariants do not hold.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var ed As PKAdaptiveDecimal = New PKAdaptiveDecimal(2)
		    Call ed.Append(1.0).Append(0.5)
		    ed.EnsureInvariants
		  Catch e As RuntimeException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a RuntimeException due to invalid invariants.")
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Prop1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Prop2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SEED As Integer = 0
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
