#tag Class
Protected Class AdaptiveDecimal
	#tag Method, Flags = &h0, Description = 417070656E64732061206E657720636F6D706F6E656E7420616674657220616C6C20746865206578697374696E6720636F6D706F6E656E74732E20526169736573204F75744F66426F756E6473457863657074696F6E2069662074686973204164617074697665446563696D616C20686173206E6F206D6F72652063617061636974792E
		Function Append(value As Double) As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Appends a new component after all the existing components.
		  '
		  ' - Parameter value: The component.
		  '
		  ' - Returns: This AdaptiveDecimal.
		  '
		  ' - Raises: OutOfBoundsException if this AdaptiveDecimal has no capacity for more components.
		  ///
		  
		  If mSize >= Capacity then
		    Raise New OutOfBoundsException(Messages.ADAPTIVE_DECIMAL_INSUFFICIENT_CAPACITY)
		  End If
		  
		  Components(mSize) = value
		  mSize = mSize + 1
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 417070656E64732061206E657720636F6D706F6E656E7420616674657220616C6C20746865206578697374696E6720636F6D706F6E656E74732C20627574206F6E6C79206966206974206861732061206E6F6E207A65726F2076616C75652E
		Function AppendNonZero(value As Double) As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Appends a new component after all the existing components, but only if it has a non zero value.
		  '
		  ' - Parameter value: The component.
		  '
		  ' - Returns: This AdaptiveDecimal.
		  ///
		  
		  If value <> 0.0 Then Call Append(value)
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D6178696D756D206E756D626572206F6620636F6D706F6E656E74732074686973204164617074697665446563696D616C2063616E20686F6C642E
		Function Capacity() As Integer
		  ///
		  ' - Returns: The maximum number of components this AdaptiveDecimal can hold.
		  ///
		  
		  Return Self.Components.Count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120626F6F6C65616E2076616C75652064657363726962696E672069662074686973204164617074697665446563696D616C20697320612076616C696420726570726573656E746174696F6E2E
		Function CheckInvariants() As Boolean
		  ///
		  ' Returns a boolean value describing if this AdaptiveDecimal is a valid representation 
		  ' as described in the `About` note for this class.
		  ' Checks for the magnitude and non-overlapping property.
		  ' The invariants can be violated if bad input components are appended to this AdaptiveDecimal.
		  ' The `Append` methods do not check for those conditions because there is a big overhead for the check.
		  ' The output of the exposed operations must satisfy the invariants, given that their input also does so.
		  '
		  ' - Returns: True if this AdaptiveDecimal satisfies the described invariants.
		  ///
		  
		  If mSize = 0 Then Return True
		  
		  // Holds the last value that needs to be checked.
		  // This skips all 0 except for maybe the first component (which is ok to be 0).
		  Var lastValue As Double = Self.Get(0)
		  
		  Var iLimit As Integer = mSize - 1
		  For i As Integer = 1 To iLimit
		    Var currentValue As Double = Self.Get(i)
		    
		    If currentValue <> 0 then
		      // The magnitude of previous non-zero elements must be smaller.
		      If Abs(currentValue) < Abs(lastValue) Then Return False
		      
		      // A number n in the floating point representation can be written as
		      // n = +/- 0.1xxxxx...x * 2 ^ exp
		      //   mantissa ^~~~~~~~^       ^~~ exponent
		      // where the above x are the binary digits either 0 or 1 except for the first digit 
		      // after the decimal point which is always 1. The exponent part is essentially a shift 
		      // of the decimal point
		      
		      // If we have two numbers a, b with a > b then they're non-overlapping if a's lower set bit to
		      // be to the left of b's higher set bit *after those have been scaled by their exponents accordingly*.
		      // The sign is irrelevant for Self.
		      // a = -0.10101011 * 2^5 = -10101.011
		      // b = 0.111001 * 2^-1 = 0.0111001
		      
		      // If we align a and b we can see that they overlap
		      // -10101.011
		      //      0.0111001
		      //         ^^ overlap
		      // They would also overlap if b's exponent was -2 (for a single bit)
		      // only if b's exponent where less than -2 then there would be no overlap.
		      
		      // Get the value of the exponents
		      Var exp1 As Int32 = MathsKit.GetExponent(lastValue)
		      Var exp2 As Int32 = MathsKit.GetExponent(currentValue)
		      
		      // Get the significants (the binary representation of the mantissa part).
		      // The first, always 1 bit is not actually stored, so we'll add it ourselves.
		      Var mantissa1 As Int64 = (MathsKit.DoubleToBits(lastValue) And SIGNIF_BIT_MASK) Or IMPLICIT_MANTISSA_BIT
		      Var mantissa2 As Int64 = (MathsKit.DoubleToBits(currentValue) And SIGNIF_BIT_MASK) Or IMPLICIT_MANTISSA_BIT
		      
		      // We want to find the logical location of the most significant bit in the smallest component
		      // and of the least significant bit in the largest component, accounting for the exponents as well
		      // In the following convention bit numbering is done from the higher to the lowest bit.
		      // Note that the first bit of the double representation won't be the first in the long below.
		      // This is logical since the mantissa is fewer bits wide than a long, but it's not a problem
		      // since both the msd and lsd will have the same difference.
		      Var msd1 As Int32 = MathsKit.NumberOfLeadingZeros(mantissa1)
		      Var lsd2 As Int32 = 64 - MathsKit.NumberOfTrailingZeros(mantissa2) - 1
		      
		      // Apply the exponents.
		      // The exponents are essentially shifts in the bit positions.
		      msd1 = msd1 - exp1
		      lsd2 = lsd2 - exp2
		      
		      // Finally check for the non-overlapping property.
		      // We want the lower bit of the currentValue's representation to be higher than
		      // lastValue's higher bit.
		      If Not(lsd2 < msd1) Then Return False
		      
		      // Update the last non-zero value.
		      lastValue = currentValue
		    End If
		  Next i
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F7665732074686520636F6D706F6E656E7473206F662074686973204164617074697665446563696D616C20616E642072657475726E732074686973204164617074697665446563696D616C2E
		Function Clear() As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Removes the components of this AdaptiveDecimal.
		  '
		  ' - Returns This AdaptiveDecimal.
		  ///
		  
		  mSize = 0
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 496E7465726E616C2068656C70657220636F6E7374727563746F7220746F2063726561746520616E204164617074697665446563696D616C20776974682074776F20636F6D706F6E656E74732E
		Protected Sub Constructor(a0 As Double, a1 As Double)
		  ///
		  ' Internal helper constructor to create an AdaptiveDecimal with two components.
		  '
		  ' - Parameter a0: The component with the smallest magnitude.
		  ' - Parameter a1: The component with the largest magnitude.
		  ///
		  
		  Self.Components.AddRow(a0)
		  Self.Components.AddRow(a1)
		  mSize = 2
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577204164617074697665446563696D616C20776974682074686520737065636966696564206C656E6774682E2054686520696E697469616C204164617074697665446563696D616C206372656174656420646F6573206E6F7420636F6E7461696E20616E7920636F6D706F6E656E74732E
		Sub Constructor(length As Integer)
		  ///
		  ' Creates a new AdaptiveDecimal with the specified length.
		  ' The initial AdaptiveDecimal created does not contain any components.
		  ' 
		  ' - Parameter length: The maximum number of components this AdaptiveDecimal can store.
		  '
		  ' - Raises: Inva;idArgumentException if `length` is <= 0.
		  ///
		  
		  If length <= 0 Then Raise New InvalidArgumentException(Messages.ADAPTIVE_DECIMAL_INVALID_LENGTH)
		  
		  Self.Components.ResizeTo(length - 1)
		  mSize = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4465657020636F707920636F6E7374727563746F722E
		Sub Constructor(other As PhysicsKit.AdaptiveDecimal)
		  ///
		  ' Deep copy constructor.
		  '
		  ' - Parameter other: The AdaptiveDecimal to copy from.
		  ///
		  
		  For Each d As Double In other.Components
		    Self.Components.AddRow(d)
		  Next d
		  mSize = other.Size
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206465657020636F7079206F662074686973204164617074697665446563696D616C2E
		Function Copy() As PhysicsKit.AdaptiveDecimal
		  ///
		  ' - Returns: A deep copy of this AdaptiveDecimal.
		  ///
		  
		  Return New AdaptiveDecimal(Self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F706965732074686520636F6D706F6E656E7473206F6620616E6F74686572204164617074697665446563696D616C20696E746F20746869732E20546865206361706163697479206F662074686973204164617074697665446563696D616C206973206E6F74206D6F64696669656420616E642069742073686F756C6420626520656E6F75676820746F20686F6C6420616C6C2074686520636F6D706F6E656E74732E20526169736573204F75744F66426F756E6473457863657074696F6E2E
		Sub CopyFrom(other As PhysicsKit.AdaptiveDecimal)
		  ///
		  ' Copies the components of another AdaptiveDecimal into this.
		  ' The capacity of this AdaptiveDecimal is not modified and it should
		  ' be enough to hold all the components.
		  ' 
		  ' - Parameter other: The AdaptiveDecimal to copy from.
		  '
		  ' - Raises: OutOfBoundsException if other.Components is too large to fit into Self.Components.
		  ///
		  
		  If other.Components.Count > Self.Components.Count Then
		    Raise New OutOfBoundsException(Messages.ADAPTIVE_DECIMAL_OTHER_COMPONENTS_TOO_LARGE)
		  End If
		  
		  Var index As Integer = 0
		  For Each d As Double In other.Components
		    Self.Components(index) = d
		    index = index + 1
		  Next d
		  
		  mSize = other.Size
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52616973657320612052756E74696D65457863657074696F6E2069662060436865636B496E76617269616E74732829602072657475726E732046616C73652E
		Sub EnsureInvariants()
		  ///
		  ' - Raises: RuntimeException if `CheckInvariants()` returns False.
		  ///
		  
		  If Not CheckInvariants Then
		    Raise New RuntimeException(Messages.ADAPTIVE_DECIMAL_INVALID_REPRESENTATION)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FromDiff(a As Double, b As Double) As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Creates an AdaptiveDecimal that holds the result of the difference of two double values.
		  ' 
		  ' - Parameter a: The first value.
		  ' - Parameter b: The second value.
		  '
		  ' - Returns: A new AdaptiveDecimal that holds the resulting difference.
		  ///
		  
		  Var diff As Double = a - b
		  Return New AdaptiveDecimal(GetErrorComponentFromDifference(a, b, diff), diff)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 476976656E2074776F20756E726F6C6C656420657870616E73696F6E73202861302C2061312920616E64202862302C2062312920706572666F726D732074686520646966666572656E6365202861302C20613129202D202862302C2062312920616E642073746F72657320746865203420636F6D706F6E656E7420726573756C7420696E2074686520676976656E204164617074697665446563696D616C2060726573756C7460206F722061206E6577206F6E65206966204E696C206973207061737365642E
		Shared Function FromDiff(a0 As Double, a1 As Double, b0 As Double, b1 As Double, result As PhysicsKit.AdaptiveDecimal) As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Given two unrolled expansions (a0, a1) and (b0, b1) performs the difference
		  ' (a0, a1) - (b0, b1) and stores the 4 component result in the given AdaptiveDecimal `result`.
		  ' In the same way as with `AdaptiveDecimal.Sum(AdaptiveDecimal, AdaptiveDecimal)` if `result` is Nil.
		  ' a new one is allocated, otherwise the existing is cleared and used.
		  ' Does not perform zero elimination.
		  ' This is also a helper method to allow fast computation of the cross product
		  ' without the overhead of creating new AdaptiveDecimal and performing
		  ' the generalized sum procedure.
		  '
		  ' - Parameter a0: The first component of a.
		  ' - Parameter a1: The second component of a.
		  ' - Parameter b0: The first component of b.
		  ' - Parameter b1: The second component of b.
		  ' - Parameter result: The AdaptiveDecimal in which the difference is stored.
		  '
		  ' - Returns: AdaptiveDecimal.
		  ///
		  
		  // The exact order of those operations is necessary for correct functionality.
		  // Allocate a new instance of sufficient size if result is Nil or just clear.
		  If result = Nil Then
		    result = New AdaptiveDecimal(4)
		  Else
		    Call result.Clear
		  End If
		  
		  // x0-x1-x2-x3 store the resulting components with increasing magnitude.
		  Var x0, x1, x2, x3 As Double
		  
		  // Variable to store immediate results for each pair of Diff/Sum.
		  Var imm As Double
		  
		  // Variables to store immediate results across the two pairs .
		  Var imm1, imm2 As Double
		  
		  // Diff (a0, a1) - b0, result = (x0, imm1, imm2)
		  imm = a0 - b0
		  x0 = AdaptiveDecimal.GetErrorComponentFromDifference(a0, b0, imm)
		  imm2 = a1 + imm
		  imm1 = AdaptiveDecimal.GetErrorComponentFromSum(a1, imm, imm2)
		  
		  // Diff (imm1, imm2) - b1, result = (x1, x2, x3)
		  imm = imm1 - b1
		  x1 = AdaptiveDecimal.GetErrorComponentFromDifference(imm1, b1, imm)
		  x3 = imm2 + imm
		  x2 = AdaptiveDecimal.GetErrorComponentFromSum(imm2, imm, x3)
		  
		  Call result.Append(x0)
		  Call result.Append(x1)
		  Call result.Append(x2)
		  Call result.Append(x3)
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E204164617074697665446563696D616C207468617420686F6C64732074686520726573756C74206F66207468652070726F64756374206F662074776F20646F75626C652076616C7565732E
		Shared Function FromProduct(a As Double, b As Double) As PhysicsKit.AdaptiveDecimal
		  ///
		  '  Creates an AdaptiveDecimal that holds the result of the product of two double values.
		  ' 
		  ' - Parameter a: The first value.
		  ' - Parameter b: The second value.
		  '
		  ' - Returns: A new AdaptiveDecimal that holds the resulting product.
		  ///
		  
		  Var product As Double = a * b
		  Return New AdaptiveDecimal(GetErrorComponentFromProduct(a, b, product), a * b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FromSum(a As Double, b As Double) As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Creates an AdaptiveDecimal that holds the result of the addition of two double values.
		  '
		  ' - Parameter a: The first value.
		  ' - Parameter b: The second value.
		  '
		  ' - Returns: A new AdaptiveDecimal that holds the resulting sum.
		  ///
		  
		  Var sum As Double = a + b
		  Return New AdaptiveDecimal(GetErrorComponentFromSum(a, b, sum), sum)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520636F6D706F6E656E74206174207468652073706563696669656420696E6465782E20526169736573204F75744F66426F756E6473457863657074696F6E2E
		Function Get(index As Integer) As Double
		  ///
		  ' - Parameter index: The index of the component to return.
		  '
		  ' - Returns: The component at the specified position.
		  '
		  ' - Raises: OutOfBoundsException if the index is not in the range [0, size].
		  ///
		  
		  If index < 0 Or index >= mSize Then
		    Raise New OutOfBoundsException(Messages.ADAPTIVE_DECIMAL_INDEX_OUT_OF_RANGE)
		  End If
		  
		  Return Self.Components(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 476976656E2074776F2076616C75657320612C206220616E6420746865697220646966666572656E6365203D20666C2861202D2062292063616C63756C61746573207468652076616C7565206572726F7220666F7220776869636820666C286129202D20666C286229203D20666C2861202D206229202B20666C286572726F72292E
		Shared Function GetErrorComponentFromDifference(a As Double, b As Double, diff As Double) As Double
		  ///
		  ' Given two values a, b and their difference = fl(a - b) calculates the value error for which
		  ' fl(a) - fl(b) = fl(a - b) + fl(error).
		  '
		  ' - Parameter a: The first value.
		  ' - Parameter b: The second value.
		  ' - Parameter diff: Their difference, must always be diff = fl(a - b)
		  '
		  ' - Returns The error as a Double.
		  ///
		  
		  // The exact order of those operations is necessary for correct functionality.
		  Var bvirt As Double = a - diff
		  Var avirt As Double = diff + bvirt
		  Var bround As Double = bvirt - b
		  Var around As Double = a - avirt
		  Var error As Double = around + bround
		  
		  Return error
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 476976656E2074776F2076616C75657320612C206220616E642074686569722070726F64756374203D20666C2861202A2062292063616C63756C61746573207468652076616C7565206572726F7220666F7220776869636820666C286129202A20666C286229203D20666C2861202A206229202B20666C286572726F72292E
		Shared Function GetErrorComponentFromProduct(a As Double, b As Double, product As Double) As Double
		  ///
		  ' Given two values a, b and their product = fl(a * b) calculates the value error for which
		  ' fl(a) * fl(b) = fl(a * b) + fl(error).
		  ' 
		  ' - Parameter a: The first value.
		  ' - Parameter b: The second value.
		  ' - Parameter product: Their product, must always be product = fl(a * b)
		  '
		  ' - Returns: The error as a Double.
		  ///
		  
		  // The exact order of those operations is necessary for correct functionality.
		  
		  // Split a in two parts.
		  Var ac As Double = RobustGeometry.SPLITTER * a
		  Var abig As Double = ac - a
		  Var ahi As Double = ac - abig
		  Var alo As Double = a - ahi
		  
		  // Split b in two parts.
		  Var bc As Double = RobustGeometry.SPLITTER * b
		  Var bbig As Double = bc - b
		  Var bhi As Double = bc - bbig
		  Var blo As Double = b - bhi
		  
		  Var error1 As Double = product - (ahi * bhi)
		  Var error2 As Double = error1 - (alo * bhi)
		  Var error3 As Double = error2 - (ahi * blo)
		  Var error As Double = alo * blo - error3
		  
		  Return error
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 476976656E2074776F2076616C75657320612C206220616E642074686569722073756D203D20666C2861202B2062292063616C63756C61746573207468652076616C7565206572726F7220666F7220776869636820666C286129202B20666C286229203D20666C2861202B206229202B20666C286572726F72292E
		Shared Function GetErrorComponentFromSum(a As Double, b As Double, sum As Double) As Double
		  ///
		  ' Given two values a, b and their sum = fl(a + b) calculates the value error for which
		  ' fl(a) + fl(b) = fl(a + b) + fl(error).
		  '
		  ' - Parameter a: The first value.
		  ' - Parameter b: The second value.
		  ' - Parameter sum: Their sum, must always be sum = fl(a + b)
		  '
		  ' - Returns: The error as a Double.
		  ///
		  
		  // The exact order of those operations is necessary for correct functionality .
		  Var bvirt As Double = sum - a
		  Var avirt As Double = sum - bvirt
		  Var bround As Double = b - bvirt
		  Var around As Double = a - avirt
		  Var error As Double = around + bround
		  
		  Return error
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEstimation() As Double
		  ///
		  ' Computes an approximation for the value of this AdaptiveDecimal that fits in a double.
		  '
		  ' - Returns: The approximation as a Double.
		  ///
		  
		  Var value As Double = 0.0
		  
		  Var iLimit As Integer = mSize - 1
		  For i As Integer = 0 To iLimit
		    value = value + Components(i)
		  Next i
		  
		  Return value
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4E65676174657320746865206C6F676963616C2076616C7565206F662074686973204164617074697665446563696D616C2E2043616E206265207573656420776974682053756D20746F20706572666F726D207375627472616374696F6E2E2052657475726E732074686973204164617074697665446563696D616C2E
		Function Negate() As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Negates the logical value of this AdaptiveDecimal.
		  ' This can be used with Sum to perform subtraction.
		  '
		  ' - Returns: This AdaptiveDecimal.
		  ///
		  
		  Var iLimit As Integer = mSize - 1
		  For i As Integer = 0 To iLimit
		    Components(i) = -Components(i)
		  Next i
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 456E73757265732074686973204164617074697665446563696D616C20686173206174206C65617374206F6E6520636F6D706F6E656E742E20546861742069732C20617070656E647320746865207A65726F2076616C7565206966207468657265206172652063757272656E746C79207A65726F20636F6D706F6E656E74732E
		Function Normalise() As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Ensures this AdaptiveDecimal has at least one component.
		  ' That is, appends the zero value if there are currently zero components.
		  '
		  ' - Returns: This AdaptiveDecimal.
		  ///
		  
		  If mSize = 0 Then Call Append(0.0)
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320616C6C2074686520636F6D706F6E656E74732077697468207A65726F2076616C75652066726F6D2074686973204164617074697665446563696D616C20616E642072657475726E732074686973204164617074697665446563696D616C2E
		Function RemoveZeros() As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Removes all the components with zero value from this AdaptiveDecimal.
		  '
		  ' - Return: This AdaptiveDecimal.
		  ///
		  
		  Var limit As Integer = mSize - 1
		  Call Self.Clear
		  
		  For i As Integer = 0 To limit
		    Call AppendNonZero(Components(i))
		  Next i
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206E756D626572206F6620636F6D706F6E656E74732074686973204164617074697665446563696D616C2063616E20686F6C642E
		Function Size() As Int32
		  ///
		  ' Returns: The number of components this AdaptiveDecimal can hold.
		  ///
		  
		  Return mSize
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 506572666F726D73206164646974696F6E20616E6420616C736F20616C6C6F63617465732061206E6577204164617074697665446563696D616C207769746820746865200A617070726F70726961746520636170616369747920746F2073746F72652074686520726573756C742E2052657475726E7320746865206E6577204164617074697665446563696D616C2E
		Function Sum(f As PhysicsKit.AdaptiveDecimal) As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Performs addition and also allocates a new AdaptiveDecimal with the 
		  ' appropriate capacity to store the result.
		  '
		  ' - Parameter f: The AdaptiveDecimal to sum with this AdaptiveDecimal.
		  '
		  ' - Returns: A new AdaptiveDecimal that holds the result of the addition
		  ///
		  
		  Return Sum(f, Nil)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 506572666F726D7320746865206164646974696F6E206F662074686973204164617074697665446563696D616C20776974682074686520676976656E204164617074697665446563696D616C2060666020616E642073746F7265732074686520726573756C7420696E207468652070726F7669646564204164617074697665446563696D616C2060726573756C74602E2049662060726573756C7460206973204E696C20697420637265617465732061206E6577204164617074697665446563696D616C2E
		Function Sum(f As PhysicsKit.AdaptiveDecimal, result As PhysicsKit.AdaptiveDecimal) As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Performs the addition of this AdaptiveDecimal with the given AdaptiveDecimal `f`
		  ' and stores the result in the provided AdaptiveDecimal `result`.
		  ' If `result` is Nil it allocates a new AdaptiveDecimal with the 
		  ' appropriate capacity to store the result. Otherwise the components of `result`
		  ' are cleared and the resulting value is stored there, assuming there is enough capacity.
		  ' 
		  ' Be careful that it must be `f` ≠ `result` ≠ `Self`.
		  '
		  ' - Parameter f: The AdaptiveDecimal to sum with this AdaptiveDecimal.
		  ' - Parameter result: The AdaptiveDecimal in which the sum is stored or Nil to allocate a new one.
		  '
		  ' - Returns: The result as an AdaptiveDecimal.
		  ///
		  
		  // The following algorithm performs addition of two AdaptiveDecimals
		  // It is based on the original fast_expansion_sum_zeroelim function written
		  // by the author of the said paper.
		  
		  // Allocate a new instance of sufficient size if result is null or just clear.
		  If result = Nil Then
		    result = New AdaptiveDecimal(mSize + f.Size)
		  Else
		    Call result.Clear
		  End If
		  
		  Var e As AdaptiveDecimal = Self
		  
		  // eIndex and fIndex are used to iterate the components of e and f accordingly.
		  Var eIndex As Int32 = 0
		  Var fIndex As Int32 = 0
		  
		  // enow = e[eIndex] and fnow = f[fIndex] is the current component examined for e and f
		  Var enow As Double = e.Get(eIndex)
		  Var fnow As Double = f.Get(fIndex)
		  
		  // sum will be used to store the sum needed for the getErrorComponentFromSum method
		  // error will store the error as returned from getErrorComponentFromSum method
		  // carry will store the value that will be summed in the next sum.
		  Var carry, sum, error As Double
		  
		  // Each time we need the next component in increasing magnitude.
		  // (fnow > enow) == (fnow > -enow)
		  If Abs(enow) <= Abs(fnow) Then
		    carry = enow
		    eIndex = eIndex + 1
		    
		    If eIndex >= e.Size Then Return SumEpilogue(carry, f, fIndex, result)
		    
		    enow = e.Get(eIndex)
		  Else
		    carry = fnow
		    fIndex = fIndex + 1
		    
		    If fIndex >= f.Size Then Return SumEpilogue(carry, e, eIndex, result)
		    
		    fnow = f.Get(fIndex)
		  End If
		  
		  While True
		    If Abs(enow) <= Abs(fnow) Then
		      // Perform the addition with the carry from the previous iteration.
		      sum = carry + enow
		      error = GetErrorComponentFromSum(carry, enow, sum)
		      eIndex = eIndex + 1
		      carry = sum
		      
		      // append + zero elimination
		      Call result.AppendNonZero(error)
		      
		      // If this AdaptiveDecimal has no more components then move to the epilogue.
		      If eIndex >= e.Size Then Return SumEpilogue(carry, f, fIndex, result)
		      
		      enow = e.Get(eIndex)
		    Else
		      // Perform the addition with the carry from the previous iteration.
		      sum = carry + fnow
		      error = GetErrorComponentFromSum(carry, fnow, sum)
		      fIndex = fIndex + 1
		      carry = sum
		      
		      // append + zero elimination
		      Call result.AppendNonZero(error)
		      
		      // If this AdaptiveDecimal has no more components then move to the epilogue.
		      If fIndex >= f.Size Then Return sumEpilogue(carry, e, eIndex, result)
		      
		      fnow = f.Get(fIndex)
		    End If                
		  Wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SumEpilogue(carry As Double, e As PhysicsKit.AdaptiveDecimal, eIndex As Int32, result As PhysicsKit.AdaptiveDecimal) As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Helper method to implement the sum procedure.
		  ' Sums the remaining components of a single AdaptiveDecimal to the result
		  ' and the initial carry value from previous computations.
		  '
		  ' - Parameter carry: The carry from previous computations.
		  ' - Parameter e: The AdaptiveDecimal that probably has more components.
		  ' - Parameter eIndex: The index to the next component of e that has to be examined.
		  ' - Parameter result: The AdaptiveDecimal in which the result is stored.
		  '
		  ' - Returns: The result as an AdaptiveDecimal.
		  ///
		  
		  Do
		    Var enow As Double = e.Get(eIndex)
		    Var sum As Double = carry + enow
		    Var error As Double = GetErrorComponentFromSum(carry, enow, sum)
		    
		    carry = sum
		    Call result.AppendNonZero(error)
		    eIndex = eIndex + 1
		  Loop until eIndex < e.Size
		  
		  Call result.AppendNonZero(carry)
		  Call result.Normalise
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F662074686973204164617074697665446563696D616C2E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this AdaptiveDecimal.
		  ///
		  
		  Var s() As String
		  s.AddRow("[")
		  
		  Var iLimit As Integer = mSize - 1
		  For i As Integer = 0 To iLimit
		    s.AddRow(Components(i).ToString)
		    
		    If i < mSize - 1 Then s.AddRow(", ")
		  Next i
		  
		  s.AddRow("] ~= ")
		  s.AddRow(GetEstimation.ToString)
		  
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ValueOf(value As Double) As PhysicsKit.AdaptiveDecimal
		  ///
		  ' Creates an AdaptiveDecimal with only a single component.
		  '
		  ' - Parameter value: The component.'
		  ' - Returns: A new AdaptiveDecimal.
		  ///
		  
		  Var ad As AdaptiveDecimal = New AdaptiveDecimal(1)
		  Return ad.Append(value)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is an implementation of multi-precision decimals based on the original work by 
		Jonathan Richard Shewchuk, "Routines for Arbitrary Precision Floating-point Arithmetic 
		and Fast Robust Geometric Predicates".
		
		More information about the algorithms, the original code in C and proofs of correctness can all
		be found at <a href="http://www.cs.cmu.edu/~quake/robust.html">http://www.cs.cmu.edu/~quake/robust.html</a>
		
		Short description:
		The value of this AdaptiveDecimal is represented as the sum of some components, where each 
		component is a double value. The components must be stored in increasing magnitude order, 
		but there can be any amount of zeros between components. The components must also satisfy 
		the non-overlapping property, that is the corresponding bit representation of adjacent 
		components must not overlap. See `CheckInvariants()` and the corresponding paper for more info.
		
		This code **requires** that the floating point model is IEEE-754 with round-to-even in order
		to work properly in all cases and fulfill the above properties. This is a port from Java where this holds True and
		I'm hoping it's true for Xojo...
		
		
	#tag EndNote


	#tag Property, Flags = &h21, Description = 5468652061727261792073746F72696E672074686973204164617074697665446563696D616C277320636F6D706F6E656E742076616C7565732E
		Private Components() As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520696D706C696369742062697420696E20746865206D616E7469737361206F66206120446F75626C652E
		Shared IMPLICIT_MANTISSA_BIT As Int64 = &h0010000000000000
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 546865206E756D626572206F6620636F6D706F6E656E74732074686973204164617074697665446563696D616C2063757272656E746C7920636F6E7461696E732E
		Private mSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 546865206D61736B20746F2067657420746865206D616E7469737361206F66206120646F75626C652061732070657220746865207374616E646172642E2054616B656E2066726F6D20604D617468734B69742E444F55424C455F5349474E49465F4249545F4D41534B602E
		Private Shared SIGNIF_BIT_MASK As Int64 = &h000FFFFFFFFFFFFF
	#tag EndProperty


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
			Name="Components()"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
