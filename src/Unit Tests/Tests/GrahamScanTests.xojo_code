#tag Class
Protected Class GrahamScanTests
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
		Private Function Generate(seed As Integer) As PKVector2()
		  ///
		  ' Returns a random point cloud
		  '
		  ' - Paramater seed: The random seed.
		  '
		  ' - Returns: PKVector2 array.
		  ///
		  
		  System.Random.Seed = seed
		  
		  // Randomise the size from 4 to 100.
		  Var size As Integer = Floor(System.Random.Number * 96.0 + 4.0)
		  
		  // Create the cloud container.
		  Var cloud() As PKVector2
		  
		  // Fill the cloud with a random distribution of points.
		  For i As Integer = 0 To size - 1
		    cloud.AddRow(New PKVector2(System.Random.Number * 2.0 - 1.0, System.Random.Number * 2.0 - 1.0))
		  Next i
		  
		  Return cloud
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS10Test()
		  Var cloud() as PKVector2 = Array( _
		  New PKVector2(-7.725662343635252, 3.239314248048395), _
		  New PKVector2(-7.725662343635252, 9.244107520658332), _
		  New PKVector2(-7.725662343635252, 5.6066430781506575), _
		  New PKVector2(-5.985432177897989, 1.0634285355681339), _
		  New PKVector2(2.7404621676247265, -4.946792659796997))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS11Test()
		  // Coincident vertices.
		  
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(-5.214810023866061, -5.581528163221621), _
		  New PKVector2(-3.2956195481849493, 6.700146933201903), _
		  New PKVector2(2.159226322162535, -2.2353877725618476), _
		  New PKVector2(4.84788802330902, -6.921113359457114), _
		  New PKVector2(4.84788802330902, -6.921113359457114))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS12Test()
		  // Coincident vertices.
		  
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(-0.33826889474805055, 8.329321811558497), _
		  New PKVector2(-3.5586156659982215, -3.467244912905423), _
		  New PKVector2(-3.5586156659982215, -4.566140779700733), _
		  New PKVector2(-3.5586156659982215, -3.05702346750299), _
		  New PKVector2(1.1178446483487536, -3.05702346750299))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS13Test()
		  // Coincident vertices.
		  
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(-0.9025337983824699, 4.56709308364953), _
		  New PKVector2(-5.5168621708920345, 0.34366552069341916), _
		  New PKVector2(-2.400927400987851, 3.19563523962121), _
		  New PKVector2(-9.419896312210547, 3.19563523962121))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS14Test()
		  // Coincident vertices.
		  
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(5.916275853509346, -4.228267720344762), _
		  New PKVector2(8.31483976082672, -0.3807196367883092), _
		  New PKVector2(3.9941738969349405, -0.491971233546733), _
		  New PKVector2(-5.952110964171484, -0.7480752942332325))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS22Test()
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(-0.9726201659613243, -0.061797000490076304), _
		  New PKVector2(-0.49116488082909115, 0.7678687827639961), _
		  New PKVector2(-0.48739204883444187, -0.9956524492331893), _
		  New PKVector2(-0.4537370168301149, -0.6616125022480972), _
		  New PKVector2(-0.34908102882750347, -0.7747234303505055), _
		  New PKVector2(-0.33139487141988466, 0.03531605400219706), _
		  New PKVector2(-0.280521830078756, -0.8019885163611113), _
		  New PKVector2(-0.18129485409799484, -0.20967044425834414), _
		  New PKVector2(0.06567685427976788, 0.08518030687971767), _
		  New PKVector2(0.18792402577067557, -0.47162922175654987), _
		  New PKVector2(0.4819840632260479, 0.36769528256486916), _
		  New PKVector2(0.5215540748770324, 0.47445238228262654), _
		  New PKVector2(0.527334528883231, 0.4308651755136941), _
		  New PKVector2(0.6152877195482263, 0.7025685140058535), _
		  New PKVector2(0.7757776753703407, 0.3215448776809937), _
		  New PKVector2(0.7785392212464266, 0.7209603726626324), _
		  New PKVector2(0.8940177489295154, -0.1882690653739989))
		  
		  Self.TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS2Test()
		  #Pragma BreakOnExceptions False
		  
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(23.854242711277, 1.0), _
		  New PKVector2(57.707453390935676, 1.0), _ 
		  New PKVector2(13.0, 1.0), _
		  New PKVector2(27.918475169266998, 1.0))
		  
		  Try
		    TestCloud(cloud)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS3Test()
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(1.5, 1.0), _
		  New PKVector2(2.0, 1.0), _
		  New PKVector2(2.5, 1.0), _
		  New PKVector2(3.5, 1.0), _
		  New PKVector2(1.0, 1.0), _
		  New PKVector2(5.0, 0.0))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS4Test()
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(1.0, 1.0), _
		  New PKVector2(1.0, 1.0), _
		  New PKVector2(9135172.538699752, 1594.2921033236523),  _
		  New PKVector2(1.0, 3436.444789677664), _
		  New PKVector2(53371.47726301303, 63.201463180191396), _
		  New PKVector2(1.0, 1.0), _
		  New PKVector2(0.09713620217398017, 286668.0866273699), _
		  New PKVector2(104.83526669412421, 579.583503857007))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS5Part2Test()
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(334.68865889609134, 3.955720227287777E-23), _
		  New PKVector2(5.758935896542613E22, 8.12199057379559E21), _
		  New PKVector2(69464.96179292782, 0.05006981639456297), _
		  New PKVector2(0.03735960666625501, 0.3783853688716485))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS5Part3Test()
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(334.68865889609134, 3.955720227287777E-23), _
		  New PKVector2(5.758935896542613E22, 8.12199057379559E21), _
		  New PKVector2(400.758935896542613E21, 8.12199057379559E20), _
		  New PKVector2(69464.96179292782, 0.05006981639456297), _
		  New PKVector2(0.03735960666625501, 0.3783853688716485))
		  
		  TestCloud(cloud)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS5Test()
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(69464.96179292782, 0.05006981639456297), _
		  New PKVector2(0.03735960666625501, 0.3783853688716485), _
		  New PKVector2(334.68865889609134, 3.955720227287777E-23), _
		  New PKVector2(5.758935896542613E22, 8.12199057379559E21))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS6Test()
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(9.67305424383519, 114.09907896473986), _
		  New PKVector2(1.0, 1161.9752606517477), _
		  New PKVector2(1.0, 1.0), _
		  New PKVector2(1.0, 10.546088997659012), _
		  New PKVector2(22.088494561091807, 230.94365885699824), _
		  New PKVector2(2.8366426821689994, 1.0), _
		  New PKVector2(8.944224404040732, 6.315177488492587), _
		  New PKVector2(1.0, 59.98064323348245), _
		  New PKVector2(9.24861145190379, 8404.268678968832), _
		  New PKVector2(1.0, 0.03504029713737921), _
		  New PKVector2(1.0, 82.55330004652801))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS7Test()
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(1.0, 1.5767304065549268E12), _
		  New PKVector2(1.870841152451107, 6.534140012505794E23), _
		  New PKVector2(1.9603053816739006E12, 9.074076290143341E10), _
		  New PKVector2(3260266.640396411, 7.796498271329308E7), _
		  New PKVector2(28.709287118505284, 82447.5698720256), _
		  New PKVector2(1.8463774403168068E15, 0.013098511687408589), _
		  New PKVector2(3740193.601814064, 4682.6340006396895), _
		  New PKVector2(3170758.3618271016, 2.131083797649407E7), _
		  New PKVector2(143.83527343008367, 3.2294659543003845E15), _
		  New PKVector2(1.0, 5.956908518731977E17), _
		  New PKVector2(2.0531014115467064E-7, 2306510.1010659263), _
		  New PKVector2(1.2474786776966758E20, 1.4802417824918536E11), _
		  New PKVector2(1.0, 15.084034859698757))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS8Test()
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(24.00000000000005, 24.000000000000053), _
		  New PKVector2(54.85, 6),_
		  New PKVector2(24.000000000000068, 24.000000000000071), _
		  New PKVector2(54.850000000000357, 61.000000000000121), _
		  New PKVector2(24, 6), _
		  New PKVector2(6, 6))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GS9Test()
		  Var cloud() As PKVector2 = Array( _
		  New PKVector2(23, 1.0), _
		  New PKVector2(57, 1.0), _
		  New PKVector2(13, 1.0), _
		  New PKVector2(27, 10.0))
		  
		  TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GSRandom1Test()
		  ///
		  ' Tests the Graham Scan class against the random point cloud.
		  ///
		  
		  Var cloud() As PKVector2 = Self.Generate(0)
		  Self.TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GSRandom2Test()
		  ///
		  ' Tests the Graham Scan class against the random point cloud.
		  ///
		  
		  Var cloud() As PKVector2 = Self.Generate(5)
		  Self.TestCloud(cloud)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestCloud(cloud() As PKVector2)
		  ///
		  ' Test a point cloud with the GrahamScan hull algorithm.
		  '
		  ' The result must be a valid Polygon and contain all the original points.
		  ' 
		  ' - Parameter cloud: The point cloud.
		  ///
		  
		  Var gs As GrahamScan = New GrahamScan
		  Var hull() As PKVector2 = gs.Generate(cloud)
		  
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
