#tag Class
Protected Class AxisAlignedBoundsTests
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
		Sub CreateNegativeHeightTest()
		  ///
		  ' Tests creating one with negative height.
		  ///
		  
		  Try
		    Var tmp As PKAxisAlignedBounds = New PKAxisAlignedBounds(10.0, -40.0)
		    #Pragma Unused tmp
		    Assert.Fail("Expected an InvalidArgumentException")
		  Catch e As InvalidArgumentException
		    Assert.Pass
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeWidthTest()
		  ///
		  ' Tests creating one with negative width.
		  ///
		  
		  Try
		    Var tmp As PKAxisAlignedBounds = New PKAxisAlignedBounds(-10.0, 7.0)
		    #Pragma Unused tmp
		    Assert.Fail("Expected an InvalidArgumentException")
		  Catch e As InvalidArgumentException
		    Assert.Pass
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTest()
		  ///
		  ' Tests the constructor and the width and height getters.
		  ///
		  
		  Var ab As PKAxisAlignedBounds = New PKAxisAlignedBounds(10.0, 7.0)
		  Assert.AreEqual(10.0, ab.GetWidth)
		  Assert.AreEqual(7.0, ab.GetHeight)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroHeightTest()
		  ///
		  ' Tests creating one with zero height.
		  ///
		  
		  Try
		    Var tmp As PKAxisAlignedBounds = New PKAxisAlignedBounds(10.0, 0.0)
		    #Pragma Unused tmp
		    Assert.Fail("Expected an InvalidArgumentException")
		  Catch e As InvalidArgumentException
		    Assert.Pass
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroWidthTest()
		  ///
		  ' Tests creating one with zero width.
		  ///
		  
		  Try
		    Var tmp As New PKAxisAlignedBounds(0.0, 7.0)
		    #Pragma Unused tmp
		    Assert.Fail("Expected an InvalidArgumentException")
		  Catch e As InvalidArgumentException
		    Assert.Pass
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetBoundsTest()
		  ///
		  ' Tests the GetBounds method.
		  ///
		  
		  Var bounds As PKAxisAlignedBounds = New PKAxisAlignedBounds(20.0, 20.0)
		  
		  Var aabb As PKAABB = bounds.GetBounds
		  
		  // Should be centered about the origin.
		  Assert.AreEqual(-10.0, aabb.GetMinX)
		  Assert.AreEqual(-10.0, aabb.GetMinY)
		  Assert.AreEqual(10.0, aabb.GetMaxX)
		  Assert.AreEqual(10.0, aabb.GetMaxY)
		  
		  // Move it a bit.
		  bounds.Translate(1.0, -2.0)
		  aabb = bounds.GetBounds
		  Assert.AreEqual(-9.0, aabb.GetMinX)
		  Assert.AreEqual(-12.0, aabb.GetMinY)
		  Assert.AreEqual(11.0, aabb.GetMaxX)
		  Assert.AreEqual(8.0, aabb.GetMaxY)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsOutsideAABBTest()
		  ///
		  ' Tests the IsOutside method on an AABB.
		  ///
		  
		  Var bounds As PKAxisAlignedBounds = New PKAxisAlignedBounds(20.0, 20.0)
		  
		  // Create some shapes.
		  Var aabb As PKAABB = New PKAABB(0, 0, 1, 1)
		  
		  // Should be in.
		  Assert.IsFalse(bounds.IsOutside(aabb))
		  
		  // Test half way in and out.
		  aabb.Translate(9.5, 0.0)
		  Assert.IsFalse(bounds.IsOutside(aabb))
		  
		  // Test all the way out.
		  aabb.Translate(1.5, 0.0)
		  Assert.IsTrue(bounds.IsOutside(aabb))
		  
		  // Test half way out a corner.
		  aabb.Translate(-1.5, 9.5)
		  Assert.IsFalse(bounds.IsOutside(aabb))
		  
		  // Test moving the bounds.
		  bounds.Translate(2.0, 1.0)
		  
		  // Test half way in and out.
		  aabb.Translate(2.0, 0.0)
		  Assert.IsFalse(bounds.IsOutside(aabb))
		  
		  // Test all the way out.
		  aabb.Translate(1.0, 0.0)
		  Assert.IsTrue(bounds.IsOutside(aabb))
		  
		  // Test half way out a corner.
		  aabb.Translate(-0.5, 1.0)
		  Assert.IsFalse(bounds.IsOutside(aabb))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsOutsideCircleTest()
		  ///
		  ' Tests the IsOutside method on a circle.
		  ///
		  
		  Var bounds As PKAxisAlignedBounds = New PKAxisAlignedBounds(20.0, 20.0)
		  
		  // Create some shapes.
		  Var c As PKCircle = New PKCircle(1.0)
		  Var ct As TestCollisionBody = New TestCollisionBody(c)
		  
		  // Should be in.
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test half way in and out.
		  ct.Transform.Translate(9.5, 0.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test all the way out.
		  ct.Transform.Translate(1.6, 0.0)
		  Assert.IsTrue(bounds.IsOutside(ct))
		  
		  // Test half way out a corner.
		  ct.Transform.Translate(-1.5, 9.5)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test moving the bounds.
		  bounds.Translate(2.0, 1.0)
		  
		  // Test half way in and out.
		  ct.Transform.Translate(2.0, 0.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test all the way out.
		  ct.Transform.Translate(1.6, 0.0)
		  Assert.IsTrue(bounds.IsOutside(ct))
		  
		  // Test half way out a corner.
		  ct.Transform.Translate(-1.5, 1.5)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsOutsideEllipseTest()
		  ///
		  ' Tests the IsOutside method on an ellipse.
		  ///
		  
		  Var bounds As PKAxisAlignedBounds = New PKAxisAlignedBounds(20.0, 20.0)
		  
		  // Create some shapes.
		  Var c As PKEllipse = New PKEllipse(1.0, 0.5)
		  Var ct As TestCollisionBody = New TestCollisionBody(c)
		  
		  // Should be in.
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test half way in and out.
		  ct.Transform.Translate(9.5, 0.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test all the way out.
		  ct.Transform.Translate(1.6, 0.0)
		  Assert.IsTrue(bounds.IsOutside(ct))
		  
		  // Test half way out a corner.
		  ct.Transform.Translate(-1.5, 9.5)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test moving the bounds.
		  bounds.Translate(2.0, 1.0)
		  
		  // Test half way in and out.
		  ct.Transform.Translate(2.0, 0.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test all the way out.
		  ct.Transform.Translate(1.6, 0.0)
		  Assert.IsTrue(bounds.IsOutside(ct))
		  
		  // Test half way out a corner.
		  ct.Transform.Translate(-1.5, 1.5)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsOutsidePolygonTest()
		  ///
		  ' Tests the IsOutside method on a polygon.
		  ///
		  
		  Var bounds As PkAxisAlignedBounds = New PKAxisAlignedBounds(20.0, 20.0)
		  
		  // Create some shapes.
		  Var p As PKPolygon = PKGeometry.CreateUnitCirclePolygon(6, 0.5)
		  Var ct As TestCollisionBody = New TestCollisionBody(p)
		  
		  // Should be in.
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test half way in and out.
		  ct.Transform.Translate(10.0, 0.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test all the way out.
		  ct.Transform.Translate(0.6, 0.0)
		  Assert.IsTrue(bounds.IsOutside(ct))
		  
		  // Test half way out a corner.
		  ct.Transform.Translate(-0.6, 10.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test moving the bounds.
		  bounds.Translate(2.0, 1.0)
		  
		  // Test half way in and out.
		  ct.Transform.Translate(2.0, 0.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test all the way out.
		  ct.Transform.Translate(1.6, 0.0)
		  Assert.IsTrue(bounds.IsOutside(ct))
		  
		  // Test half way out a corner.
		  ct.Transform.Translate(-1.5, 1.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsOutsideRectangleTest()
		  ///
		  ' Tests the IsOutside method on a rectangle.
		  ///
		  
		  Var bounds As PKAxisAlignedBounds = New PKAxisAlignedBounds(20.0, 20.0)
		  
		  // Create some shapes.
		  Var r As PKRectangle = New PKRectangle(1.0, 1.0)
		  Var ct As TestCollisionBody = New TestCollisionBody(r)
		  
		  // Should be in.
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test half way in and out.
		  ct.Transform.Translate(10.0, 0.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test all the way out.
		  ct.Transform.Translate(0.6, 0.0)
		  Assert.IsTrue(bounds.IsOutside(ct))
		  
		  // Test half way out a corner.
		  ct.Transform.Translate(-0.6, 10.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test moving the bounds.
		  bounds.Translate(2.0, 1.0)
		  
		  // Test half way in and out.
		  ct.Transform.Translate(2.0, 0.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test all the way out.
		  ct.Transform.Translate(1.6, 0.0)
		  Assert.IsTrue(bounds.IsOutside(ct))
		  
		  // Test half way out a corner.
		  ct.Transform.Translate(-1.5, 1.5)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsOutsideSegmentTest()
		  ///
		  ' Tests the IsOutside method on a segment.
		  ///
		  
		  Var bounds As PKAxisAlignedBounds = New PKAxisAlignedBounds(20.0, 20.0)
		  
		  // Create some shapes.
		  Var s As PKSegment = New PKSegment(New PKVector2(0.5, -0.5), New PKVector2(-0.5, 0.5))
		  Var ct As TestCollisionBody = New TestCollisionBody(s)
		  
		  // Should be in.
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test half way in and out.
		  ct.Transform.Translate(10.0, 0.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test all the way out.
		  ct.Transform.Translate(0.6, 0.0)
		  Assert.IsTrue(bounds.IsOutside(ct))
		  
		  // Test half way out a corner.
		  ct.Transform.Translate(-0.6, 10.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test moving the bounds.
		  bounds.Translate(2.0, 1.0)
		  
		  // Test half way in and out.
		  ct.Transform.Translate(2.0, 0.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test all the way out.
		  ct.Transform.Translate(1.6, 0.0)
		  Assert.IsTrue(bounds.IsOutside(ct))
		  
		  // Test half way out a corner.
		  ct.Transform.Translate(-1.5, 1.5)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsOutsideTriangleTest()
		  ///
		  ' Tests the IsOutside method on a triangle.
		  ///
		  
		  Var bounds As PKAxisAlignedBounds = New PKAxisAlignedBounds(20.0, 20.0)
		  
		  // Create some shapes.
		  Var t As PKTriangle = New PKTriangle(New PKVector2(0.0, 0.5), New PKVector2(-0.5, -0.5), New PKVector2(0.5, -0.5))
		  Var ct As TestCollisionBody = New TestCollisionBody(t)
		  
		  // Should be in.
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test half way in and out.
		  ct.Transform.Translate(10.0, 0.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test all the way out.
		  ct.Transform.Translate(0.6, 0.0)
		  Assert.IsTrue(bounds.IsOutside(ct))
		  
		  // Test half way out a corner.
		  ct.Transform.Translate(-0.6, 10.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test moving the bounds.
		  bounds.Translate(2.0, 1.0)
		  
		  // Test half way in and out.
		  ct.Transform.Translate(2.0, 0.0)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		  // Test all the way out.
		  ct.Transform.Translate(1.6, 0.0)
		  Assert.IsTrue(bounds.IsOutside(ct))
		  
		  // Test half way out a corner.
		  ct.Transform.Translate(-1.5, 1.5)
		  Assert.IsFalse(bounds.IsOutside(ct))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToStringTest()
		  ///
		  ' Tests the ToString method.
		  ///
		  
		  Var bounds As PKAxisAlignedBounds = New PKAxisAlignedBounds(20.0, 20.0)
		  
		  Var s As String = bounds.ToString
		  
		  Assert.IsFalse(s = "")
		  Assert.IsTrue(s.Length > 0)
		  
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
