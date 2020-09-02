#tag Class
Protected Class Interval
	#tag Method, Flags = &h0, Description = 4966207468652076616C75652069732077697468696E207468697320496E74657276616C2C20696E636C75736976652C207468656E2072657475726E73207468652076616C75652C20656C73652072657475726E732065697468657220746865206D6178206F72206D696E696D756D2076616C75652E
		Function Clamp(value As Double) As Double
		  ///
		  ' If the value is within this Interval, inclusive, then returns the value, else
		  ' returns either the max or minimum value.
		  '
		  ' - Parameter value: The value to clamp.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Interval.Clamp(value, Self.Min, Self.Max)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E756D62657220636C616D706564206265747765656E2074776F206F74686572206E756D626572732E20417373756D6573207468617420606D696E60203C3D20606D6178602E
		Shared Function Clamp(value As Double, min As Double, max As Double) As Double
		  ///
		  ' Returns a number clamped between two other numbers.
		  '
		  ' This method assumes that min <= max.
		  '
		  ' - Parameter value: The value to clamp.
		  ' - Parameter min: The min value.
		  ' - Parameter max: The max value.
		  '
		  ' - Returns: Double.
		  ///
		  
		  If value <= max And value >= min Then
		    Return value
		  ElseIf max < value Then
		    Return max
		  Else
		    Return min
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46756C6C20636F6E7374727563746F722E
		Sub Constructor(min As Double, max As Double)
		  ///
		  ' Full constructor.
		  ' - Parameter min: The minimum value.
		  ' - Parameter max: The maximum value.
		  ' 
		  ' - Raises: InvalidArgumentException if min > max.
		  ///
		  
		  If min > max Then
		    Raise New InvalidArgumentException(PKMessages.GEOMETRY_INTERVAL_INVALID)
		  End If
		  
		  Self.Min = min
		  Self.Max = max
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F707920636F6E7374727563746F722E
		Sub Constructor(interval As PhysicsKit.Interval)
		  ///
		  ' Copy constructor.
		  '
		  ' - Parameter interval: The Interval to copy.
		  ///
		  
		  Self.Min = interval.Min
		  Self.Max = interval.Max
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E20496E74657276616C20697320636F6E7461696E656420696E207468697320496E74657276616C2E
		Function Contains(interval As PhysicsKit.Interval) As Boolean
		  ///
		  ' Returns True if the given Interval is contained in this Interval.
		  '
		  ' - Parameter interval: The Interval to test.
		  '
		  '- Returns: Boolean.
		  ///
		  
		  Return interval.Min > Self.Min And interval.Max < Self.Max
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652064697374616E6365206265747765656E207468652074776F20496E74657276616C732E2049662074686520676976656E20696E74657276616C206F7665726C617073207468697320696E74657276616C2C207A65726F2069732072657475726E65642E
		Function Distance(interval As PhysicsKit.Interval) As Double
		  ///
		  ' Returns the distance between the two Intervals.
		  '
		  ' If the given interval overlaps this interval, zero is returned.
		  '
		  ' - Parameter interval: The Interval to check distance against.'
		  '
		  ' - Returns: Double.
		  ///
		  
		  // Make sure they arent overlapping.
		  If Not Self.Overlaps(interval) Then
		    // The distance is calculated by taking the max of one - the min of the other
		    // the interval whose max will be used is determined by the interval with the max
		    // less than the other's min.
		    If Self.Max < interval.Min Then
		      Return interval.Min - Self.Max
		    Else
		      Return Self.Min - interval.Max
		    End If
		  End If
		  
		  // If they are overlapping then return 0.
		  Return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 457870616E6473207468697320496E74657276616C2062792068616C662074686520676976656E20616D6F756E7420696E20626F746820646972656374696F6E732E
		Sub Expand(value As Double)
		  ///
		  ' Expands this Interval by half the given amount in both directions.
		  '
		  ' The value can be negative to shrink the interval. However, if the value is
		  ' greater than the current length of the interval, the interval can become
		  ' invalid. In this case, the interval will become a degenerate interval at
		  ' the mid point of the min and max.
		  '
		  ' - Parameter value: The value to expand by.
		  ///
		  
		  Var e As Double = value * 0.5
		  Self.Min = Self.Min - e
		  Self.Max = Self.Max + e
		  
		  // Verify the interval is still valid.
		  If value < 0.0 And Self.Min > Self.Max Then
		    // If its not then set the min/max to the middle value of their current values.
		    Var p As Double = (Self.Min + Self.Max) * 0.5
		    Self.Min = p
		    Self.Max = p
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720496E74657276616C206F66207468697320696E74657276616C20657870616E6465642062792068616C662074686520676976656E20616D6F756E7420696E20626F746820646972656374696F6E732E
		Function GetExpanded(value As Double) As PhysicsKit.Interval
		  ///
		  ' Returns a new Interval of this interval expanded by half the given amount in both directions.
		  '
		  ' The value can be negative to shrink the interval. However, if the value is
		  ' greater than the current length of the interval, the interval will be 
		  ' invalid. In this case, the interval returned will be a degenerate interval at
		  ' the mid point of the min and max.
		  '
		  ' - Parameter value: The value to expand by.
		  ' 
		  ' - Returns: A new Interval.
		  ///
		  
		  Var e As Double = value * 0.5
		  Var min As Double = Self.Min - e
		  Var max As Double = Self.Max + e
		  
		  // Verify the interval is still valid.
		  If value < 0.0 And min > max Then
		    // If its not then set the min/max to the middle value of their current values.
		    Var p As Double = (min + max) * 0.5
		    min = p
		    max = p
		  End If
		  
		  Return New Interval(min, max)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520696E74657273656374696F6E206F662074686520676976656E20496E74657276616C20616E64207468697320496E74657276616C2061732061206E657720496E74657276616C2E
		Function GetIntersection(interval As PhysicsKit.Interval) As PhysicsKit.Interval
		  ///
		  ' Returns the intersection of the given Interval and this Interval as a new Interval.
		  '
		  ' If the two Intervals are not overlapping then this method will make this Interval
		  ' the a zero degenerate Interval: [0, 0].
		  '
		  ' - Parameter interval: The Interval to intersect with.
		  '
		  ' - Returns: A new Interval.
		  ///
		  
		  If Self.Overlaps(interval) Then
		    Return New Interval(Max(interval.Min, Self.Min), Min(interval.Max, Self.Max))
		  End If
		  
		  Return New Interval(0, 0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLength() As Double
		  ///
		  ' Returns the length of this interval from its min to its max.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Max - Self.Min
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D6178696D756D2076616C756520666F72207468697320496E74657276616C2E
		Function GetMax() As Double
		  ///
		  ' Returns the maximum value for this Interval.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Max
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D696E696D756D2076616C756520666F72207468697320496E74657276616C2E
		Function GetMin() As Double
		  ///
		  ' Returns the minimum value for this Interval.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Min
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520616D6F756E74206F66206F7665726C6170206265747765656E207468697320496E74657276616C20616E642074686520676976656E20496E74657276616C2E2052657475726E732030206966206E6F206F7665726C61702E
		Function GetOverlap(interval As PhysicsKit.Interval) As Double
		  ///
		  ' Returns the amount of overlap between this Interval and the given Interval.
		  '
		  ' This method tests to if the Intervals overlap first.  If they do then
		  ' the overlap is returned, if they do not then 0 is returned.
		  '
		  ' - Parameter interval: The Interval to test against.
		  '
		  ' Returns: Double (0 if no overlap).
		  ///
		  
		  // Make sure they overlap.
		  If Self.Overlaps(interval) Then
		    Return Min(Self.Max, interval.Max) - Max(Self.Min, interval.Min)
		  End If
		  
		  // No overlap.
		  Return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520756E696F6E206F662074686520676976656E20496E74657276616C20616E64207468697320496E74657276616C2061732061206E657720496E74657276616C2E
		Function GetUnion(interval As PhysicsKit.Interval) As PhysicsKit.Interval
		  ///
		  ' Returns the union of the given Interval and this Interval as a new Interval.
		  ' 
		  ' - Parameter interval: The other Interval.
		  '
		  ' - Returns: A new Interval.
		  ///
		  
		  Return New Interval(Min(interval.Min, Self.Min), Max(interval.Max, Self.Max))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E2076616C75652069732077697468696E207468697320496E74657276616C2065786C637564696E6720746865206D6178696D756D20616E64206D696E696D756D2E
		Function IncludesExclusive(value As Double) As Boolean
		  ///
		  ' Returns True if the given value is within this Interval exlcuding the maximum and minimum.
		  '
		  ' - Parameter value: The test value.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return value < Self.Max And value > Self.Min
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E2076616C75652069732077697468696E207468697320496E74657276616C20696E636C7564696E6720746865206D6178696D756D20616E64206D696E696D756D2E
		Function IncludesInclusive(value As Double) As Boolean
		  ///
		  ' Returns True if the given value is within this Interval including the maximum and minimum.
		  '
		  ' - Parameter value: The test value.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return value <= Self.Max And value >= Self.Min
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E2076616C75652069732077697468696E207468697320496E74657276616C20696E636C7564696E6720746865206D6178696D756D20616E64206578636C7564696E6720746865206D696E696D756D2E
		Function IncludesInclusiveMax(value As Double) As Boolean
		  ///
		  ' Returns True if the given value is within this Interval including the 
		  ' maximum and excluding the minimum.
		  '
		  ' - Parameter value: The test value.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return value <= Self.Max And value > Self.Min
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520676976656E2076616C75652069732077697468696E207468697320496E74657276616C20696E636C7564696E6720746865206D696E696D756D20616E64206578636C7564696E6720746865206D6178696D756D2E
		Function IncludesInclusiveMin(value As Double) As Boolean
		  ///
		  ' Returns True if the given value is within this Interval including the 
		  ' minimum and excluding the maximum.
		  '
		  ' - Parameter value: The test value.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return value < Self.Max And value >= Self.Min
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320496E74657276616C20746F2074686520696E74657273656374696F6E206F66207468697320496E74657276616C20616E642074686520676976656E20496E74657276616C2E204966207468652074776F20496E74657276616C7320617265206E6F74206F7665726C617070696E67207468656E2074686973206D6574686F642077696C6C206D616B65207468697320496E74657276616C207468652061207A65726F20646567656E657261746520496E74657276616C3A205B302C20305D2E
		Sub Intersection(interval As PhysicsKit.Interval)
		  ///
		  ' Sets this Interval to the intersection of this Interval and the given Interval.
		  '
		  ' If the two Intervals are not overlapping then this method will make this Interval
		  ' the a zero degenerate Interval: [0, 0].
		  '
		  ' - Parameter interval: The Interval to intersect with.
		  ///
		  
		  If Self.Overlaps(interval) Then
		    Self.Min = Max(interval.Min, Self.Min)
		    Self.Max = Min(interval.Max, Self.Max)
		  Else
		    Self.Min = 0
		    Self.Max = 0
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732054727565206966207468697320496E74657276616C20697320646567656E65726174652E20416E20496E74657276616C20697320646567656E657261746520696620697420657175616C73205B612C20615D2E
		Function IsDegenerate() As Boolean
		  ///
		  ' Returns True if this Interval is degenerate.
		  ' An Interval is degenerate if it equals [a, a].
		  '
		  ' - Returns: Boolean
		  ///
		  
		  Return Self.Min = Self.Max
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732054727565206966207468697320496E74657276616C20697320646567656E657261746520676976656E2074686520616C6C6F776564206572726F722E20416E20496E74657276616C20697320646567656E657261746520676976656E20736F6D65206572726F722069663A20606D6178202D206D696E203C3D206572726F7260
		Function IsDegenerate(error As Double) As Boolean
		  ///
		  ' Returns True if this Interval is degenerate given the allowed error.
		  ' An Interval is degenerate given some error if: `max - min <= error`.
		  '
		  ' - Parameter error: The margin of error.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Abs(Self.Max - Self.Min) <= error
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732054727565206966207468652074776F20496E74657276616C73206F7665726C61702E
		Function Overlaps(interval As PhysicsKit.Interval) As Boolean
		  ///
		  ' Returns True if the two Intervals overlap.
		  '
		  ' - Parameter interval: The Interval to test against.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Not(Self.Min > interval.Max Or interval.Min > Self.Max)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5365747320746865206D6178696D756D20666F72207468697320696E74657276616C2E
		Sub SetMax(max As Double)
		  ///
		  ' Sets the maximum for this interval.
		  '
		  ' - Parameter max: The maximum value.
		  '
		  ' - Raises: InvalidArgumentException if max < min.
		  ///
		  
		  If max < Self.Min Then
		    Raise New InvalidArgumentException(PKMessages.GEOMETRY_INTERVAL_INVALID_MAXIMUM)
		  End If
		  
		  Self.Max = max
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5365747320746865206D696E696D756D20666F72207468697320696E74657276616C2E
		Sub SetMin(min As Double)
		  ///
		  ' Sets the minimum for this interval.
		  '
		  ' - Parameter min: The minimum value.
		  '
		  ' - Raises: InvalidArgumentException if min > max.
		  ///
		  
		  If min > Self.Max Then
		    Raise New InvalidArgumentException(PKMessages.GEOMETRY_INTERVAL_INVALID_MINIMUM)
		  End If
		  
		  Self.Min = min
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F66207468697320496E74657276616C20696E2074686520666F726D61743A20225B6D696E2C206D61785D222E
		Function ToString() As String
		  ///
		  ' Returns a String representation of this Interval in the format: "[min, max]".
		  '
		  ' - Returns: String.
		  ///
		  
		  Var s() As String
		  s.AddRow("[")
		  s.AddRow(Self.Min.ToString)
		  s.AddRow(", ")
		  s.AddRow(Self.Max.ToString)
		  s.AddRow("]")
		  Return String.FromArray(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320496E74657276616C20746F2074686520756E696F6E206F66207468697320496E74657276616C20616E642074686520676976656E20496E74657276616C2E
		Sub Union(interval As PhysicsKit.Interval)
		  ///
		  ' Sets this Interval to the union of this Interval and the given Interval.
		  '
		  ' If the two Intervals are not overlapping then this method will
		  ' return one Interval that represents an Interval enclosing both Intervals.
		  '
		  ' - Parameter interval: The other Interval.
		  ///
		  
		  Self.Min = Min(interval.Min, Self.Min)
		  Self.Max = Max(interval.Max, Self.Max)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Represents a one dimensional numeric Interval.
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 546865206D6178696D756D2076616C75652E
		Max As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206D696E696D756D2076616C75652E
		Min As Double
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
			Name="Min"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Max"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
