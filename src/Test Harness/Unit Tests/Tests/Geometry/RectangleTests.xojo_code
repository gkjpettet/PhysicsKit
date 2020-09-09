#tag Class
Protected Class RectangleTests
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
		Sub ContainsTest()
		  ///
		  ' Tests the Contains method.
		  ///
		  
		  Var r As PKRectangle = New PKRectangle(1.0, 2.0)
		  Var t As PKTransform = New PKTransform
		  
		  Var pt As PKVector2 = New PKVector2(2.0, 0.5)
		  
		  Assert.IsTrue(Not r.Contains(pt, t))
		  
		  // Move the rectangle a bit.
		  t.Translate(2.0, 0.0)
		  t.Rotate(MathsKit.ToRadians(30), r.Center)
		  
		  Assert.IsTrue(r.Contains(pt, t))
		  
		  // Check for on the edge.
		  t.Identity
		  Call pt.Set(0.5, 0.5)
		  
		  Assert.IsTrue(r.Contains(pt, t))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateInvalidHeightTest()
		  ///
		  ' Tests the constructor with an invalid height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var r As PKRectangle = New PKRectangle(2.0, 0.0)
		    #Pragma Unused r
		    
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException due to an invalid height.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateInvalidWidthTest()
		  ///
		  ' Tests the constructor with an invalid width.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var r As PKRectangle = New PKRectangle(-1.0, 3.0)
		    #Pragma Unused r
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException due to an invalid width.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSuccessTest()
		  ///
		  ' Tests successful creation.
		  ///
		  
		  Var r As PKRectangle = New PKRectangle(2.0, 2.0)
		  
		  // Make sure the center is 0,0.
		  Assert.AreEqual(0.000, r.Center.x, 1.0e-3)
		  Assert.AreEqual(0.000, r.Center.y, 1.0e-3)
		  
		  // Make sure the points are correct.
		  Assert.AreEqual(-1.000, r.Vertices(0).x, 1.0e-3)
		  Assert.AreEqual(-1.000, r.Vertices(0).y, 1.0e-3)
		  
		  Assert.AreEqual( 1.000, r.Vertices(1).x, 1.0e-3)
		  Assert.AreEqual(-1.000, r.Vertices(1).y, 1.0e-3)
		  
		  Assert.AreEqual( 1.000, r.Vertices(2).x, 1.0e-3)
		  Assert.AreEqual( 1.000, r.Vertices(2).y, 1.0e-3)
		  
		  Assert.AreEqual(-1.000, r.Vertices(3).x, 1.0e-3)
		  Assert.AreEqual( 1.000, r.Vertices(3).y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAxesTest()
		  ///
		  ' Tests the GetAxes method.
		  ///
		  
		  Var r As PKRectangle = New PKRectangle(1.0, 1.0)
		  Var t As PKTransform = New PKTransform
		  
		  Var axes() As PKVector2 = r.GetAxes(Nil, t)
		  
		  // Make sure there are only two.
		  // Gets its own variable as the Xojo compiler seems unable to deduce which `AreEquals` method 
		  // we're trying to call.
		  Var axesCount As Integer = axes.Count
		  Assert.AreEqual(2, axesCount)
		  
		  // make sure the axes are perpendicular to the edges
		  Var ab As PKVector2 = r.Vertices(0).Towards(r.Vertices(1))
		  Var ad As PKVector2 = r.Vertices(0).Towards(r.Vertices(3))
		  
		  Assert.AreEqual(0.000, ab.Dot(axes(1)), 1.0e-3)
		  Assert.AreEqual(0.000, ad.Dot(axes(0)), 1.0e-3)
		  
		  // Test a focal point.
		  Var pt As PKVector2 = New PKVector2(2.0, -1.0)
		  axes = r.GetAxes(Array(pt), t)
		  
		  // Make sure there are 4 more axes.
		  axesCount = axes.Count
		  Assert.AreEqual(3, axesCount)
		  
		  // Make sure they are parallel to the vector from a vertex to the focal point.
		  Assert.AreEqual(0.000, r.Vertices(1).Towards(pt).Cross(axes(2)), 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetRotationTest()
		  ///
		  ' Tests the GetRotation method.
		  ///
		  
		  Var r As PKRectangle= PKGeometry.CreateRectangle(1, 1)
		  r.Translate(1, 1)
		  r.Rotate(MathsKit.ToRadians(30))
		  
		  Assert.AreEqual(30, MathsKit.ToDegrees(r.GetRotationAngle), 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProjectTest()
		  ///
		  ' Tests the Project method.
		  ///
		  
		  Var r As PKRectangle = New PKRectangle(2.0, 1.0)
		  Var t As PKTransform = New PKTransform
		  Var axis As PKVector2 = New PKVector2(1.0, 0.0)
		  Var i As PKInterval = r.Project(axis, t)
		  
		  Assert.AreEqual(-1.000, i.min, 1.0e-3)
		  Assert.AreEqual( 1.000, i.max, 1.0e-3)
		  
		  // Move the rectangle a bit.
		  t.Translate(1.0, 1.0)
		  t.Rotate(MathsKit.ToRadians(30), t.GetTransformed(r.Center))
		  
		  i = r.Project(axis, t)
		  
		  Assert.AreEqual(-0.116, i.min, 1.0e-3)
		  Assert.AreEqual( 2.116, i.max, 1.0e-3)
		  
		  Call axis.Set(0.0, 1.0)
		  
		  i = r.Project(axis, t)
		  
		  Assert.AreEqual(0.066, i.min, 1.0e-3)
		  Assert.AreEqual(1.933, i.max, 1.0e-3)
		  
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
