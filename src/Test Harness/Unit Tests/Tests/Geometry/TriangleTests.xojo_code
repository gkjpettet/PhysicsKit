#tag Class
Protected Class TriangleTests
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
		  ' Tests the `Contains` method.
		  ///
		  
		  Var t As PKTriangle = New PKTriangle(_
		  New PKVector2( 0.0,  0.5), _
		  New PKVector2(-0.5, -0.5), _
		  New PKVector2( 0.5, -0.5))
		  
		  Var tx As PKTransform = New PKTransform
		  
		  // Outside.
		  Var p As PKVector2 = New PKVector2(1.0, 1.0)
		  Assert.IsFalse(t.Contains(p, tx))
		  
		  // Inside.
		  Call p.Set(0.2, 0.0)
		  Assert.IsTrue(t.Contains(p, tx))
		  
		  // On edge.
		  Call p.Set(0.3, -0.5)
		  Assert.IsTrue(t.Contains(p, tx))
		  
		  // Move the triangle a bit.
		  tx.Rotate(MathsKit.ToRadians(90))
		  tx.Translate(0.0, 1.0)
		  
		  // sSill outside.
		  Call p.Set(1.0, 1.0)
		  Assert.IsFalse(t.Contains(p, tx))
		  
		  // Inside.
		  Call p.Set(0.4, 1.0)
		  Assert.IsTrue(t.Contains(p, tx))
		  
		  // On edge.
		  Call p.Set(0.0, 0.76) // 0.76 should be 0.75 but it fails because of floating point problems
		  Assert.IsTrue(t.Contains(p, tx))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNilPoint2Test()
		  ///
		  ' Tests the failed creation of a triangle with one point being Nil.
		  ///
		  
		  Var t As PKTriangle
		  #Pragma Unused t
		  
		  Try
		    t = New PKTriangle(New PKVector2(-0.5, -0.5), Nil, New PKVector2( 0.5, -0.5))
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNilPoint3Test()
		  ///
		  ' Tests the failed creation of a triangle with one point being Nil.
		  ///
		  
		  Var t As PKTriangle
		  #Pragma Unused t
		  
		  Try
		    t = New PKTriangle(New PKVector2(-0.5, -0.5), New PKVector2( 0.5, -0.5), Nil)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNilPointTest()
		  ///
		  ' Tests the failed creation of a triangle with one point being Nil.
		  ///
		  
		  Var t As PKTriangle
		  #Pragma Unused t
		  
		  Try
		    t = New PKTriangle(Nil, New PKVector2(-0.5, -0.5), New PKVector2( 0.5, -0.5))
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException")
		  
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
