#tag Class
Protected Class IntervalTests
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
		Sub ClampTest()
		  ///
		  ' Tests the clamp methods.
		  ///
		  
		  Var i As PKInterval = New PKInterval(-1.0, 6.5)
		  
		  Assert.AreEqual(2.0, i.Clamp(2.0))
		  Assert.AreEqual(2.0, PKInterval.Clamp(2.0, -1.0, 6.5))
		  Assert.AreEqual(-1.0, i.Clamp(-2.0))
		  Assert.AreEqual(6.5, i.Clamp(7.0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCopyTest()
		  ///
		  ' Tests the copy constructor.
		  ///
		  
		  Var i1 As PKInterval = New PKInterval(-1.0, 2.0)
		  Var i2 As PKInterval = New PKInterval(i1)
		  
		  Assert.AreDifferent(i2, i1)
		  Assert.AreEqual(i1.min, i2.min)
		  Assert.AreEqual(i1.max, i2.max)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateMinGreaterThanMaxTest()
		  ///
		  ' Tests the min > max.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var i As PKInterval = New PKInterval(0.0, -1.0)
		    #Pragma Unused i
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTest()
		  ///
		  ' Tests the constructor.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var i As PKInterval = New PKInterval(0.0, 2.0)
		    #Pragma Unused i
		  Catch e As RuntimeException
		    Assert.Fail("A runtime exception occurred during Interval construction.")
		    Return
		  End Try
		  
		  Assert.Pass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DegenerateTest()
		  ///
		  ' Tests the degenerate interval methods.
		  ///
		  
		  Var i As PKInterval = New PKInterval(2.0, 2.0)
		  
		  Assert.IsTrue(i.IsDegenerate)
		  
		  i.Expand(0.000001)
		  
		  Assert.AreEqual(1.9999995, i.min)
		  Assert.AreEqual(2.0000005, i.max)
		  
		  Assert.IsTrue(Not i.IsDegenerate)
		  Assert.IsTrue(i.IsDegenerate(0.01))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DistanceTest()
		  ///
		  ' Tests the distance method.
		  ///
		  
		  Var i1 As PKInterval = New PKInterval(-2.0, 3.0)
		  Var i2 As PKInterval = New PKInterval(-1.0, 4.0)
		  
		  // Overlapping intervals should return 0.
		  Assert.AreEqual(0.0, i1.Distance(i2))
		  
		  i2 = New PKInterval(4.0, 6.0)
		  
		  Assert.AreEqual(1.0, i1.Distance(i2))
		  Assert.AreEqual(1.0, i2.Distance(i1))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExpandTest()
		  ///
		  ' Tests the expand method.
		  ///
		  
		  Var i As PKInterval = New PKInterval(-2.0, 2.0)
		  Var ci As PKInterval = Nil
		  
		  // Test a normal expansion.
		  ci = i.GetExpanded(2.0)
		  Assert.AreEqual(-3.0, ci.min, 1.0e-3)
		  Assert.AreEqual( 3.0, ci.max, 1.0e-3)
		  i.Expand(2.0)
		  Assert.AreEqual(-3.0, i.min, 1.0e-3)
		  Assert.AreEqual( 3.0, i.max, 1.0e-3)
		  
		  // Test no expansion.
		  ci = i.GetExpanded(0.0)
		  Assert.AreEqual(-3.0, ci.min, 1.0e-3)
		  Assert.AreEqual( 3.0, ci.max, 1.0e-3)
		  i.Expand(0.0)
		  Assert.AreEqual(-3.0, i.min, 1.0e-3)
		  Assert.AreEqual( 3.0, i.max, 1.0e-3)
		  
		  // Test negative expansion.
		  ci = i.GetExpanded(-1.0)
		  Assert.AreEqual(-2.5, ci.min, 1.0e-3)
		  Assert.AreEqual( 2.5, ci.max, 1.0e-3)
		  i.Expand(-1.0)
		  Assert.AreEqual(-2.5, i.min, 1.0e-3)
		  Assert.AreEqual( 2.5, i.max, 1.0e-3)
		  
		  // Test large negative expansion (this should make the interval invalid, so the interval
		  // is instead reduced down to a degenerate interval at the mid point).
		  ci = i.GetExpanded(-6.0)
		  Assert.AreEqual(0.0, ci.min, 1.0e-3)
		  Assert.AreEqual(0.0, ci.max, 1.0e-3)
		  i.Expand(-6.0)
		  Assert.AreEqual(0.0, i.min, 1.0e-3)
		  Assert.AreEqual(0.0, i.max, 1.0e-3)
		  
		  // Make a copy.
		  i = New PKInterval(-2.5, 1.5)
		  ci = i.GetExpanded(-6.0)
		  Assert.AreEqual(-0.5, ci.min, 1.0e-3)
		  Assert.AreEqual(-0.5, ci.max, 1.0e-3)
		  i.Expand(-6.0)
		  Assert.AreEqual(-0.5, i.min, 1.0e-3)
		  Assert.AreEqual(-0.5, i.max, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetLengthTest()
		  ///
		  ' Tests the length method.
		  ///
		  
		  Var i As PKInterval = New PKInterval(-2.0, 2.0)
		  Assert.AreEqual(4.0, i.GetLength)
		  
		  i = New PKInterval(-1.0, 2.0)
		  Assert.AreEqual(3.0, i.GetLength)
		  
		  i = New PKInterval(-3.0, -1.0)
		  Assert.AreEqual(2.0, i.GetLength)
		  
		  i = New PKInterval(2.0, 3.0)
		  Assert.AreEqual(1.0, i.GetLength)
		  
		  i = New PKInterval(-1.0, 2.0)
		  i.Expand(-4.0)
		  Assert.AreEqual(0.0, i.GetLength)
		  
		  i = New PKInterval(-1.0, -1.0)
		  Assert.AreEqual(0.0, i.GetLength)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IncludesTest()
		  ///
		  ' Tests the `Includes` methods.
		  ///
		  
		  Var i As PKInterval = New PKInterval(-2.5, 100.521)
		  
		  Assert.IsTrue(i.IncludesExclusive(50.0))
		  Assert.IsTrue(Not i.IncludesExclusive(100.521))
		  Assert.IsTrue(Not i.IncludesExclusive(-3.0))
		  
		  Assert.IsTrue(i.IncludesInclusive(50.0))
		  Assert.IsTrue(i.IncludesInclusive(-2.5))
		  Assert.IsTrue(Not i.IncludesInclusive(-3.0))
		  
		  Assert.IsTrue(i.IncludesInclusiveMax(50.0))
		  Assert.IsTrue(i.IncludesInclusiveMax(100.521))
		  Assert.IsTrue(Not i.IncludesInclusiveMax(-2.5))
		  Assert.IsTrue(Not i.IncludesInclusiveMax(200.0))
		  
		  Assert.IsTrue(i.IncludesInclusiveMin(50.0))
		  Assert.IsTrue(i.IncludesInclusiveMin(-2.5))
		  Assert.IsTrue(Not i.IncludesInclusiveMin(100.521))
		  Assert.IsTrue(Not i.IncludesInclusiveMin(-3.0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IntersectionTest()
		  ///
		  ' Tests the intersection methods.
		  ///
		  
		  Var i1 As PKInterval = New PKInterval(-2.0, 3.0)
		  Var i2 As PKInterval = New PKInterval(-1.0, 4.0)
		  
		  Var u As PKInterval = i1.GetIntersection(i2)
		  Assert.AreEqual(-1.0, u.min)
		  Assert.AreEqual(3.0, u.max)
		  
		  // Test cumulativity.
		  u = i2.GetIntersection(i1)
		  Assert.AreEqual(-1.0, u.min)
		  Assert.AreEqual(3.0, u.max)
		  
		  // Test intervals that don't overlap.
		  Var i3 As PKInterval = New PKInterval(-3.0, -2.5)
		  u = i1.GetIntersection(i3)
		  Assert.AreEqual(0.0, u.min)
		  Assert.AreEqual(0.0, u.max)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OverlapsTest()
		  ///
		  ' Tests the overlaps methods.
		  ///
		  
		  Var i1 As PKInterval = New PKInterval(-2.0, 5.0)
		  Var i2 As PKInterval = New PKInterval(-4.0, 1.0)
		  
		  Assert.IsTrue(i1.Overlaps(i2))
		  // The reverse should work also.
		  Assert.IsTrue(i2.Overlaps(i1))
		  
		  // Distance should return zero.
		  Assert.AreEqual(0.0, i1.Distance(i2))
		  Assert.AreEqual(0.0, i2.Distance(i1))
		  
		  // Contains should return False.
		  Assert.IsTrue(Not i1.Contains(i2))
		  Assert.IsTrue(Not i2.Contains(i1))
		  
		  Var ov1 As Double = i1.GetOverlap(i2)
		  Var ov2 As Double = i2.GetOverlap(i1)
		  
		  Assert.AreEqual(3.0, ov1)
		  Assert.AreEqual(3.0, ov2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetInvalidMaxTest()
		  ///
		  ' Tests an invalid max.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var i As PKInterval = New PKInterval(0.0, 2.0)
		    i.SetMax(-1.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetInvalidMinTest()
		  ///
		  ' Tests an invalid min.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var i As PKInterval = New PKInterval(0.0, 2.0)
		    i.SetMin(3.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Should not have been able to set an invalid min.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMaxTest()
		  ///
		  ' Tests a valid max.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var i As PKInterval = New PKInterval(0.0, 2.0)
		    i.SetMax(1.5)
		  Catch e As RuntimeException
		    Assert.Fail("A RuntimeException occurred when setting a valid Interval max.")
		    Return
		  End Try
		  
		  Assert.Pass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMinTest()
		  ///
		  ' Tests a valid min.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var i As PKInterval = New PKInterval(0.0, 2.0)
		    i.SetMin(1.5)
		  Catch e As RuntimeException
		    Assert.Fail("Encountered a RuntimeException whilst setting a valid Interval min.")
		    Return
		  End Try
		  
		  Assert.Pass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnionTest()
		  ///
		  ' Tests the union methods.
		  ///
		  
		  Var i1 As PKInterval = New PKInterval(-2.0, 3.0)
		  Var i2 As PKInterval = New PKInterval(-1.0, 4.0)
		  
		  Var u As PKInterval = i1.GetUnion(i2)
		  Assert.AreEqual(-2.0, u.min)
		  Assert.AreEqual(4.0, u.max)
		  
		  // Test cumulativity.
		  u = i2.GetUnion(i1)
		  Assert.AreEqual(-2.0, u.min)
		  Assert.AreEqual(4.0, u.max)
		  
		  // Test intervals that don't overlap.
		  Var i3 As PKInterval = New PKInterval(-3.0, -2.5)
		  u = i1.GetUnion(i3)
		  Assert.AreEqual(-3.0, u.min)
		  Assert.AreEqual(3.0, u.max)
		  
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
