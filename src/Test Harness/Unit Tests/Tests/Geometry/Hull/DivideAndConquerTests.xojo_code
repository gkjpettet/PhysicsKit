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
		  // Var cloud() AS PKVector2 = GenerateSeed0
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

	#tag Method, Flags = &h21, Description = 52657475726E732061202272616E646F6D2220706F696E7420636C6F7564206261736564206F6E2073656564696E67204A61766127732052616E646F6D20636C6173732077697468206030602E
		Private Function GenerateSeed0() As PKVector2()
		  ///
		  ' Returns a "random" point cloud based on seeding Java's Random class with `0`.
		  ' Equivalent to dyn4j's `Generate(0)` method.
		  ///
		  
		  Return Array( _
		  New PKVector2(-0.5189271686570283, 0.2748348507002165), _
		  New PKVector2(0.10087401023526787, 0.19509055559440358), _
		  New PKVector2(-0.33356320104670045, -0.229621630518563), _
		  New PKVector2(0.9696830803996179, 0.7583650357449603), _
		  New PKVector2(0.8824983589642288, -0.45009206792903034), _
		  New PKVector2(-0.7422056982524465, -0.7067966847069636), _
		  New PKVector2(-0.9535237550322211, 0.09347951439693114), _
		  New PKVector2(0.9289737213537002, -0.7910186274980566), _
		  New PKVector2(0.2502927269311186, -0.17840760901787656), _
		  New PKVector2(0.552624582549865, 0.981445571429566), _
		  New PKVector2(-0.025534305939714397, 0.49248281064466104), _
		  New PKVector2(0.4663041403899877, 0.6345941428186488), _
		  New PKVector2(0.6777807000940366, 0.05339886920973225), _
		  New PKVector2(0.7986700232229871, -0.7321203188262155), _
		  New PKVector2(-0.8338752035501702, 0.9571486802956806), _
		  New PKVector2(0.4447142383776974, 0.4300620277009488), _
		  New PKVector2(-0.7135592293988064, -0.07408436315515421), _
		  New PKVector2(-0.9910287956342296, -0.8570033702402118), _
		  New PKVector2(-0.3031595404166709, -0.3224606929284928), _
		  New PKVector2(0.7187131027092959, 0.9430939777034255), _
		  New PKVector2(0.7314917604280766, 0.2251622094197363), _
		  New PKVector2(-0.6420240309423655, -0.564859175580628), _
		  New PKVector2(0.7089743340845813, -0.9806530053980513), _
		  New PKVector2(0.38458601390586655, 0.5426259323413591), _
		  New PKVector2(0.4253748562913786, -0.5775292501402076), _
		  New PKVector2(0.5661849795343588, 0.8906664779192579), _
		  New PKVector2(-0.9715272897926641, -0.2115928944453378), _
		  New PKVector2(0.7075815506161456, 0.5720849016291052), _
		  New PKVector2(0.986943910011628, 0.766208811962958), _
		  New PKVector2(-0.6594169395045921, 0.9241378364150772), _
		  New PKVector2(0.44859006715773764, 0.35470832249974893), _
		  New PKVector2(0.6087908344492714, -0.1171464526484165), _
		  New PKVector2(-0.07582401942801109, 0.7056549331989215), _
		  New PKVector2(0.003669700411470078, 0.9838859608204338), _
		  New PKVector2(0.9385398198808321, -0.2937878556417637), _
		  New PKVector2(-0.9054682616077412, -0.8567527531643988), _
		  New PKVector2(-0.9417849745567284, -0.0326596197897997), _
		  New PKVector2(0.9439002419074904, 0.978234301502811), _
		  New PKVector2(0.5348842060309797, 0.002794702024459861), _
		  New PKVector2(-0.48894937820711304, -0.38168362550362467), _
		  New PKVector2(0.696561000544685, -0.8958309236520334), _
		  New PKVector2(-0.9796490909275415, -0.2922940605825761), _
		  New PKVector2(-0.826524289668545, 0.7006230305286114), _
		  New PKVector2(-0.9926461952885992, -0.38421366473105456), _
		  New PKVector2(0.06321711249759532, 0.8376284036771464), _
		  New PKVector2(-0.44557994786257726, 0.7485244205663888), _
		  New PKVector2(0.21976302702552708, 0.8172784193934717), _
		  New PKVector2(-0.9110187596864099, 0.2934478020777791), _
		  New PKVector2(-0.006392472754687795, 0.01340319190570538), _
		  New PKVector2(0.04137763978589892, -0.26727851097200794), _
		  New PKVector2(-0.04472617648615729, 0.4079394106852692), _
		  New PKVector2(-0.35446440351355735, -0.9766903234469044), _
		  New PKVector2(0.4020778763648092, 0.4907057207831018), _
		  New PKVector2(0.21457649712523552, -0.5298365482716678), _
		  New PKVector2(-0.2219136328927429, 0.8229367236859715), _
		  New PKVector2(-0.6652218228311861, -0.9921729387655582), _
		  New PKVector2(-0.4702083450950567, 0.7856339143123703), _
		  New PKVector2(-0.40486347017843705, -0.14219104134052496), _
		  New PKVector2(0.37510327636772756, -0.18300713059794815), _
		  New PKVector2(-0.2938950011135606, 0.34351713499907377), _
		  New PKVector2(0.4808343603387655, 0.7888704490126863), _
		  New PKVector2(0.1599155665373344, 0.02151095989651952), _
		  New PKVector2(-0.37606052613241703, 0.0804588083428397), _
		  New PKVector2(0.9462153023499189, 0.22727520505451748), _
		  New PKVector2(-0.9456618762622269, 0.37803502908268394), _
		  New PKVector2(0.2605785519124091, 0.6356750121701042), _
		  New PKVector2(0.48223669286894855, 0.262860161463758), _
		  New PKVector2(-0.3702153029820894, 0.5007032758898953), _
		  New PKVector2(-0.6195605274827549, -0.754997344990497), _
		  New PKVector2(0.4265779920707864, 0.8660862642130771), _
		  New PKVector2(-0.37778244647320847, 0.059065551224976254), _
		  New PKVector2(-0.6420441109635837, -0.7722359507246734), _
		  New PKVector2(0.3678826629361227, -0.2414999360319654), _
		  New PKVector2(0.18485808524851732, 0.8812185304342397))
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
