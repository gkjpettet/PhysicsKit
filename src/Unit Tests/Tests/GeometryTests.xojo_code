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
		Sub CreateNEgativeRadiusCircleTest()
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
		  
		  //  Make sure the centre is at the origin.
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
