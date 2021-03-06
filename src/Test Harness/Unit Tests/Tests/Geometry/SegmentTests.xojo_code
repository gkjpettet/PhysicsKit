#tag Class
Protected Class SegmentTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  IDENTITY = New PKTransform
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
		Sub ContainsRadiusTest()
		  ///
		  ' Tests the contains with radius method.
		  ///
		  
		  Var s As PKSegment = New PKSegment(New PKVector2(1.0, 1.0), New PKVector2(-1.0, -1.0))
		  Var t As PKTransform = New PKTransform
		  
		  Assert.IsFalse(s.Contains(New PKVector2(2.0, 2.0), t, 0.1))
		  Assert.IsTrue(s.Contains(New PKVector2(1.05, 1.05), t, 0.1))
		  Assert.IsTrue(s.Contains(New PKVector2(0.505, 0.5), t, 0.1))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContainsTest()
		  ///
		  ' Tests the Contains method.
		  ///
		  
		  Var s As PKSegment = New PKSegment(New PKVector2(0.0, 1.0), New PKVector2(1.5, 3.0))
		  Var t As PKTransform = New PKTransform
		  
		  Assert.IsFalse(s.Contains(New PKVector2(2.0, 2.0), t))
		  Assert.IsTrue(s.Contains(New PKVector2(0.75, 2.0), t))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateAABBTest()
		  ///
		  ' Tests the CreateAABB method.
		  ///
		  
		  Var s As PKSegment = New PKSegment(New PKVector2(0.0, 0.0), New PKVector2(1.0, 1.0))
		  
		  Var aabb As PKAABB = s.CreateAABB(IDENTITY)
		  Assert.AreEqual(0.0, aabb.GetMinX, 1.0e-3)
		  Assert.AreEqual(0.0, aabb.GetMinY, 1.0e-3)
		  Assert.AreEqual(1.0, aabb.GetMaxX, 1.0e-3)
		  Assert.AreEqual(1.0, aabb.GetMaxY, 1.0e-3)
		  
		  // Try using the default method.
		  Var aabb2 As PKAABB = s.CreateAABB
		  Assert.AreEqual(aabb.GetMinX, aabb2.GetMinX)
		  Assert.AreEqual(aabb.GetMinY, aabb2.GetMinY)
		  Assert.AreEqual(aabb.GetMaxX, aabb2.GetMaxX)
		  Assert.AreEqual(aabb.GetMaxY, aabb2.GetMaxY)
		  
		  Var tx As PKTransform = New PKTransform
		  tx.Rotate(MathsKit.ToRadians(30.0))
		  tx.Translate(1.0, 2.0)
		  aabb = s.CreateAABB(tx)
		  Assert.AreEqual(1.0, aabb.GetMinX, 1.0e-3)
		  Assert.AreEqual(2.0, aabb.GetMinY, 1.0e-3)
		  Assert.AreEqual(1.366, aabb.GetMaxX, 1.0e-3)
		  Assert.AreEqual(3.366, aabb.GetMaxY, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCoincidentTest()
		  ///
		  ' Tests coincident points.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var s As New PKSegment(New PKVector2, New PKVector2)
		    #Pragma Unused s
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as coincident points passed to constructor.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNilPoint1Test()
		  ///
		  ' Tests a failed Create using one Nil point.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var s As New PKSegment(Nil, New PKVector2)
		    #Pragma Unused s
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected NilObjectException as passed a Nil point to the constructor.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNilPoint2Test()
		  ///
		  ' Tests a failed Create using one Nil point.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var s As PKSegment = New PKSegment(New PKVector2, Nil)
		    #Pragma Unused s
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException as passed Nil to the constructor.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSuccessTest()
		  ///
		  ' Tests a successful creation.
		  ///
		  
		  Var s As PKSegment = New PKSegment(New PKVector2(0.0, 1.0), New PKVector2(1.0, 2.0))
		  
		  Assert.AreEqual(0.500, s.center.x, 1.0e-3)
		  Assert.AreEqual(1.500, s.center.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAxesTest()
		  ///
		  ' Tests the GetAxes method.
		  ///
		  
		  Var s As PKSegment = New PKSegment(New PKVector2(0.0, 1.0), New PKVector2(1.5, 3.0))
		  Var t As PKTransform = New PKTransform
		  
		  Var axes() As PKVector2 = s.GetAxes(Nil, t)
		  
		  Assert.AreEqual(2, axes.Count)
		  
		  Var seg As PKVector2 = s.Vertices(0).Towards(s.vertices(1))
		  // One should be the line itself and the other should be the perp.
		  Assert.AreEqual(0.000, seg.Cross(axes(1)), 1.0e-3)
		  Assert.AreEqual(0.000, seg.Dot(axes(0)), 1.0e-3)
		  
		  // Perform some transformations.
		  t.Translate(1.0, 0.0)
		  t.Rotate(MathsKit.ToRadians(25))
		  
		  axes = s.GetAxes(Nil, t)
		  
		  seg = t.GetTransformed(s.Vertices(0)).Towards(t.GetTransformed(s.Vertices(1)))
		  // One should the line itself and the other should be the perp.
		  Assert.AreEqual(0.000, seg.Cross(axes(1)), 1.0e-3)
		  Assert.AreEqual(0.000, seg.Dot(axes(0)), 1.0e-3)
		  
		  // Test for some foci.
		  Var f As PKVector2 = New PKVector2(2.0, -2.0)
		  t.Identity
		  
		  axes = s.GetAxes(Array(f), t)
		  
		  Assert.AreEqual(3, axes.Count)
		  
		  Var v1 As PKVector2 = s.Vertices(0).Towards(f)
		  Call v1.Normalise
		  
		  Assert.AreEqual(v1.x, axes(2).X, 1.0e-3)
		  Assert.AreEqual(v1.y, axes(2).Y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFarthestTest()
		  ///
		  ' Tests the get farthests methods.
		  ///
		  
		  Var s As PKSegment = New PKSegment(New PKVector2(0.0, 1.0), New PKVector2(1.5, 3.0))
		  Var t As PKTransform = New PKTransform
		  Var n As PKVector2 = New PKVector2(1.0, 0.0)
		  
		  Var f As PKEdgeFeature = PKEdgeFeature(s.GetFarthestFeature(n, t))
		  Assert.AreEqual(1.500, f.max.point.x, 1.0e-3)
		  Assert.AreEqual(3.000, f.max.point.y, 1.0e-3)
		  
		  Assert.AreEqual(0.000, f.vertex1.point.x, 1.0e-3)
		  Assert.AreEqual(1.000, f.vertex1.point.y, 1.0e-3)
		  Assert.AreEqual(1.500, f.vertex2.point.x, 1.0e-3)
		  Assert.AreEqual(3.000, f.vertex2.point.y, 1.0e-3)
		  
		  Var p As PKVector2 = s.GetFarthestPoint(n, t)
		  Assert.AreEqual(1.500, p.x, 1.0e-3)
		  Assert.AreEqual(3.000, p.y, 1.0e-3)
		  
		  // Move the segment a bit.
		  t.Translate(0.0, -1.0)
		  t.Rotate(MathsKit.ToRadians(45))
		  
		  p = s.GetFarthestPoint(n, t)
		  Assert.AreEqual(0.000, p.x, 1.0e-3)
		  Assert.AreEqual(0.000, p.y, 1.0e-3)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFociTest()
		  ///
		  ' Tests the GetFoci method.
		  ///
		  
		  Var s As PKSegment = New PKSegment(New PKVector2(0.0, 1.0), New PKVector2(1.5, 3.0))
		  Var t As PKTransform = New PKTransform
		  
		  Var foci() As PKVector2 = s.GetFoci(t)
		  Assert.IsTrue(foci = Nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetLengthTest()
		  ///
		  ' Tests the GetLength method.
		  ///
		  
		  Var s As PKSegment = New PKSegment(New PKVector2(0.0, 1.0), New PKVector2(1.5, 3.0))
		  
		  Assert.AreEqual(2.500, s.GetLength, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetLineIntersectionTest()
		  ///
		  ' Tests the GetLineIntersection method.
		  //
		  
		  // Normal case.
		  Var p As PKVector2 = PKSegment.GetLineIntersection(_
		  New PKVector2(-1.0, -1.0), New PKVector2(2.0, 0.0), _
		  New PKVector2(-1.0,  0.0), New PKVector2(1.0, 0.5))
		  
		  Assert.IsNotNil(p)
		  Assert.AreEqual(11.0, p.x)
		  Assert.AreEqual(3.0, p.y)
		  
		  // Try horizontal line.
		  p = PKSegment.GetLineIntersection(_
		  New PKVector2(-1.0, 1.0), New PKVector2(2.0, 1.0), _
		  New PKVector2(-1.0, 0.0), New PKVector2(1.0, 0.5))
		  
		  Assert.IsNotNil(p)
		  Assert.AreEqual(3.0, p.x)
		  Assert.AreEqual(1.0, p.y)
		  
		  // Try a vertical line.
		  p = PKSegment.GetLineIntersection(_
		  New PKVector2(3.0, 0.0), New PKVector2(3.0, 1.0), _
		  New PKVector2(-1.0, 0.0), New PKVector2(1.0, 0.5))
		  
		  Assert.IsNotNil(p)
		  Assert.AreEqual(3.0, p.x)
		  Assert.AreEqual(1.0, p.y)
		  
		  // Try a vertical and horizontal line.
		  p = PKSegment.GetLineIntersection(_
		  New PKVector2(3.0, 0.0), New PKVector2(3.0, -2.0), _
		  New PKVector2(0.0, 1.0), New PKVector2(4.0, 1.0))
		  
		  Assert.IsNotNil(p)
		  Assert.AreEqual(3.0, p.x)
		  Assert.AreEqual(1.0, p.y)
		  
		  // Try two parallel lines.
		  p = PKSegment.GetLineIntersection(_
		  New PKVector2(-2.0, -1.0), New PKVector2(-1.0, 0.0), _
		  New PKVector2(-1.0, -1.0), New PKVector2(0.0, 0.0))
		  
		  Assert.IsNil(p)
		  
		  // Try two vertical lines (parallel).
		  p = PKSegment.GetLineIntersection(_
		  New PKVector2(3.0, 0.0), New PKVector2(3.0, 1.0), _
		  New PKVector2(2.0, 0.0), New PKVector2(2.0, 1.0))
		  
		  Assert.IsNil(p)
		  
		  // Try two horizontal lines (parallel).
		  p = PKSegment.GetLineIntersection(_
		  New PKVector2(3.0, 1.0), New PKVector2(4.0, 1.0), _
		  New PKVector2(2.0, 2.0), New PKVector2(4.0, 2.0))
		  
		  Assert.IsNil(p)
		  
		  // Try colinear lines.
		  p = PKSegment.GetLineIntersection(_
		  New PKVector2(-1.0, -1.0), New PKVector2(1.0, 1.0), _
		  New PKVector2(-2.0, -2.0), New PKVector2(-1.5, -1.5))
		  
		  Assert.IsNil(p)
		  
		  // Try colinear vertical lines.
		  p = PKSegment.GetLineIntersection(_
		  New PKVector2(3.0, 0.0), New PKVector2(3.0, 1.0), _
		  New PKVector2(3.0, 2.0), New PKVector2(3.0, 7.0))
		  
		  Assert.IsNil(p)
		  
		  // Try colinear horizontal lines.
		  p = PKSegment.GetLineIntersection(_
		  New PKVector2(4.0, 1.0), New PKVector2(5.0, 1.0), _
		  New PKVector2(-1.0, 1.0), New PKVector2(1.0, 1.0))
		  
		  Assert.IsNil(p)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetLocationTest()
		  ///
		  ' Tests the GetLocation method.
		  ///
		  
		  // Test invalid line.
		  Var loc As Double = PKSegment.GetLocation(New PKVector2(1.0, 1.0), New PKVector2, New PKVector2)
		  Assert.AreEqual(0.000, loc, 1.0e-3)
		  
		  // Test valid line/on line.
		  loc = PKSegment.GetLocation(New PKVector2(1.0, 1.0), New PKVector2, New PKVector2(2.0, 2.0))
		  Assert.AreEqual(0.000, loc, 1.0e-3)
		  
		  // Test valid line/left-above line.
		  loc = PKSegment.GetLocation(New PKVector2(1.0, 1.0), New PKVector2, New PKVector2(1.0, 0.5))
		  Assert.IsTrue(loc > 0)
		  
		  // Test valid line/right-below line.
		  loc = PKSegment.GetLocation(New PKVector2(1.0, 1.0), New PKVector2, New PKVector2(1.0, 2.0))
		  Assert.IsTrue(loc < 0)
		  
		  // Test vertical line.
		  loc = PKSegment.GetLocation(New PKVector2(1.0, 1.0), New PKVector2, New PKVector2(0.0, 3.0))
		  Assert.IsTrue(loc < 0)
		  loc = PKSegment.GetLocation(New PKVector2(-1.0, 1.0), New PKVector2, New PKVector2(0.0, 3.0))
		  Assert.IsTrue(loc > 0)
		  
		  // Test horizontal line.
		  loc = PKSegment.GetLocation(New PKVector2(1.0, 1.0), New PKVector2(0.0, 0.0), New PKVector2(1.0, 0.0))
		  Assert.IsTrue(loc > 0)
		  loc = PKSegment.GetLocation(New PKVector2(1.0, -1.0), New PKVector2(0.0, 0.0), New PKVector2(1.0, 0.0))
		  Assert.IsTrue(loc < 0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetPointClosestTest()
		  ///
		  ' Tests the get closest point methods.
		  ///
		  
		  Var pt As PKVector2 = New PKVector2(1.0, -1.0)
		  
		  // Test invalid line/segment.
		  Var p As PKVector2 = PKSegment.GetPointOnLineClosestToPoint(_
		  pt, New PKVector2(1.0, 1.0), New PKVector2(1.0, 1.0))
		  Assert.AreEqual(1.000, p.x, 1.0e-3)
		  Assert.AreEqual(1.000, p.y, 1.0e-3)
		  
		  p = PKSegment.GetPointOnSegmentClosestToPoint(pt, New PKVector2(1.0, 1.0), New PKVector2(1.0, 1.0))
		  Assert.AreEqual(1.000, p.x, 1.0e-3)
		  Assert.AreEqual(1.000, p.y, 1.0e-3)
		  
		  // Test valid line.
		  p = PKSegment.GetPointOnLineClosestToPoint(pt, New PKVector2, New PKVector2(5.0, 5.0))
		  // Since 0,0 is perpendicular to pt
		  Assert.AreEqual(0.000, p.x, 1.0e-3)
		  Assert.AreEqual(0.000, p.y, 1.0e-3)
		  
		  p = PKSegment.GetPointOnLineClosestToPoint(pt, New PKVector2, New PKVector2(2.5, 5.0))
		  Assert.AreEqual(-0.200, p.x, 1.0e-3)
		  Assert.AreEqual(-0.400, p.y, 1.0e-3)
		  
		  // Test valid segment.
		  p = PKSegment.GetPointOnSegmentClosestToPoint(pt, New PKVector2(-1.0, -1.0), New PKVector2(1.0, 1.0))
		  // since 0,0 is perpendicular to pt
		  Assert.AreEqual(0.000, p.x, 1.0e-3)
		  Assert.AreEqual(0.000, p.y, 1.0e-3)
		  
		  // Test closest is one of the segment points.
		  p = PKSegment.GetPointOnSegmentClosestToPoint(pt, New PKVector2, New PKVector2(2.5, 5.0))
		  Assert.AreEqual(0.000, p.x, 1.0e-3)
		  Assert.AreEqual(0.000, p.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetSegmentIntersectionTest()
		  ///
		  ' Tests the GetSegmentIntersection method.
		  ///
		  
		  Var p As PKVector2 = PKSegment.GetSegmentIntersection(_
		  New PKVector2(-3.0, -1.0), New PKVector2(3.0, 1.0), _
		  New PKVector2(-1.0, -2.0), New PKVector2(1.0, 2.0))
		  
		  Assert.IsNotNil(p)
		  Assert.AreEqual(0.0, p.x)
		  Assert.AreEqual(0.0, p.y)
		  
		  // Normal case, no intersection.
		  p = PKSegment.GetSegmentIntersection(_
		  New PKVector2(-1.0, -1.0), New PKVector2(2.0, 0.0), _
		  New PKVector2(-1.0,  0.0), New PKVector2(1.0, 0.5))
		  
		  Assert.IsNil(p)
		  
		  // Try horizontal segment.
		  p = PKSegment.GetSegmentIntersection(_
		  New PKVector2(-1.0, 1.0), New PKVector2(2.0, 1.0), _
		  New PKVector2(-1.0, 0.0), New PKVector2(1.0, 2.0))
		  
		  Assert.IsNotNil(p)
		  Assert.AreEqual(0.0, p.x)
		  Assert.AreEqual(1.0, p.y)
		  
		  // Try a vertical segment.
		  p = PKSegment.GetSegmentIntersection(_
		  New PKVector2(3.0, 0.0), New PKVector2(3.0, 3.0), _
		  New PKVector2(4.0, 0.0), New PKVector2(1.0, 3.0))
		  
		  Assert.IsNotNil(p)
		  Assert.AreEqual(3.0, p.x)
		  Assert.AreEqual(1.0, p.y)
		  
		  // Try a vertical and horizontal segment.
		  p = PKSegment.GetSegmentIntersection(_
		  New PKVector2(3.0, 2.0), New PKVector2(3.0, -2.0), _
		  New PKVector2(0.0, 1.0), New PKVector2(4.0, 1.0))
		  
		  Assert.IsNotNil(p)
		  Assert.AreEqual(3.0, p.x)
		  Assert.AreEqual(1.0, p.y)
		  
		  // Try two parallel segments.
		  p = PKSegment.GetSegmentIntersection(_
		  New PKVector2(-2.0, -1.0), New PKVector2(-1.0, 0.0), _
		  New PKVector2(-1.0, -1.0), New PKVector2(0.0, 0.0))
		  
		  Assert.IsNil(p)
		  
		  // Try two vertical segments (parallel).
		  p = PKSegment.GetSegmentIntersection(_
		  New PKVector2(3.0, 0.0), New PKVector2(3.0, 1.0), _
		  New PKVector2(2.0, 0.0), New PKVector2(2.0, 1.0))
		  
		  Assert.IsNil(p)
		  
		  // Try two horizontal segments (parallel).
		  p = PKSegment.GetSegmentIntersection(_
		  New PKVector2(3.0, 1.0), New PKVector2(4.0, 1.0), _
		  New PKVector2(3.0, 2.0), New PKVector2(4.0, 2.0))
		  
		  Assert.IsNil(p)
		  
		  // Try colinear segments.
		  p = PKSegment.GetSegmentIntersection(_
		  New PKVector2(-1.0, -1.0), New PKVector2(1.0, 1.0), _
		  New PKVector2(-2.0, -2.0), New PKVector2(-1.5, -1.5))
		  
		  Assert.IsNil(p)
		  
		  // Try colinear vertical segments.
		  p = PKSegment.GetSegmentIntersection(_
		  New PKVector2(3.0, 0.0), New PKVector2(3.0, 1.0), _
		  New PKVector2(3.0, -1.0), New PKVector2(3.0, 7.0))
		  
		  Assert.IsNil(p)
		  
		  // Try colinear horizontal segments.
		  p = PKSegment.GetSegmentIntersection(_
		  New PKVector2(-1.0, 1.0), New PKVector2(5.0, 1.0), _
		  New PKVector2(-1.0, 1.0), New PKVector2(1.0, 1.0))
		  
		  Assert.IsNil(p)
		  
		  // Try intersection at end point.
		  p = PKSegment.GetSegmentIntersection(_
		  New PKVector2(1.0, 0.0), New PKVector2(3.0, -2.0), _
		  New PKVector2(-1.0, -1.0), New PKVector2(1.0, 0.0))
		  
		  Assert.IsNotNil(p)
		  Assert.AreEqual(1.0, p.x)
		  Assert.AreEqual(0.0, p.y)
		  
		  // Test segment intersection perpendicular.
		  Var s1 As PKSegment = New PKSegment(New PKVector2(-10, 10), New PKVector2(10, 10))
		  Var s2 As PKSegment = New PKSegment(New PKVector2(0, 0), New PKVector2(0, 5))
		  p = s2.GetSegmentIntersection(s1)
		  Assert.IsNil(p)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProjectTest()
		  ///
		  ' Tests the Project method.
		  ///
		  
		  Var s As PKSegment = New PKSegment(New PKVector2(0.0, 1.0), New PKVector2(1.5, 3.0))
		  Var t As PKTransform = New PKTransform
		  Var n As PKVector2 = New PKVector2(1.0, 0.0)
		  
		  Var i As PKInterval = s.Project(n, t)
		  
		  Assert.AreEqual(0.000, i.min, 1.0e-3)
		  Assert.AreEqual(1.500, i.max, 1.0e-3)
		  
		  Call n.Set(1.0, 1.0)
		  i = s.Project(n, t)
		  
		  Assert.AreEqual(1.000, i.min, 1.0e-3)
		  Assert.AreEqual(4.500, i.max, 1.0e-3)
		  
		  Call n.Set(0.0, 1.0)
		  i = s.Project(n, t)
		  
		  Assert.AreEqual(1.000, i.min, 1.0e-3)
		  Assert.AreEqual(3.000, i.max, 1.0e-3)
		  
		  // Transform the segment a bit.
		  t.Translate(1.0, 2.0)
		  t.Rotate(MathsKit.ToRadians(90), t.GetTransformed(s.Center))
		  
		  i = s.Project(n, t)
		  
		  Assert.AreEqual(3.250, i.min, 1.0e-3)
		  Assert.AreEqual(4.750, i.max, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateTest()
		  ///
		  ' Tests the Rotate method.
		  ///
		  
		  Var s As PKSegment = New PKSegment(New PKVector2(0.0, 0.0), New PKVector2(1.0, 1.0))
		  s.Rotate(MathsKit.ToRadians(45), 0, 0)
		  
		  Assert.AreEqual(0.000, s.vertices(0).x, 1.0e-3)
		  Assert.AreEqual(0.000, s.vertices(0).y, 1.0e-3)
		  
		  Assert.AreEqual(0.000, s.vertices(1).x, 1.0e-3)
		  Assert.AreEqual(1.414, s.vertices(1).y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateTest()
		  ///
		  ' Tests the Translate method.
		  ///
		  
		  Var s As PKSegment = New PKSegment(New PKVector2(0.0, 0.0), New PKVector2(1.0, 1.0))
		  s.Translate(2.0, -1.0)
		  
		  Assert.AreEqual( 2.000, s.vertices(0).x, 1.0e-3)
		  Assert.AreEqual(-1.000, s.vertices(0).y, 1.0e-3)
		  Assert.AreEqual( 3.000, s.vertices(1).x, 1.0e-3)
		  Assert.AreEqual( 0.000, s.vertices(1).y, 1.0e-3)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private IDENTITY As PKTransform
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
