#tag Class
Protected Class BayazitTests
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
		Sub CoincidentVertexTest()
		  ///
		  ' Tests passing an array of vertices that contains two vertices that are coincident.
		  ///
		  
		  Try
		    Var vertices(4) As PKVector2
		    vertices(0) = New PKVector2(1.0, 2.0)
		    vertices(1) = New PKVector2(-1.0, 2.0)
		    vertices(2) = New PKVector2(-1.0, 2.0)
		    vertices(3) = New PKVector2(-1.0, 0.5)
		    vertices(4) = New PKVector2(0.5, -1.0)
		    Call Self.Algo.Decompose(vertices)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LessThan4VerticesTest()
		  ///
		  ' Tests passing an array of vertices with less than 4 elements.
		  ///
		  
		  Try
		    Var vertices(2) As PKVector2 = Array(New PKVector2, New PKVector2, New PKVector2)
		    Call Self.Algo.Decompose(vertices)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NilArrayTest()
		  ///
		  ' Tests passing a Nil array.
		  ///
		  
		  Try
		    Call Self.Algo.Decompose(Nil)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NilVertexTest()
		  ///
		  ' Tests passing an array of vertices that contains a Nil vertex.
		  ///
		  
		  Try
		    Var vertices(4) As PKVector2
		    vertices(0) = New PKVector2(1.0, 2.0)
		    vertices(1) = New PKVector2(-1.0, 2.0)
		    vertices(2) = Nil
		    vertices(3) = New PKVector2(-1.0, 0.5)
		    vertices(4) = New PKVector2(0.5, -1.0)
		    Call Self.Algo.Decompose(vertices)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Success1Test()
		  ///
		  ' Tests the implementation against a 10 vertex non-convex polygon.
		  ///
		  
		  Var vertices(9) As PKVector2
		  vertices(0) = New PKVector2(2.0, 0.5)
		  vertices(1) = New PKVector2(1.0, 1.0)
		  vertices(2) = New PKVector2(-0.25, 0.25)
		  vertices(3) = New PKVector2(-0.75, 1.5)
		  vertices(4) = New PKVector2(-1.0, 2.0)
		  vertices(5) = New PKVector2(-1.0, 0.0)
		  vertices(6) = New PKVector2(-0.5, -0.75)
		  vertices(7) = New PKVector2(0.25, -0.4)
		  vertices(8) = New PKVector2(1.0, 0.3)
		  vertices(9) = New PKVector2(0.25, -0.5)
		  
		  // Decompose the poly
		  Var result() As PKConvex = Self.Algo.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h21, Description = 54686520626179617A697420616C676F726974686D2E
		#tag Getter
			Get
			  Static algorithm As New PKBayazit
			  
			  Return algorithm
			  
			End Get
		#tag EndGetter
		Private Algo As PKBayazit
	#tag EndComputedProperty


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
