#tag Class
Protected Class AABBTests
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
		Sub AreaTest()
		  ///
		  ' Tests the `GetArea` method.
		  ///
		  
		  Var aabb As PKAABB = New PKAABB(-2.0, 0.0, 2.0, 1.0)
		  // 4 * 1 = 4
		  Assert.AreEqual(4.0, aabb.GetArea, 1.0E-4)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContainsPointTest()
		  ///
		  ' Tests the contains point method.
		  ///
		  
		  Var aabb As PKAABB = New PKAABB(-2.0, 0.0, 2.0, 1.0)
		  
		  // Test containment.
		  Assert.IsTrue(aabb.Contains(0.0, 0.5))
		  
		  // Test no containment.
		  Assert.IsFalse(aabb.Contains(0.0, 2.0))
		  
		  // Test on edge.
		  Assert.IsTrue(aabb.Contains(0.0, 1.0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContainsTest()
		  ///
		  ' Tests the `Contains` method.
		  ///
		  
		  // Test overlap.
		  Var aabb1 As PKAABB = New PKAABB(-2.0, 0.0, 2.0, 1.0)
		  Var aabb2 As PKAABB = New PKAABB(-1.0, -2.0, 5.0, 2.0)
		  Assert.IsFalse(aabb1.Contains(aabb2))
		  Assert.IsFalse(aabb2.Contains(aabb1))
		  
		  // Test no overlap.
		  Var aabb3 As PKAABB = New PKAABB(3.0, 2.0, 4.0, 3.0)
		  Assert.IsFalse(aabb1.Contains(aabb3))
		  Assert.IsFalse(aabb3.Contains(aabb1))
		  
		  // Test containment.
		  Var aabb4 As PKAABB = New PKAABB(-1.0, 0.25, 1.0, 0.75)
		  Assert.IsTrue(aabb1.Contains(aabb4))
		  Assert.IsFalse(aabb4.Contains(aabb1))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCopyTest()
		  ///
		  ' Tests the successful copy of a PKAABB.
		  ///
		  
		  Var aabb1 As PKAABB = New PKAABB(New PKVector2(-3.0, 0.0), New PKVector2(-2.0, 2.0))
		  Var aabb2 As PKAABB = New PKAABB(aabb1)
		  Assert.AreDifferent(aabb1, aabb2)
		  Assert.AreEqual(aabb1.GetMinX, aabb2.GetMinX, 1.0E-4)
		  Assert.AreEqual(aabb1.GetMinY, aabb2.GetMinY, 1.0E-4)
		  Assert.AreEqual(aabb1.GetMaxX, aabb2.GetMaxX, 1.0E-4)
		  Assert.AreEqual(aabb1.GetMaxY, aabb2.GetMaxY, 1.0E-4)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateFailure1Test()
		  ///
		  ' Tests the failed creation of a PKAABB.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var a As PKAABB = New PKAABB(0.0, 0.0, -1.0, 2.0)
		    #Pragma Unused a
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateFailure2Test()
		  ///
		  ' Tests the failed creation of a PKAABB.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var a As PKAABB = New PKAABB(New PKVector2(0.0, 0.0), New PKVector2(-1.0, 2.0))
		    #Pragma Unused a
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E20414142422066726F6D2061206E65676174697665207261646975732E
		Sub CreateRadiusNegativeTest()
		  // Creates an AABB from a negative radius.
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var a As PKAABB = New PKAABB(New PKVector2(-1.0, 1.0), -1.0)
		    #Pragma Unused a
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateRadiusTest()
		  ///
		  ' Tests the creation of a PKAABB from a radius.
		  ///
		  
		  Var aabb As PKAABB = New PKAABB(0.5)
		  Assert.AreEqual(-0.500, aabb.GetMinX, 1.0e-3)
		  Assert.AreEqual(-0.500, aabb.GetMinY, 1.0e-3)
		  Assert.AreEqual( 0.500, aabb.GetMaxX, 1.0e-3)
		  Assert.AreEqual( 0.500, aabb.GetMaxY, 1.0e-3)
		  
		  aabb = New PKAABB(New PKVector2(-1.0, 1.0), 0.5)
		  Assert.AreEqual(-1.500, aabb.GetMinX, 1.0e-3)
		  Assert.AreEqual( 0.500, aabb.GetMinY, 1.0e-3)
		  Assert.AreEqual(-0.500, aabb.GetMaxX, 1.0e-3)
		  Assert.AreEqual( 1.500, aabb.GetMaxY, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSuccessTest()
		  ///
		  ' Tests the successful creation of a PKAABB.
		  ///
		  
		  Var a As PKAABB = New PKAABB(0.0, 0.0, 1.0, 1.0)
		  Var b As PKAABB = New PKAABB(-2.0, 2.0, -1.0, 5.0)
		  Var c As PKAABB = New PKAABB(New PKVector2(-3.0, 0.0), New PKVector2(-2.0, 2.0))
		  
		  Assert.AreEqual(0.0, a.MinX)
		  Assert.AreEqual(0.0, a.MinY)
		  Assert.AreEqual(1.0, a.MaxX)
		  Assert.AreEqual(1.0, a.MaxY)
		  
		  Assert.AreEqual(-2.0, b.MinX)
		  Assert.AreEqual(2.0, b.MinY)
		  Assert.AreEqual(-1.0, b.MaxX)
		  Assert.AreEqual(5.0, b.MaxY)
		  
		  Assert.AreEqual(-3.0, c.MinX)
		  Assert.AreEqual(0.0, c.MinY)
		  Assert.AreEqual(-2.0, c.MaxX)
		  Assert.AreEqual(2.0, c.MaxY)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DegenerateTest()
		  ///
		  ' Tests the `IsDegenerate` method.
		  ///
		  
		  Var aabb As PKAABB = New PKAABB(0.0, 0.0, 0.0, 0.0)
		  Assert.IsTrue(aabb.IsDegenerate)
		  
		  aabb = New PKAABB(1.0, 2.0, 1.0, 3.0)
		  Assert.IsTrue(aabb.IsDegenerate)
		  
		  aabb = New PKAABB(1.0, 0.0, 2.0, 1.0)
		  Assert.IsFalse(aabb.IsDegenerate)
		  
		  aabb = New PKAABB(1.0, 0.0, 1.000001, 2.0)
		  Assert.IsFalse(aabb.IsDegenerate)
		  Assert.IsFalse(aabb.IsDegenerate(PKEpsilon.E))
		  Assert.IsTrue(aabb.IsDegenerate(0.000001))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExpandTest()
		  ///
		  ' Tests the `Expand` method.
		  ///
		  
		  Var aabb As PKAABB = New PKAABB(-2.0, 0.0, 4.0, 4.0)
		  Var aabb2 As PKAABB = aabb.GetExpanded(2.0)
		  
		  Assert.AreDifferent(aabb, aabb2)
		  
		  Call aabb.Expand(1.0)
		  Assert.AreEqual(-2.5, aabb.GetMinX, 1.0E-4)
		  Assert.AreEqual(-0.5, aabb.GetMinY, 1.0E-4)
		  Assert.AreEqual(4.5, aabb.GetMaxX, 1.0E-4)
		  Assert.AreEqual(4.5, aabb.GetMaxY, 1.0E-4)
		  
		  // The second aabb will have different values.
		  Assert.AreEqual(-3.0, aabb2.GetMinX, 1.0E-4)
		  Assert.AreEqual(-1.0, aabb2.GetMinY, 1.0E-4)
		  Assert.AreEqual(5.0, aabb2.GetMaxX, 1.0E-4)
		  Assert.AreEqual(5.0, aabb2.GetMaxY, 1.0E-4)
		  
		  // Test negative expansion.
		  aabb2 = aabb.GetExpanded(-1.0)
		  Assert.AreEqual(-2.0, aabb2.GetMinX, 1.0E-4)
		  Assert.AreEqual(0.0, aabb2.GetMinY, 1.0E-4)
		  Assert.AreEqual(4.0, aabb2.GetMaxX, 1.0E-4)
		  Assert.AreEqual(4.0, aabb2.GetMaxY, 1.0E-4)
		  Call aabb.Expand(-1.0)
		  Assert.AreEqual(-2.0, aabb.GetMinX, 1.0E-4)
		  Assert.AreEqual(0.0, aabb.GetMinY, 1.0E-4)
		  Assert.AreEqual(4.0, aabb.GetMaxX, 1.0E-4)
		  Assert.AreEqual(4.0, aabb.GetMaxY, 1.0E-4)
		  
		  // Test an overly negative expansion.
		  aabb2 = aabb.GetExpanded(-8.0)
		  Assert.AreEqual(1.0, aabb2.GetMinX, 1.0E-4)
		  Assert.AreEqual(2.0, aabb2.GetMinY, 1.0E-4)
		  Assert.AreEqual(1.0, aabb2.GetMaxX, 1.0E-4)
		  Assert.AreEqual(2.0, aabb2.GetMaxY, 1.0E-4)
		  Call aabb.Expand(-8.0)
		  Assert.AreEqual(1.0, aabb.GetMinX, 1.0E-4)
		  Assert.AreEqual(2.0, aabb.GetMinY, 1.0E-4)
		  Assert.AreEqual(1.0, aabb.GetMaxX, 1.0E-4)
		  Assert.AreEqual(2.0, aabb.GetMaxY, 1.0E-4)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetHeightTest()
		  ///
		  ' Tests the `GetHeight` method.
		  ///
		  
		  Var aabb As PKAABB = New PKAABB(-2.0, 0.0, 1.0, 1.0)
		  
		  Assert.AreEqual(1.0, aabb.getHeight)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetWidthTest()
		  ///
		  ' Tests the `GetWidth` method.
		  ///
		  
		  Var aabb As PKAABB = New PKAABB(-2.0, 0.0, 1.0, 1.0)
		  
		  Assert.AreEqual(3.0, aabb.GetWidth)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IntersectionTest()
		  ///
		  ' Tests the intersection methods.
		  ///
		  
		  Var aabb1 As PKAABB = New PKAABB(-2.0, 0.0, 2.0, 1.0)
		  Var aabb2 As PKAABB = New PKAABB(-1.0, -2.0, 5.0, 0.5)
		  
		  Var aabbr As PKAABB = aabb1.GetIntersection(aabb2)
		  Assert.AreEqual(-1.0, aabbr.GetMinX, 1.0E-4)
		  Assert.AreEqual(0.0, aabbr.GetMinY, 1.0E-4)
		  Assert.AreEqual(2.0, aabbr.GetMaxX, 1.0E-4)
		  Assert.AreEqual(0.5, aabbr.GetMaxY, 1.0E-4)
		  
		  // Test using separated aabbs (should give a zero PKAABB).
		  VAR aabb3 AS PKAABB = New PKAABB(-4.0, 2.0, -3.0, 4.0)
		  aabbr = aabb1.GetIntersection(aabb3)
		  Assert.AreEqual(0.0, aabbr.GetMinX, 1.0E-4)
		  Assert.AreEqual(0.0, aabbr.GetMinY, 1.0E-4)
		  Assert.AreEqual(0.0, aabbr.GetMaxX, 1.0E-4)
		  Assert.AreEqual(0.0, aabbr.GetMaxY, 1.0E-4)
		  
		  Call aabb1.Intersection(aabb2)
		  Assert.AreEqual(-1.0, aabb1.GetMinX, 1.0E-4)
		  Assert.AreEqual(0.0, aabb1.GetMinY, 1.0E-4)
		  Assert.AreEqual(2.0, aabb1.GetMaxX, 1.0E-4)
		  Assert.AreEqual(0.5, aabb1.GetMaxY, 1.0E-4)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OverlapsTest()
		  ///
		  ' Tests the `Overlaps` method.
		  ///
		  
		  // Test overlap.
		  Var aabb1 As PKAABB = New PKAABB(-2.0, 0.0, 2.0, 1.0)
		  Var aabb2 As PKAABB = New PKAABB(-1.0, -2.0, 5.0, 2.0)
		  Assert.IsTrue(aabb1.Overlaps(aabb2))
		  Assert.IsTrue(aabb2.Overlaps(aabb1))
		  
		  // Test no overlap.
		  Var aabb3 As PKAABB = New PKAABB(3.0, 2.0, 4.0, 3.0)
		  Assert.IsFalse(aabb1.Overlaps(aabb3))
		  Assert.IsFalse(aabb3.Overlaps(aabb1))
		  
		  // Test containment.
		  Var aabb4 As PKAABB = New PKAABB(-1.0, 0.25, 1.0, 0.75)
		  Assert.IsTrue(aabb1.Overlaps(aabb4))
		  Assert.IsTrue(aabb4.Overlaps(aabb1))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerimeterTest()
		  ///
		  ' Tests the `GetPerimeter` method.
		  ///
		  
		  Var aabb As PKAABB = New PKAABB(-2.0, 0.0, 2.0, 1.0)
		  // 4 + 1 = 5 * 2 = 10
		  Assert.AreEqual(10.0, aabb.GetPerimeter, 1.0E-4)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateTest()
		  ///
		  ' Tests the `Translate` method.
		  ///
		  
		  Var aabb As PKAABB = New PKAABB(-2.0, 0.0, 1.0, 1.0)
		  
		  Var aabb2 As PKAABB = aabb.GetTranslated(New PKVector2(-1.0, 2.0))
		  Assert.AreDifferent(aabb, aabb2)
		  
		  Assert.AreEqual(-2.0, aabb.GetMinX, 1.0E-4)
		  Assert.AreEqual( 0.0, aabb.GetMinY, 1.0E-4)
		  Assert.AreEqual( 1.0, aabb.GetMaxX, 1.0E-4)
		  Assert.AreEqual( 1.0, aabb.GetMaxY, 1.0E-4)
		  
		  Assert.AreEqual(-3.0, aabb2.GetMinX, 1.0E-4)
		  Assert.AreEqual( 2.0, aabb2.GetMinY, 1.0E-4)
		  Assert.AreEqual( 0.0, aabb2.GetMaxX, 1.0E-4)
		  Assert.AreEqual( 3.0, aabb2.GetMaxY, 1.0E-4)
		  
		  aabb.Translate(New PKVector2(-1.0, 2.0))
		  
		  Assert.AreEqual(-3.0, aabb.GetMinX, 1.0E-4)
		  Assert.AreEqual( 2.0, aabb.GetMinY, 1.0E-4)
		  Assert.AreEqual( 0.0, aabb.GetMaxX, 1.0E-4)
		  Assert.AreEqual( 3.0, aabb.GetMaxY, 1.0E-4)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnionTest()
		  ///
		  ' Tests the union methods.
		  ///
		  
		  //Ooverlapping PKAABBs.
		  Var aabb1 As PKAABB = New PKAABB(-2.0, 0.0, 2.0, 1.0)
		  Var aabb2 As PKAABB = New PKAABB(-1.0, -2.0, 5.0, 0.5)
		  
		  // Test the `GetUnion` method.
		  Var aabbr As PKAABB = aabb1.GetUnion(aabb2)
		  Assert.AreEqual(-2.0, aabbr.GetMinX, 1.0E-4)
		  Assert.AreEqual(-2.0, aabbr.GetMinY, 1.0E-4)
		  Assert.AreEqual(5.0, aabbr.GetMaxX, 1.0E-4)
		  Assert.AreEqual(1.0, aabbr.GetMaxY, 1.0E-4)
		  
		  // Test the `GetUnion` method using separated aabbs.
		  Var aabb3 As PKAABB = New PKAABB(-4.0, 2.0, -3.0, 4.0)
		  aabbr = aabb1.GetUnion(aabb3)
		  Assert.AreEqual(-4.0, aabbr.GetMinX, 1.0E-4)
		  Assert.AreEqual(0.0, aabbr.GetMinY, 1.0E-4)
		  Assert.AreEqual(2.0, aabbr.GetMaxX, 1.0E-4)
		  Assert.AreEqual(4.0, aabbr.GetMaxY, 1.0E-4)
		  
		  Call aabb1.Union(aabb2)
		  Assert.AreEqual(-2.0, aabb1.GetMinX, 1.0E-4)
		  Assert.AreEqual(-2.0, aabb1.GetMinY, 1.0E-4)
		  Assert.AreEqual(5.0, aabb1.GetMaxX, 1.0E-4)
		  Assert.AreEqual(1.0, aabb1.GetMaxY, 1.0E-4)
		  
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
