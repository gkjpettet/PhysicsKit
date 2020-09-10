#tag Class
Protected Class DivideAndConquerTests
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
		Sub DACRandom1Test()
		  ///
		  ' Tests the Divide and Conquer class against the random point cloud.
		  ///
		  
		  Var cloud() AS PKVector2 = Generate(0)
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E7320612072616E646F6D20706F696E7420636C6F75642E
		Private Function Generate(seed As Integer) As PKVector2()
		  ///
		  ' Returns a random point cloud.
		  '
		  ' - Parameter seed: The random seed
		  ///
		  
		  System.Random.Seed = seed
		  
		  // Randomise the size from 4 to 100.
		  Var size As Integer = Floor(System.Random.Number * 96.0 + 4.0)
		  
		  // Create the cloud container.
		  Var cloud() As PKVector2
		  Redim cloud(size - 1)
		  
		  // Fill the cloud with a random distribution of points.
		  For i As Integer = 0 To cloud.LastRowIndex
		    cloud(i) = New PKVector2(System.Random.Number * 2.0 - 1.0, System.Random.Number * 2.0 - 1.0)
		  Next i
		  
		  Return cloud
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestCloud(cloud() As PKVector2)
		  ///
		  ' Test a point cloud with the DivideAndConquer hull algorithm.
		  ' The result must be a valid Polygon and contain all the original points.
		  '
		  ' - Parameter cloud(): The point cloud.
		  ///
		  
		  Var dac As PKDivideAndConquer = New PKDivideAndConquer
		  Var hull() As PKVector2 = dac.Generate(cloud)
		  
		  // Make sure we can create a polygon from it (this will check for convexity, winding, etc).
		  Var poly As PKPolygon = New PKPolygon(hull)
		  
		  // Make sure all the points are either on or contained in the hull.
		  For Each p As PKVector2 In cloud
		    If Not RobustGeometryTests.RobustPolygonContains(poly.GetVertices, p) Then
		      Assert.Fail("Hull does not contain all points.")
		    End If
		  Next p
		  
		  Assert.Pass
		  
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
