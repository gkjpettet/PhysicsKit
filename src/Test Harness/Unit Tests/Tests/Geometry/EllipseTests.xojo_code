#tag Class
Protected Class EllipseTests
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
		Sub ContainsTest()
		  ///
		  ' Tests the Contains method.
		  ///
		  
		  Var e As PKEllipse = New PKEllipse(2.0, 1.0)
		  Var t As PKTransform = New PKTransform
		  Var p As PKVector2 = New PKVector2(0.75, 0.35)
		  
		  // Shouldn't be in the circle
		  Assert.IsTrue(Not e.Contains(p, t))
		  
		  // Move the circle a bit.
		  t.Translate(0.5, 0.0)
		  
		  // Should be in the circle.
		  Assert.IsTrue(e.Contains(p, t))
		  
		  Call p.Set(1.5, 0.0)
		  
		  // Should be on the edge.
		  Assert.IsTrue(e.Contains(p, t))
		  
		  // Test with local translation.
		  e.Rotate(MathsKit.ToRadians(90))
		  e.Translate(0.5, 1.0)
		  
		  Assert.IsFalse(e.Contains(p, t))
		  Call p.Set(1.0, 2.1)
		  Assert.IsFalse(e.Contains(p, t))
		  Call p.Set(1.0, 2.0)
		  Assert.IsTrue(e.Contains(p, t))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateAABBTest()
		  ///
		  ' Tests the generated PKAABB.
		  ///
		  
		  Var e As PKEllipse = New PKEllipse(1.0, 0.5)
		  
		  // Using an identity transform.
		  Var aabb As PKAABB = e.CreateAABB(IDENTITY)
		  Assert.AreEqual(-0.500, aabb.GetMinX, 1.0e-3)
		  Assert.AreEqual(-0.250, aabb.GetMinY, 1.0e-3)
		  Assert.AreEqual( 0.500, aabb.GetMaxX, 1.0e-3)
		  Assert.AreEqual( 0.250, aabb.GetMaxY, 1.0e-3)
		  
		  // Try using the default method.
		  Var aabb2 As PKAABB = e.CreateAABB
		  Assert.AreEqual(aabb.GetMinX, aabb2.GetMinX)
		  Assert.AreEqual(aabb.GetMinY, aabb2.GetMinY)
		  Assert.AreEqual(aabb.GetMaxX, aabb2.GetMaxX)
		  Assert.AreEqual(aabb.GetMaxY, aabb2.GetMaxY)
		  
		  // Test using a rotation and translation matrix.
		  Var tx As PKTransform = New PKTransform
		  tx.Rotate(MathsKit.ToRadians(30.0))
		  tx.Translate(1.0, 2.0)
		  
		  aabb = e.CreateAABB(tx)
		  Assert.AreEqual(0.549, aabb.GetMinX, 1.0e-3)
		  Assert.AreEqual(1.669, aabb.GetMinY, 1.0e-3)
		  Assert.AreEqual(1.450, aabb.GetMaxX, 1.0e-3)
		  Assert.AreEqual(2.330, aabb.GetMaxY, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeHeightTest()
		  ///
		  ' Tests a negative height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var ell As PKEllipse = New PKEllipse(1.0, -1.0)
		    #Pragma Unused ell
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as negative height.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeWidthTest()
		  ///
		  ' Tests a negative width.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var ell As PKEllipse = New PKEllipse(-1.0, 1.0)
		    #Pragma Unused ell
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as negative width.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSuccessTest()
		  ///
		  ' Tests the constructor.
		  ///
		  
		  Var e As PKEllipse = New PKEllipse(1.0, 2.0)
		  Assert.AreEqual(1.0, e.GetHalfHeight)
		  Assert.AreEqual(0.5, e.GetHalfWidth)
		  Assert.AreEqual(1.0, e.GetWidth)
		  Assert.AreEqual(2.0, e.GetHeight)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroHeightTest()
		  ///
		  ' Tests a zero height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var ell As PKEllipse = New PKEllipse(1.0, 0.0)
		    #Pragma Unused ell
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as zero height.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroWidthTest()
		  ///
		  ' Tests a zero width.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var ell As PKEllipse = New PKEllipse(0.0, 1.0)
		    #Pragma Unused ell
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException as zero width.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAxesTest()
		  ///
		  ' Tests the GetAxes method.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var e As PKEllipse = New PKEllipse(1.0, 0.5)
		    Call e.GetAxes(Array(New PKVector2), IDENTITY)
		  Catch err As UnsupportedOperationException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an UnsupportOperationException as GetAxes not supported.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFarthestTest()
		  ///
		  ' Tests the farthest methods.
		  ///
		  
		  Var e As PKEllipse = New PKEllipse(2.0, 1.0)
		  Var t As PKTransform = New PKTransform
		  Var x As PKVector2 = New PKVector2(1.0, 0.0)
		  Var y As PKVector2 = New PKVector2(0.0, -1.0)
		  
		  // Try some translation.
		  t.Translate(1.0, 0.5)
		  
		  Var p As PKVector2 = e.GetFarthestPoint(x, t)
		  Assert.AreEqual(2.000, p.x, 1.0e-3)
		  Assert.AreEqual(0.500, p.y, 1.0e-3)
		  
		  // Try some rotation.
		  t.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  p = e.GetFarthestPoint(y, t)
		  Assert.AreEqual( 0.509, p.x, 1.0e-3)
		  Assert.AreEqual(-0.161, p.y, 1.0e-3)
		  
		  // Try some local rotation.
		  e.Translate(1.0, 0.5)
		  e.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  p = e.GetFarthestPoint(y, IDENTITY)
		  Assert.AreEqual( 0.509, p.x, 1.0e-3)
		  Assert.AreEqual(-0.161, p.y, 1.0e-3)
		  
		  t.Identity
		  t.Translate(0.0, 1.0)
		  p = e.GetFarthestPoint(y, t)
		  Assert.AreEqual( 0.509, p.x, 1.0e-3)
		  Assert.AreEqual( 0.838, p.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFociTest()
		  ///
		  ' Tests the GetFoci method.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var e As PKEllipse = New PKEllipse(1.0, 0.5)
		    Call e.GetFoci(IDENTITY)
		  Catch err As UnsupportedOperationException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an UnsupportedOperationExcetpion as GetFoci is not supported.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProjectTest()
		  ///
		  ' Tests the Project method.
		  ///
		  
		  Var e As PKEllipse = New PKEllipse(2.0, 1.0)
		  Var t As PKTransform = New PKTransform
		  Var x As PKVector2 = New PKVector2(1.0, 0.0)
		  Var y As PKVector2 = New PKVector2(0.0, -1.0)
		  
		  // Try some translation.
		  t.Translate(1.0, 0.5)
		  
		  Var i As PKInterval = e.Project(x, t)
		  Assert.AreEqual(0.000, i.Min, 1.0e-3)
		  Assert.AreEqual(2.000, i.Max, 1.0e-3)
		  
		  // Try some rotation.
		  t.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  i = e.Project(y, t)
		  Assert.AreEqual(-1.161, i.Min, 1.0e-3)
		  Assert.AreEqual( 0.161, i.Max, 1.0e-3)
		  
		  // Try some local rotation.
		  e.Translate(1.0, 0.5)
		  e.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  i = e.Project(y, IDENTITY)
		  Assert.AreEqual(-1.161, i.Min, 1.0e-3)
		  Assert.AreEqual( 0.161, i.Max, 1.0e-3)
		  
		  t.Identity
		  t.Translate(0.0, 1.0)
		  i = e.Project(y, t)
		  Assert.AreEqual(-2.161, i.Min, 1.0e-3)
		  Assert.AreEqual(-0.839, i.Max, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateTest()
		  ///
		  ' Tests the Rotate methods.
		  ///
		  
		  Var e As PKEllipse = New PKEllipse(1.0, 0.5)
		  
		  // Rotate about centre.
		  e.Translate(1.0, 1.0)
		  e.RotateAboutCenter(MathsKit.ToRadians(30))
		  Assert.AreEqual(1.000, e.center.x, 1.0e-3)
		  Assert.AreEqual(1.000, e.center.y, 1.0e-3)
		  
		  // Rotate about the origin.
		  e.Rotate(MathsKit.toRadians(90))
		  Assert.AreEqual(-1.000, e.center.x, 1.0e-3)
		  Assert.AreEqual( 1.000, e.center.y, 1.0e-3)
		  e.Translate(e.GetCenter.GetNegative)
		  
		  // Should move the centre.
		  e.Rotate(MathsKit.ToRadians(90), 1.0, -1.0)
		  Assert.AreEqual( 0.000, e.center.x, 1.0e-3)
		  Assert.AreEqual(-2.000, e.center.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateTest()
		  ///
		  ' Tests the Translate methods.
		  ///
		  
		  Var e As PKEllipse = New PKEllipse(1.0, 0.5)
		  
		  e.Translate(1.0, -0.5)
		  
		  Assert.AreEqual( 1.000, e.center.x, 1.0e-3)
		  Assert.AreEqual(-0.500, e.center.y, 1.0e-3)
		  
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
