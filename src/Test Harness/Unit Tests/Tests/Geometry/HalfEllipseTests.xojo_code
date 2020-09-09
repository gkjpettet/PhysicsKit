#tag Class
Protected Class HalfEllipseTests
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
		  
		  Var e As PKHalfEllipse = New PKHalfEllipse(2.0, 0.5)
		  Var t As PKTransform = New PKTransform
		  Var p As PKVector2 = New PKVector2(0.75, 0.35)
		  
		  // Shouldn't be in.
		  Assert.IsTrue(Not e.Contains(p, t))
		  
		  Call p.Set(0.75, -0.2)
		  Assert.IsTrue(Not e.Contains(p, t))
		  
		  // Move a bit.
		  Call p.Set(0.75, 0.35)
		  t.Translate(0.5, 0.0)
		  
		  // Should be in.
		  Assert.IsTrue(e.Contains(p, t))
		  
		  Call p.Set(1.5, 0.0)
		  
		  // Should be on the edge.
		  Assert.IsTrue(e.Contains(p, t))
		  
		  // Another test for failure case.
		  Call p.Set(0.75, 0.35)
		  e.Translate(e.GetCenter.GetNegative)
		  Assert.IsFalse(e.Contains(p, t))
		  
		  // Try local rotation and translation.
		  e.Rotate(MathsKit.ToDegrees(90))
		  e.Translate(0.5, 1.0)
		  
		  Call p.Set(0.3, 0.3)
		  Assert.IsFalse(e.Contains(p, t))
		  
		  Call p.Set(0.7, 0.4)
		  Assert.IsTrue(e.Contains(p, t))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateAABBTest()
		  ///
		  ' Tests the generated PKAABB.
		  ///
		  
		  Var e As PKHalfEllipse = New PKHalfEllipse(1.0, 0.25)
		  
		  // Using an identity transform.
		  Var aabb As PKAABB = e.CreateAABB(IDENTITY)
		  Assert.AreEqual(-0.500, aabb.getMinX, 1.0e-3)
		  Assert.AreEqual( 0.000, aabb.getMinY, 1.0e-3)
		  Assert.AreEqual( 0.500, aabb.getMaxX, 1.0e-3)
		  Assert.AreEqual( 0.250, aabb.getMaxY, 1.0e-3)
		  
		  // Try using the default method.
		  Var aabb2 As PKAABB = e.CreateAABB
		  Assert.AreEqual(aabb.getMinX, aabb2.getMinX)
		  Assert.AreEqual(aabb.getMinY, aabb2.getMinY)
		  Assert.AreEqual(aabb.getMaxX, aabb2.getMaxX)
		  Assert.AreEqual(aabb.getMaxY, aabb2.getMaxY)
		  
		  // Test using a rotation and translation matrix.
		  Var tx As PKTransform = New PKTransform
		  tx.Rotate(MathsKit.ToRadians(30.0))
		  tx.Translate(1.0, 2.0)
		  
		  aabb = e.CreateAABB(tx)
		  Assert.AreEqual(0.549, aabb.getMinX, 1.0e-3)
		  Assert.AreEqual(1.750, aabb.getMinY, 1.0e-3)
		  Assert.AreEqual(1.433, aabb.getMaxX, 1.0e-3)
		  Assert.AreEqual(2.330, aabb.getMaxY, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNegativeHeightTest()
		  ///
		  ' Tests a negative height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var he As PKHalfEllipse = New PKHalfEllipse(1.0, -1.0)
		    #Pragma Unused he
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
		    Var he As PKHalfEllipse = New PKHalfEllipse(-1.0, 1.0)
		    #Pragma Unused he
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
		  
		  Try
		    Var he As PKHalfEllipse  = New PKHalfEllipse(1.0, 2.0)
		    #Pragma Unused he
		  Catch e As RuntimeException
		    Assert.Fail("Unexpected constructor failure.")
		    Return
		  End Try
		  
		  Assert.Pass
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateZeroHeightTest()
		  ///
		  ' Tests a zero height.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var he As PKHalfEllipse = New PKHalfEllipse(1.0, 0.0)
		    #Pragma Unused he
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
		    Var he As PKHalfEllipse = New PKHalfEllipse(0.0, 1.0)
		    #Pragma Unused he
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
		    Var e As PKHalfEllipse = New PKHalfEllipse(1.0, 0.5)
		    Call e.GetAxes(Array(New PKVector2), IDENTITY)
		  Catch e As UnsupportedOperationException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected UnsupportedOperationException.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFarthestTest()
		  ///
		  ' Tests the farthest methods.
		  ///
		  
		  Var e As PKHalfEllipse = New PKHalfEllipse(2.0, 0.5)
		  Var t As PKTransform = New PKTransform
		  Var x As PKVector2 = New PKVector2(1.0, 0.0)
		  Var y As PKVector2 = New PKVector2(0.0, -1.0)
		  
		  // Try some translation.
		  t.Translate(1.0, 0.5)
		  
		  Var p As PKVector2 = e.GetFarthestPoint(x, t)
		  Assert.AreEqual( 2.000, p.x, 1.0e-3)
		  Assert.AreEqual( 0.5, p.y, 1.0e-3)
		  
		  // Try some rotation.
		  t.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  p = e.GetFarthestPoint(y, t)
		  Assert.AreEqual( 0.133, p.x, 1.0e-3)
		  Assert.AreEqual( 0.000, p.y, 1.0e-3)
		  
		  // Try some local rotation.
		  e.Translate(1.0, 0.5)
		  e.Rotate(MathsKit.ToRadians(30), 1.0, 0.5)
		  
		  p = e.GetFarthestPoint(y, IDENTITY)
		  Assert.AreEqual( 0.133, p.x, 1.0e-3)
		  Assert.AreEqual( 0.000, p.y, 1.0e-3)
		  
		  t.Identity
		  t.Translate(0.0, 1.0)
		  p = e.GetFarthestPoint(y, t)
		  Assert.AreEqual( 0.133, p.x, 1.0e-3)
		  Assert.AreEqual( 1.000, p.y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFociTest()
		  ///
		  ' Tests the GetFoci method.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var e As PKHalfEllipse = New PKHalfEllipse(1.0, 0.5)
		    Call e.GetFoci(IDENTITY)
		  Catch e As UnsupportedOperationException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an UnsupportOperationException.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetRadiusTest()
		  ///
		  ' Tests the GetRadius method for a point above the x-axis but below the evolute
		  ' to ensure that we obtain the correct max distance.
		  ///
		  
		  Var he As PKHalfEllipse = New PKHalfEllipse(4.0, 4.0)
		  Var d As Double = he.GetRadius(New PKVector2(1, 0.25))
		  
		  Assert.AreEqual(3.927647520827677, d, 1e-3)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProjectTest()
		  ///
		  ' Tests the Project method.
		  ///
		  
		  Var e As PKHalfEllipse = New PKHalfEllipse(2.0, 0.5)
		  Var t As PKTransform = New PKTransform
		  Var x As PKVector2 = New PKVector2(1.0, 0.0)
		  Var y As PKVector2 = New PKVector2(0.0, 1.0)
		  
		  // Try some translation.
		  t.Translate(1.0, 0.5)
		  
		  Var i As PKInterval = e.Project(x, t)
		  Assert.AreEqual( 0.000, i.Min, 1.0e-3)
		  Assert.AreEqual( 2.000, i.Max, 1.0e-3)
		  
		  i = e.Project(y, t)
		  Assert.AreEqual( 0.500, i.Min, 1.0e-3)
		  Assert.AreEqual( 1.000, i.Max, 1.0e-3)        
		  
		  // Try some rotation.
		  t.Rotate(MathsKit.ToRadians(30), t.GetTransformed(e.GetCenter))
		  
		  i = e.Project(y, t)
		  Assert.AreEqual( 0.028, i.Min, 1.0e-3)
		  Assert.AreEqual( 1.189, i.Max, 1.0e-3)
		  
		  // Try some local rotation.
		  e.Translate(1.0, 0.5)
		  e.RotateAboutCenter(MathsKit.ToRadians(30))
		  
		  i = e.Project(y, IDENTITY)
		  Assert.AreEqual( 0.028, i.Min, 1.0e-3)
		  Assert.AreEqual( 1.189, i.Max, 1.0e-3)
		  
		  t.Identity
		  t.Translate(0.0, 1.0)
		  i = e.Project(y, t)
		  Assert.AreEqual( 1.028, i.Min, 1.0e-3)
		  Assert.AreEqual( 2.189, i.Max, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateTest()
		  ///
		  ' Tests the Rotate methods.
		  ///
		  
		  Var e As PKHalfEllipse = New PKHalfEllipse(1.0, 0.25)
		  
		  // Rotate about center.
		  e.Translate(1.0, 1.0)
		  e.RotateAboutCenter(MathsKit.ToRadians(30))
		  Assert.AreEqual(1.000, e.center.x, 1.0e-3)
		  Assert.AreEqual(1.106, e.center.y, 1.0e-3)
		  
		  // Rotate about the origin.
		  e.Rotate(MathsKit.ToRadians(90))
		  Assert.AreEqual(-1.106, e.center.x, 1.0e-3)
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
		  ' Tests the Translate method.
		  ///
		  
		  Var e As PKHalfEllipse = New PKHalfEllipse(1.0, 0.25)
		  
		  e.Translate(1.0, -0.5)
		  
		  Assert.AreEqual( 1.000, e.GetEllipseCenter.X, 1.0e-3)
		  Assert.AreEqual(-0.500, e.GetEllipseCenter.Y, 1.0e-3)
		  
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
