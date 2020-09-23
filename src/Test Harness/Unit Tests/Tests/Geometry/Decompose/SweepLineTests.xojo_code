#tag Class
Protected Class SweepLineTests
Inherits AbstractDecomposeTest
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
		    Call Self.Algorithm.Decompose(vertices)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DecomposeFailSelfIntersection1Test()
		  ///
		  ' Tests the triangulation to confirm it fails properly on self-intersecting edges.
		  ///
		  
		  Try
		    Var vertices() As PKVector2 = Array( _
		    New PKVector2(-0.07792188619765694, 0.10364292899125216), _
		    New PKVector2(0.1, -0.2), _
		    New PKVector2(0.15, 0.0), _
		    New PKVector2(0.2, 0.07), _
		    New PKVector2(0.21037640391727175, 0.06289919008100842), _
		    New PKVector2(0.3079072605141815, -0.20863138522549773))
		    
		    // Decompose the poly.
		    Call Algorithm.Decompose(vertices)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DecomposeFailSelfIntersection2Test()
		  ///
		  ' Tests the triangulation to confirm it fails properly on self-intersecting edges.
		  ///
		  
		  Try
		    Var vertices() As PKVector2 = Array( _
		    New PKVector2(-0.07792188619765694, 0.10364292899125216), _
		    New PKVector2(0.2412466770151972, -0.3145214553981004), _
		    New PKVector2(0.21037640391727175, 0.06289919008100842), _
		    New PKVector2(0.3079072605141815, -0.20863138522549773))
		    
		    // Decompose the poly.
		    Call Algorithm.Decompose(vertices)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DecomposeFailSelfIntersection3Test()
		  ///
		  ' Tests the triangulation to confirm it fails properly on self-intersecting edges.
		  ///
		  
		  Try
		    Var vertices() As PKVector2 = Array( _
		    New PKVector2(-0.07792188619765694, 0.10364292899125216), _
		    New PKVector2(0.1, -0.2), _
		    New PKVector2(0.2412466770151972, -0.3145214553981004), _
		    New PKVector2(0.21037640391727175, 0.06289919008100842), _
		    New PKVector2(0.3079072605141815, -0.20863138522549773))
		    
		    // Decompose the poly.
		    Call Algorithm.Decompose(vertices)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DecomposeFailSelfIntersection4Test()
		  ///
		  ' Tests the triangulation to confirm it fails properly on self-intersecting edges.
		  ///
		  
		  Try
		    Var vertices() As PKVector2 = Array( _
		    New PKVector2(-0.22574647794211955, 0.3562272754868271), _
		    New PKVector2(-0.24724056392833493, -0.06552204150010887), _
		    New PKVector2(0.2551995234048088, -0.4678431592201415), _
		    New PKVector2(-0.11272047497863902, -0.40936273068655504))
		    
		    // Decompose the poly.
		    Call Algorithm.Decompose(vertices)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DecomposeFailSelfIntersection5Test()
		  ///
		  ' Tests the triangulation to confirm it fails properly on self-intersecting edges.
		  ///
		  
		  Try
		    Var vertices() As PKVector2 = Array( _
		    New PKVector2(0.187521000630546, -0.2171227524343904), _
		    New PKVector2(-0.05418163781638374, -0.4552384293706746), _
		    New PKVector2(-0.12615265827683775, 0.08842525905551823), _
		    New PKVector2(-0.4197343412893181, -0.45293439849558936))
		    
		    // Decompose the poly.
		    Call Algorithm.Decompose(vertices)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DecomposeFailSelfIntersection6Test()
		  ///
		  ' Tests the triangulation to confirm it fails properly on self-intersecting edges.
		  ///
		  
		  Try
		    Var vertices() As PKVector2 = Array( _
		    New PKVector2(0.1595990921676319, 0.20158036631684495), _
		    New PKVector2(0.3627243978540108, -0.2125801642934565), _
		    New PKVector2(0.4972213824759445, -0.2197501458724339), _
		    New PKVector2(-0.17530050402164232, -0.10202036313267437))
		    
		    // Decompose the poly.
		    Call Algorithm.Decompose(vertices)
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected an InvalidArgumentException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DecomposeFailureDegenerateGusAsfTest()
		  ///
		  ' Tests the triangulation to confirm it fails properly on degenerate data.
		  ///
		  
		  Try
		    // Degenerate polygon.
		    Var vertices() As PKVector2 = Array( _
		    New PKVector2(70.5, 360.0), _
		    New PKVector2(70.947212,360.89444), _
		    New PKVector2(71.394424,361.78884899999997), _
		    New PKVector2(71.158356,361.316711), _
		    New PKVector2(70.71114299999999,360.422302))
		    
		    // Decompose the poly.
		    Call Algorithm.Decompose(vertices)
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
		    Call Self.Algorithm.Decompose(vertices)
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
		    Call Self.Algorithm.Decompose(Nil)
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
		    Call Algorithm.Decompose(vertices)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NsoftTriangulateFailureTest()
		  ///
		  ' Tests the bayazit algorithm with a sample provided by nsoft.
		  ///
		  
		  #Pragma BreakOnExceptions True
		  
		  // Degenerate ploygon.
		  Var vertices() As PKVector2 = Array( _
		  New PKVector2(9.761856, 2.894968), _
		  New PKVector2(9.814371999999999, 2.941328), _
		  New PKVector2(9.879956, 2.9670609999999997), _
		  New PKVector2(9.950168999999999, 2.975665), _
		  New PKVector2(10.020947, 2.972896), _
		  New PKVector2(10.090999, 2.962284), _
		  New PKVector2(10.160001, 2.946294), _
		  New PKVector2(10.224352, 2.917453), _
		  New PKVector2(10.287756, 2.8861149999999998), _
		  New PKVector2(10.354289, 2.882955), _
		  New PKVector2(10.42306, 2.89995), _
		  New PKVector2(10.491831, 2.916946), _
		  New PKVector2(10.560603, 2.933941), _
		  New PKVector2(10.629374, 2.9509369999999997), _
		  New PKVector2(10.698146, 2.967932), _
		  New PKVector2(10.766917, 2.984928), _
		  New PKVector2(10.835689, 3.0019229999999997), _
		  New PKVector2(10.902652999999999, 3.023749), _
		  New PKVector2(10.966056, 3.055087), _
		  New PKVector2(11.02946, 3.0864249999999998), _
		  New PKVector2(11.092863999999999, 3.1177639999999998), _
		  New PKVector2(11.156269, 3.149102), _
		  New PKVector2(11.219673, 3.18044), _
		  New PKVector2(11.283076999999999, 3.211778), _
		  New PKVector2(11.346480999999999, 3.2431159999999997), _
		  New PKVector2(11.409885, 3.274454), _
		  New PKVector2(11.470938, 3.309624), _
		  New PKVector2(11.528354, 3.350723), _
		  New PKVector2(11.585768999999999, 3.391823), _
		  New PKVector2(11.643184, 3.432922), _
		  New PKVector2(11.700598999999999, 3.474021), _
		  New PKVector2(11.758014, 3.51512), _
		  New PKVector2(11.815429, 3.5562199999999997), _
		  New PKVector2(11.872845, 3.5973189999999997), _
		  New PKVector2(11.930259999999999, 3.6384179999999997), _
		  New PKVector2(11.987675, 3.6795169999999997), _
		  New PKVector2(12.04509, 3.720617), _
		  New PKVector2(12.102504999999999, 3.761716), _
		  New PKVector2(12.159920999999999, 3.802815), _
		  New PKVector2(12.217335, 3.843914), _
		  New PKVector2(12.27475, 3.885014), _
		  New PKVector2(12.332165999999999, 3.926113), _
		  New PKVector2(12.389581, 3.967212), _
		  New PKVector2(12.446995, 4.008311), _
		  New PKVector2(12.495809999999999, 4.057666), _
		  New PKVector2(12.53567, 4.115612), _
		  New PKVector2(12.575531999999999, 4.173558), _
		  New PKVector2(12.615393, 4.231504999999999), _
		  New PKVector2(12.655254, 4.289451), _
		  New PKVector2(12.695115, 4.347397), _
		  New PKVector2(12.734976, 4.405343), _
		  New PKVector2(12.774837, 4.46329), _
		  New PKVector2(12.814696999999999, 4.521236), _
		  New PKVector2(12.854559, 4.579181999999999), _
		  New PKVector2(12.894419, 4.637129), _
		  New PKVector2(12.934280999999999, 4.695075), _
		  New PKVector2(12.974141, 4.7530209999999995), _
		  New PKVector2(13.014002999999999, 4.810967), _
		  New PKVector2(13.053863999999999, 4.868914), _
		  New PKVector2(13.10245, 4.9170609999999995), _
		  New PKVector2(13.159697, 4.9580649999999995), _
		  New PKVector2(13.204635, 5.0120059999999995), _
		  New PKVector2(13.235349999999999, 5.074993999999999), _
		  New PKVector2(13.253463, 5.142634), _
		  New PKVector2(13.26161, 5.212177), _
		  New PKVector2(13.262213, 5.282213), _
		  New PKVector2(13.256893, 5.352073), _
		  New PKVector2(13.281281, 5.416812999999999), _
		  New PKVector2(13.310070999999999, 5.480848), _
		  New PKVector2(13.338861999999999, 5.544881999999999), _
		  New PKVector2(13.367652, 5.608917), _
		  New PKVector2(13.396441999999999, 5.672950999999999), _
		  New PKVector2(13.425232999999999, 5.736986), _
		  New PKVector2(13.454023999999999, 5.8010209999999995), _
		  New PKVector2(13.482813, 5.865056), _
		  New PKVector2(13.511604, 5.929091), _
		  New PKVector2(13.540618, 5.993009), _
		  New PKVector2(13.575342, 6.054065), _
		  New PKVector2(13.605383, 6.117508), _
		  New PKVector2(13.630118999999999, 6.183152), _
		  New PKVector2(13.650364999999999, 6.250286), _
		  New PKVector2(13.666599999999999, 6.3184819999999995), _
		  New PKVector2(13.678803, 6.387498), _
		  New PKVector2(13.687422999999999, 6.457040999999999), _
		  New PKVector2(13.692998, 6.526886999999999), _
		  New PKVector2(13.695791, 6.5968979999999995), _
		  New PKVector2(13.696048, 6.666963), _
		  New PKVector2(13.693999999999999, 6.737000999999999), _
		  New PKVector2(13.689857, 6.8069489999999995), _
		  New PKVector2(13.683812, 6.8767629999999995), _
		  New PKVector2(13.672563, 6.945861), _
		  New PKVector2(13.658662, 7.014575), _
		  New PKVector2(13.644758999999999, 7.083288), _
		  New PKVector2(13.630856, 7.1520019999999995), _
		  New PKVector2(13.616954999999999, 7.2207159999999995), _
		  New PKVector2(13.5985, 7.288234), _
		  New PKVector2(13.576082999999999, 7.354711999999999), _
		  New PKVector2(13.553666999999999, 7.421189999999999), _
		  New PKVector2(13.53125, 7.4876689999999995), _
		  New PKVector2(13.508833, 7.5541469999999995), _
		  New PKVector2(13.47304, 7.614159), _
		  New PKVector2(13.433719, 7.672464), _
		  New PKVector2(13.394397, 7.730769), _
		  New PKVector2(13.355075999999999, 7.789073999999999), _
		  New PKVector2(13.315754, 7.847379999999999), _
		  New PKVector2(13.276432999999999, 7.905685), _
		  New PKVector2(13.237110999999999, 7.963991), _
		  New PKVector2(13.193520999999999, 8.019065), _
		  New PKVector2(13.146841, 8.071802), _
		  New PKVector2(13.100159999999999, 8.124537), _
		  New PKVector2(13.053479999999999, 8.177273999999999), _
		  New PKVector2(13.006801, 8.23001), _
		  New PKVector2(12.960121, 8.282746999999999), _
		  New PKVector2(12.91344, 8.335483), _
		  New PKVector2(12.86676, 8.388219), _
		  New PKVector2(12.820081, 8.440954999999999), _
		  New PKVector2(12.773401, 8.493692), _
		  New PKVector2(12.72672, 8.546427999999999), _
		  New PKVector2(12.660881, 8.571221), _
		  New PKVector2(12.594036, 8.594543), _
		  New PKVector2(12.527189, 8.617865), _
		  New PKVector2(12.460341999999999, 8.641187), _
		  New PKVector2(12.393495, 8.66451), _
		  New PKVector2(12.326647999999999, 8.687832), _
		  New PKVector2(12.259801, 8.711153999999999), _
		  New PKVector2(12.192955999999999, 8.734475999999999), _
		  New PKVector2(12.126109, 8.757798), _
		  New PKVector2(12.059261999999999, 8.781120999999999), _
		  New PKVector2(11.992415, 8.804442), _
		  New PKVector2(11.925568, 8.827764), _
		  New PKVector2(11.858723, 8.851087), _
		  New PKVector2(11.791876, 8.874409), _
		  New PKVector2(11.725029, 8.897731), _
		  New PKVector2(11.658182, 8.921052999999999), _
		  New PKVector2(11.591334999999999, 8.944374999999999), _
		  New PKVector2(11.524488999999999, 8.967698), _
		  New PKVector2(11.454464999999999, 8.977869), _
		  New PKVector2(11.384172, 8.986932999999999), _
		  New PKVector2(11.31388, 8.995996), _
		  New PKVector2(11.243587, 9.005059), _
		  New PKVector2(11.173295, 9.014123), _
		  New PKVector2(11.103002, 9.023185999999999), _
		  New PKVector2(11.03271, 9.032249), _
		  New PKVector2(10.962417, 9.041312999999999), _
		  New PKVector2(10.892123999999999, 9.050376), _
		  New PKVector2(10.821831999999999, 9.05944), _
		  New PKVector2(10.751539, 9.068503), _
		  New PKVector2(10.681084, 9.075819), _
		  New PKVector2(10.610294999999999, 9.079500999999999), _
		  New PKVector2(10.539505, 9.083185), _
		  New PKVector2(10.468715, 9.086867), _
		  New PKVector2(10.397924999999999, 9.090551), _
		  New PKVector2(10.327135, 9.094233), _
		  New PKVector2(10.256345, 9.097916999999999), _
		  New PKVector2(10.185554999999999, 9.1016), _
		  New PKVector2(10.114765, 9.105283))
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have n - 2 triangles shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
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
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Success2Test()
		  ///
		  ' Tests the implementation against the 1st polygon data string.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.POLYGON1_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Success3Test()
		  ///
		  ' Tests the implementation against the 2nd polygon data string.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.POLYGON2_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Success4Test()
		  ///
		  ' Tests the implementation against the 3rd polygon data string.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.POLYGON3_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Success5Test()
		  ///
		  ' Tests the implementation against the 4th polygon data string.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.POLYGON4_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessBirdTest()
		  ///
		  ' Tests the ear clipping implementation against the bird data string.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.BIRD_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessNazcaHeronTest()
		  ///
		  ' Tests the ear clipping implementation against the Nazca heron data string.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.NAZCA_HERON_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessNazcaMonkeyTest()
		  ///
		  ' Tests the ear clipping implementation against the Nazca monkey data string.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.NAZCA_MONKEY_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessTankTest()
		  ///
		  ' Tests the ear clipping implementation against the tank data string.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.TANK_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessTridol1Test()
		  ///
		  ' Tests the implementation against the tridol1 data string
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.TRIDOL1_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessTridol2Test()
		  ///
		  ' Tests the implementation against the tridol2 data string
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.TRIDOL2_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessTridol3Test()
		  ///
		  ' Tests the implementation against the tridol3 data string
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.TRIDOL3_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessZoom1Test()
		  ///
		  ' Tests the bayazit implementation against the zoom(forum) data string 1.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.ZOOM1_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessZoom2Test()
		  ///
		  ' Tests the bayazit implementation against the zoom(forum) data string 2.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.ZOOM2_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessZoom3Test()
		  ///
		  ' Tests the bayazit implementation against the zoom(forum) data string 3.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.ZOOM3_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessZoom4Test()
		  ///
		  ' Tests the bayazit implementation against the zoom(forum) data string 4.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.ZOOM4_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessZoom5Test()
		  ///
		  ' Tests the bayazit implementation against the zoom(forum) data string 5.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.ZOOM5_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessZoom6Test()
		  ///
		  ' Tests the bayazit implementation against the zoom(forum) data string 6.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.ZOOM6_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SuccessZoom7Test()
		  ///
		  ' Tests the bayazit implementation against the zoom(forum) data string 7.
		  ///
		  
		  Var vertices() As PKVector2 = Parse(DecomposeData.ZOOM7_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h21, Description = 546865207377656570206C696E6520616C676F726974686D2E
		#tag Getter
			Get
			  Static algo As New PKSweepLine
			  
			  Return algo
			  
			End Get
		#tag EndGetter
		Private Algorithm As PKSweepLine
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
