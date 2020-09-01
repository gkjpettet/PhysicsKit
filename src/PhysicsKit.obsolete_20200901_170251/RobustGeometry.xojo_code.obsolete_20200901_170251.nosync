#tag Class
Protected Class RobustGeometry
	#tag Method, Flags = &h0, Description = 506572666F726D732063726F73732070726F64756374206F6E20666F7572207072696D69746976657320616E642072657475726E732074686520726573756C742061732061206E6577204164617074697665446563696D616C2E
		Shared Function Cross(ax As Double, ay As Double, bx As Double, by As Double) As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Performs cross product on four primitives and also allocates a new AdaptiveDecimal
		  ' with the appropriate capacity to store the result.
		  '
		  ' - Parameter ax: The x value of the vector a.
		  ' - Parameter ay: The y value of the vector a.
		  ' - Parameter bx: The x value of the vector b.
		  ' - Parameter by: The y value of the vector b.
		  '
		  ' - Returns: A new AdaptiveResult.
		  ///
		  
		  Return Cross(ax, ay, bx, by, Nil)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 506572666F726D73207468652063726F73732070726F64756374206F662074776F20766563746F727320612C20622C2074686174206973206178202A206279202D206179202A20627820627574207769746820657874656E64656420707265636973696F6E20616E642073746F72657320746865203420636F6D706F6E656E7420726573756C7420696E2074686520676976656E204164617074697665446563696D616C2060726573756C7460206F7220637265617465732061206E6577206F6E652069662060726573756C7460206973204E696C2E
		Shared Function Cross(ax As Double, ay As Double, bx As Double, by As Double, result As PhysicsKit.AdaptiveDecimal) As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Performs the cross product of two vectors a, b, that is ax * by - ay * bx but with extended precision
		  ' and stores the 4 component result in the given AdaptiveDecimal `result`.
		  ' In the same way as with `AdaptiveDecimal.Sum(AdaptiveDecimal, AdaptiveDecimal)` if `result` is Nil
		  ' a new one is allocated, otherwise the existing is cleared and used.
		  '
		  ' - Parameter ax: The x value of the vector a.
		  ' - Parameter ay: The y value of the vector a.
		  ' - Parameter bx: The x value of the vector b.
		  ' - Parameter by: The y value of the vector b.
		  ' - Parameter result: The AdaptiveDecimal in which the cross product is stored.
		  '
		  ' - Returns: AdaptiveDecimal.
		  ///
		  
		  Var axby As Double = ax * by
		  Var aybx As Double = bx * ay
		  Var axbyTail As Double = AdaptiveDecimal.GetErrorComponentFromProduct(ax, by, axby)
		  Var aybxTail As Double = AdaptiveDecimal.GetErrorComponentFromProduct(bx, ay, aybx)
		  
		  // Result can be Nil in which case AdaptiveDecimal.FromDiff will allocate a new one.
		  Var newResult As AdaptiveDecimal = AdaptiveDecimal.FromDiff(axbyTail, axby, aybxTail, aybx, result)
		  
		  Return newResult
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F6275737420736964652D6F662D6C696E6520746573742E20436F6D7075746573207468652073616D652076616C7565207769746820605365676D656E742E4765744C6F636174696F6E28566563746F72322C20566563746F72322C20566563746F723229602062757420776974682068696768657220707265636973696F6E2E
		Shared Function GetLocation(point As PhysicsKit.Vector2, linePoint1 As PhysicsKit.Vector2, linePoint2 As PhysicsKit.Vector2) As Double
		  ///
		  ' Robust side-of-line test.
		  ' Computes the same value with `Segment.GetLocation(Vector2, Vector2, Vector2)` but with
		  ' enough precision so the sign of the result is correct for any Vector2s pa, pb, pc.
		  ' This implementation uses more precision as-needed only for the hardest cases.
		  ' For the majority of inputs this will be only slightly slower than the corresponding call
		  ' to `Segment.GetLocation(Vector2, Vector2, Vector2)` but in the hard cases can be 5-25 times slower.
		  '
		  ' - Parameter point: The point.
		  ' - Parameter linePoint1: The first point of the line.
		  ' - Parameter linePoint2: The second point of the line.
		  '
		  ' - Returns: Double.
		  ///
		  
		  // This code is based on the original code by Jonathan Richard Shewchuk
		  // For more details about the correctness and error bounds check the note
		  // in the AdaptiveDecimal class and the corresponding paper of the author.
		  
		  // In the beginning try the simple-straightforward computation with floating point values
		  // and no extra precision, as in `Segment.GetLocation`.
		  Var detLeft As Double = (point.X - linePoint2.X) * (linePoint1.Y - linePoint2.Y)
		  Var detRight As Double = (point.Y - linePoint2.Y) * (linePoint1.X - linePoint2.X)
		  Var det As Double = detLeft - detRight
		  
		  If detLeft = 0 Or detRight = 0 Or (detLeft > 0) <> (detRight > 0) Then
		    Return det
		  End If
		  
		  Var detSum As Double = Abs(detLeft + detRight)
		  If Abs(det) >= ERROR_BOUND_A * detSum Then
		    // This will cover the vast majority of cases.
		    Return det
		  End If
		  
		  // For the few harder cases we need to use the adaptive precision implementation.
		  Return GetLocationAdaptive(point, linePoint1, linePoint2, detSum)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 54686520657874656E64656420707265636973696F6E20696D706C656D656E746174696F6E20666F722074686520736964652D6F662D6C696E6520746573742E
		Shared Function GetLocationAdaptive(point As PhysicsKit.Vector2, linePoint1 As PhysicsKit.Vector2, linePoint2 As PhysicsKit.Vector2, detSum As Double) As Double
		  ///
		  ' The extended precision implementation for the side-of-line test.
		  '
		  ' - Parameter point: The point.
		  ' - Parameter linePoint1: The first point of the line.
		  ' - Parameter linePoint2: The second point of the line.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Var acx As Double = point.X - linePoint2.X
		  Var acy As Double = point.Y - linePoint2.Y
		  Var bcx As Double = linePoint1.X - linePoint2.X
		  Var bcy As Double = linePoint1.Y - linePoint2.Y
		  
		  // Calculate the cross product but with more precision than before
		  // But don't bother yet to perform the differences acx, acy, bcx, bcy with full precision.
		  Var B As AdaptiveDecimal = RobustGeometry.Cross(acx, acy, bcx, bcy)
		  
		  Var det As Double = B.GetEstimation
		  Var errorBound As Double = ERROR_BOUND_B * detSum
		  If Abs(det) >= errorBound Then Return det
		  
		  // Since we need more precision to produce the result at this point
		  // we have to calculate the differences with full precision.
		  Var acxTail As Double = AdaptiveDecimal.GetErrorComponentFromDifference(point.X, linePoint2.X, acx)
		  Var acyTail As Double = AdaptiveDecimal.GetErrorComponentFromDifference(point.Y, linePoint2.Y, acy)
		  Var bcxTail As Double = AdaptiveDecimal.GetErrorComponentFromDifference(linePoint1.X, linePoint2.X, bcx)
		  Var bcyTail As Double = AdaptiveDecimal.GetErrorComponentFromDifference(linePoint1.Y, linePoint2.Y, bcy)
		  
		  If acxTail = 0 And acyTail = 0 And bcxTail = 0 And bcyTail = 0 Then
		    // Trivial case: the extra precision was not needed after all.
		    Return det
		  End If
		  
		  errorBound = ERROR_BOUND_C * detSum + RESULT_ERROR_BOUND * Abs(det)
		  // But don't use full precision to calculate the following cross products with the tail values.
		  det = det + ((acx * bcyTail + bcy * acxTail) - (acy * bcxTail + bcx * acyTail))
		  
		  If Abs(det) >= errorBound Then Return det
		  
		  // This case is so rare that we don't know if there are any inputs going into it
		  // At this point we have to go full out and calculate all the products with full precision.
		  
		  // Re-usable buffer to store the results of the 3 cross products needed below
		  Var buffer As AdaptiveDecimal = New AdaptiveDecimal(4)
		  
		  Call RobustGeometry.Cross(acxTail, bcx, acyTail, bcy, buffer)
		  Var C1 As AdaptiveDecimal = B.Sum(buffer)
		  
		  Call RobustGeometry.Cross(acx, bcxTail, acy, bcyTail, buffer)
		  Var C2 As AdaptiveDecimal = C1.Sum(buffer)
		  
		  Call RobustGeometry.Cross(acxTail, bcxTail, acyTail, bcyTail, buffer)
		  Var D As AdaptiveDecimal = C2.Sum(buffer)
		  
		  // Return the most significant component of the last buffer D.
		  // Reminder: components are non-overlapping so this is OK.
		  Return D.Get(D.Size - 1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Initialise()
		  ///
		  ' Initializer that computes the necessary splitter value and error bounds based on the machine epsilon.
		  ' Also instantiates the internal AdaptiveDecimal variables.
		  ///
		  
		  // Calculate the splitter and epsilon.
		  Var everyOther As Boolean = True
		  Var epsilon As Double = 1.0
		  Var splitterMut As Int32 = 1
		  
		  While 1.0 + epsilon > 1.0
		    If everyOther Then splitterMut = splitterMut * 2
		    
		    epsilon = epsilon * 0.5
		    everyOther = Not everyOther
		  Wend
		  
		  splitterMut = splitterMut + 1.0
		  
		  mSPLITTER = splitterMut
		  
		  // Compute bounds.
		  mRESULT_ERROR_BOUND = (3 + 8 * epsilon) * epsilon
		  mERROR_BOUND_A = (3 + 16 * epsilon) * epsilon
		  mERROR_BOUND_B = (2 + 12 * epsilon) * epsilon
		  mERROR_BOUND_C = (9 + 64 * epsilon) * epsilon * epsilon
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This class provides geometric routines that have guarantees about some properties
		of their floating point results and operations.
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h21, Description = 4572726F7220626F756E6473207573656420746F2061646170746976656C7920757365206173206D75636820707265636973696F6E20697320726571756972656420666F72206120636F727265637420726573756C742E
		#tag Getter
			Get
			  Return mERROR_BOUND_A
			End Get
		#tag EndGetter
		Private Shared ERROR_BOUND_A As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21, Description = 4572726F7220626F756E6473207573656420746F2061646170746976656C7920757365206173206D75636820707265636973696F6E20697320726571756972656420666F72206120636F727265637420726573756C742E
		#tag Getter
			Get
			  Return mERROR_BOUND_B
			End Get
		#tag EndGetter
		Private Shared ERROR_BOUND_B As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21, Description = 4572726F7220626F756E6473207573656420746F2061646170746976656C7920757365206173206D75636820707265636973696F6E20697320726571756972656420666F72206120636F727265637420726573756C742E
		#tag Getter
			Get
			  Return mERROR_BOUND_C
			End Get
		#tag EndGetter
		Private Shared ERROR_BOUND_C As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared mERROR_BOUND_A As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mERROR_BOUND_B As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mERROR_BOUND_C As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mRESULT_ERROR_BOUND As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mSPLITTER As Int32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21, Description = 4572726F7220626F756E6473207573656420746F2061646170746976656C7920757365206173206D75636820707265636973696F6E20697320726571756972656420666F72206120636F727265637420726573756C742E
		#tag Getter
			Get
			  Return mRESULT_ERROR_BOUND
			End Get
		#tag EndGetter
		Private Shared RESULT_ERROR_BOUND As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 4120636F6E7374616E74207468617420204164617074697665446563696D616C207573657320746F2073706C697420446F75626C6573207768656E2063616C63756C6174696E67206D756C7469706C69636174696F6E206572726F72732E
		#tag Getter
			Get
			  Return mSPLITTER
			End Get
		#tag EndGetter
		Shared SPLITTER As Int32
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mSPLITTER"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
