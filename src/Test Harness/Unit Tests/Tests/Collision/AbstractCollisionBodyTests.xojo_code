#tag Class
Protected Class AbstractCollisionBodyTests
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
		Sub AddFixtureTest()
		  ///
		  ' Tests adding a valid fixture.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Call b.AddFixture(PKGeometry.CreateCircle(1.0))
		  Assert.AreEqual(1, b.GetFixtureCount)
		  
		  Call b.AddFixture(New PKFixture(PKGeometry.CreateEquilateralTriangle(2.0)))
		  Assert.AreEqual(2, b.GetFixtureCount)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddNilConvexTest()
		  ///
		  ' Tests adding a fixture using a Nil convex shape.
		  ///
		  
		  Using TestSupportClasses
		  
		  Try
		    Var b As TestBody = New TestBody
		    Call b.AddFixture(Nil)
		    Assert.Fail("Expected a NilObjectException")
		  Catch e As NilObjectException
		    Assert.Pass
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddNilFixtureTest()
		  ///
		  ' Tests adding a Nil fixture.
		  ///
		  
		  Using TestSupportClasses
		  
		  Try
		    Var b As TestBody = New TestBody
		    Call b.AddFixture(Nil)
		    Assert.Fail("Expected a NilObjectException")
		  Catch e As NilObjectException
		    Assert.Pass
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContainsFixtureTest()
		  ///
		  ' Tests the containment of a fixture.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Var f As PKFixture = b.AddFixture(PKGeometry.CreateCircle(1.0))
		  Assert.AreEqual(1, b.GetFixtureCount)
		  Assert.IsTrue(b.ContainsFixture(f))
		  
		  Var f2 As PKFixture = New PKFixture(PKGeometry.CreateCircle(0.5))
		  Assert.IsFalse(b.ContainsFixture(f2))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContainsPointTest()
		  ///
		  ' Tests the Contains(PKVector2) method.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Var c1 As PKConvex = PKGeometry.CreateCircle(0.5)
		  Var c2 As PKConvex = PKGeometry.CreateRectangle(1.0, 1.0)
		  c1.Translate(0.75, 0.0)
		  Call b.AddFixture(c1)
		  Call b.AddFixture(c2)
		  
		  Assert.IsTrue(b.Contains(New PKVector2(0.0, 0.0)))
		  Assert.IsTrue(b.Contains(New PKVector2(0.5, 0.0)))
		  Assert.IsTrue(b.Contains(New PKVector2(0.55, 0.25)))
		  Assert.IsFalse(b.Contains(New PKVector2(0.52, 0.45)))
		  Assert.IsTrue(b.Contains(New PKVector2(0.70, 0.3)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateAABBTest()
		  ///
		  ' Tests the create AABB method.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  // Create an AABB from an empty body (no fixtures).
		  Var aabb As PKAABB = b.CreateAABB
		  Assert.AreEqual(0.0, aabb.GetMaxX)
		  Assert.AreEqual(0.0, aabb.GetMaxY)
		  Assert.AreEqual(0.0, aabb.GetMinX)
		  Assert.AreEqual(0.0, aabb.GetMinY)
		  
		  // Create an AABB from just one fixture.
		  Call b.AddFixture(PKGeometry.CreateCircle(0.5))
		  aabb = b.CreateAABB
		  Assert.AreEqual(0.5, aabb.GetMaxX)
		  Assert.AreEqual(0.5, aabb.GetMaxY)
		  Assert.AreEqual(-0.5, aabb.GetMinX)
		  Assert.AreEqual(-0.5, aabb.GetMinY)
		  
		  // Create an AABB from more than one fixture.
		  Var bf As PKFixture = b.AddFixture(PKGeometry.CreateRectangle(1.0, 1.0))
		  bf.GetShape.Translate(-0.5, 0.0)
		  aabb = b.CreateAABB
		  Assert.AreEqual(0.5, aabb.GetMaxX)
		  Assert.AreEqual(0.5, aabb.GetMaxY)
		  Assert.AreEqual(-1.0, aabb.GetMinX)
		  Assert.AreEqual(-0.5, aabb.GetMinY)
		  
		  // Create an AABB from more than one fixture + a different transform.
		  Var tx As PkTransform = New PKTransform
		  tx.Translate(0.2, 0.5)
		  aabb = b.CreateAABB(tx)
		  Assert.AreEqual(0.7, aabb.GetMaxX)
		  Assert.AreEqual(1.0, aabb.GetMaxY)
		  Assert.AreEqual(-0.8, aabb.GetMinX)
		  Assert.AreEqual(0.0, aabb.GetMinY)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTest()
		  ///
		  ' Tests the constructors.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Assert.IsNil(b.Owner)
		  Assert.IsNil(b.UserData)
		  Assert.IsTrue(b.Enabled)
		  Assert.IsNil(b.FixtureModificationHandler)
		  Assert.IsNotNil(b.Fixtures)
		  Assert.IsNotNil(b.FixturesUnmodifiable)
		  Assert.AreEqual(0.0, b.Radius)
		  Assert.IsNotNil(b.Transform)
		  Assert.IsNotNil(b.Transform0)
		  
		  b = New TestBody(5)
		  Assert.IsNil(b.Owner)
		  Assert.IsNil(b.UserData)
		  Assert.IsTrue(b.Enabled)
		  Assert.IsNil(b.FixtureModificationHandler)
		  Assert.IsNotNil(b.Fixtures)
		  Assert.IsNotNil(b.FixturesUnmodifiable)
		  Assert.AreEqual(0.0, b.Radius)
		  Assert.IsNotNil(b.Transform)
		  Assert.IsNotNil(b.Transform0)
		  
		  b = New TestBody(-1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFixtureByIndexTest()
		  ///
		  ' Tests getting fixtures at a specified index.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Var f1 As PKFixture = b.AddFixture(PKGeometry.CreateCircle(1.0))
		  Var f2 As PKFixture = b.AddFixture(PKGeometry.CreateUnitCirclePolygon(5, 1.0))
		  Var f3 As PKFixture = b.AddFixture(PKGeometry.CreateUnitCirclePolygon(5, 1.0))
		  
		  Assert.AreEqual(3, b.Fixtures.Count)
		  Assert.IsTrue(f1 = b.GetFixture(0))
		  Assert.IsTrue(f2 = b.GetFixture(1))
		  Assert.IsTrue(f3 = b.GetFixture(2))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFixtureByPointTest()
		  ///
		  ' Tests getting fixtures using a world space point.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Call b.AddFixture(PKGeometry.CreateCircle(1.0))
		  Var bf As PKFixture = b.AddFixture(PKGeometry.CreateUnitCirclePolygon(5, 1.0))
		  bf.GetShape.Translate(0.5, 0)
		  
		  // Test not in body.
		  bf = b.GetFixture(New PKVector2(-1.0, -1.0))
		  Assert.IsNil(bf)
		  
		  // Confirm there are two fixtures at this location.
		  Assert.AreEqual(2, b.GetFixtures(New PKVector2(0.5, 0.25)).Count)
		  
		  // Test getting the first one.
		  bf = b.GetFixture(New PKVector2(0.5, 0.25))
		  Assert.IsNotNil(bf)
		  Assert.IsTrue(bf.GetShape IsA PKCircle)
		  
		  // Test not in body.
		  Var bfs() As PKFixture = b.GetFixtures(New PKVector2(-1.0, -1.0))
		  Assert.IsNotNil(bfs)
		  Assert.AreEqual(0, bfs.Count)
		  
		  // Test in body remove one.
		  bfs = b.GetFixtures(New PKVector2(1.25, 0.10))
		  Assert.IsNotNil(bfs)
		  Assert.AreEqual(1, bfs.Count)
		  Assert.IsTrue(bfs(0).GetShape IsA PKPolygon)
		  
		  // Test in body remove both.
		  bfs = b.GetFixtures(New PKVector2(0.75, 0.10))
		  Assert.IsNotNil(bfs)
		  Assert.AreEqual(2, bfs.Count)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFixtureCountTest()
		  ///
		  ' Tests getting the fixture count.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Var f1 As PKFixture = b.AddFixture(PKGeometry.CreateCircle(1.0))
		  Call b.AddFixture(PKGeometry.CreateUnitCirclePolygon(5, 1.0))
		  Call b.AddFixture(PKGeometry.CreateUnitCirclePolygon(5, 1.0))
		  
		  Assert.AreEqual(3, b.GetFixtureCount)
		  
		  Call b.RemoveFixture(f1)
		  
		  Assert.AreEqual(2, b.GetFixtureCount)
		  
		  Call b.RemoveAllFixtures
		  
		  Assert.AreEqual(0, b.GetFixtureCount)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFixtureIteratorFailuresTest()
		  ///
		  ' Tests the GetFixtureIterator method failure cases.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  Var it As PKFixtureIterator = PKFixtureIterator(b.GetFixtureIterator)
		  Assert.IsNotNil(it)
		  Assert.IsFalse(it.MoveNext)
		  
		  Call b.AddFixture(PKGeometry.CreateCircle(0.5))
		  Call b.AddFixture(PKGeometry.CreateRectangle(1.0, 0.5))
		  
		  // Test overflow.
		  it = PKFixtureIterator(b.GetFixtureIterator)
		  Try
		    Call it.MoveNext
		    Call it.MoveNext
		    Assert.IsFalse(it.MoveNext, "Expected `it.MoveNext` to return False")
		  catch e As RuntimeException
		    Assert.Fail("Unexpected RuntimeException")
		  End Try
		  
		  // Test remove.
		  it = PKFixtureIterator(b.GetFixtureIterator)
		  Try
		    it.Remove
		    Assert.Fail("Expected an IteratorException")
		  Catch e As IteratorException
		    // Expected.
		  Catch e As RuntimeException
		    Assert.Fail("Unexpected RuntimeException")
		  End Try
		  
		  // Test second remove.
		  it = PKFixtureIterator(b.GetFixtureIterator)
		  Try
		    Call it.MoveNext
		    it.Remove
		    it.Remove
		    Assert.Fail("Expected an IteratorException")
		  Catch e As IteratorException
		    // Expected.
		  Catch e As RuntimeException
		    Assert.Fail("Unexpected RuntimeException")
		  End Try
		  
		  // Test source modification before remove.
		  it = PKFixtureIterator(b.GetFixtureIterator)
		  Try
		    Call it.MoveNext
		    Call b.RemoveAllFixtures
		    it.Remove
		    Assert.Fail("Expected an OutOfBoundsException")
		  Catch e As OutOfBoundsException
		    // Expected.
		  Catch e As RuntimeException
		    Assert.Fail("Unexpected RuntimeException")
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFixtureIteratorTest()
		  ///
		  ' Tests the fixture iterator.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Call b.AddFixture(PKGeometry.CreateCircle(0.5))
		  Call b.AddFixture(PKGeometry.CreateCircle(0.4))
		  Call b.AddFixture(PKGeometry.CreateCircle(0.3))
		  Call b.AddFixture(PKGeometry.CreateCircle(0.2))
		  
		  // Test iteration.
		  Var it As PKFixtureIterator = PKFixtureIterator(b.GetFixtureIterator)
		  While it.MoveNext
		  Wend
		  
		  // Test iteration with removal.
		  it = PKFixtureIterator(b.GetFixtureIterator)
		  While it.MoveNext
		    it.Remove
		  Wend
		  
		  Assert.AreEqual(0, b.GetFixtureCount)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFixturesTest()
		  ///
		  ' Tests the GetFixtures method.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  Assert.IsNotNil(b.GetFixtures)
		  
		  Var f1 As PKFixture = b.AddFixture(PKGeometry.CreateCircle(0.5))
		  Var fixtures() As PKFixture = b.GetFixtures
		  Assert.AreEqual(1, fixtures.Count)
		  Assert.IsTrue(f1 = fixtures(0))
		  
		  Var f2 As PKFixture = b.AddFixture(PKGeometry.CreateCircle(0.5))
		  fixtures = b.GetFixtures
		  Assert.AreEqual(2, fixtures.Count)
		  Assert.IsTrue(f1 = fixtures(0))
		  Assert.IsTrue(f2 = fixtures(1))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetSetFixtureModificationHandlerTest()
		  ///
		  ' Tests the get/set FixtureModificationHandler methods.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Var f1 As PKFixture = b.AddFixture(PKGeometry.CreateCircle(0.5))
		  Var f2 As PKFixture = b.AddFixture(PKGeometry.CreateCircle(0.4))
		  
		  Assert.IsNil(b.FixtureModificationHandler)
		  Assert.IsNil(b.GetFixtureModificationHandler)
		  
		  Var fmc As FixtureModificationCounter = New FixtureModificationCounter
		  b.SetFixtureModificationHandler(fmc)
		  
		  Assert.IsNotNil(b.FixtureModificationHandler)
		  Assert.IsNotNil(b.GetFixtureModificationHandler)
		  
		  Call b.AddFixture(PKGeometry.CreateCircle(0.3))
		  Call b.AddFixture(PKGeometry.CreateCircle(0.2))
		  
		  Assert.AreEqual(2, fmc.Added)
		  
		  Call b.RemoveFixture(0)
		  
		  Assert.AreEqual(1, fmc.Removed)
		  
		  Call b.RemoveAllFixtures
		  
		  Assert.IsTrue(fmc.AllRemoved)
		  
		  fmc.Reset
		  Call b.AddFixture(f1)
		  Call b.RemoveFixture(f1)
		  
		  Assert.AreEqual(1, fmc.Removed)
		  
		  fmc.Reset
		  Call b.AddFixture(f1)
		  Call b.AddFixture(f2)
		  Call b.RemoveFixture(New PKVector2)
		  
		  Assert.AreEqual(1, fmc.Removed)
		  
		  fmc.Reset
		  Call b.AddFixture(f1)
		  Call b.RemoveFixtures(New PKVector2)
		  
		  Assert.AreEqual(2, fmc.Removed)
		  
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
