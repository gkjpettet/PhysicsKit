#tag Class
Protected Class GiftWrapTests
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


	#tag Method, Flags = &h21
		Private Function Generate(seed As Integer) As PhysicsKit.Vector2()
		  ///
		  ' Returns a random point cloud.
		  '
		  ' - Parameter seed: The random seed.
		  '
		  ' - Returns: Vector2 array.
		  ///
		  
		  System.Random.Seed = seed
		  
		  // Randomise the size from 4 to 100.
		  Var size As Integer = Floor(System.Random.Number * 96.0 + 4.0)
		  
		  // Create the cloud container.
		  Var cloud() As Vector2
		  cloud.ResizeTo(size - 1)
		  
		  // Fill the cloud with a random distribution of points.
		  Var iLimit As Integer = size - 1
		  For i As Integer = 0 To iLimit
		    cloud(i) = New Vector2(System.Random.Number * 2.0 - 1.0, System.Random.Number * 2.0 - 1.0)
		  Next i
		  
		  Return cloud
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GiftWrap2Test()
		  ///
		  ' Tests the GiftWrap class against a failure case.
		  ///
		  
		  Var cloud() As Vector2 = Array( _
		  New Vector2(23.854242711277, 1.0), _
		  New Vector2(57.707453390935676, 1.0), _
		  New Vector2(13.0, 1.0), _
		  New Vector2(27.918475169266998, 1.0))
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Self.TestCloud(cloud)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GiftWrap3Test()
		  ///
		  ' Tests the GiftWrap class against a prior failure case.
		  ///
		  
		  Var cloud() As Vector2 = Array( _
		  New Vector2(1.5, 1.0), _
		  New Vector2(2.0, 1.0), _
		  New Vector2(2.5, 1.0), _
		  New Vector2(3.5, 1.0), _
		  New Vector2(1.0, 1.0), _
		  New Vector2(5.0, 0.0))
		  
		  Self.TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GiftWrap4Test()
		  ///
		  ' Tests the GiftWrap class against a prior failure case.
		  ///
		  
		  Var cloud() As Vector2 = Array( _
		  New Vector2(1.0, 1.0), _
		  New Vector2(1.0, 1.0), _
		  New Vector2(9135172.538699752, 1594.2921033236523), _
		  New Vector2(1.0, 3436.444789677664), _
		  New Vector2(53371.47726301303, 63.201463180191396), _
		  New Vector2(1.0, 1.0), _
		  New Vector2(0.09713620217398017, 286668.0866273699), _
		  New Vector2(104.83526669412421, 579.583503857007))
		  
		  Self.TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GiftWrapRandom1Test()
		  ///
		  ' Tests the GiftWrap class against the random point cloud.
		  ///
		  
		  Var cloud() As Vector2 = Self.Generate(0)
		  Self.TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GiftWrapRandom2Test()
		  ///
		  ' Tests the GiftWrap class against the random point cloud.
		  ///
		  
		  Var cloud() As Vector2 = Self.Generate(5)
		  Self.TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestCloud(cloud() As PhysicsKit.Vector2)
		  ///
		  ' Test a point cloud with the GiftWrap hull algorithm.
		  ' The result must be a valid Polygon and contain all the original points.
		  '
		  ' - Parameter cloud: The point cloud.
		  ///
		  
		  Var gw As GiftWrap = New GiftWrap
		  Var hull() As Vector2 = gw.Generate(cloud)
		  
		  // Make sure we can create a polygon from it (this will check for convexity, winding, etc).
		  Var poly As Polygon = New Polygon(hull)
		  
		  // Make sure all the points are either on or contained in the hull.
		  For Each p As Vector2 In cloud
		    If Not RobustGeometryTests.RobustPolygonContains(poly.GetVertices, p) Then
		      Assert.Fail("Hull does not contain all points.")
		    End If
		  Next p
		  
		  Assert.Pass
		  
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
