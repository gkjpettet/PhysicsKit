#tag Class
Protected Class BayazitTests
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
		  
		  Var vertices() As PKVector2 = Parse(POLYGON1_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(POLYGON2_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(POLYGON3_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(POLYGON4_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(BIRD_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(NAZCA_HERON_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(NAZCA_MONKEY_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(TANK_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(TRIDOL1_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(TRIDOL2_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(TRIDOL3_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(ZOOM1_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(ZOOM2_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(ZOOM3_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(ZOOM4_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(ZOOM5_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(ZOOM6_DATA)
		  
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
		  
		  Var vertices() As PKVector2 = Parse(ZOOM7_DATA)
		  
		  // Decompose the poly.
		  Var result() As PKConvex = Algorithm.Decompose(vertices)
		  
		  // The result should have less than or equal to n - 2 convex shapes.
		  Assert.IsTrue(result.Count <= vertices.Count - 2)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h21, Description = 54686520626179617A697420616C676F726974686D2E
		#tag Getter
			Get
			  Static algo As New PKBayazit
			  
			  Return algo
			  
			End Get
		#tag EndGetter
		Private Algorithm As PKBayazit
	#tag EndComputedProperty


	#tag Constant, Name = BIRD_DATA, Type = String, Dynamic = False, Default = \"# bird.dat from poly2tri testbed http://code.google.com/p/poly2tri\n4.57998 4.03402\n4.06435 4.06435\n3.51839 4.21601\n3.09376 4.42832\n2.60846 4.57998\n2.09284 4.7013\n1.51655 4.82263\n0.909929 4.94395\n0.242648 5.06527\n-0.30331 5.0956\n-1.15258 5.12594\n-1.72887 5.12594\n-2.48714 5.12594\n-2.85111 5.03494\n-3.36674 5.30792\n-3.70038 5.52024\n-4.15534 5.9752\n-4.7013 6.27851\n-5.0956 6.61215\n-5.73255 6.67281\n-6.55149 6.73348\n-6.88513 6.61215\n-7.46142 6.36951\n-7.88605 6.18752\n-8.25003 5.91454\n-8.64433 5.61123\n-8.88698 5.30792\n-9.06896 5.00461\n-9.25095 4.88329\n-9.94856 4.73163\n-10.6462 4.64064\n-11.1011 4.54965\n-11.3741 4.42832\n-11.5561 4.21601\n-11.0101 4.21601\n-10.1305 3.94303\n-9.61492 3.73071\n-9.15996 3.4274\n-8.73532 3.00277\n-8.34102 2.6388\n-7.97705 2.36582\n-7.61308 2.03218\n-7.18844 1.45589\n-6.79414 1.12225\n-6.64248 0.788605\n-6.36951 0.242648\n-6.24818 -0.212317\n-6.00553 -0.515627\n-5.73255 -0.818936\n-5.24726 -1.2739\n-4.7923 -1.60754\n-4.42832 -2.00184\n-3.67005 -2.21416\n-3.18475 -2.39615\n-2.5478 -2.69946\n-1.91085 -2.79045\n-1.06158 -2.88144\n-0.333641 -2.88144\n0.242648 -2.85111\n0.94026 -2.82078\n1.2739 -2.85111\n1.42556 -3.0331\n1.42556 -3.30608\n1.33456 -3.57905\n1.15258 -4.00369\n1.03125 -4.57998\n0.849267 -5.15627\n0.63695 -5.5809\n0.30331 -5.91454\n0.060662 -6.15719\n-0.333641 -6.27851\n-0.697612 -6.27851\n-1.15258 -6.36951\n-1.57721 -6.39984\n-2.09284 -6.52116\n-2.36582 -6.79414\n-2.48714 -7.06712\n-2.18383 -6.97612\n-1.85019 -6.79414\n-1.42556 -6.76381\n-1.15258 -6.79414\n-1.36489 -6.88513\n-1.69853 -6.97612\n-1.97151 -7.12778\n-2.12317 -7.37043\n-2.27482 -7.64341\n-2.39615 -7.91639\n-2.36582 -8.21969\n-2.03218 -7.85572\n-1.81986 -7.7344\n-1.57721 -7.67374\n-1.36489 -7.49175\n-1.21324 -7.40076\n-0.849267 -7.2491\n-0.60662 -7.12778\n-0.242648 -6.91546\n0.030331 -6.70315\n0.363972 -6.4605\n0.242648 -6.61215\n0.152837 -6.72007\n-0.092855 -6.88818\n-0.506653 -7.15974\n-0.765276 -7.31491\n-1.01097 -7.41836\n-1.16614 -7.5606\n-1.32132 -7.71577\n-1.45063 -7.81922\n-1.50235 -8.06492\n-1.50235 -8.29768\n-1.46356 -8.53044\n-1.38597 -8.29768\n-1.28252 -8.05199\n-1.14028 -7.87095\n-0.985106 -7.84509\n-0.817001 -7.84509\n-0.623033 -7.70284\n-0.390272 -7.52181\n-0.105787 -7.31491\n0.178699 -7.06922\n0.489047 -6.84939\n0.670083 -6.66835\n0.928707 -6.47438\n1.16147 -6.33214\n1.47182 -6.13817\n1.82096 -5.91834\n2.04079 -5.84076\n2.15717 -5.71144\n2.18303 -5.45282\n2.06665 -5.28472\n1.87268 -5.3623\n1.49768 -5.63386\n1.22612 -5.81489\n1.03216 -5.91834\n0.876982 -5.95714\n0.954569 -5.80196\n1.00629 -5.60799\n1.16147 -5.29765\n1.3425 -4.9873\n1.45888 -4.65109\n1.47182 -4.4054\n1.73044 -3.95281\n1.84682 -3.6166\n1.98906 -3.30625\n2.14424 -2.95711\n2.26062 -2.75021\n2.42872 -2.59503\n2.63562 -2.50452\n2.98476 -2.51745\n3.12701 -2.71141\n3.06235 -3.09935\n2.9589 -3.4097\n2.86838 -3.75884\n2.79079 -4.12091\n2.70028 -4.43126\n2.55803 -4.75454\n2.48045 -5.03902\n2.3382 -5.37523\n2.29941 -5.59506\n2.23475 -5.90541\n2.11837 -6.21576\n1.7951 -6.65542\n1.39423 -7.05628\n1.09681 -7.26318\n0.838188 -7.37956\n0.41146 -7.49594\n-0.002337 -7.62526\n-0.416135 -7.7675\n-0.687689 -8.05199\n-0.907519 -8.40113\n-0.70062 -8.19423\n-0.312685 -8.05199\n-0.015268 -7.89681\n0.217493 -7.89681\n0.243355 -7.90974\n0.023525 -8.1425\n-0.157511 -8.25888\n-0.403203 -8.43992\n-0.648896 -8.75027\n-0.778207 -8.90544\n-0.881657 -9.18993\n-0.80407 -9.60372\n-0.597171 -9.177\n-0.14458 -8.9701\n0.269217 -8.62096\n0.695946 -8.28475\n1.13561 -8.00026\n1.52354 -7.62526\n1.82096 -7.26318\n1.95027 -7.09508\n1.9632 -7.15974\n1.66578 -7.58646\n1.45888 -7.84509\n1.13561 -8.20716\n0.760601 -8.65975\n0.450253 -8.99596\n0.269217 -9.28045\n0.126974 -9.65545\n0.19163 -10.2761\n0.333873 -9.84942\n0.63129 -9.68131\n0.980431 -9.26751\n1.26492 -8.72441\n1.60113 -8.31061\n1.98906 -7.7675\n2.36407 -7.34077\n2.79079 -7.00456\n3.13994 -6.7718\n3.68304 -6.46145\n4.14857 -6.33214\n4.7434 -6.09938\n5.19599 -6.13817\n4.85978 -5.87955\n4.29081 -5.76317\n3.77356 -5.81489\n3.34683 -6.07352\n2.77786 -6.47438\n2.41579 -6.60369\n2.41579 -6.28042\n2.59683 -5.84076\n2.79079 -5.42696\n2.99769 -4.90971\n3.25632 -4.30195\n3.50201 -3.52608\n3.83822 -2.63383\n4.07098 -2.40107\n4.39426 -2.28469\n4.79512 -2.23296\n4.54943 -2.02606\n4.49771 -1.6252\n4.54943 -1.50882\n4.91151 -1.50882\n5.54513 -1.45709\n6.12704 -1.39244\n6.85118 -1.32778\n7.44601 -1.14674\n7.85981 -0.78467\n7.79516 -0.409667\n7.49774 -0.151043\n7.84688 0.042924\n8.23481 0.314479\n8.64861 0.702414\n8.70034 1.09035\n8.41585 1.42656\n8.11843 1.62053\n8.3512 2.06019\n8.53223 2.38347\n8.67447 2.74554\n8.66154 3.22399\n8.80379 3.87055\n8.90724 4.36193\n9.1012 4.85332\n9.43741 5.40936\n9.90293 6.04298\n10.3167 6.58609\n10.7047 7.3749\n10.9374 7.96973\n11.1573 8.40939\n11.1573 8.84905\n10.9374 9.05595\n10.6659 9.28871\n10.3426 9.37922\n9.99345 9.34043\n9.63138 8.97836\n9.20465 8.48697\n8.86844 8.1249\n8.50637 7.72404\n8.17016 7.28438\n7.74343 6.88351\n7.43308 6.5473\n7.16153 6.1723\n6.70894 5.71971\n6.20462 5.25418\n5.72617 4.80159\n5.13134 4.41366\n4.87271 4.16797", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NAZCA_HERON_DATA, Type = String, Dynamic = False, Default = \"# nazca_heron.dat from poly2tri testbed http://code.google.com/p/poly2tri\n-91.726 10.4022\n-92.5616 10.385\n-93.0053 10.4193\n-93.8429 10.4444\n-94.4002 10.3881\n-95.1773 10.4322\n-95.731 10.328\n-96.0661 10.0034\n-95.7371 9.52215\n-95.0108 9.51904\n-93.8987 9.40352\n-93.063 9.41048\n-92.1174 9.36365\n-91.1689 9.32841\n-90.1664 9.32695\n-89.2738 9.29848\n-87.9935 9.21778\n-87.1011 9.24003\n-85.9323 9.16578\n-84.818 9.2136\n-83.8152 9.2263\n-82.3111 9.25894\n-81.2523 9.21521\n-80.3055 9.26966\n-79.1913 9.27179\n-78.3561 9.26927\n-77.4071 9.2506\n-76.2938 9.15212\n-75.2359 9.21265\n-74.2889 9.23221\n-73.2304 9.22176\n-72.3344 9.24597\n-71.3911 9.06377\n-70.7225 9.00533\n-69.8321 8.87212\n-68.5508 8.90126\n-67.2126 8.90584\n-66.2109 8.83119\n-65.1525 8.76935\n-64.2054 8.77328\n-62.9784 8.69629\n-62.0884 8.7899\n-61.1999 8.81082\n-60.4738 8.81708\n-59.6372 8.77889\n-58.3559 8.77041\n-57.8008 8.75645\n-57.2974 8.71659\n-56.6289 8.69558\n-55.7933 8.71756\n-55.1804 8.7228\n-54.4562 8.71456\n-53.3976 8.71721\n-52.2278 8.78652\n-51.4479 8.73714\n-50.4451 8.74938\n-49.8323 8.77075\n-48.6067 8.78685\n-47.7153 8.78148\n-46.9345 8.79131\n-45.8212 8.72036\n-44.9864 8.73653\n-43.76 8.7899\n-43.2029 8.80459\n-42.5953 8.82626\n-42.0346 8.81404\n-41.4759 8.75151\n-40.7516 8.71843\n-40.1388 8.78394\n-39.5817 8.75781\n-39.1361 8.75758\n-38.6347 8.80655\n-38.2447 8.77854\n-37.8547 8.74123\n-37.4091 8.7923\n-35.9611 8.78602\n-34.6793 8.78076\n-33.8436 8.83903\n-32.8966 8.83963\n-32.0052 8.8087\n-31.0024 8.86909\n-29.9997 8.8264\n-29.1083 8.82878\n-27.7705 8.83849\n-26.5457 8.72773\n-25.4873 8.7165\n-24.2616 8.6655\n-23.0892 8.68424\n-22.1449 8.54477\n-20.8074 8.50105\n-19.5257 8.45263\n-17.9667 8.37676\n-16.6851 8.31799\n-15.5706 8.3359\n-14.401 8.27044\n-13.2307 8.27746\n-12.5648 8.24932\n-11.7826 8.30542\n-11.225 8.26741\n-10.6119 8.33761\n-9.94418 8.2737\n-9.10957 8.29055\n-8.16166 8.32522\n-7.15627 8.31888\n-6.10021 8.19418\n-5.04173 8.20764\n-4.20608 8.21455\n-3.25902 8.21726\n-2.09019 8.14631\n-1.30858 8.09495\n-0.306399 8.16141\n0.528273 8.19199\n1.97994 8.12994\n2.75763 8.20323\n3.48095 8.19986\n4.54034 8.18316\n5.26597 8.14464\n5.93308 8.20355\n6.37876 8.23306\n6.93779 8.20172\n7.38503 8.28515\n7.75928 8.14925\n8.10818 7.83366\n8.55309 7.68152\n9.27282 7.59373\n10.1085 7.35329\n10.6702 7.35345\n11.5114 7.20388\n12.5089 7.36493\n13.4027 7.4728\n14.412 7.6901\n15.1803 8.05105\n15.6266 8.26723\n16.2416 8.29494\n17.0758 8.37201\n17.9672 8.45068\n18.6906 8.3527\n19.4689 8.36621\n20.0833 8.32903\n20.8076 8.36605\n21.5349 8.39958\n22.811 8.30214\n23.5936 8.32996\n24.2817 8.11023\n24.3617 7.60334\n24.4628 6.99157\n24.4059 6.20837\n24.5479 5.43455\n24.7617 4.81808\n25.0482 4.37841\n25.4039 3.83047\n25.9341 3.55091\n26.5429 3.48577\n27.1405 3.94951\n27.7711 4.42902\n28.3433 5.30396\n29.0083 5.9264\n29.3964 6.59346\n30.0334 7.39695\n30.4568 7.93096\n30.9385 8.5706\n31.4443 9.3344\n31.9062 9.83899\n32.3178 9.99556\n32.4543 9.44194\n32.3424 8.99712\n32.3298 8.3286\n32.2872 7.66008\n32.3614 7.04572\n32.2586 6.26963\n32.1964 5.65849\n32.1029 4.76416\n32.0489 3.98324\n32.0854 3.31228\n31.9712 2.75763\n32.0396 2.13545\n31.8344 1.53202\n31.8289 0.861208\n31.99 0.183618\n32.3457 -0.243851\n32.8982 -0.739612\n33.7837 -0.849395\n34.3622 -0.710696\n34.8876 -0.0191316\n35.4023 0.808785\n35.7456 1.19234\n36.2095 1.94174\n36.8011 2.75484\n37.2693 3.52304\n37.7639 4.47142\n38.2574 5.25764\n38.5964 5.86575\n39.0468 6.53111\n39.4802 7.20908\n39.8636 7.93611\n40.3677 8.68935\n40.853 9.50473\n41.3001 10.2266\n41.5896 10.8341\n41.8697 11.2788\n42.1444 11.7269\n42.4414 12.3274\n42.8817 13.0026\n43.044 13.3927\n43.2547 13.7354\n43.8157 14.4808\n44.21 14.4567\n44.2384 13.7881\n44.214 13.1202\n44.2478 12.3397\n44.2545 11.504\n44.2471 10.2762\n44.383 9.55421\n44.3819 8.8306\n44.4857 7.99434\n44.4374 7.1038\n44.4823 6.49018\n44.5055 5.54178\n44.3968 4.65176\n44.4035 3.87539\n44.3112 3.09147\n44.3678 2.31195\n44.3634 1.64156\n44.4741 1.08215\n44.7443 0.405587\n45.098 -0.0812431\n45.5916 -0.319965\n46.0404 -0.518244\n47.0404 -0.187042\n47.6198 0.241597\n48.0225 1.04872\n48.4879 1.70359\n49.0113 2.52644\n49.4565 3.30864\n49.7829 4.08959\n50.2298 4.64717\n50.7013 5.35933\n50.968 6.06294\n51.3782 6.77734\n51.8168 7.50498\n52.2817 8.27353\n52.5085 8.88449\n52.9297 9.67783\n53.2782 10.2838\n53.7366 10.9445\n54.1325 11.6654\n54.43 12.1549\n54.74 12.7268\n54.9842 13.2537\n55.3914 13.7539\n55.9159 14.019\n56.1591 13.621\n56.1814 12.7857\n56.0542 11.8895\n55.901 10.9481\n55.755 10.1629\n55.6441 9.16009\n55.4555 8.44064\n55.3158 7.48927\n55.1979 6.76738\n55.1458 6.04168\n55.0153 5.20856\n54.9225 4.47831\n54.6817 3.75997\n54.4404 2.76892\n54.3443 1.69915\n54.3354 0.809666\n54.1511 -0.0300711\n54.2166 -0.702496\n54.453 -1.31046\n54.6851 -1.85943\n55.1255 -2.25343\n55.7401 -2.43474\n56.4817 -2.28494\n57.1939 -1.76082\n57.67 -1.0781\n58.1661 -0.0158294\n58.7044 0.911084\n59.1398 1.69647\n59.5985 2.35776\n59.9523 3.04503\n60.2915 3.7707\n60.7648 4.36495\n61.1845 5.10498\n61.5282 5.65631\n61.9625 6.44572\n62.3804 6.92578\n62.7068 7.38979\n63.1888 7.02434\n63.7594 6.71273\n64.4182 5.92176\n64.9326 5.49007\n65.436 4.93653\n65.9846 4.48258\n66.3835 3.82101\n66.8552 3.23917\n67.3884 2.6537\n67.8008 2.17994\n68.2584 1.64344\n68.2649 0.417823\n68.2525 -0.137759\n68.212 -0.863123\n68.2058 -1.53202\n68.1769 -2.19838\n68.2882 -3.03763\n68.1923 -3.65085\n68.2978 -4.37321\n68.3021 -5.31814\n68.2969 -6.10242\n68.4 -6.88111\n68.3005 -7.82472\n68.273 -8.44002\n68.2464 -9.2692\n68.1829 -9.71818\n68.245 -10.5034\n68.3322 -11.2255\n68.3078 -11.8903\n68.2012 -12.5096\n68.3418 -13.1022\n68.6065 -13.3261\n69.0974 -13.3425\n69.0796 -12.6196\n69.0225 -11.5006\n69.1975 -10.0556\n69.2256 -8.9414\n69.243 -7.60627\n69.3237 -6.21134\n69.4118 -4.87177\n69.2502 -3.87182\n69.2618 -2.97959\n69.3274 -2.14482\n69.3415 -1.36489\n69.3206 -0.686317\n69.6114 -0.427229\n70.0984 -0.312499\n70.4035 -0.864603\n70.2948 -1.58221\n70.2543 -2.36766\n70.2135 -3.09189\n70.2426 -3.81611\n70.1699 -4.54469\n70.2999 -5.2107\n70.2593 -5.87737\n70.1916 -6.43108\n70.1723 -6.93454\n70.244 -7.43724\n70.2816 -8.16147\n70.289 -8.88495\n70.3531 -9.72134\n70.3477 -10.3873\n70.4535 -11.0022\n70.4808 -11.9497\n70.4864 -12.6171\n70.4493 -13.34\n70.6577 -13.7504\n71.1761 -14.0215\n71.6078 -13.6693\n71.7849 -12.7296\n71.7493 -11.1698\n71.7383 -10.222\n71.6867 -9.21995\n71.5978 -8.10296\n71.6945 -6.65731\n71.724 -5.6547\n71.6909 -4.93167\n71.7255 -4.0947\n71.6829 -3.09189\n71.6556 -2.31361\n71.5993 -1.80799\n71.7354 -1.15126\n72.1227 -0.732545\n72.5957 -0.924082\n72.7269 -1.42072\n72.798 -2.41973\n72.955 -3.03618\n72.9628 -3.64899\n72.95 -4.20608\n72.939 -4.93373\n73.1754 -5.7659\n73.2306 -6.60159\n73.258 -7.4394\n73.3313 -8.16212\n73.4053 -9.05141\n73.5125 -9.66491\n73.582 -10.2253\n73.6984 -11.0503\n73.9074 -11.6638\n74.2887 -12.1152\n74.8254 -12.0555\n75.0308 -11.4474\n74.9288 -10.3949\n74.7818 -9.44347\n74.6863 -8.04964\n74.5524 -7.05342\n74.5059 -5.76663\n74.406 -4.81738\n74.1716 -3.98324\n74.1828 -3.14729\n74.1627 -2.19507\n73.9711 -1.31592\n74.2954 -1.13944\n74.4945 -1.70344\n74.7325 -2.59075\n74.8428 -3.48254\n75.0145 -4.26162\n75.1478 -5.1454\n75.3825 -5.99195\n75.5103 -6.71359\n75.6344 -7.54683\n75.7996 -8.32736\n75.9504 -9.2252\n76.3494 -9.94925\n76.7611 -10.013\n77.0247 -9.55421\n77.0168 -8.60758\n76.7722 -7.66401\n76.5674 -6.32409\n76.3879 -5.43546\n76.1592 -4.37618\n76.079 -3.48081\n75.9239 -2.71101\n75.7774 -2.03729\n75.699 -1.59737\n75.9528 -1.05432\n76.6689 -0.939149\n77.1612 -1.32968\n77.4792 -1.61957\n77.9039 -1.91182\n78.1904 -1.77006\n78.6284 -1.71267\n79.0308 -1.85639\n79.5234 -2.19157\n79.7474 -2.14619\n80.2003 -2.47286\n80.416 -2.7096\n80.9208 -2.76515\n81.2445 -2.63541\n81.4789 -2.47298\n81.858 -2.71375\n82.3006 -3.00137\n82.6434 -3.14951\n82.8334 -3.30639\n82.9618 -3.5857\n83.0542 -4.13459\n83.3045 -4.51251\n83.4828 -4.53942\n83.6902 -5.01666\n84.1795 -5.22944\n84.433 -5.47731\n84.8724 -5.69724\n85.44 -5.65169\n85.2045 -4.93327\n84.9319 -4.59458\n84.5801 -4.0562\n85.0434 -4.41845\n85.4846 -4.5517\n85.822 -4.58297\n86.4291 -4.66072\n86.8641 -4.8989\n87.3249 -5.1661\n87.7599 -5.17183\n88.1596 -5.38038\n88.8845 -5.54301\n89.0758 -5.03874\n88.9908 -4.60685\n88.4392 -4.31739\n87.9944 -3.92687\n87.8263 -3.73325\n87.3787 -3.69144\n86.9907 -3.74579\n86.667 -3.74799\n86.307 -3.39915\n86.1521 -3.29102\n85.5422 -3.20372\n84.9936 -3.25056\n84.8131 -3.09682\n84.6518 -2.92498\n84.7139 -2.70778\n84.9344 -2.41951\n84.5395 -1.91678\n84.1568 -1.92933\n83.8164 -2.26671\n83.3204 -2.25906\n82.8592 -2.28033\n82.4168 -2.10331\n81.8816 -1.84037\n81.4293 -1.57093\n81.032 -1.35101\n80.3612 -1.25898\n79.9668 -1.28969\n79.5208 -1.24133\n79.0219 -1.15593\n78.3544 -1.03266\n77.9372 -0.724926\n77.6381 -0.532779\n78.1321 -0.412019\n79.022 -0.334834\n79.7365 -0.403715\n80.53 -0.579743\n81.084 -0.760943\n81.8071 -0.895225\n82.4782 -0.914448\n82.9781 -0.930945\n83.4276 -0.936112\n84.3706 -1.03896\n85.2088 -1.1944\n85.9289 -1.39795\n87.0464 -1.4622\n87.9377 -1.49596\n88.659 -1.51403\n90.0546 -1.58832\n90.7826 -1.72732\n91.6118 -1.8804\n92.4502 -2.01859\n93.3968 -2.0376\n94.4012 -2.15891\n95.1315 -2.09807\n95.6052 -1.6493\n95.6245 -0.920633\n95.0142 -0.412069\n94.0101 -0.144715\n93.1187 -0.189432\n92.1155 -0.184855\n90.8904 -0.243803\n89.5533 -0.237599\n88.6615 -0.236242\n87.1578 -0.303836\n85.8783 -0.270527\n84.7623 -0.250566\n83.5943 -0.129718\n82.7553 0.0179645\n81.1995 0.260974\n80.5318 0.411907\n80.9183 0.658629\n82.1999 0.635839\n84.0376 0.771737\n86.0993 0.803398\n88.1648 0.84411\n89.609 0.65952\n91.2238 0.624693\n92.3389 0.58028\n94.4558 0.66607\n95.2629 0.660988\n95.5713 1.03034\n95.7391 1.81258\n95.4034 2.13092\n94.1247 2.06277\n92.2822 1.89953\n90.2776 1.75379\n88.6628 1.83331\n87.0464 1.86452\n85.2636 1.86765\n83.8709 1.82\n82.2554 1.79107\n81.0865 1.79007\n80.1157 1.74386\n80.1334 1.93887\n81.0811 2.23192\n82.7003 2.42892\n84.5395 2.65818\n86.0436 2.63221\n87.6047 2.63459\n88.7183 2.74889\n90.334 2.88772\n91.8931 2.83109\n93.0628 2.81122\n94.1236 2.69508\n94.8341 2.93287\n95.2499 3.48754\n95.0085 4.03008\n94.3443 4.37434\n92.8445 4.17146\n91.5055 4.02086\n90.1646 3.8803\n88.9421 3.6319\n87.1005 3.49\n85.9879 3.25387\n85.0421 3.24464\n83.7595 3.20743\n82.9798 3.14365\n81.8622 3.11751\n80.976 2.96988\n81.0885 3.47024\n81.9378 3.6489\n82.4922 3.83974\n83.3647 4.27166\n84.0266 4.62188\n84.5386 4.82064\n84.9745 5.02323\n85.3698 4.81152\n85.7651 4.6058\n86.4328 4.548\n86.9687 4.59919\n87.0659 4.99771\n86.8618 5.24124\n86.6658 5.44818\n86.2668 5.6535\n87.1019 5.87851\n87.7698 5.99097\n88.3791 6.22568\n89.1112 6.4213\n89.7168 6.61037\n90.3558 6.91892\n90.7855 7.21441\n90.7737 7.54215\n90.5004 7.77089\n89.9933 7.79614\n89.2749 7.60375\n88.4356 7.44428\n87.8883 7.17135\n87.6597 7.26648\n87.2029 7.22145\n87.0047 6.8102\n86.7121 6.82344\n86.3262 6.82444\n86.3146 7.16477\n86.553 7.43624\n86.6073 7.89827\n86.212 8.04484\n85.7741 7.92294\n85.3727 7.71698\n85.159 7.26678\n84.9196 6.82769\n84.8213 6.48738\n84.4684 6.12775\n83.9911 5.79129\n83.5915 5.71275\n83.1381 5.56378\n82.4792 5.26258\n81.7937 4.96558\n81.1962 4.65765\n80.7362 4.6232\n80.4787 4.909\n80.08 4.82191\n79.4998 4.23189\n78.8931 3.72655\n78.3428 3.20188\n78.3092 3.71576\n77.9599 3.9784\n77.719 4.30016\n78.0395 4.91762\n78.4051 5.49132\n78.9135 6.40463\n79.4112 7.32762\n79.9172 8.16058\n80.4247 9.10461\n80.7546 9.775\n81.0854 10.3341\n81.5764 11.0636\n81.8685 11.6162\n81.754 12.1079\n81.3082 12.1171\n81.0363 11.8892\n80.568 11.2937\n80.1876 10.7835\n79.7582 9.99418\n79.3481 9.33988\n78.8698 8.71184\n78.3571 7.77085\n78.0088 7.05571\n77.5734 6.38028\n77.1178 5.71761\n76.8005 5.15005\n76.337 4.49448\n75.9919 4.03294\n75.994 4.26179\n75.9583 4.9314\n76.3466 5.60066\n76.8133 6.4246\n77.2997 7.32439\n77.9281 8.37226\n78.6042 9.37164\n79.0863 10.2193\n79.4958 10.9289\n79.856 11.5059\n80.1477 12.0564\n80.5155 12.8522\n80.861 13.2316\n81.1485 14.0724\n80.7678 14.5459\n80.3209 14.2254\n79.9206 13.6464\n79.6606 13.0853\n79.2478 12.395\n78.8736 11.7173\n78.4521 11.0659\n78.0784 10.2776\n77.7548 9.71539\n77.29 8.8348\n76.9343 8.3413\n76.7456 7.82355\n76.4154 7.32071\n75.9858 6.4719\n75.4055 5.70854\n74.8422 4.93221\n74.6119 4.49262\n74.3462 4.09592\n74.1215 4.37322\n74.1782 5.09694\n74.8469 5.98837\n75.4801 7.25591\n76.0283 8.0968\n76.7103 9.12227\n77.398 10.5616\n77.7939 11.4511\n78.3011 12.2833\n78.8654 13.1148\n79.2539 13.7846\n79.623 14.5733\n79.9541 15.4692\n80.3716 16.2507\n80.5987 16.9298\n80.0747 17.2511\n79.5869 16.7935\n79.1336 15.9618\n78.7511 15.1781\n78.3425 14.4076\n77.8659 13.3927\n77.4296 12.4389\n76.7817 11.4001\n76.3303 10.5669\n76.0301 9.87661\n75.4467 9.22674\n74.962 8.32609\n74.622 7.71632\n74.2949 6.98872\n73.7711 5.93905\n73.5375 5.33381\n73.2448 4.64053\n72.84 4.14617\n72.2613 4.19979\n72.1516 4.60385\n72.4467 5.32227\n72.8275 6.05278\n73.3687 6.80996\n74.1322 8.26793\n74.6116 9.3374\n75.1627 10.3982\n75.6426 11.3286\n76.0586 12.2348\n76.3405 12.7905\n76.8518 13.7323\n77.198 14.5048\n77.7446 15.4027\n78.1249 16.0761\n78.3535 16.5196\n78.687 16.9633\n78.637 17.4934\n78.067 17.5349\n77.669 17.2531\n77.3505 16.6867\n77.0095 16.1879\n76.6357 15.3447\n76.179 14.4034\n75.8572 13.8396\n75.458 13.0644\n74.8572 11.9994\n74.4823 11.2672\n74.0028 10.4494\n73.6473 9.65219\n73.242 8.87957\n72.7264 7.93995\n72.3241 7.16613\n71.8701 6.28093\n71.5224 5.58931\n71.194 4.91632\n70.6833 4.02852\n70.1796 3.41292\n69.7207 2.8571\n69.2136 2.86331\n68.7805 3.32243\n68.1988 3.80251\n67.6737 4.55604\n67.0607 5.11157\n66.5602 5.61566\n66.0439 6.04454\n65.542 6.65693\n65.0516 7.28061\n64.4886 7.83231\n63.8682 8.38166\n63.4806 8.82701\n62.6509 8.98197\n61.8701 8.71545\n61.5024 8.14539\n61.1667 7.58665\n60.7729 7.03534\n60.4889 6.53788\n60.1274 5.88575\n59.7446 5.45344\n59.5827 4.81796\n59.1301 4.26463\n58.8581 3.70411\n58.481 3.13902\n58.1724 2.71238\n57.7765 2.10247\n57.4722 1.52727\n57.0016 0.817253\n56.6784 0.198728\n56.354 -0.372287\n55.7403 -0.584321\n55.6175 -0.083565\n55.6389 0.638398\n55.8152 1.58658\n55.8485 2.64634\n56.0662 3.48261\n56.2021 4.3124\n56.5438 5.76862\n56.6148 7.00231\n56.7995 7.71535\n56.9572 8.59928\n57.0697 9.66596\n57.1411 10.4998\n57.2485 11.2812\n57.2209 12.0068\n57.2864 12.8427\n57.4071 13.621\n57.4292 14.4641\n57.1339 15.0174\n56.756 15.5683\n55.8035 15.7749\n55.1888 15.45\n54.702 14.9986\n54.3267 14.5244\n53.8733 13.8576\n53.4584 13.0049\n53.0047 12.3416\n52.5121 11.5011\n52.213 10.9564\n51.9035 10.2931\n51.5297 9.9067\n51.116 9.16314\n50.8362 8.55092\n50.4922 7.83421\n50.0078 7.21066\n49.7895 6.70805\n49.5116 5.97696\n49.1128 5.5406\n48.714 4.82213\n48.2439 4.27275\n47.9923 3.53879\n47.4039 2.74948\n47.1212 1.96748\n46.7692 1.35872\n46.3782 1.30907\n45.9053 1.69915\n45.869 2.64621\n45.9339 3.87182\n45.9591 5.37443\n46.0595 6.32305\n45.9919 7.60484\n45.8376 8.88829\n45.6288 9.94298\n45.6099 11.1148\n45.5345 12.0054\n45.5154 12.8441\n45.6385 13.8427\n45.5997 14.5682\n45.5452 15.6848\n44.9829 16.225\n44.0949 16.4052\n43.265 15.9555\n42.7019 15.2921\n42.1312 14.4089\n41.6672 13.5517\n41.1422 12.6737\n40.8033 12.008\n40.2677 11.2383\n40.065 10.5723\n39.4596 9.8392\n38.9891 8.98232\n38.3485 8.16589\n37.959 7.49736\n37.5209 6.76843\n37.0109 6.16027\n36.5893 5.31344\n36.0748 4.14867\n35.5462 3.32695\n35.0692 2.31194\n34.7339 1.6445\n34.1748 1.06472\n33.7977 1.14943\n33.2575 1.81321\n33.45 3.03618\n33.4054 4.20571\n33.4258 5.32202\n33.5421 6.21163\n33.5726 7.65692\n33.5749 8.77428\n33.5748 9.55367\n33.6373 10.5673\n33.3481 11.0118\n32.5488 11.5421\n31.6239 11.1543\n30.7264 10.6669\n30.2189 9.98657\n29.7357 9.15279\n29.1033 8.38725\n28.7121 7.72117\n28.0097 6.86454\n27.4493 6.31322\n26.9991 5.76595\n26.9828 5.33162\n26.5307 4.95098\n26.2086 5.19947\n25.7791 5.60628\n25.4568 6.09787\n25.4387 6.82499\n25.3458 7.54666\n25.3102 8.38349\n25.2393 9.03098\n24.8817 9.51595\n24.2058 9.77595\n23.3135 9.81943\n22.5903 9.86593\n21.923 9.90705\n21.0305 9.94285\n20.2505 9.89838\n19.6377 9.85003\n19.192 9.908\n18.4142 9.85643\n17.5764 9.83844\n17.075 9.81595\n16.6211 9.82152\n16.0157 10.2765\n15.1799 10.5993\n14.4367 10.6016\n13.8872 10.7675\n13.2852 10.9309\n12.7302 11.012\n11.6141 11.0355\n10.7226 11.136\n9.8908 11.0508\n9.16189 10.8441\n8.546 10.6847\n7.87413 10.4649\n7.2606 10.1765\n6.88074 9.77113\n6.31967 9.70218\n5.37599 9.91319\n4.87612 9.90665\n4.20608 9.92573\n3.48031 9.96736\n2.64828 9.91948\n1.81057 9.96115\n0.807282 9.9518\n-0.027855 9.8843\n-0.752081 9.88456\n-2.03146 9.91959\n-2.92476 9.94002\n-4.03895 9.95328\n-4.76318 9.9326\n-6.04626 9.97233\n-6.93586 9.86425\n-7.93863 9.90267\n-8.77428 9.8777\n-9.77663 9.89603\n-10.7798 9.94277\n-11.504 9.92638\n-12.674 9.91078\n-13.3982 10.0215\n-14.4013 9.93858\n-15.4048 10.0089\n-16.2957 9.88017\n-17.075 9.92469\n-17.6878 9.95143\n-18.5792 9.94126\n-19.4735 9.99813\n-20.473 9.89347\n-21.3647 9.96261\n-22.4783 9.9315\n-23.7045 9.86269\n-24.9858 9.89156\n-25.824 9.92438\n-26.601 9.82282\n-28.0498 9.77438\n-29.1627 9.80298\n-30.2777 9.8431\n-31.4481 9.89154\n-32.5623 9.92407\n-33.6219 9.91263\n-34.8464 9.81087\n-35.7935 9.85645\n-36.6291 9.83217\n-37.7433 9.89153\n-38.4675 9.89622\n-39.1943 9.85547\n-39.916 10.0103\n-40.8631 9.99673\n-41.5306 9.95644\n-42.2001 9.99526\n-42.9783 10.0222\n-43.7036 10.066\n-44.5399 10.1084\n-45.5427 10.0927\n-46.4897 10.1051\n-47.2697 10.1179\n-48.1033 10.1233\n-48.779 10.1864\n-49.9437 10.4296\n-50.7794 10.4231\n-52.395 10.4119\n-53.5649 10.3887\n-55.1809 10.3502\n-56.9064 10.2634\n-58.5243 10.1341\n-59.9715 10.2029\n-61.1414 10.2087\n-62.477 10.2043\n-63.2026 10.1565\n-64.2052 10.172\n-65.375 10.2146\n-67.0466 10.1996\n-68.1608 10.1552\n-68.885 10.1522\n-69.5549 10.1887\n-70.4451 10.1088\n-71.3353 10.1866\n-72.4492 10.2401\n-73.2861 10.2751\n-74.1225 10.2678\n-74.9017 10.3368\n-75.6816 10.3683\n-76.3494 10.3453\n-77.2972 10.3623\n-78.2443 10.3738\n-79.247 10.3957\n-80.3055 10.3897\n-81.5314 10.3962\n-82.59 10.3249\n-83.9799 10.4463\n-85.2635 10.4424\n-86.2662 10.3957\n-87.2688 10.4357\n-88.5506 10.4145\n-89.8321 10.3863\n-90.7782 10.4345", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NAZCA_MONKEY_DATA, Type = String, Dynamic = False, Default = \"# nazca_monkey.dat from poly2tri testbed http://code.google.com/p/poly2tri\n-30.7428 -41.7049\n-31.9015 -40.832\n-32.6739 -40.444\n-34.5123 -40.5501\n-35.9626 -40.5436\n-37.0264 -40.7339\n-37.9951 -41.5062\n-38.0928 -42.5706\n-37.8 -43.9196\n-36.3507 -44.4093\n-34.8902 -44.5997\n-34.5131 -45.9623\n-33.1567 -46.1557\n-32.081 -45.9461\n-31.5143 -46.6346\n-31.1211 -47.5048\n-31.126 -48.8594\n-30.5117 -49.5416\n-30.0931 -48.512\n-29.8408 -47.0594\n-29.6633 -48.0291\n-29.8985 -49.4199\n-29.8469 -50.8722\n-29.0609 -51.2922\n-27.7909 -51.1142\n-27.6069 -49.8435\n-27.9728 -47.9686\n-28.6379 -45.7908\n-27.6046 -47.3017\n-27.3107 -48.4528\n-27.1851 -49.3605\n-26.2186 -49.7207\n-25.3631 -48.937\n-25.1855 -47.18\n-25.8537 -46.0926\n-26.4529 -45.673\n-26.222 -45.3106\n-25.4954 -46.1571\n-24.8254 -46.9365\n-23.9744 -46.8823\n-23.1846 -45.9709\n-23.3137 -44.7669\n-24.4621 -44.5277\n-25.4863 -44.5161\n-25.9177 -43.9741\n-25.6126 -42.6428\n-24.4608 -41.6775\n-23.7347 -41.1323\n-23.1288 -40.2858\n-22.2203 -39.0157\n-21.4348 -37.8046\n-20.772 -36.3514\n-20.4854 -34.8362\n-20.1788 -33.0236\n-20.1072 -29.0304\n-19.9908 -26.1278\n-20.4025 -24.4289\n-21.0193 -23.345\n-21.5604 -21.6489\n-21.4991 -19.8945\n-21.557 -18.0794\n-21.3066 -15.7213\n-20.9514 -13.6627\n-20.773 -12.5735\n-20.7699 -10.6377\n-20.468 -9.48837\n-19.7382 -8.40535\n-18.9574 -7.85135\n-18.0563 -7.47587\n-16.8412 -6.88153\n-15.5076 -6.15998\n-14.1763 -5.43461\n-12.9022 -5.00207\n-11.9411 -5.43567\n-11.5138 -6.28103\n-11.4585 -7.24994\n-11.2089 -8.64013\n-10.9056 -10.153\n-10.7902 -11.6661\n-10.6087 -13.5419\n-10.3656 -14.7518\n-10.0651 -15.8414\n-9.75352 -17.1102\n-9.52007 -18.6847\n-9.28164 -20.1378\n-8.90539 -21.7085\n-8.61497 -23.8287\n-8.12303 -25.3995\n-7.64123 -27.3361\n-7.18957 -28.6674\n-7.24708 -29.6918\n-7.64695 -31.509\n-8.61699 -33.685\n-9.33216 -34.8417\n-10.1165 -35.992\n-10.9696 -37.4406\n-12.1731 -39.2597\n-13.2668 -41.0721\n-14.1145 -42.4636\n-15.5088 -44.0951\n-16.4717 -45.4293\n-17.0771 -46.46\n-17.8067 -47.0608\n-19.0161 -46.9341\n-20.4686 -46.7507\n-22.0444 -46.6937\n-22.5213 -47.0025\n-22.8815 -47.7262\n-22.8927 -48.5094\n-23.372 -49.0596\n-24.1027 -49.4233\n-23.2539 -50.4537\n-21.9225 -50.9373\n-20.7099 -51.3541\n-19.4427 -51.906\n-18.4113 -52.384\n-17.6251 -52.8084\n-16.776 -53.4695\n-15.9321 -53.8998\n-14.9051 -54.3849\n-14.2952 -54.863\n-13.753 -55.3509\n-13.2689 -55.3497\n-12.9663 -54.5027\n-12.6041 -54.0115\n-11.3927 -53.8995\n-10.1243 -53.4735\n-9.76015 -52.3247\n-10.0637 -51.543\n-11.2758 -51.1809\n-11.9967 -50.7496\n-12.7219 -50.0849\n-13.0258 -49.239\n-12.9044 -48.514\n-12.1212 -47.603\n-11.1534 -46.817\n-10.4291 -45.8471\n-9.75574 -45.1273\n-9.1506 -44.282\n-8.5458 -43.7349\n-8.06811 -42.8234\n-7.22182 -41.734\n-6.49384 -40.7067\n-5.70662 -39.6787\n-5.10459 -38.8903\n-4.50083 -37.9221\n-3.77308 -36.4706\n-3.35045 -35.7445\n-2.80372 -34.5353\n-2.38739 -33.6864\n-1.83611 -31.995\n-1.71118 -30.1802\n-1.65053 -28.4256\n-1.52958 -27.0339\n-1.5293 -25.4606\n-1.70693 -23.7646\n-2.18951 -22.4325\n-3.1009 -20.3168\n-3.71033 -18.4425\n-3.95051 -17.2926\n-4.43971 -15.4788\n-4.85498 -13.9033\n-5.52524 -11.7266\n-5.96218 -10.0364\n-6.37058 -8.57986\n-6.91724 -7.12857\n-7.34478 -5.98087\n-7.82366 -4.88951\n-8.25198 -3.91841\n-7.46002 -2.6517\n-6.18748 -1.86782\n-4.73837 -0.834822\n-3.04648 0.0767719\n-1.70745 0.788371\n0.0431392 1.76356\n1.80011 2.66568\n3.24563 3.34625\n5.00218 4.06908\n6.39434 4.43025\n8.02861 4.791\n10.3275 4.66822\n11.6586 4.60952\n12.8681 4.42731\n14.3155 3.39263\n15.5896 2.42917\n16.8675 1.46808\n17.8306 0.314723\n19.0406 -0.53289\n19.8278 -1.92397\n20.4824 -2.84096\n21.399 -3.86138\n22.1875 -5.13064\n23.1443 -6.472\n23.9408 -7.3097\n24.6047 -8.15785\n25.2695 -9.18616\n25.6921 -10.3325\n25.212 -11.0621\n23.5782 -11.7901\n22.9752 -11.8532\n22.3689 -12.0918\n20.8613 -12.8278\n20.0075 -13.2369\n19.2237 -13.4852\n18.0152 -14.0951\n16.3767 -14.7494\n15.2282 -15.3562\n14.2026 -15.7854\n12.8666 -16.5033\n11.7182 -17.3527\n10.8141 -18.5655\n9.53574 -20.0118\n8.39731 -21.7128\n7.48394 -23.3431\n7.06224 -24.3724\n6.57641 -25.6423\n6.26354 -27.2762\n6.32905 -29.4555\n6.75744 -30.9667\n7.12281 -32.1759\n7.71138 -33.576\n8.26694 -34.5989\n8.93741 -35.7461\n9.18345 -36.8342\n9.53469 -38.3168\n10.1418 -39.6813\n10.757 -40.8869\n11.2907 -42.2826\n11.8365 -43.7343\n12.3871 -45.1229\n13.47 -46.7602\n14.1404 -47.9676\n14.7486 -49.175\n15.354 -49.9636\n15.5319 -50.6912\n15.2944 -51.422\n14.5593 -52.2024\n14.3872 -52.8082\n14.4349 -54.0826\n15.1103 -55.4068\n16.3106 -56.445\n17.6473 -57.8926\n19.1607 -58.8599\n20.6114 -59.4008\n21.5216 -58.7983\n21.3393 -57.2858\n20.1289 -56.6812\n19.2242 -56.1949\n18.5549 -55.2203\n18.981 -55.1654\n20.0706 -55.7083\n21.0367 -56.1364\n22.2478 -56.4339\n23.7593 -56.737\n25.5142 -56.6832\n28.0551 -56.4987\n29.3844 -56.3169\n29.8045 -55.3522\n29.2041 -54.0813\n27.5106 -53.533\n25.2108 -53.4646\n22.8525 -53.6506\n21.2177 -53.4764\n20.0046 -53.2338\n19.8267 -52.8757\n21.0367 -52.878\n22.5493 -52.8726\n24.3041 -52.8636\n25.9989 -52.9346\n27.6314 -52.6259\n29.203 -52.1412\n30.4174 -50.9331\n30.5433 -49.2327\n29.9903 -48.5758\n29.2023 -48.2613\n27.815 -48.6364\n26.4842 -49.5436\n25.3913 -50.5657\n24.3644 -50.9891\n22.7312 -50.9891\n20.854 -50.8134\n20.3113 -50.3906\n21.4603 -50.0877\n22.8517 -50.0837\n24.366 -49.9678\n25.6343 -49.2986\n26.533 -48.4534\n26.3655 -46.9966\n25.877 -46.3945\n24.2416 -46.391\n22.6083 -47.1188\n20.7947 -48.2707\n19.7056 -48.8164\n18.4934 -48.7579\n17.5893 -48.1488\n16.7442 -46.9383\n16.1969 -45.6083\n15.773 -44.1565\n15.4101 -42.5833\n15.1028 -41.9802\n14.6198 -40.83\n14.1379 -39.5586\n13.5343 -37.501\n12.9928 -36.1687\n12.6267 -35.2624\n12.3826 -34.3555\n12.0254 -33.3255\n11.7725 -32.1803\n11.2934 -31.2096\n10.6292 -29.696\n10.5609 -28.0621\n10.6287 -26.3071\n11.1064 -25.2745\n11.8375 -24.1265\n13.5386 -22.6826\n14.8678 -21.5306\n16.0731 -20.3739\n17.4085 -19.7163\n18.9193 -18.8058\n19.9443 -18.1952\n20.8539 -17.5933\n22.1837 -16.7435\n23.2749 -16.1424\n24.4268 -15.4203\n25.5762 -14.7543\n26.6049 -14.0899\n27.6317 -13.6011\n28.7782 -13.6077\n29.8105 -14.146\n30.4746 -14.9945\n31.6229 -15.9032\n32.3546 -16.62\n33.863 -17.4194\n35.9204 -17.5919\n37.5539 -17.4732\n39.3063 -16.8658\n40.5808 -15.903\n41.6708 -15.1221\n42.6364 -14.8171\n43.9099 -14.8699\n44.8106 -15.784\n45.4759 -16.5088\n45.9072 -17.2298\n46.7569 -18.3779\n47.2999 -19.2262\n47.8995 -20.258\n48.441 -21.1066\n49.1718 -22.4957\n49.8411 -23.7649\n50.261 -24.8554\n50.6844 -26.1258\n51.3432 -27.2184\n52.0128 -28.5471\n52.4356 -29.8788\n52.9812 -31.0879\n53.2264 -32.4788\n52.9292 -34.5991\n52.6208 -35.5651\n52.3702 -36.9537\n51.8344 -38.4092\n51.2848 -39.4961\n50.8656 -40.5265\n50.1384 -41.4935\n49.4745 -42.04\n48.6896 -42.6465\n47.9002 -43.4299\n46.9315 -43.8524\n45.843 -44.5189\n44.1492 -45.3683\n42.9996 -45.3687\n42.213 -45.3665\n42.0876 -44.0362\n41.8475 -42.645\n41.1836 -41.1923\n40.5177 -39.9227\n39.6116 -39.1343\n38.7646 -38.5893\n37.3727 -38.2262\n35.3148 -38.4068\n34.0449 -38.9526\n32.4121 -39.6194\n31.3287 -40.5244\n31.5633 -41.3744\n32.2307 -42.0364\n33.6215 -42.5244\n34.9542 -42.5289\n35.8608 -42.2824\n37.0702 -41.8572\n38.4589 -41.9818\n39.1861 -42.5845\n39.7401 -43.4291\n39.9053 -44.5195\n39.9179 -45.4878\n39.8518 -46.2131\n39.7323 -46.6372\n38.8849 -45.6699\n37.9769 -45.1254\n37.1902 -44.3395\n36.2245 -43.606\n35.3764 -43.4256\n34.4083 -43.3728\n32.7738 -43.4885\n31.5032 -43.853\n30.8412 -44.3985\n30.8363 -45.2489\n31.7463 -45.7881\n32.8948 -46.0252\n34.6502 -45.8527\n35.6782 -45.7909\n36.4077 -46.2121\n36.8297 -47.0625\n36.5262 -47.3\n35.5575 -47.1225\n34.0451 -46.8797\n32.4707 -46.8769\n31.45 -47.4822\n31.62 -48.0915\n32.0499 -48.9918\n33.9238 -49.537\n35.6187 -49.4852\n37.6156 -49.2303\n38.2787 -49.3022\n38.6923 -49.5404\n38.6433 -50.3241\n37.6149 -50.3287\n36.4058 -50.4527\n34.7122 -50.9357\n33.6226 -51.5381\n33.4446 -52.6205\n34.4673 -53.3562\n35.3761 -53.7163\n36.7075 -53.7201\n38.8252 -53.5349\n40.0344 -52.8079\n40.877 -52.1355\n41.6176 -51.6582\n41.6639 -52.5038\n41.1828 -53.5346\n41.2448 -54.4422\n41.7897 -55.3445\n43.1822 -55.4112\n43.9703 -54.5644\n44.3942 -53.7176\n44.9969 -52.5063\n45.7233 -50.873\n46.6295 -49.4199\n47.8306 -48.1356\n49.9597 -46.7612\n51.6502 -45.6066\n52.7398 -44.7608\n53.3463 -43.9755\n54.1328 -43.3098\n54.7386 -42.4631\n55.5839 -41.252\n56.1859 -39.9801\n56.9151 -38.348\n57.3414 -36.7753\n57.5762 -35.1417\n57.46 -33.3263\n57.577 -31.5113\n57.5276 -29.5742\n57.2169 -26.9131\n56.8517 -25.0383\n56.2514 -23.2212\n55.345 -21.8282\n54.6139 -20.9858\n53.8882 -20.1983\n53.2313 -19.1637\n52.3181 -17.897\n51.3469 -16.8109\n50.3185 -15.782\n49.6497 -14.9994\n48.8046 -14.2124\n47.9622 -13.6611\n47.053 -12.8161\n46.2088 -12.269\n45.5436 -11.422\n45.1744 -10.875\n45.7224 -10.4551\n46.4495 -10.5712\n47.5376 -10.8192\n48.3231 -10.2738\n48.6855 -9.6084\n48.9217 -8.64071\n48.9322 -7.18776\n48.687 -6.28112\n47.719 -5.91752\n46.8114 -5.73793\n46.2678 -5.73548\n45.8408 -5.31462\n45.4204 -4.64729\n45.1139 -3.6198\n44.8136 -2.46972\n44.4593 -1.43788\n43.9651 -0.170934\n43.6077 1.10209\n43.0626 2.06995\n42.5227 2.98254\n41.8518 3.70412\n40.9408 4.48593\n39.972 5.08823\n38.7622 5.6293\n37.5531 5.93722\n36.6466 6.2463\n35.0719 6.1906\n33.6843 5.87382\n32.3517 5.39473\n31.1986 4.73315\n30.5941 4.0675\n29.6825 3.22382\n29.0291 2.48877\n28.6565 1.82921\n28.2972 1.34793\n27.7532 1.34296\n27.2646 1.82245\n26.6637 2.43065\n25.6789 2.37865\n25.3234 1.58272\n25.5161 0.617623\n26.3563 -0.839496\n27.0243 -1.68382\n27.5752 -2.89216\n27.7543 -3.98076\n28.417 -4.89004\n28.7906 -5.67509\n28.9059 -6.88831\n28.5392 -7.49887\n27.7469 -7.49471\n27.2708 -6.70333\n26.7229 -5.73725\n25.9375 -4.46598\n25.3954 -3.49674\n24.8465 -2.34929\n24.2963 -1.2046\n23.7131 -0.402416\n23.0353 0.556745\n22.6693 1.34181\n22.0655 2.37112\n21.4656 3.10153\n20.794 3.88301\n20.0084 4.85178\n19.5235 5.69822\n18.9773 6.36267\n18.4349 7.15059\n17.3431 8.17513\n15.7745 9.27139\n14.8659 9.75335\n14.0228 10.3635\n13.0483 11.0803\n12.3254 11.5114\n11.6584 11.6933\n10.4477 11.6305\n9.482 11.2607\n8.26731 10.8529\n6.94585 10.4606\n5.61033 9.98824\n4.15505 9.514\n2.22019 8.90516\n1.1919 8.29614\n-0.0199303 8.18336\n-1.28849 7.75436\n-2.19871 7.33577\n-3.04031 6.84052\n-4.25046 6.295\n-5.34561 5.88582\n-6.61384 5.27591\n-7.58102 4.85026\n-9.09478 4.24827\n-10.9085 3.57986\n-12.0619 2.85838\n-13.3709 1.68589\n-14.424 1.05319\n-15.8701 0.433674\n-17.4418 -0.236547\n-19.135 -0.779826\n-20.5311 -1.61977\n-21.495 -2.29062\n-22.5811 -3.2604\n-23.4986 -4.34041\n-24.2198 -5.07161\n-25.3697 -5.68338\n-26.2772 -5.67587\n-27.2428 -5.06958\n-27.7305 -4.22403\n-27.8514 -2.71191\n-28.3956 -1.74382\n-29.0602 -0.896092\n-29.9687 0.252322\n-31.1132 1.04483\n-32.1456 1.94842\n-33.1665 2.50922\n-34.4462 3.09519\n-35.5969 3.63654\n-37.1674 4.30817\n-38.6206 4.97145\n-40.1886 5.82808\n-41.7665 6.66609\n-43.3358 7.46006\n-44.7305 8.17994\n-45.8841 8.89912\n-47.0233 9.58266\n-48.1752 10.242\n-49.3277 11.1459\n-50.1754 11.8105\n-51.3832 13.0839\n-53.0191 14.4726\n-53.9288 15.3176\n-55.0799 16.6469\n-56.2296 17.7368\n-57.251 19.1335\n-58.3434 20.6437\n-59.3117 22.0955\n-59.7364 23.0025\n-60.5241 24.3332\n-61.0134 25.4822\n-61.2492 26.9354\n-61.4966 28.5086\n-61.5001 29.8999\n-61.5527 31.897\n-61.373 33.2889\n-61.1895 34.4987\n-61.0739 35.5897\n-60.8013 36.4332\n-60.3453 38.2508\n-60.0302 39.5189\n-59.802 40.974\n-59.3718 42.4243\n-59.0696 43.7554\n-58.6505 45.1484\n-58.0427 46.9627\n-57.4967 48.1722\n-56.7729 49.8071\n-56.1624 50.7706\n-54.9601 52.1099\n-53.871 53.0179\n-53.0793 53.6162\n-52.1132 54.3449\n-51.0835 55.0694\n-50.1177 55.6784\n-48.9671 56.2818\n-47.6368 56.8886\n-46.5455 57.3672\n-44.9133 57.7944\n-43.2201 58.646\n-41.6455 59.0666\n-40.2527 59.1797\n-39.4067 59.3662\n-37.9538 59.7225\n-36.3207 59.9136\n-33.9616 59.7806\n-31.2976 59.6763\n-29.3637 59.301\n-26.8242 58.8156\n-25.7314 58.3412\n-24.9499 58.0887\n-23.916 57.4928\n-22.8936 56.8787\n-21.9187 56.1612\n-21.0804 55.3049\n-19.9861 54.2822\n-19.1371 53.3159\n-17.8016 51.9866\n-17.2631 50.8942\n-16.4084 49.9914\n-15.7495 48.838\n-14.9606 47.5082\n-13.9909 45.8135\n-13.6308 44.0582\n-13.5106 41.88\n-13.6389 39.4009\n-13.9966 37.8268\n-14.5401 36.2534\n-14.9668 35.4087\n-15.6969 34.3211\n-16.2975 33.1691\n-16.8985 31.9569\n-17.5632 30.9276\n-18.4109 29.8393\n-18.8967 28.7513\n-19.7444 27.6627\n-20.5261 26.5108\n-21.0079 25.177\n-21.9253 23.9139\n-22.828 22.821\n-23.1992 22.1008\n-24.0365 20.9427\n-25.369 20.0365\n-26.4588 19.554\n-28.0325 19.0722\n-29.3022 18.7057\n-30.3902 18.5203\n-31.7832 18.1658\n-33.8402 18.1024\n-36.6239 18.0346\n-38.194 18.168\n-39.4066 18.7066\n-40.9821 18.8861\n-41.8828 19.8016\n-42.7958 20.5213\n-43.638 21.677\n-44.9124 22.5793\n-46.0601 23.4883\n-47.0895 24.7583\n-48.4158 26.2728\n-49.0205 27.5445\n-49.9332 28.9932\n-50.6053 30.1997\n-51.3294 31.5324\n-52.0559 33.3476\n-52.6599 35.2244\n-52.832 37.524\n-52.9632 40.3071\n-52.8963 41.6371\n-52.2953 43.3327\n-51.4457 45.2071\n-50.5427 46.9044\n-49.6342 48.054\n-48.6021 49.0178\n-46.6024 50.4055\n-45.6969 51.0725\n-44.6091 51.6192\n-43.4626 52.1116\n-42.2511 52.5329\n-40.6794 52.8364\n-39.4073 53.3791\n-38.2573 53.6273\n-36.2602 53.6861\n-34.1431 53.6154\n-32.5699 53.3747\n-31.2987 52.954\n-29.9644 52.6575\n-29.057 52.2321\n-27.3612 51.262\n-26.945 50.7107\n-26.152 50.1131\n-25.4303 49.4429\n-24.4624 48.2931\n-23.8513 47.6927\n-23.0672 46.6625\n-22.3478 45.7507\n-21.3816 43.5738\n-21.2542 41.759\n-21.3195 39.5823\n-21.8588 38.2494\n-22.1056 36.7382\n-22.7075 34.8615\n-23.1298 33.7113\n-24.0362 32.0162\n-24.9486 30.7492\n-25.8552 29.5991\n-26.7565 28.6256\n-27.3631 27.8976\n-28.3979 27.3643\n-29.9682 26.4519\n-31.1229 25.7988\n-32.1465 25.3635\n-33.5363 24.8757\n-34.4452 24.3966\n-36.441 24.518\n-37.1709 24.7485\n-38.2592 25.1163\n-39.1628 25.6073\n-40.0135 26.1461\n-41.4581 27.122\n-42.3713 28.1456\n-43.0962 29.1148\n-43.8784 29.904\n-44.5442 30.8725\n-45.2831 31.7732\n-45.7551 33.1688\n-46.1888 34.4966\n-46.6083 35.8291\n-46.9069 37.0402\n-47.1475 38.0682\n-47.1492 38.9754\n-46.8545 40.43\n-46.2991 41.9972\n-45.6932 42.7837\n-45.1551 43.6355\n-44.1848 44.359\n-43.2796 45.2698\n-41.464 46.2369\n-40.1921 46.8347\n-38.257 47.163\n-36.26 47.1469\n-33.9001 46.8433\n-31.8414 46.1781\n-29.9634 44.4849\n-29.0066 43.1475\n-28.0868 41.215\n-27.9107 39.6413\n-27.9061 37.8249\n-28.397 36.0121\n-29.1777 34.3144\n-29.7883 33.4717\n-30.5184 32.749\n-31.2997 31.8368\n-32.0245 30.9875\n-33.6592 30.4384\n-35.1738 30.5576\n-36.7427 31.0522\n-37.957 31.8935\n-39.1621 32.8065\n-40.1912 34.0156\n-40.9207 35.2241\n-41.2192 36.072\n-41.4701 37.524\n-41.4003 38.9729\n-40.6814 39.7076\n-39.7649 40.3627\n-39.1049 41.0342\n-38.3799 41.4658\n-36.8688 41.7504\n-35.4709 41.218\n-34.6251 40.551\n-33.6002 39.7018\n-33.5932 38.3712\n-33.5286 37.5195\n-33.9003 36.7325\n-34.6258 36.6815\n-35.4775 36.8556\n-36.0816 37.7042\n-36.566 38.9716\n-37.0469 39.3366\n-38.2579 39.3398\n-39.0989 38.6115\n-39.4593 37.1642\n-38.7312 35.5404\n-37.3482 34.5009\n-35.9581 33.8375\n-34.4416 33.8857\n-33.2942 34.4366\n-32.325 35.5254\n-31.5431 36.7376\n-31.1787 38.6129\n-30.9989 40.4876\n-31.4768 41.8841\n-32.4452 42.7909\n-33.2942 43.6376\n-34.1431 44.0562\n-34.99 44.2371\n-36.2615 44.3447\n-37.1073 44.4205\n-38.1362 44.3005\n-39.346 43.7554\n-40.5034 43.2234\n-41.1665 42.7922\n-41.5827 42.3019\n-42.3112 41.3961\n-43.0321 40.1236\n-43.5829 38.6736\n-43.8213 37.4632\n-43.8216 36.0719\n-43.5748 34.8022\n-43.3994 33.8332\n-42.8629 32.7981\n-42.2488 32.0799\n-41.4058 31.2287\n-40.5573 30.383\n-39.768 29.7219\n-38.8039 29.229\n-37.3487 28.6323\n-35.5948 28.1452\n-34.0216 28.1429\n-31.6015 28.2664\n-30.4013 29.0031\n-29.2452 30.084\n-27.9715 31.8968\n-27.128 33.1694\n-26.0975 35.044\n-25.3043 36.4342\n-25.1326 38.9761\n-25.0111 40.7297\n-25.2416 42.1865\n-25.8542 43.2711\n-26.754 44.3055\n-27.9737 45.931\n-29.0659 46.8355\n-30.2076 47.9336\n-31.4242 48.8215\n-33.1146 49.2578\n-35.5345 49.5011\n-37.5918 49.6921\n-40.1321 49.5581\n-42.4918 49.3812\n-44.4291 48.6577\n-45.9436 47.8118\n-46.7291 46.9636\n-47.3306 46.2349\n-48.1181 45.1466\n-48.9089 43.878\n-49.3322 42.9098\n-49.8164 41.8209\n-50.181 40.9729\n-50.3659 39.1555\n-50.0582 37.8255\n-49.699 36.3711\n-49.2196 35.278\n-48.9029 34.8016\n-48.609 33.4086\n-48.4211 32.0788\n-47.8754 31.2319\n-47.4493 30.0238\n-46.6062 28.6298\n-45.6973 27.2408\n-44.4897 26.4506\n-43.095 25.3054\n-41.1545 24.042\n-40.0092 23.3096\n-38.5014 22.4527\n-36.8047 21.7331\n-34.6278 21.1918\n-32.5695 21.6711\n-30.4434 21.9618\n-28.8776 23.0603\n-27.485 23.6641\n-26.1587 24.3977\n-25.371 25.0008\n-24.4095 25.9118\n-23.4891 27.4132\n-22.411 28.2697\n-21.7333 29.5336\n-21.1339 30.5654\n-20.4702 31.5346\n-19.8096 32.6257\n-19.3826 33.5921\n-18.6606 35.3473\n-18.1737 37.2217\n-17.9887 38.7339\n-17.7493 40.6094\n-17.7486 42.6662\n-18.0415 44.7866\n-18.6544 46.599\n-19.6201 48.2947\n-20.406 49.324\n-21.4951 50.536\n-22.7053 51.2609\n-24.0393 52.2857\n-25.5549 53.4316\n-26.4563 54.167\n-27.853 54.8844\n-28.7566 55.4969\n-29.7855 55.8596\n-31.1175 56.2804\n-32.5694 56.6505\n-34.99 56.7094\n-36.5625 56.6397\n-37.5916 56.5228\n-38.8015 56.4015\n-39.7102 56.4041\n-40.5563 56.0997\n-41.6459 56.0422\n-43.0397 55.8022\n-44.0647 55.309\n-45.3377 55.0141\n-46.6648 54.5217\n-48.1815 53.6211\n-49.142 53.0657\n-50.1875 52.2988\n-50.9639 51.5613\n-51.5045 50.65\n-52.2368 49.9898\n-52.9014 49.0211\n-53.5683 48.0527\n-53.7482 47.5079\n-54.2966 46.4202\n-54.6512 45.5094\n-55.074 44.2993\n-55.2525 43.6336\n-55.4425 42.486\n-55.8588 41.4565\n-55.8658 40.852\n-56.1035 39.9431\n-56.5227 38.794\n-56.5962 37.5853\n-56.7705 36.5557\n-56.6505 35.5271\n-56.4755 34.4346\n-56.1646 33.8334\n-55.9183 32.8658\n-55.7424 31.7154\n-55.4415 31.1094\n-54.8927 30.2039\n-54.5315 29.2956\n-54.108 28.207\n-53.3248 27.3578\n-52.6554 26.2106\n-52.1134 25.4829\n-51.5707 24.3312\n-50.7863 23.4829\n-50.1165 22.6393\n-49.4568 21.7283\n-48.8518 20.6982\n-48.0615 19.734\n-47.447 18.6513\n-46.7768 17.7536\n-46.0021 17.1333\n-45.034 16.1042\n-43.6419 15.2582\n-42.5546 14.7656\n-41.1007 14.4703\n-39.7695 14.4733\n-38.3774 14.3582\n-36.2604 14.1698\n-34.4453 14.2351\n-32.3863 14.2147\n-30.3308 14.4639\n-28.3327 14.5277\n-26.2799 15.3265\n-24.7103 15.8756\n-22.5273 16.9542\n-21.8577 17.4345\n-21.193 18.402\n-20.4708 18.9505\n-19.8028 19.7956\n-19.0759 20.4608\n-18.4072 21.7294\n-17.8693 22.6408\n-17.3896 23.6121\n-16.5354 24.8781\n-15.9304 26.2696\n-15.3892 27.2999\n-14.8984 28.2642\n-14.2938 29.2935\n-13.7572 30.5072\n-13.3296 31.4734\n-12.903 32.44\n-12.3583 33.5899\n-11.8816 34.9237\n-11.2159 36.6178\n-10.7238 37.7645\n-10.3051 39.2178\n-10.2431 40.7301\n-9.70324 41.8805\n-9.51718 43.3322\n-9.81727 44.543\n-10.3073 46.114\n-10.8437 47.5095\n-11.6893 49.0823\n-12.303 50.7118\n-13.2138 51.7975\n-14.1748 52.8328\n-15.0818 53.8012\n-15.937 54.702\n-16.7208 55.6716\n-17.5007 56.4657\n-18.474 57.246\n-19.1371 57.8541\n-19.9266 58.332\n-21.1281 58.8874\n-21.9811 59.79\n-23.3729 60.455\n-24.401 61.182\n-25.3064 61.6102\n-26.2157 62.0304\n-27.367 62.448\n-28.5165 62.6908\n-29.7262 62.9936\n-30.8752 63.1205\n-32.3276 63.2432\n-33.5982 63.2375\n-35.2318 63.2364\n-36.1998 63.2364\n-37.4101 63.1172\n-38.9226 62.8153\n-40.1331 62.8163\n-41.3417 62.5081\n-42.4313 62.2073\n-44.0055 61.848\n-44.9719 61.5401\n-46.0023 61.2438\n-47.3328 60.8182\n-48.2424 60.3981\n-48.9667 59.9716\n-50.1782 59.4301\n-51.2046 58.9417\n-52.0531 58.3994\n-53.0224 57.7964\n-53.5086 57.4966\n-54.2878 56.9412\n-54.9559 56.5217\n-55.5601 55.976\n-56.4747 55.3178\n-56.9505 54.825\n-57.4913 54.4005\n-57.916 53.734\n-58.3491 53.3176\n-58.5851 52.8304\n-59.1298 51.9828\n-59.6144 51.6208\n-59.9141 51.1348\n-60.3397 50.5312\n-60.7664 49.9277\n-60.9439 49.3808\n-61.5548 48.5984\n-62.0352 47.87\n-62.2144 47.3238\n-62.7008 46.6599\n-63.0658 46.056\n-63.5524 45.2099\n-63.9092 44.4204\n-64.273 43.6948\n-64.5709 42.9668\n-64.8841 42.2457\n-65.1832 41.6387\n-65.4683 40.7245\n-65.7827 39.9427\n-66.0874 39.0965\n-66.3992 37.7665\n-66.4534 37.1609\n-66.6288 35.8889\n-66.8712 34.9811\n-67.0559 34.438\n-67.0557 33.5304\n-67.0602 32.6227\n-66.9928 31.7156\n-66.9533 30.8683\n-66.9383 29.8397\n-66.9263 29.0539\n-66.8729 28.2668\n-66.8236 27.3578\n-66.6969 26.5109\n-66.3943 25.6642\n-66.0922 24.5746\n-65.6619 23.4878\n-65.37 22.4538\n-64.8782 21.6719\n-64.4534 20.7046\n-64.0386 19.9738\n-63.3093 18.6442\n-62.8256 17.8577\n-62.1598 16.7081\n-61.4843 15.6252\n-61.0649 14.9572\n-60.6401 14.3522\n-60.2194 13.4436\n-59.7328 12.78\n-59.1336 11.9895\n-58.5793 11.0268\n-58.2201 10.3614\n-57.5542 9.81519\n-57.1374 9.14484\n-56.6504 8.54221\n-55.9257 7.8149\n-55.3159 7.15355\n-54.5954 6.30196\n-53.922 5.40095\n-53.1381 4.49142\n-52.419 3.75688\n-51.7501 3.27756\n-50.8383 2.61624\n-49.9314 1.64865\n-48.9657 0.919663\n-48.2405 0.494643\n-47.2714 0.0127581\n-46.5421 -0.344675\n-45.4614 -0.963183\n-44.4973 -1.63675\n-43.3404 -2.29018\n-42.3102 -2.77096\n-41.4643 -3.37826\n-40.1971 -3.92937\n-39.2261 -4.40723\n-38.3775 -4.88676\n-37.2897 -5.07389\n-35.8364 -5.49333\n-34.8671 -5.91258\n-33.297 -6.4053\n-31.8465 -7.01358\n-30.6357 -7.55535\n-29.3056 -8.34424\n-28.2725 -8.88058\n-27.245 -9.54744\n-26.2147 -9.90444\n-25.186 -10.213\n-24.7734 -11.3646\n-24.6349 -12.2108\n-24.7152 -13.5991\n-25.0115 -14.7491\n-25.5963 -15.908\n-26.0307 -16.8694\n-26.0797 -18.0811\n-26.2151 -19.1685\n-26.2802 -20.3782\n-26.4075 -21.4695\n-26.2138 -22.3134\n-25.7295 -23.4624\n-25.3056 -24.2502\n-25.131 -25.4615\n-24.8259 -26.8526\n-24.5853 -27.881\n-24.5183 -28.7883\n-24.455 -29.9378\n-24.3993 -31.4508\n-24.4606 -33.0846\n-24.703 -34.1741\n-25.8635 -35.8598\n-26.462 -36.652\n-26.9976 -37.5042\n-27.5463 -38.4706\n-28.1566 -39.071\n-28.824 -39.857\n-29.3058 -40.5843\n-29.8478 -41.3712", Scope = Private
	#tag EndConstant

	#tag Constant, Name = POLYGON1_DATA, Type = String, Dynamic = False, Default = \"1.0 1.0\n0.8 0.9\n0.7 1.2\n-0.5 0.7\n-0.2 0.4\n-0.6 0.2\n-0.4 -0.1\n-0.3 -0.5\n0.0 0.0\n0.2 -0.3\n0.1 -0.5\n-0.2 -0.6\n0.2 -0.7\n0.4 -0.4\n0.8 -0.6\n0.4 0.0\n0.6 0.5", Scope = Private
	#tag EndConstant

	#tag Constant, Name = POLYGON2_DATA, Type = String, Dynamic = False, Default = \"1.0 1.0\n0.8 0.9\n0.7 1.2\n-0.5 0.7\n-0.2 0.4\n0.0 0.8\n0.2 0.6\n0.2 0.4\n-0.6 0.2\n-0.4 -0.1\n-0.3 -0.5\n0.0 0.0\n0.2 -0.3\n0.1 -0.5\n-0.2 -0.6\n0.2 -0.7\n0.4 -0.4\n0.8 -0.6\n0.4 0.0\n0.6 0.5", Scope = Private
	#tag EndConstant

	#tag Constant, Name = POLYGON3_DATA, Type = String, Dynamic = False, Default = \"1.015625 -1.328125\n1.546875 -1.15625\n0.890625 -0.3125\n2.21875 -0.234375\n2.421875 0.7109375\n1.5 1.0703125\n0.8828125 1.1484375\n1.5 0.5625\n1.140625 0.2734375\n0.0625 0.7265625\n-0.5625 1.21875\n-1.5 0.4921875\n-1.484375 -0.234375\n-0.6484375 -1.046875\n-0.5234375 -0.1171875\n0.125 -0.671875\n0.3359375 -1.1875\n0.1875 0.078125\n0.796875 -0.8125", Scope = Private
	#tag EndConstant

	#tag Constant, Name = POLYGON4_DATA, Type = String, Dynamic = False, Default = \"0.28125 0.0390625\n0.671875 -0.4140625\n0.609375 -0.6875\n0.046875 -0.84375\n-0.4921875 -1.1328125\n-0.0859375 -1.328125\n0.40625 -1.2421875\n0.5234375 -1.0234375\n1.0546875 -0.90625\n1.53125 -0.8359375\n1.6796875 -0.6015625\n1.6171875 -0.4296875\n1.2890625 -0.4296875\n1.1640625 -0.6953125\n1.0078125 -0.546875\n1.3046875 -0.0078125\n2.203125 -0.2421875\n2.0390625 -0.890625\n2.4375 -0.7265625\n2.390625 -0.1171875\n2.1015625 0.015625\n2.640625 0.2578125\n2.2734375 0.546875\n1.7578125 0.3515625\n1.703125 0.1953125\n1.1015625 0.4375\n0.7578125 0.125\n0.25 0.265625", Scope = Private
	#tag EndConstant

	#tag Constant, Name = TANK_DATA, Type = String, Dynamic = False, Default = \"# tank.dat from poly2tri testbed http://code.google.com/p/poly2tri\n-37.317758 260.65677\n-37.317758 317.44301\n-34.741139 339.73612\n-27.330761 354.21222\n59.525828 406.25724\n444.17643 404.87856\n538.9604 368.68832\n555.15984 355.59089\n558.95121 344.90615\n559.64054 325.94936\n568.19908 315.85885\n572.586 322.56108\n584.65003 322.31737\n568.80837 296.11771\n557.59736 289.78104\n539.56224 286.49085\n443.31476 286.82943\n389.89106 280.79772\n405.74583 272.00866\n412.98388 262.01326\n475.5413 262.1856\n480.71134 267.01096\n514.66123 266.66629\n520.34827 262.01326\n669.93463 262.01326\n670.45162 264.08127\n676.91417 263.82277\n678.03434 262.09943\n680.61936 261.66859\n683.03204 255.46455\n682.51504 249.94985\n677.862 243.91814\n668.81445 243.4873\n665.28159 247.02016\n520.86527 246.33082\n514.66123 240.12678\n479.67733 239.95444\n475.5413 243.57347\n412.98388 243.05647\n397.64611 227.54636\n324.74862 221.16998\n323.88695 214.79361\n328.36764 211.86392\n326.6443 207.03856\n300.79412 207.03856\n295.62409 211.69159\n285.28402 208.2449\n272.01426 211.17458\n96.577738 209.62357\n80.205961 211.86392\n58.491817 232.7164\n74.863594 254.94755\n168.61356 269.25131\n175.16228 276.83403\n87.271676 260.11758", Scope = Private
	#tag EndConstant

	#tag Constant, Name = TRIDOL1_DATA, Type = String, Dynamic = False, Default = \"3.3232234 6.676777\n4.323223 6.676777\n4.323223 9.323223\n3.3232234 9.323223\n3.3232234 10.676777\n4.323223 10.676777\n4.323223 11.323223\n2.6767766 11.323223\n2.6767766 9.323223\n1.3232234 9.323223\n1.3232234 12.676777\n4.676777 12.676777\n4.676777 11.676777\n5.676777 11.676777\n5.676777 10.676777\n9.323223 10.676777\n9.323223 11.323223\n6.323223 11.323223\n6.323223 14.323223\n5.676777 14.323223\n5.676777 13.323223\n2.3232234 13.323223\n2.3232234 14.323223\n-0.3232233 14.323223\n-0.32322332 5.676777\n0.6767767 5.676777\n0.67677665 4.676777\n1.3232232 4.676777\n1.3232234 8.676777\n2.6767766 8.676777\n2.6767766 4.676777\n5.323223 4.676777\n5.323223 5.323223\n3.3232234 5.323223", Scope = Private
	#tag EndConstant

	#tag Constant, Name = TRIDOL2_DATA, Type = String, Dynamic = False, Default = \"9 2\n8 2\n8 3.5\n9 3.5\n9 5\n8.5 5\n8.5 4\n6 4\n6 5.5\n8 5.5\n8 6.5\n9 6.5\n9 9\n0 9\n0 0\n9 0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = TRIDOL3_DATA, Type = String, Dynamic = False, Default = \"9.5 6.5\n7.5 6.5\n7.5 5.5\n6.5 5.5\n6.5 4.5\n5.5 4.5\n5.5 6.5\n3.5 6.5\n3.5 7.5\n4.5 7.5\n4.5 8.5\n5.5 8.5\n5.5 6.5\n7.5 6.5\n7.5 7.5\n9.5 7.5\n9.5 9.5\n8.5 9.5\n8.5 8.5\n7.5 8.5\n7.5 9.5\n3.5 9.5\n3.5 8.5\n2.5 8.5\n2.5 7.5\n0.49999997 7.5\n0.49999997 9.5\n-0.49999997 9.5\n-0.5 -0.49999994\n9.5 -0.49999997", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ZOOM1_DATA, Type = String, Dynamic = False, Default = \"71.82635498046875 9.041028851841528\n71.96970245420596 9.065084876518275\n72.84698496066702 8.535128282291913\n72.85212905478721 8.457094723203058\n75.51513682772148 9.128348037567196\n76.70296532421452 8.916850486978241\n77.19770569589713 7.839325490691246\n76.46878594640248 6.889293757782514\n72.87897848026506 4.323094016359528\n73.03435152895737 3.7155890257581383\n72.28207788606544 2.9392849608061224\n71.82635498046875 2.5678077743236867\n71.82635498046875 2.327088393206619\n79.83867079209722 9.051105711660203\n80.77425982846728 8.60682542580367\n80.98318680154084 7.578596633204889\n80.2861980012057 4.982484879650631\n80.78947337898077 4.9093922310236735\n81.17545575666367 3.7803067422699828\n80.88830898145511 0.7191905975341796\n83.86756474767769 0.7191905975341798\n83.3037228572522 3.4814833294392136\n83.22650414981284 4.317255138051698\n83.85131080342165 4.86468204040777\n84.6027957656383 4.522519719761086\n86.30689112630213 0.7191905975341797\n86.5126675216799 0.7191905975341798\n83.38454864794507 7.394201805656439\n83.1420168018937 8.23834702740324\n83.76439112030559 8.912651005533197\n84.61727129539887 8.607441584597902\n90.77911618627967 3.9450768276991264\n90.68350119873307 4.186463422920709\n91.27661927304128 4.893971888314738\n87.96678925945295 6.9341776563845565\n87.063201992979 7.494961973012931\n87.11877116838001 8.545605841410751\n88.0375809687112 9.090192593778918\n90.86590428326572 8.348417452751162\n91.47713545841357 9.133472470193109\n91.82635498046876 9.121498206691484\n91.82635498046875 10.874356739163366\n88.24220267307402 10.81874283070839\n87.09631542746817 11.230030782501522\n87.04442081666514 11.493439722546299\n83.79384784722082 11.0111243673198\n83.00124533525602 11.679728579402237\n# up to here Bayazit works\n83.27803227672017 12.669011445848815\n87.96270653524759 18.961233250534043\n87.38910642299808 19.046162528869065\n87.34845701745272 19.113846687691975\n85.0528358856582 15.624061496174741\n84.18031160855162 14.961954221955967\n83.13059795574226 15.245499974453281\n82.98295614572393 16.322653086529236\n83.61481093483974 19.383841952373963\n83.50431054838108 19.412011233040054\n83.2461827904734 20.134944673016733\n83.33428286242321 20.71919059753418\n81.26695660158973 20.719190597534183\n81.3254918038506 19.672794961240943\n80.52308528217246 18.897947111809234\n80.93042306619374 16.341671492933468\n80.78517075508344 15.343200570529769\n79.8612938938059 15.032950367786151\n79.14041304036952 15.619239996575383\n77.03927635833409 19.45241054371343\n76.53289520480828 18.99554850226785\n80.80971693242398 12.308710628247649\n80.69335781522103 11.439475329103534\n79.88071697360861 11.153564647488462\n77.069238864496 11.781242112827389\n76.51712027105569 10.926269915496224\n72.59036653008536 11.079427485464521\n72.55768655732842 11.022371552157944\n71.82635498046875 11.039997430350738", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ZOOM2_DATA, Type = String, Dynamic = False, Default = \"-1277.0235595703125 2115.5494863831605\n-1277.0235595703125 2104.7347184264263\n-1275.9042506727417 2104.9923997669994\n-1275.0902048765192 2104.4184586587235\n-1275.0919618993644 2104.397177851862\n-1272.0396789765905 2105.395773656894\n-1270.919938932065 2104.6997011576755\n-1270.7851988833552 2103.4116306505825\n-1277.0235595703125 2097.399485671647\n-1277.0235595703125 2097.036865234375\n-1276.3566396807325 2097.036865234375\n-1272.4606031383762 2101.211303357978\n-1271.2404324747924 2100.9421943370676\n-1271.121489888675 2100.674432798434\n-1268.4313933731482 2104.8510673423434\n-1267.4775277154338 2104.8279203234692\n-1267.1025975327843 2103.9830931406045\n-1267.196497442808 2100.3551033003528\n-1267.0567977244593 2100.216378116663\n-1267.0722923859769 2097.036865234375\n-1264.3305615496781 2097.036865234375\n-1265.164023254697 2100.1317865772003\n-1264.4593321899172 2101.0299010348062\n-1263.3423234002275 2100.9112637865464\n-1261.0139681833493 2097.036865234375\n-1260.155258040146 2097.036865234375\n-1260.1132564042903 2097.070149860997\n-1260.0784382360916 2097.055214633385\n-1264.3823094415916 2103.240814068967\n-1264.8179755468534 2103.951606041049\n-1264.423427336613 2104.649256150598\n-1263.611493393691 2104.7536751919415\n-1257.0235595703125 2100.3453477659245\n-1257.0235595703125 2100.791334885779\n-1261.0127270059204 2103.2827815142577\n-1261.1866054361687 2104.5562838984993\n-1260.0907623519245 2105.2310703229477\n-1257.210127124702 2104.4807474343443\n-1257.0235595703125 2104.6233023390796\n-1257.0235595703125 2116.130512231795\n-1257.0382388073358 2116.1683622698247\n-1257.0235595703125 2116.1854266637147\n-1257.0235595703125 2117.036865234375\n-1257.7017407774574 2117.036865234375\n-1259.0670750168492 2115.5722001623126\n-1259.9205966107684 2114.958694112713\n-1260.8924517200146 2115.377702224576\n-1260.9591177897469 2116.4201115241613\n-1260.5605065998677 2117.036865234375\n-1262.2842672142572 2117.036865234375\n-1262.9432837248928 2115.6463274470466\n-1263.781054621851 2114.9052176289674\n-1264.8433202920128 2115.2561760313015\n-1265.0219567395015 2116.337910946029\n-1264.8715404394798 2117.036865234375\n-1266.6354254200173 2117.036865234375\n-1266.6654098158608 2116.2643386268333\n-1267.1173913778273 2115.0020996385542\n-1268.4145244856422 2114.74846069912\n-1269.3009067795608 2115.7339112569475\n-1269.6420891300347 2117.036865234375\n-1271.3618181810775 2117.036865234375\n-1271.0146167538264 2116.2365408221863\n-1271.345956767621 2115.319392963282\n-1272.271969702898 2115.071845644556\n-1272.9654404385574 2115.7743850564493\n-1273.8239800434415 2117.036865234375\n-1275.5802581239361 2117.036865234375\n-1275.1513964240917 2116.535665271379\n-1275.076942131551 2115.488317486968\n-1276.0204986768335 2114.9428753317557\n-1276.956086281257 2115.4920489284323", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ZOOM3_DATA, Type = String, Dynamic = False, Default = \"169.1416032719501 43.554870831590996\n165.12038421579865 39.94712327598281\n165.01733949336142 39.280052684215526\n160.00098891796975 34.18185043334961\n161.48793243106027 34.1818504333496\n163.13232251250386 36.150588917809294\n163.7112768646376 36.783683268472004\n164.42836853405993 36.68192266760234\n167.09865641928596 40.382348772692225\n167.877643677884 41.01692408350048\n168.82665933889518 40.61677932024483\n168.9715427481903 39.58242636067556\n168.43168622248103 36.72474393395388\n168.65095787123087 36.67214754264457\n168.99268888243853 35.74550576849868\n168.8355605524554 34.18185043334962\n171.501148545648 34.18185043334962\n171.18692272466407 36.07396812520156\n171.6663957224415 36.705909094304104\n172.23425546760217 36.689804384142775\n171.354817943026 39.44222341373178\n171.13491081989812 40.30521515633293\n171.8396738199488 40.85878016311799\n172.66080707357645 40.572243439877425\n175.69681138318617 36.68665776759129\n176.06456106870652 36.87010429737165\n176.77872459259143 36.36827415361618\n178.7202212899152 34.18185043334961\n179.84043884277344 34.18185043334961\n179.84043884277347 34.43223689288292\n174.96608411846668 39.184544374996804\n174.93645703749942 39.67392974799891\n171.08512994569588 43.08080083828676\n170.71342438165473 44.32401531947587\n171.61295511776754 45.26368047534241\n175.2664832777762 47.493559308346136\n174.9779029618782 48.059648366847604\n175.5272104059404 48.93582543773451\n178.87327978240245 51.73304174965181\n178.68040387924196 52.17831785073633\n179.53449258722782 53.11891766928541\n179.84043884277344 53.40097328074292\n179.84043884277344 54.18185043334961\n179.57699342630002 54.18185043334961\n176.75222737873577 51.280653687281415\n176.4436696887102 51.215990147831555\n172.46467797606184 46.97734026831735\n171.36087667224368 47.16805865165288\n170.84100303227967 48.19415156431357\n171.51704898158212 50.90512199021725\n170.94596501222244 51.11415465907416\n170.8125343544852 52.42568794856254\n171.01961724108352 54.18185043334961\n168.87875538035456 54.18185043334962\n169.0935156956158 51.94867991879095\n168.50399043578798 50.992976571593864\n168.3082255092885 51.0075765591254\n169.01568260099765 47.855986471626714\n168.39308005351188 47.01292011188349\n167.34000755748798 47.15809403002359\n164.2812685612533 50.79888688244585\n164.26710967028285 50.78620518070249\n163.08367801584484 51.15166104897637\n160.14611399013035 54.18185043334961\n159.84043884277344 54.18185043334961\n159.84043884277344 53.50912176985284\n160.8165019345809 52.59872123996942\n160.83172513819702 52.440438908747105\n164.82520143245554 48.77948592677119\n165.1064657409055 47.66949675430108\n165.01464331153534 47.57856114285639\n168.9697373369313 44.79470713449518", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ZOOM4_DATA, Type = String, Dynamic = False, Default = \"101.00555850575881 -8.251811893308789\n100.26689781146466 -9.083823411432645\n96.94821588376446 -11.7055706436662\n97.14952437828954 -12.041382313936344\n96.52805491285025 -12.966682720529612\n92.86044240545272 -16.544219644251775\n92.62732662151383 -16.931942034302477\n91.53866577148438 -18.01345273498935\n91.53866577148438 -18.079132080078125\n92.40367025335983 -18.079132080078125\n95.1075406705432 -15.119228411072653\n96.29337173062352 -14.821083718530657\n96.82943814094435 -15.310192588474651\n99.10851323195877 -11.81065224922159\n99.74473211542617 -11.074757051175819\n100.65687383363243 -11.330171298416978\n100.92891534358786 -12.190471029630817\n100.50218747333787 -15.06775202938379\n100.69363967530582 -15.08461196434083\n101.21003061852332 -16.1673853555485\n101.1323541311826 -18.079132080078125\n103.20993706272863 -18.07913208007813\n102.94507216619829 -16.49432102529932\n103.04388583755971 -15.36280421094929\n103.93577876573967 -14.946584251559814\n103.20645455938963 -12.857154252993347\n102.89939278809051 -11.741962073613996\n103.66161937112157 -10.84108458375145\n104.87513085909818 -11.088289159509706\n111.32623838511132 -16.906543367053665\n110.8454311296485 -15.9207398306675\n111.05276202842644 -15.637280653284162\n107.38384429574796 -12.722633998834645\n107.07030639733776 -11.776062029625038\n107.71623447180899 -11.00329137161576\n108.65646228217794 -11.272057410727214\n111.17054986040327 -12.399835691203007\n111.09838606732836 -11.742250652166543\n103.68524333129122 -8.901662532088451\n103.0613351230734 -8.159367109962448\n103.3601620920359 -7.229913263901768\n111.53866577148438 -3.416931961242139\n111.53866577148438 1.9208688735961914\n91.73666130083187 1.9208688735961912\n100.71722976355093 -7.24110252685272", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ZOOM5_DATA, Type = String, Dynamic = False, Default = \"43.908292589851285 78.68948789240166\n36.46077665485198 76.64339871234114\n36.55772072677519 76.61314449012383\n36.83774577044181 75.94476513193842\n39.4416173547993 76.90145504100248\n40.51547260238483 76.93003331289938\n41.037214946794755 75.97813877782743\n40.51783220697889 75.00526185195228\n37.024478014324636 72.11292284029174\n37.132881185268786 71.4779895091023\n35.49369812011719 69.97874156058067\n35.49369812011719 69.12505340576172\n36.11511163580499 69.12505340576172\n39.54404760010683 72.78118641689032\n39.90824751318205 72.77953344608797\n43.5631239726889 76.93176630177666\n44.634376372930895 76.82986130374076\n45.044220015866216 75.81701100192825\n44.608871146357394 72.61295610542547\n44.98049654106943 71.96196945906102\n44.77724472816143 69.12505340576172\n47.34813895296208 69.12505340576172\n46.87483754124205 71.6773128434162\n47.143414369023525 72.83779067581642\n47.81772270142552 72.99149218460478\n46.9794641765016 75.20382247711967\n46.86385248821962 76.46504464002412\n47.82231825548691 77.32706566945102\n49.046840435507406 76.80940629292719\n51.08136169521118 75.48347198947219\n50.96294261285211 76.53414962442032\n51.9432160364557 77.17928553862694\n55.011115692695206 76.25372479933783\n55.38816430017073 76.95878536703015\n55.493698120117195 76.96573404912499\n55.49369812011719 78.22130940381507\n48.19641993252272 78.88079654307253\n47.19690468617096 79.3134499986603\n46.94925641753653 80.41444827629876\n51.06703892023312 84.06215352202999\n51.02816349527818 84.14658238287907\n51.65796190395037 84.90760683359858\n55.011521397353185 88.05350350902806\n54.934646439271916 88.40984920556062\n55.49369812011718 88.95965421695458\n55.49369812011719 89.12505340576172\n53.97950104846256 89.12505340576172\n52.86205011581448 87.80820579324475\n52.268570997048236 87.13402248401675\n51.60515751895773 87.27992339070175\n48.85400481589285 83.60890291293062\n48.103626145476525 83.11721498454467\n47.297077150990845 83.49284213686241\n47.157458727600584 84.41711988218638\n48.04522690632645 87.24092049168524\n47.47702313561414 87.30190959118279\n47.10642659927953 88.10346477934522\n47.2899273326785 89.12505340576172\n44.99291994072672 89.1250534057617\n45.03116352347675 88.36137031564458\n44.78170306804308 87.34885271285498\n44.51609261442175 87.24555235687862\n44.92498987707547 83.84903937372793\n44.61179239816473 83.48999357651309\n45.20590667852616 80.54946011152391\n45.084974147593186 79.23543266466608", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ZOOM6_DATA, Type = String, Dynamic = False, Default = \"80.77196448011058 33.012895162881584\n81.21186092471575 31.837541371471822\n80.47902034650072 30.810590296051608\n75.82778534972147 24.725270297745848\n75.97718510781385 24.81586173589281\n76.41683835428547 24.55856892214857\n79.01769604608533 28.383762673024933\n79.84793019016624 29.00870382023813\n80.8312111794988 28.660304325110214\n81.01714228017751 27.598205543824054\n80.47377687766536 25.070014098450248\n80.7357970600193 25.05698676517179\n81.20955209851837 23.89966845407798\n80.82815161250164 20.334665445776583\n80.87784200379288 19.519780894145413\n80.63828137748064 17.046672821044922\n83.12327207108976 17.046672821044922\n82.92920134057591 20.36720333243137\n83.36890350661261 20.779469907772125\n83.11294620832679 23.438666612985976\n83.11506194343843 24.443728542275856\n83.57938033496501 24.76936901224217\n83.08663707030969 27.700989198042954\n83.27093629800773 28.648959171696088\n84.19159305766877 28.90002306727725\n84.3998793107783 28.730784041746674\n82.83123638755089 31.791764609625165\n83.28527398678403 32.81866524565359\n84.33741291657955 33.00818671901541\n87.4523677829778 32.95240854475014\n88.43792531936423 33.142841517293164\n98.18814086914062 33.2928731743894\n98.18814086914061 34.92423204216172\n96.29529043379888 34.70211086784479\n95.07426417881625 35.12022248897971\n94.94077719573292 35.76342536504683\n92.42395134088409 35.22725442212482\n91.52481825860515 35.2487855357523\n91.15804692321888 35.97520403896833\n88.65124734364676 35.15677397051555\n87.6037754653795 35.05978906720259\n86.93666265222113 35.88087052035753\n87.34212027149833 36.89841697870343\n91.12941414785648 39.72879054498605\n91.01524582084052 40.23473721978297\n91.71685576872684 40.976619457972774\n94.97150395937732 43.68518894985178\n94.89927557263469 43.75877929986757\n94.98878425552154 44.01358141421196\n84.30530816877973 34.860548854517404\n83.14656874604808 35.124877442947465\n82.8635205207299 36.292618097432985\n83.48265942938374 39.268264478315004\n83.40071277908191 39.28212738783476\n83.06686640385995 40.166913878038066\n83.45786212817133 43.3351202170515\n83.40576966239556 43.34833926213752\n83.12994030808538 44.17553648199879\n83.40493784693047 47.42507135147585\n83.1706529369342 48.133815062464095\n83.23010049496959 49.04667282104492\n80.83654890053911 49.046672821044915\n80.89124420729823 48.399195676702746\n80.79731114646232 47.42401526788546\n80.4448383209876 47.273309896968186\n80.83352640959141 44.1013278573851\n80.73697814460571 43.90356279387443\n81.20275533901948 40.41884556257697\n80.97285031568597 39.15097089645424\n80.16411988462063 38.87221088723674\n81.00362729047318 36.455940311463166\n80.91834009073199 35.329618177026425\n79.86002110082046 34.827187078913184\n73.13548501992999 39.97002059310742\n73.17920308804621 39.536138565795476\n72.66678570019296 39.10950991359797\n76.41838182977921 36.720636085541\n76.91969499535422 35.994224143883805\n76.43003623282947 35.241912817625355\n75.55251216295277 35.233428789667656\n72.86937791472853 36.117649425226865\n72.54959657536988 35.32327601467032\n71.70763386306105 35.199742399175456\n68.89039187371151 35.77850428712437\n68.91677759683982 35.62364485877995\n68.12332641259627 34.95297978729455\n66.18814086914062 35.215269609451326\n66.18814086914062 33.99096814014214\n79.49872040972909 33.205398267976584", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ZOOM7_DATA, Type = String, Dynamic = False, Default = \"15.5 37.66666555404663\n14.746791839599608 37.36630086687434\n14.74679183959961 27.746788024902344\n46.74679183959961 27.746788024902344\n46.74679183959961 48.5\n37.66666555404663 48.5\n37.66666555404663 49.5\n42.477803224203164 53.5\n39.33333444595337 53.5\n39.33333444595337 54.5\n42.5273727021464 58.5\n41.0 58.5\n41.0 59.5\n41.160625591455116 59.746788024902344\n22.878639641207986 59.74678802490234\n23.0 59.5\n23.0 58.5\n22.404971368252205 58.49999999999999\n24.666667461395264 54.5\n24.666667461395264 53.5\n23.264814069201424 53.50000000000001\n26.333332538604736 49.5\n26.333332538604736 48.5\n15.5 48.5", Scope = Private
	#tag EndConstant


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
