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
		Sub GetFixturesByPointTest()
		  ///
		  ' Tests getting fixtures by a world space point.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Call b.AddFixture(PKGeometry.CreateCircle(1.0))
		  Var bf As PKFixture = b.AddFixture(PKGeometry.CreateUnitCirclePolygon(5, 1.0))
		  bf.GetShape.Translate(0.5, 0)
		  
		  // Test not in body.
		  Var fixtures() As PKFixture = b.GetFixtures(New PKVector2(-1.0, -1.0))
		  Assert.IsNotNil(fixtures)
		  Assert.AreEqual(0, fixtures.Count)
		  
		  // Test on top of both.
		  fixtures = b.GetFixtures(New PKVector2(0.5, 0.25))
		  Assert.AreEqual(2, fixtures.Count)
		  
		  // Test in body remove one.
		  fixtures = b.GetFixtures(New PKVector2(1.25, 0.10))
		  Assert.IsNotNil(fixtures)
		  Assert.AreEqual(1, fixtures.Count)
		  Assert.IsTrue(fixtures(0).GetShape IsA PKPolygon)
		  
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
		Sub GetLocalPointTest()
		  ///
		  ' Tests the `GetLocalPoint` method.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  Var wsp As PKVector2 = New PKVector2
		  Var lsp As PKVector2 = b.GetLocalPoint(wsp)
		  
		  // Test without transform.
		  Assert.AreEqual(0.0, lsp.X)
		  Assert.AreEqual(0.0, lsp.Y)
		  
		  // Test with transform.
		  b.Translate(1.0, 2.0)
		  lsp = b.GetLocalPoint(wsp)
		  Assert.AreEqual(-1.0, lsp.X)
		  Assert.AreEqual(-2.0, lsp.Y)
		  
		  // Test with transform + non-origin point.
		  Call wsp.Set(1, 1)
		  lsp = b.GetLocalPoint(wsp)
		  Assert.AreEqual(0.0, lsp.X)
		  Assert.AreEqual(-1.0, lsp.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetLocalVectorTest()
		  ///
		  ' Tests the `GetLocalVector` method.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As  TestBody = New TestBody
		  
		  Var wsv As PKVector2 = New PKVector2(1.0, 1.0)
		  Var lsv As PKVector2 = b.GetLocalVector(wsv)
		  
		  // Test without transform.
		  Assert.AreEqual(1.0, lsv.X)
		  Assert.AreEqual(1.0, lsv.Y)
		  
		  // Test with transform.
		  b.Translate(1.0, 2.0)
		  lsv = b.GetLocalVector(wsv)
		  Assert.AreEqual(1.0, lsv.X)
		  Assert.AreEqual(1.0, lsv.Y)
		  
		  // Test with transform + non-origin point.
		  b.Rotate(MathsKit.ToRadians(90))
		  lsv = b.GetLocalVector(wsv)
		  Assert.AreEqual(1.0, lsv.X, 1e-8)
		  Assert.AreEqual(-1.0, lsv.Y, 1e-8)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetSetEnabledTest()
		  ///
		  ' Tests the set/is enabled methods.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  Assert.IsTrue(b.Enabled)
		  Assert.IsTrue(b.IsEnabled)
		  
		  b.SetEnabled(False)
		  
		  Assert.IsFalse(b.Enabled)
		  Assert.IsFalse(b.IsEnabled)
		  
		  b.SetEnabled(True)
		  
		  Assert.IsTrue(b.Enabled)
		  Assert.IsTrue(b.IsEnabled)
		  
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

	#tag Method, Flags = &h0
		Sub GetSetOwnerTest()
		  ///
		  ' Tests the get/set of ownership.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  Assert.IsNil(b.GetOwner)
		  Assert.IsNil(b.Owner)
		  
		  Var o As ComparableObject = New ComparableObject
		  b.SetOwner(o)
		  Assert.IsNotNil(b.GetOwner)
		  Assert.IsNotNil(b.Owner)
		  Assert.IsTrue(o Is b.Owner)
		  Assert.IsTrue(o Is b.GetOwner)
		  
		  b.SetOwner(Nil)
		  Assert.IsNil(b.GetOwner)
		  Assert.IsNil(b.Owner)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetSetPreviousTransformTest()
		  ///
		  ' Tests the get/set of the previous transform.
		  ///
		  
		  Using TestSupportClasses
		  
		  var b As TestBody = New TestBody
		  
		  // Test the default.
		  Assert.IsNotNil(b.GetPreviousTransform)
		  Assert.IsTrue(b.GetPreviousTransform.IsIdentity)
		  
		  b.Translate(1.0, -1.0)
		  
		  Assert.IsNotNil(b.GetPreviousTransform)
		  Assert.IsTrue(b.GetPreviousTransform.IsIdentity)
		  
		  b.GetPreviousTransform.Set(b.GetTransform)
		  
		  Assert.IsNotNil(b.GetPreviousTransform)
		  Assert.IsFalse(b.GetPreviousTransform.IsIdentity)
		  Assert.AreEqual(1.0, b.GetPreviousTransform.GetTranslationX)
		  Assert.AreEqual(-1.0, b.GetPreviousTransform.GetTranslationY)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetSetRotationDiscRadiusTest()
		  ///
		  ' Tests the get/set RotationDiscRadius methods.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  b.SetRotationDiscRadius(b.center)
		  Assert.AreEqual(0.0, b.Radius)
		  Assert.AreEqual(0.0, b.GetRotationDiscRadius)
		  
		  Var f1 As PKFixture = b.AddFixture(PKGeometry.CreateCircle(0.5))
		  Var f2 As PKFixture = b.AddFixture(PKGeometry.CreateCircle(0.4))
		  
		  b.SetRotationDiscRadius(b.center)
		  
		  Assert.AreEqual(0.5, b.Radius)
		  Assert.AreEqual(0.5, b.GetRotationDiscRadius)
		  
		  f1.GetShape.Translate(1.0, 0.0)
		  f2.GetShape.Translate(0.0, 1.0)
		  b.SetRotationDiscRadius(b.Center)
		  
		  Assert.AreEqual(1.5, b.Radius)
		  Assert.AreEqual(1.5, b.GetRotationDiscRadius)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetSetTransformTest()
		  ///
		  ' Tests the get/set Transform methods.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  Assert.IsNotNil(b.Transform)
		  Assert.IsNotNil(b.GetTransform)
		  
		  b.SetTransform(Nil)
		  
		  Assert.IsNotNil(b.Transform)
		  Assert.IsNotNil(b.GetTransform)
		  
		  Var tx As PKTransform = New PKTransform
		  b.SetTransform(tx)
		  
		  Assert.IsNotNil(b.Transform)
		  Assert.IsNotNil(b.GetTransform)
		  Assert.IsFalse(tx = b.GetTransform)
		  
		  tx.Translate(2.0, 1.0)
		  b.SetTransform(tx)
		  
		  Assert.IsNotNil(b.Transform)
		  Assert.IsNotNil(b.GetTransform)
		  Assert.IsFalse(tx = b.GetTransform)
		  Assert.AreEqual(tx.GetTranslationX, b.GetTransform.GetTranslationX)
		  Assert.AreEqual(tx.GetTranslationY, b.GetTransform.GetTranslationY)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetSetUserDataTest()
		  ///
		  ' Make sure the user data is stored.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var obj As String = "hello"
		  Var b As TestBody = New TestBody
		  
		  Assert.IsNil(b.GetUserData)
		  
		  b.SetUserData(obj)
		  Assert.IsNotNil(b.GetUserData)
		  Assert.IsTrue(obj = b.GetUserData)
		  
		  b.SetUserData(Nil)
		  Assert.IsNil(b.GetUserData)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetWorldCenterTest()
		  ///
		  ' Tests the `GetWorldCenter` method.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  Var wc As PKVector2 = b.GetWorldCenter
		  Assert.AreEqual(0.0, wc.X)
		  Assert.AreEqual(0.0, wc.Y)
		  
		  b.Translate(2.0, 0.5)
		  wc = b.GetWorldCenter
		  Assert.AreEqual(2.0, wc.X)
		  Assert.AreEqual(0.5, wc.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetWorldPointTest()
		  ///
		  ' Tests the `GetWorldPoint` method.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  Var lsp As PKVector2 = New PKVector2
		  Var wsp As PKVector2 = b.GetWorldPoint(lsp)
		  
		  // Test without transform.
		  Assert.AreEqual(0.0, wsp.X)
		  Assert.AreEqual(0.0, wsp.Y)
		  
		  // Test with transform.
		  b.Translate(1.0, 2.0)
		  wsp = b.GetWorldPoint(lsp)
		  Assert.AreEqual(1.0, wsp.X)
		  Assert.AreEqual(2.0, wsp.Y)
		  
		  // Test with transform + non-origin point.
		  Call lsp.Set(1, 1)
		  wsp = b.GetWorldPoint(lsp)
		  Assert.AreEqual(2.0, wsp.X)
		  Assert.AreEqual(3.0, wsp.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetWorldVectorTest()
		  ///
		  ' Tests the `GetWorldVector` method.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  Var lsv As PKVector2 = New PKVector2(1.0, 1.0)
		  Var wsv As PKVector2 = b.GetWorldVector(lsv)
		  
		  // Test without transform.
		  Assert.AreEqual(1.0, wsv.X)
		  Assert.AreEqual(1.0, wsv.Y)
		  
		  // Test with transform.
		  b.Translate(1.0, 2.0)
		  wsv = b.GetWorldVector(lsv)
		  Assert.AreEqual(1.0, wsv.X)
		  Assert.AreEqual(1.0, wsv.Y)
		  
		  // Test with transform + non-origin point.
		  b.Rotate(MathsKit.ToRadians(90))
		  wsv = b.GetWorldVector(lsv)
		  Assert.AreEqual(-1.0, wsv.X, 1e-8)
		  Assert.AreEqual(1.0, wsv.Y, 1e-8)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllFixturesTest()
		  ///
		  ' Tests the removal of all fixtures.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Call b.AddFixture(PKGeometry.CreateCircle(1.0))
		  Call b.AddFixture(PKGeometry.CreateRectangle(1.0, 0.5))
		  Call b.AddFixture(PKGeometry.CreateSegment(New PKVector2(1.0, -2.0)))
		  
		  Assert.AreEqual(3, b.GetFixtureCount)
		  
		  Call b.RemoveAllFixtures
		  
		  Assert.AreEqual(0, b.GetFixtureCount)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFixtureByIndexOutOfBoundsTest()
		  ///
		  ' Tests receiving index out of bounds exceptions.
		  ///
		  
		  Using TestSupportClasses
		  
		  Try
		    Var b As TestBody = New TestBody
		    // Test index with empty fixture list.
		    Call b.RemoveFixture(0)
		    Assert.Fail("Expected an OutOfBoundsException")
		  Catch e As OutOfBoundsException
		    Assert.Pass
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFixtureByPointTest()
		  ///
		  ' Tests removing fixtures by a world space point.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Call b.AddFixture(PKGeometry.CreateCircle(1.0))
		  Var bf As PKFixture = b.AddFixture(PKGeometry.CreateUnitCirclePolygon(5, 1.0))
		  bf.GetShape.Translate(0.5, 0)
		  
		  // Test not in body.
		  bf = b.RemoveFixture(New PKVector2(-1.0, -1.0))
		  Assert.IsNil(bf)
		  Assert.AreEqual(2, b.GetFixtures.Count)
		  
		  // Confirm there are two fixtures at this location.
		  Assert.AreEqual(2, b.GetFixtures(New PKVector2(0.5, 0.25)).Count)
		  
		  // Test remove the first one.
		  bf = b.RemoveFixture(New PKVector2(0.5, 0.25))
		  Assert.IsNotNil(bf)
		  Assert.IsTrue(bf.GetShape IsA PKCircle)
		  Assert.AreEqual(1, b.GetFixtures.Count)
		  
		  // Add the fixture back.
		  bf = b.AddFixture(PKGeometry.CreateCircle(1.0))
		  
		  // Test not in body.
		  Var bfs() As PKFixture = b.RemoveFixtures(New PKVector2(-1.0, -1.0))
		  Assert.IsNotNil(bfs)
		  Assert.AreEqual(0, bfs.Count)
		  Assert.AreEqual(2, b.GetFixtures.Count)
		  
		  // Test in body remove one.
		  bfs = b.RemoveFixtures(New PKVector2(1.25, 0.10))
		  Assert.IsNotNil(bfs)
		  Assert.AreEqual(1, bfs.Count)
		  Assert.IsTrue(bfs(0).GetShape IsA PKPolygon)
		  Assert.AreEqual(1, b.GetFixtures.Count)
		  
		  // Add the fixture back.
		  bf = b.AddFixture(PKGeometry.CreateUnitCirclePolygon(5, 1.0))
		  bf.GetShape.Translate(0.5, 0)
		  
		  // Test in body remove both.
		  bfs = b.RemoveFixtures(New PKVector2(0.75, 0.10))
		  Assert.IsNotNil(bfs)
		  Assert.AreEqual(2, bfs.Count)
		  Assert.AreEqual(0, b.GetFixtures.Count)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFixtureIndexNegativeTest()
		  ///
		  ' Tests receiving index out of bounds exceptions.
		  ///
		  
		  Using TestSupportClasses
		  
		  Try
		    Var b As TestBody = New TestBody
		    Call b.AddFixture(PKGeometry.CreateCircle(1.0))
		    // Test negative index.
		    Call b.RemoveFixture(-2)
		    Assert.Fail("Expected an OutOfBoundsException")
		  Catch e As OutOfBoundsException
		    Assert.Pass
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFixtureNotFoundTest()
		  ///
		  ' Tests the remove fixture method failure cases.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  // Test Nil fixture.
		  Var nilFixture As PKFixture = Nil
		  Var success As Boolean = b.RemoveFixture(nilFixture)
		  Assert.IsFalse(success)
		  
		  // Test not found fixture.
		  Call b.AddFixture(PKGeometry.CreateCircle(1.0))
		  success = b.RemoveFixture(New PKFixture(PKGeometry.CreateRightTriangle(0.5, 0.3)))
		  Assert.IsFalse(success)
		  Assert.AreEqual(1, b.Fixtures.Count)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFixtureTest()
		  ///
		  ' Tests the remove fixture methods.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  Var f As PKFixture = b.AddFixture(PKGeometry.CreateCircle(1.0))
		  
		  // Test removing the fixture.
		  Var success As Boolean = b.removeFixture(f)
		  Assert.AreEqual(0, b.GetFixtures.Count)
		  Assert.IsTrue(success)
		  
		  Call b.AddFixture(f)
		  Var f2 As PKFixture = b.AddFixture(PKGeometry.CreateSquare(0.5))
		  success = b.RemoveFixture(f)
		  Assert.AreEqual(1, b.GetFixtures.Count)
		  Var bFixtures() As PKFixture = b.GetFixtures
		  Assert.IsTrue(f2 = bFixtures(0))
		  Assert.IsTrue(success)
		  
		  // Test removing by index.
		  f = b.AddFixture(PKGeometry.CreateEquilateralTriangle(0.5))
		  Call b.AddFixture(PKGeometry.CreateRectangle(1.0, 2.0))
		  f2 = b.RemoveFixture(1)
		  
		  Assert.AreEqual(2, b.GetFixtures.Count)
		  Assert.IsTrue(f2 = f)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateTest()
		  ///
		  ' Tests the rotate methods.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  Assert.AreEqual(0.0, b.GetTransform.GetRotationAngle)
		  
		  Var r As Double = MathsKit.ToRadians(30)
		  
		  b.Rotate(r)
		  Assert.AreEqual(r, b.GetTransform.GetRotationAngle, 1e-15)
		  Assert.AreEqual(0.0, b.GetTransform.GetTranslationX)
		  Assert.AreEqual(0.0, b.GetTransform.GetTranslationY)
		  
		  b.Rotate(New PKRotation(r))
		  Assert.AreEqual(2.0 * r, b.GetTransform.GetRotationAngle, 1e-15)
		  Assert.AreEqual(0.0, b.GetTransform.GetTranslationX)
		  Assert.AreEqual(0.0, b.GetTransform.GetTranslationY)
		  
		  b.GetTransform.Identity
		  b.Rotate(r, 1.0, 1.0)
		  
		  Assert.AreEqual(r, b.GetTransform.GetRotationAngle, 1e-15)
		  Assert.AreEqual(0.6339745962155612, b.GetTransform.GetTranslationX)
		  Assert.AreEqual(-0.3660254037844386, b.GetTransform.GetTranslationY)
		  
		  Var rp As PKVector2 = New PKVector2(1.0, 1.0)
		  b.GetTransform.Identity
		  b.Rotate(r, rp)
		  
		  Assert.AreEqual(r, b.GetTransform.GetRotationAngle, 1e-15)
		  Assert.AreEqual(0.6339745962155612, b.GetTransform.GetTranslationX)
		  Assert.AreEqual(-0.3660254037844386, b.GetTransform.GetTranslationY)
		  
		  b.GetTransform.Identity
		  b.Rotate(New PKRotation(r), 1.0, 1.0)
		  
		  Assert.AreEqual(r, b.GetTransform.GetRotationAngle, 1e-15)
		  Assert.AreEqual(0.6339745962155612, b.GetTransform.GetTranslationX)
		  Assert.AreEqual(-0.3660254037844386, b.GetTransform.GetTranslationY)
		  
		  b.GetTransform.Identity
		  b.Rotate(New PKRotation(r), rp)
		  
		  Assert.AreEqual(r, b.GetTransform.GetRotationAngle, 1e-15)
		  Assert.AreEqual(0.6339745962155612, b.GetTransform.GetTranslationX)
		  Assert.AreEqual(-0.3660254037844386, b.GetTransform.GetTranslationY)
		  
		  b.GetTransform.Identity
		  b.GetTransform.Translate(1.0, 1.0)
		  b.RotateAboutCenter(r)
		  Assert.AreEqual(r, b.GetTransform.GetRotationAngle, 1e-15)
		  Assert.AreEqual(1.0, b.GetTransform.GetTranslationX)
		  Assert.AreEqual(1.0, b.GetTransform.GetTranslationY)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShiftCoordinatesTest()
		  ///
		  ' Tests the `ShiftCoordinates` method.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  b.Shift(New PKVector2(-2.0, 1.0))
		  
		  // It just translates the transform.
		  Var tx As PKVector2 = b.GetTransform.GetTranslation
		  Assert.AreEqual(-2.0, tx.X, 1.0e-3)
		  Assert.AreEqual(1.0, tx.Y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateTest()
		  ///
		  ' Tests the translate methods.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As TestBody = New TestBody
		  
		  Assert.AreEqual(0.0, b.GetTransform.GetTranslationX)
		  Assert.AreEqual(0.0, b.GetTransform.GetTranslationY)
		  
		  b.Translate(1.0, 1.0)
		  
		  Assert.AreEqual(1.0, b.GetTransform.GetTranslationX)
		  Assert.AreEqual(1.0, b.GetTransform.GetTranslationY)
		  
		  Var tx As PKVector2 = New PKVector2(2.0, -1.0)
		  b.Translate(tx)
		  Assert.AreEqual(3.0, b.GetTransform.GetTranslationX)
		  Assert.AreEqual(0.0, b.GetTransform.GetTranslationY)
		  
		  b.TranslateToOrigin
		  
		  Assert.AreEqual(0.0, b.GetTransform.GetTranslationX)
		  Assert.AreEqual(0.0, b.GetTransform.GetTranslationY)
		  
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
