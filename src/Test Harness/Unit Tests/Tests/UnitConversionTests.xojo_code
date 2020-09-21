#tag Class
Protected Class UnitConversionTests
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
		Sub FootMeterTest()
		  ///
		  ' Tests the foot to meter and meter to foot conversions.
		  ///
		  
		  // Test the static values.
		  Assert.AreEqual(1.000, PKUnitConversion.FOOT_TO_METER * PKUnitConversion.METER_TO_FOOT)
		  
		  // Test a normal value.
		  Var m As Double = 2.5
		  Var f As Double = PKUnitConversion.MetersToFeet(m)
		  Var r As Double = PKUnitConversion.FeetToMeters(f)
		  
		  Assert.AreEqual(m, r, 1.0e-9)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FootPoundNewtonMeterTest()
		  ///
		  ' Tests the foot-pound to newton-meter and newton-meter to foot-pound conversions.
		  ///
		  
		  // Test the static values.
		  Assert.AreEqual(1.000, PKUnitConversion.FOOT_POUND_TO_NEWTON_METER * _
		  PKUnitConversion.NEWTON_METER_TO_FOOT_POUND)
		  
		  // Test a normal value.
		  Var fp As Double = 2.5
		  Var nm As Double = PKUnitConversion.FootPoundsToNewtonMeters(fp)
		  Var r As Double = PKUnitConversion.NewtonMetersToFootPounds(nm)
		  
		  Assert.AreEqual(fp, r, 1.0e-9)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MpsToFpsTest()
		  ///
		  ' Tests the meters per second to feet per second (and reverse) conversions.
		  ///
		  
		  // Test a normal value.
		  Var fps As Double = 2.5
		  Var mps As Double = PKUnitConversion.MetersPerSecondToFeetPerSecond(fps)
		  Var r As Double = PKUnitConversion.FeetPerSecondToMetersPerSecond(mps)
		  
		  Assert.AreEqual(fps, r, 1.0e-9)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PoundKilogramTest()
		  ///
		  ' Tests the pound to kilogram and kilogram to pound conversions.
		  ///
		  
		  // Test the static values.
		  Assert.AreEqual(1.000, PKUnitConversion.POUND_TO_KILOGRAM * PKUnitConversion.KILOGRAM_TO_POUND)
		  
		  // Test a normal value.
		  Var p As Double = 2.5
		  Var k As Double = PKUnitConversion.PoundsToKilograms(p)
		  Var r As Double = PKUnitConversion.KilogramsToPounds(k)
		  
		  Assert.AreEqual(p, r, 1.0e-9)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PoundNewtonTest()
		  ///
		  ' Tests the pound to newton and newton to pound conversions.
		  ///
		  
		  // Test the static values.
		  Assert.AreEqual(1.000, PKUnitConversion.POUND_TO_NEWTON * PKUnitConversion.NEWTON_TO_POUND)
		  
		  // Test a normal value.
		  Var p As Double = 2.5
		  Var n As Double = PKUnitConversion.PoundsToNewtons(p)
		  Var r As Double = PKUnitConversion.NewtonsToPounds(n)
		  
		  Assert.AreEqual(p, r, 1.0e-9)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SlugKilogramTest()
		  ///
		  ' Tests the slug to kilogram and kilogram to slug conversions.
		  ///
		  
		  // Test the static values.
		  Assert.AreEqual(1.000, PKUnitConversion.SLUG_TO_KILOGRAM * PKUnitConversion.KILOGRAM_TO_SLUG)
		  
		  // Test a normal value.
		  Var s As Double = 2.5
		  Var k As Double = PKUnitConversion.SlugsToKilograms(s)
		  Var r As Double = PKUnitConversion.KilogramsToSlugs(k)
		  
		  Assert.AreEqual(s, r, 1.0e-9)
		  
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
