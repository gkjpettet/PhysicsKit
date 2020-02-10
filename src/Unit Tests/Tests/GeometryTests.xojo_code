#tag Class
Protected Class GeometryTests
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
		Sub CleanseArrayTest()
		  ///
		  ' Tests the cleanse array method.
		  ///
		  
		  Var points() As Vector2
		  points.AddRow(New Vector2(1.0, 0.0))
		  points.AddRow(New Vector2(1.0, 0.0))
		  points.AddRow(New Vector2(0.5, -0.5))
		  points.AddRow(New Vector2(0.0, -0.5))
		  points.AddRow(New Vector2(-0.5, -0.5))
		  points.AddRow(New Vector2(-2.0, -0.5))
		  points.AddRow(New Vector2(2.1, 0.5))
		  points.AddRow(New Vector2(1.0, 0.0))
		  
		  Var result() As Vector2 = Geometry.Cleanse(points)
		  
		  Assert.IsTrue(Geometry.GetWinding(result) > 0.0)
		  Assert.AreEqual(4, result.Count)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CleanseArrayWithNilElementsTest()
		  ///
		  ' Tests the cleanse method passing an array with Nil elements.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var a(4) As Vector2
		    a(0) = New Vector2
		    a(3) = New Vector2
		    a(4) = New Vector2
		    Call Geometry.cleanse(a)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CleanseNilArrayTest()
		  ///
		  ' Tests the cleanse method passing a Nil array.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.Cleanse(Nil)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCircleTest()
		  ///
		  ' Tests the successful creation of a circle.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateCircle(1.0)
		  Catch e As RuntimeException
		    Assert.Fail("Unexpected runtime exception whilst creating a circle.")
		    Return
		  End Try
		  
		  Assert.Pass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateEquilateralTriangleTest()
		  ///
		  ' Tests the successful creation of an equilateral angle triangle.
		  ///
		  
		  Var t As Triangle = Geometry.CreateEquilateralTriangle(2.0)
		  
		  // Test that the centre is the origin.
		  Var center As Vector2 = t.GetCenter
		  Assert.AreEqual(0.000, center.x, 1.0e-3)
		  Assert.AreEqual(0.000, center.y, 1.0e-3)
		  
		  // Compute the first angle.
		  Var previousA As Double = t.Vertices(0).GetAngleBetween(t.Vertices(1))
		  
		  // Put the angle between 0 and 180.
		  previousA = Abs(MathsKit.PI - Abs(previousA))
		  
		  // Compute the first distance.
		  Var previousD As Double = t.Vertices(0).Distance(t.Vertices(1))
		  
		  // Make sure all the angles are the same.
		  For i As Integer = 1 To 2
		    Var v1 As Vector2 = t.Vertices(i)
		    Var v2 As Vector2 = t.Vertices(If(i + 1 = 3, 0, i + 1))
		    
		    // Test the angle between the vectors.
		    Var angle As Double = v1.GetAngleBetween(v2)
		    
		    // Put the angle between 0 and 180.
		    angle = Abs(MathsKit.PI - Abs(angle)) 
		    If angle < previousA * 0.9999 Or angle > previousA * 1.0001 Then
		      Assert.Fail("The angle is not the same as the last.")
		      Return
		    End If
		    
		    // Test the distance between the points.
		    Var distance As Double = v1.Distance(v2)
		    If distance < previousD * 0.9999 Or distance > previousD * 1.0001 Then
		      Assert.Fail("The distance is not the same as the last.")
		    End If
		  Next i
		  
		  // If we get here we didn't find a 90 degree angle.
		  Assert.Pass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateHoriztonalSegmentTest()
		  ///
		  ' Tests the successful creation of a segment given a length.
		  ///
		  
		  Var s As Segment = Geometry.CreateHorizontalSegment(5.0)
		  
		  // Test that the centre is the origin.
		  Var center As Vector2 = s.GetCenter
		  Assert.AreEqual(0.000, center.x, 1.0e-3)
		  Assert.AreEqual(0.000, center.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateIsoscelesTriangleTest()
		  ///
		  ' Tests the successful creation of an isosceles triangle.
		  ///
		  
		  Var t As Triangle = Geometry.CreateIsoscelesTriangle(2.0, 1.0)
		  
		  // Test that the centre is the origin.
		  Var center As Vector2 = t.GetCenter
		  Assert.AreEqual(0.000, center.x, 1.0e-3)
		  Assert.AreEqual(0.000, center.y, 1.0e-3)
		  
		  // Get the vertices.
		  Var v1 As Vector2 = t.Vertices(0)
		  Var v2 As Vector2 = t.Vertices(1)
		  Var v3 As Vector2 = t.Vertices(2)
		  
		  // Create the edges.
		  Var e1 As Vector2 = v1.Towards(v2)
		  Var e2 As Vector2 = v2.Towards(v3)
		  Var e3 As Vector2 = v3.Towards(v1)
		  
		  // The length of e1 and e3 should be identical.
		  Assert.AreEqual(e1.GetMagnitude, e3.GetMagnitude, 1.0e-3)
		  
		  // Then angles between e1 and e2 and e2 and e3 should be identical.
		  Assert.AreEqual(e1.GetAngleBetween(e2), e2.GetAngleBetween(e3), 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateLessThan3PointsUnitCirclePolygonTest()
		  ///
		  ' Tests the failed creation of a unit circle polygon with less than 3 points.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try 
		    Call Geometry.CreateUnitCirclePolygon(2, 0.5)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as requested less than 3 points.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeHeightEquilateralTriangleTest()
		  ///
		  ' Tests the create equilateral triangle method with a negative height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateEquilateralTriangle(-1.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeHeightIsoscelesTriangleTest()
		  ///
		  ' Tests the create right triangle method with a negative height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateIsoscelesTriangle(2.0, -2.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeHeightRectangleTest()
		  ///
		  ' Tests the failed creation of a rectangle with a negative height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateRectangle(1.0, -2.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as negative height.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeHeightRightTriangleTest()
		  ///
		  ' Tests the create right triangle method with a negative height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateRightTriangle(2.0, -2.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeLengthHorizontalSegmentTest()
		  ///
		  ' Tests the creation of a segment passing a negative length.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateHorizontalSegment(-1.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeLengthVerticalSegmentTest()
		  ///
		  ' Tests the creation of a segment passing a negative length.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateVerticalSegment(-1.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeRadiusCircleTest()
		  ///
		  ' Tests the failed creation of a circle using a negative radius.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateCircle(-1.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as negative radius.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeRadiusUnitCirclePolygonTest()
		  ///
		  ' Tests the failed creation of a negative radius unit circle polygon.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateUnitCirclePolygon(5, -0.5)
		  Catch InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as passed a negative radius.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeSizeSquareTest()
		  ///
		  ' Tests the creation of a square with a negative size.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateSquare(-1.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as negative size.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeWidthIsoscelesTriangleTest()
		  ///
		  ' Tests the create right triangle method with a negative width.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateIsoscelesTriangle(-1.0, 2.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeWidthRectangleTest()
		  ///
		  ' Tests the failed creation of a rectangle with a negative width.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateRectangle(-1.0, 2.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as negative width.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeWidthRightTriangleTest()
		  ///
		  ' Tests the create right triangle method with a negative width.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateRightTriangle(-1.0, 2.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonalEllipseLessCountTest()
		  ///
		  ' Tests the CreatePolygonalEllipse method with less than 4 vertices.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreatePolygonalEllipse(3, 2, 1)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonalEllipseNegativeHeightTest()
		  ///
		  ' Tests the CreatePolygonalEllipse method with a negative height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreatePolygonalEllipse(10, 2, -1)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonalEllipseNegativeWidthTest()
		  ///
		  ' Tests the CreatePolygonalEllipse method with a negative width.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreatePolygonalEllipse(10, -1, 1)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonalEllipseOddCountTest()
		  ///
		  ' Tests the createPolygonalEllipse method with an odd count.
		  ///
		  
		  // This method should succeed.
		  Var p As Polygon = Geometry.CreatePolygonalEllipse(5, 2, 1)
		  
		  // And the centre should be the origin.
		  Assert.AreEqual(4, p.GetVertices.Count)
		  
		  // This method should succeed.
		  p = Geometry.CreatePolygonalEllipse(11, 2, 1)
		  
		  // The centre should be the origin.
		  Assert.AreEqual(10, p.GetVertices.Count)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonalEllipseTest()
		  ///
		  ' Tests the createPolygonalEllipse method.
		  ///
		  
		  // This method should succeed
		  Var p As Polygon = Geometry.CreatePolygonalEllipse(10, 2, 1)
		  
		  // And the centre should be the origin.
		  Assert.AreEqual(0.000, p.GetCenter.x, 1.0e-3)
		  Assert.AreEqual(0.000, p.GetCenter.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonalEllipseZeroHEightTest()
		  ///
		  ' Tests the CreatePolygonalEllipse method with a zero height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreatePolygonalEllipse(10, 2, 0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonalEllipseZeroWidthTest()
		  ///
		  ' Tests the CreatePolygonalEllipse method with a zero width.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreatePolygonalEllipse(10, 0, 1)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonalSliceAtOriginTest()
		  ///
		  ' Tests the CreatePolygonalSliceAtOrigin method.
		  ///
		  
		  // This method should succeed.
		  Var p As Polygon = Geometry.CreatePolygonalSliceAtOrigin(5, 1.0, MathsKit.ToRadians(30))
		  
		  // The centre should be the origin.
		  Assert.AreEqual(0.000, p.GetCenter.x, 1.0e-3)
		  Assert.AreEqual(0.000, p.GetCenter.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonalSliceTest()
		  ///
		  ' Tests the CreatePolygonalSlice method.
		  ///
		  
		  // This method should succeed.
		  Var p As Polygon = Geometry.CreatePolygonalSlice(5, 1.0, MathsKit.ToRadians(30))
		  
		  // The centre should not be at the origin.
		  Assert.AreEqual(0.658, p.GetCenter.x, 1.0e-3)
		  Assert.AreEqual(0.000, p.GetCenter.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonAtOriginTest()
		  ///
		  ' Tests the successful creation of a polygon using vertices.
		  ///
		  
		  Var vertices(4) As Vector2
		  vertices(0) = New Vector2(1.0, 0.0)
		  vertices(1) = New Vector2(0.5, 1.0)
		  vertices(2) = New Vector2(-0.5, 1.0)
		  vertices(3) = New Vector2(-1.0, 0.0)
		  vertices(4) = New Vector2(0.0, -1.0)
		  
		  Var p As Polygon = Geometry.CreatePolygonAtOrigin(vertices)
		  
		  // The array should not be the same object.
		  Assert.IsFalse(p.vertices Is vertices)
		  
		  // The points should also be copies.
		  For i As Integer = 0 To 4
		    Assert.AreDifferent(p.Vertices(0), vertices(0))
		  Next 
		  
		  // Make sure the centre is at the origin.
		  Var c As Vector2 = p.GetCenter
		  Assert.AreEqual(0.000, c.x, 1.0e-3)
		  Assert.AreEqual(0.000, c.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonNilArrayTest()
		  ///
		  ' Tests the creation of a polygon with a Nil array.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var vertices() As Vector2 = Nil
		    Call Geometry.CreatePolygon(vertices)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected NilObjectException as passed Nil array.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonNilPointTest()
		  ///
		  ' Tests the creation of a polygon with a Nil point.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var vertices(4) As Vector2
		    // Should fail since the vertices list contains Nil items.
		    Call Geometry.CreatePolygon(vertices)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected NilObjectException as the passed array contains Nil elements.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePolygonTest()
		  ///
		  ' Tests the successful creation of a polygon using vertices.
		  ///
		  
		  Var vertices(4) As Vector2
		  vertices(0) = New Vector2(1.0, 0.0)
		  vertices(1) = New Vector2(0.5, 1.0)
		  vertices(2) = New Vector2(-0.5, 1.0)
		  vertices(3) = New Vector2(-1.0, 0.0)
		  vertices(4) = New Vector2(0.0, -1.0)
		  
		  Var p As Polygon = Geometry.CreatePolygon(vertices)
		  
		  // The array should not be the same object.
		  Assert.IsFalse(p.Vertices Is vertices)
		  
		  // The points should also be copies.
		  For i As Integer = 0 To 4
		    Assert.AreDifferent(p.Vertices(0), vertices(0))
		  Next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateRectangleTest()
		  ///
		  ' Tests the successful creation of a rectangle.
		  
		  Call Geometry.CreateRectangle(1.0, 2.0)
		  
		  Assert.Pass
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateRightTriangleMirrorTest()
		  ///
		  ' Tests the successful creation of a right angle triangle.
		  ///
		  
		  Var t As Triangle = Geometry.CreateRightTriangle(1.0, 2.0, True)
		  
		  // Test that the centre is the origin.
		  Var center As Vector2 = t.GetCenter
		  Assert.AreEqual(0.000, center.x, 1.0e-3)
		  Assert.AreEqual(0.000, center.y, 1.0e-3)
		  
		  // Get the vertices.
		  Var v1 As Vector2 = t.Vertices(0)
		  Var v2 As Vector2 = t.Vertices(1)
		  Var v3 As Vector2 = t.Vertices(2)
		  
		  // Create the edges.
		  Var e1 As Vector2 = v1.Towards(v2)
		  Var e2 As Vector2 = v2.Towards(v3)
		  Var e3 As Vector2 = v3.Towards(v1)
		  
		  // One of the follow dot products must be zero indicating a 90 degree angle.
		  If e1.Dot(e2) < 0.00001 And e1.Dot(e2) > -0.00001 Then
		    Assert.Pass
		    Return
		  End If
		  
		  If e2.Dot(e3) < 0.00001 And e2.Dot(e3) > -0.00001 Then
		    Assert.Pass
		    Return
		  End If
		  
		  If e3.Dot(e1) < 0.00001 And e3.Dot(e1) > -0.00001 Then
		    Assert.Pass
		    Return
		  End If
		  
		  // If we get here we didn't find a 90 degree angle.
		  Assert.Fail("Failed to find a 90 degree angle.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateRightTriangleTest()
		  ///
		  ' Tests the successful creation of a right angle triangle.
		  ///
		  
		  Var t As Triangle = Geometry.CreateRightTriangle(1.0, 2.0)
		  
		  // Test that the centre is the origin.
		  Var center As Vector2 = t.GetCenter
		  Assert.AreEqual(0.000, center.x, 1.0e-3)
		  Assert.AreEqual(0.000, center.y, 1.0e-3)
		  
		  // Get the vertices.
		  Var v1 As Vector2 = t.Vertices(0)
		  Var v2 As Vector2 = t.Vertices(1)
		  Var v3 As Vector2 = t.Vertices(2)
		  
		  // Create the edges.
		  Var e1 As Vector2 = v1.Towards(v2)
		  Var e2 As Vector2 = v2.Towards(v3)
		  Var e3 As Vector2 = v3.Towards(v1)
		  
		  // One of the follow dot products must be zero indicating a 90 degree angle.
		  If e1.Dot(e2) < 0.00001 And e1.Dot(e2) > -0.00001 Then
		    Assert.Pass
		    Return
		  End If
		  
		  If e2.Dot(e3) < 0.00001 And e2.Dot(e3) > -0.00001 Then
		    Assert.Pass
		    Return
		  End If
		  
		  If e3.Dot(e1) < 0.00001 And e3.Dot(e1) > -0.00001 Then
		    Assert.Pass
		    Return
		  End If
		  
		  // If we get here we didn't find a 90 degree angle.
		  Assert.Fail("Failed to find a 90 degree angle.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSegmentAtOriginTest()
		  ///
		  ' Tests the successful creation of a segment given two points at the origin.
		  ///
		  
		  Var s As Segment = Geometry.CreateSegmentAtOrigin(New Vector2(1.0, 1.0), New Vector2(2.0, -1.0))
		  
		  // Test that the centre is the origin.
		  Var center As Vector2 = s.GetCenter
		  Assert.AreEqual(0.000, center.x, 1.0e-3)
		  Assert.AreEqual(0.000, center.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSegmentEndTest()
		  ///
		  ' Tests the successful creation of a segment given an end point.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateSegment(New Vector2(1.0, 1.0))
		    Assert.Pass
		    Return
		  Catch e As RuntimeException
		    Assert.Fail("")
		    Return
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSegmentNilPoint1Test()
		  ///
		  '  Tests the creation of a segment passing a Nil point.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateSegment(Nil, New Vector2)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSegmentNilPoint2Test()
		  ///
		  ' Tests the creation of a segment passing a Nil point.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateSegment(New Vector2, Nil)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSegmentTest()
		  ///
		  ' Tests the successful creation of a segment given two points.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateSegment(New Vector2(1.0, 1.0), New Vector2(2.0, -1.0))
		    Assert.Pass
		    Return
		  Catch e As RuntimeException
		    Assert.Fail("")
		    Return
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSquareTest()
		  ///
		  ' Tests the successful creation of a square.
		  ///
		  
		  Var r As Rectangle = Geometry.CreateSquare(1.0)
		  Assert.AreEqual(1.000, r.GetWidth, 1.0e-3)
		  Assert.AreEqual(1.000, r.GetHeight, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTriangleAtOriginTest()
		  ///
		  ' Tests the successful creation of a triangle using points.
		  ///
		  
		  Var p1 As Vector2 = New Vector2(1.0, 0.0)
		  Var p2 As Vector2 = New Vector2(0.5, 1.0)
		  Var p3 As Vector2 = New Vector2(-0.5, 1.0)
		  Var t As Triangle = Geometry.CreateTriangleAtOrigin(p1, p2, p3)
		  
		  // The points should not be the same instances.
		  Assert.IsFalse(t.Vertices(0) Is p1)
		  Assert.IsFalse(t.Vertices(1) Is p2)
		  Assert.IsFalse(t.Vertices(2) Is p3)
		  
		  // Make sure the centre is at the origin.
		  Var c As Vector2 = t.GetCenter
		  Assert.AreEqual(0.000, c.x, 1.0e-3)
		  Assert.AreEqual(0.000, c.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTriangleNilPointTest()
		  ///
		  ' Tests the creation of a triangle using a null point.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Var p1 As Vector2 = New Vector2(1.0, 0.0)
		  Var p2 As Vector2 = New Vector2(0.5, 1.0)
		  
		  // Should fail since the vertices list contains a Nil item.
		  Try
		    Call Geometry.CreateTriangle(p1, p2, Nil)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected NilObjectException.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTriangleTest()
		  ///
		  ' Tests the successful creation of a triangle using points.
		  ///
		  
		  Var p1 As Vector2 = New Vector2(1.0, 0.0)
		  Var p2 As Vector2 = New Vector2(0.5, 1.0)
		  Var p3 As Vector2 = New Vector2(-0.5, 1.0)
		  Var t As Triangle = Geometry.CreateTriangle(p1, p2, p3)
		  
		  // The points should not be the same instances.
		  Assert.IsFalse(t.Vertices(0) Is p1)
		  Assert.IsFalse(t.Vertices(1) Is p2)
		  Assert.IsFalse(t.Vertices(2) Is p3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateUnitCirclePolygonTest()
		  ///
		  ' Test case for the UnitCirclePolygon methods.
		  ///
		  
		  Var p As Polygon 
		  
		  Try
		    p = Geometry.CreateUnitCirclePolygon(5, 0.5)
		  Catch e As RuntimeException
		    Assert.Fail("Unexpected runtime exception during creation of first polygon.")
		    Return
		  End Try
		  
		  // No exception indicates the generated polygon is valid.
		  // Test that the correct vertices are created.
		  Assert.AreEqual( 0.154, p.vertices(4).x, 1.0e-3)
		  Assert.AreEqual(-0.475, p.vertices(4).y, 1.0e-3)
		  Assert.AreEqual(-0.404, p.vertices(3).x, 1.0e-3)
		  Assert.AreEqual(-0.293, p.vertices(3).y, 1.0e-3)
		  Assert.AreEqual(-0.404, p.vertices(2).x, 1.0e-3)
		  Assert.AreEqual( 0.293, p.vertices(2).y, 1.0e-3)
		  Assert.AreEqual( 0.154, p.vertices(1).x, 1.0e-3)
		  Assert.AreEqual( 0.475, p.vertices(1).y, 1.0e-3)
		  Assert.AreEqual( 0.500, p.vertices(0).x, 1.0e-3)
		  Assert.AreEqual( 0.000, p.vertices(0).y, 1.0e-3)
		  
		  Var v11 As Vector2 = p.vertices(0)
		  
		  Try
		    p = Geometry.CreateUnitCirclePolygon(5, 0.5, MathsKit.PI / 2.0)
		  Catch e As RuntimeException
		    Assert.Fail("Unexpected runtime exception during creation of second polygon.")
		    Return
		  End Try
		  
		  // No exception indicates the generated polygon is valid.
		  // Test that the correct vertices are created.
		  Assert.AreEqual( 0.475, p.vertices(4).x, 1.0e-3)
		  Assert.AreEqual( 0.154, p.vertices(4).y, 1.0e-3)
		  Assert.AreEqual( 0.293, p.vertices(3).x, 1.0e-3)
		  Assert.AreEqual(-0.404, p.vertices(3).y, 1.0e-3)
		  Assert.AreEqual(-0.293, p.vertices(2).x, 1.0e-3)
		  Assert.AreEqual(-0.404, p.vertices(2).y, 1.0e-3)
		  Assert.AreEqual(-0.475, p.vertices(1).x, 1.0e-3)
		  Assert.AreEqual( 0.154, p.vertices(1).y, 1.0e-3)
		  Assert.AreEqual( 0.000, p.vertices(0).x, 1.0e-3)
		  Assert.AreEqual( 0.500, p.vertices(0).y, 1.0e-3)
		  
		  Var v21 As Vector2 = p.vertices(0)
		  
		  // The angle between any two vertices of the two polygons should be PI / 2.
		  Var angle As Double = v11.GetAngleBetween(v21)
		  Assert.AreEqual(MathsKit.PI / 2.0, angle, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateVerticalSegmentTest()
		  ///
		  ' Tests the successful creation of a segment given a length.
		  ///
		  
		  Var s As Segment = Geometry.CreateVerticalSegment(5.0)
		  
		  // Test that the centre is the origin.
		  Var center As Vector2 = s.GetCenter
		  Assert.AreEqual(0.000, center.x, 1.0e-3)
		  Assert.AreEqual(0.000, center.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroHeightEquilateralTriangleTest()
		  ///
		  ' Tests the create equilateral triangle method with a zero height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateEquilateralTriangle(0.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroHeightIsoscelesTraingleTest()
		  ///
		  ' Tests the create right triangle method with a zero height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateIsoscelesTriangle(1.0, 0.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroHeightRectangleTest()
		  ///
		  ' Tests the failed creation of a rectangle with a zero height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateRectangle(1.0, 0.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as zero height.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroHeightRightTriangleTest()
		  ///
		  ' Tests the create right triangle method with a zero height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateRightTriangle(1.0, 0.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroLengthHorizontalSegmentTest()
		  ///
		  ' Tests the creation of a segment passing a zero length.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateHorizontalSegment(0.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroLengthVerticalSegmentTest()
		  ///
		  ' Tests the creation of a segment passing a zero length.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.createVerticalSegment(0.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroRadiusCircleTest()
		  ///
		  ' Tests the failed creation of a circle using a zero radius.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateCircle(0.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as used a zero radius.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroRadiusUnitCirclePolygonTest()
		  ///
		  ' Tests the failed creation of a zero radius unit circle polygon.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateUnitCirclePolygon(5, 0.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as passed a zero radius.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroSizeSquareTest()
		  ///
		  ' Tests the creation of a square with a zero size.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateSquare(0.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as zero size.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroWidthIsoscelesTriangleTest()
		  ///
		  ' Tests the create right triangle method with a zero width.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateIsoscelesTriangle(0.0, 1.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroWidthRectangleTest()
		  ///
		  ' Tests the failed creation of a rectangle with a zero width.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateRectangle(0.0, 2.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as zero width rectangle.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroWidthRightTriangleTest()
		  ///
		  ' Tests the create right triangle method with a zero width.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.CreateRightTriangle(0.0, 2.0)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAreaWeightedCenterArrayNilElementsTest()
		  ///
		  ' Tests the GetAreaWeightedCenter method passing an array with Nil elements.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.GetAreaWeightedCenter(Array(_
		    New Vector2(1.0, 0.0), _
		    Nil, _
		    New Vector2(4.0, 3.0), _
		    New Vector2(-2.0, -1.0), _
		    Nil))
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected NilObjectException as passed Nil array elements.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAreaWeightedCenterEmptyArrayTest()
		  ///
		  ' Tests the GetAreaWeightedCenter method passing an empty array.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var tmp() As Vector2
		    Call Geometry.GetAreaWeightedCenter(tmp)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as passed an empty array.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAreaWeightedCenterNilArrayTest()
		  ///
		  ' Tests the GetAreaWeightedCenter method passing a Nil array.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.GetAreaWeightedCenter(Nil)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException as passed a Nil array.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAreaWeightedCenterOffsetTest()
		  ///
		  ' Tests the GetAreaWeightedCenter method with a polygon that is not centered about the origin.
		  ///
		  
		  Var vertices(5) As Vector2
		  vertices(0) = New Vector2(-1.0, 2.0)
		  vertices(1) = New Vector2(0.0, 3.0)
		  
		  // Test dense area of points.
		  vertices(2) = New Vector2(2.2, 1.5)
		  vertices(3) = New Vector2(2.3, 1.3)
		  vertices(4) = New Vector2(2.4, 1.2)
		  vertices(5) = New Vector2(1.0, 0.0)
		  
		  Var c As Vector2 = Geometry.GetAreaWeightedCenter(vertices)
		  
		  // Note the x is closer to the "real" centre of the object.
		  Assert.AreEqual(0.682, c.x, 1.0e-3)
		  Assert.AreEqual(1.527, c.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAreaWeightedCenterTest()
		  ///
		  ' Tests the GetAreaWeightedCenter method.
		  ///
		  
		  Var vertices(5) As Vector2
		  vertices(0) = New Vector2(-2.0, 1.0)
		  vertices(1) = New Vector2(-1.0, 2.0)
		  
		  // Test dense area of points.
		  vertices(2) = New Vector2(1.2, 0.5)
		  vertices(3) = New Vector2(1.3, 0.3)
		  vertices(4) = New Vector2(1.4, 0.2)
		  vertices(5) = New Vector2(0.0, -1.0)
		  
		  Var c As Vector2 = Geometry.GetAreaWeightedCenter(vertices)
		  
		  // Note the x is closer to the "real" centre of the object
		  Assert.AreEqual(-0.318, c.x, 1.0e-3)
		  Assert.AreEqual( 0.527, c.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAreaWeightedCenterZeroAreaArrayTest()
		  ///
		  ' Tests the GetAreaWeightedCenter method passing an array of
		  ' points who are all the same yielding zero area.
		  ///
		  
		  Var points(3) As Vector2
		  points(0) = New Vector2(2.0, 1.0)
		  points(1) = New Vector2(2.0, 1.0)
		  points(2) = New Vector2(2.0, 1.0)
		  points(3) = New Vector2(2.0, 1.0)
		  
		  Var c As Vector2 = Geometry.GetAreaWeightedCenter(points)
		  
		  Assert.AreEqual(2.000, c.x, 1.0e-3)
		  Assert.AreEqual(1.000, c.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAverageCenterArrayNilElementsTest()
		  ///
		  ' Tests the GetAverageCenter method passing an array with Nil elements.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.GetAverageCenter(Array(_
		    New Vector2(1.0, 0.0), _
		    Nil, _
		    New Vector2(4.0, 3.0), _
		    New Vector2(-2.0, -1.0), _
		    Nil))
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected NilObjectException as array passed contained Nil elements.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAverageCenterArrayTest()
		  ///
		  ' Tests the GetAverageCenter method.
		  ' This test also shows that the average method can produce an incorrect
		  ' centre of mass when vertices are more dense at any place along the perimeter.
		  ///
		  
		  Var vertices(5) As Vector2
		  vertices(0) = New Vector2(-2.0, 1.0)
		  vertices(1) = New Vector2(-1.0, 2.0)
		  vertices(2) = New Vector2(1.2, 0.5)
		  vertices(3) = New Vector2(1.3, 0.3)
		  vertices(4) = New Vector2(1.4, 0.2)
		  vertices(5) = New Vector2(0.0, -1.0)
		  
		  Var c As Vector2 = Geometry.GetAverageCenter(vertices)
		  
		  Assert.AreEqual(0.150, c.x, 1.0e-3)
		  Assert.AreEqual(0.500, c.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAverageCenterEmptyArrayTest()
		  ///
		  ' Tests the GetAverageCenter method passing an empty array.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var tmp() As Vector2
		    Call Geometry.GetAverageCenter(tmp)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as passed empty array.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAverageCenterNilArrayTest()
		  ///
		  ' Tests the GetAverageCenter method passing a Nil array.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.GetAverageCenter(Nil)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected NilObjectException as passed Nil array.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetWindingArrayLessThan2PointsTest()
		  ///
		  ' Tests the GetWinding method passing an array with less than two points.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var points(0) As Vector2
		    points(0) = New Vector2(-1.0, -1.0)
		    Call Geometry.GetWinding(points)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetWindingArrayNilPointTest()
		  ///
		  ' Tests the getWinding method passing an array containing Nil points.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var points(3) As Vector2
		    points(0) = New Vector2(-1.0, -1.0)
		    points(1) = Nil
		    points(2) = Nil
		    points(3) = Nil
		    Call Geometry.GetWinding(points)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetWindingArrayTest()
		  ///
		  ' Tests the GetWinding method passing a valid array.
		  ///
		  
		  Var points(3) As Vector2
		  points(0) = New Vector2(-1.0, -1.0)
		  points(1) = New Vector2(1.0, -1.0)
		  points(2) = New Vector2(1.0, 1.0)
		  points(3) = New Vector2(-1.0, 1.0)
		  Assert.IsTrue(Geometry.GetWinding(points) > 0)
		  
		  // Reverse the array.
		  Var p As Vector2 = points(0)
		  points(0) = points(3)
		  points(3) = p
		  p = points(1)
		  points(1) = points(2)
		  points(2) = p
		  
		  Assert.IsTrue(Geometry.GetWinding(points) < 0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetWindingNilArrayTest()
		  ///
		  ' Tests the getWinding method passing a Nil array.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.GetWinding(Nil)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReverseWindingNilArrayTest()
		  ///
		  ' Tests the reverse winding method passing a Nil array.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Call Geometry.ReverseWinding(Nil)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("")
		  
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
