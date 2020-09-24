#tag Class
Protected Class FixtureTests
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
		Sub CreateNilFixtureTest()
		  ///
		  ' Tests the failed creation of a fixture by passing a Nil shape.
		  ///
		  
		  Try
		    Var f As PKFixture = New PKFixture(Nil)
		    #Pragma Unused f
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSuccessTest()
		  ///
		  ' Tests the successful creation of a fixture.
		  ///
		  
		  Try
		    Var f As New PKFixture(PKGeometry.CreateCircle(1.0))
		    #Pragma Unused f
		    Assert.Pass
		  Catch e
		    Assert.Fail("Expected the successful creation of a fixture")
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetSetFilterTest()
		  ///
		  ' Tests setting the filter.
		  ///
		  
		  Var fixture As PKFixture = New PKFixture(PKGeometry.CreateCircle(1.0))
		  Var f As PKFilter = New PKCategoryFilter
		  fixture.SetFilter(f)
		  Assert.IsTrue(f = fixture.GetFilter)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetSetSensorTest()
		  ///
		  ' Tests the set/get sensor methods.
		  ///
		  
		  Var fixture As PKFixture = New PKFixture(PKGeometry.CreateCircle(1.0))
		  
		  // By default it should be False.
		  Assert.IsFalse(fixture.IsSensor)
		  
		  fixture.SetSensor(True)
		  Assert.IsTrue(fixture.IsSensor)
		  
		  fixture.SetSensor(False)
		  Assert.IsFalse(fixture.IsSensor)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetSetUserDataTest()
		  ///
		  ' Make sure storage of user data is working.
		  ///
		  
		  Var fixture As PKFixture = New PKFixture(PKGeometry.CreateCircle(1.0))
		  
		  // Should be Nil initially.
		  Assert.IsNil(fixture.GetUserData)
		  
		  Var obj As String = "hello"
		  fixture.SetUserData(obj)
		  Assert.IsNotNil(fixture.GetUserData)
		  Assert.IsTrue(obj = fixture.GetUserData)
		  
		  fixture.SetUserData(Nil)
		  Assert.IsNil(fixture.GetUserData)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetShapeTest()
		  ///
		  ' Tests the GetShape method.
		  ///
		  
		  Var c As PKConvex = PKGeometry.CreateCircle(1.0)
		  Var f As PKFixture = New PKFixture(c)
		  
		  Assert.IsNotNil(f.GetShape)
		  Assert.IsTrue(c = f.GetShape)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetNilFilterTest()
		  ///
		  ' Tests setting a Nil filter.
		  ///
		  
		  Try
		    Var fixture As PKFixture = New PKFixture(PKGeometry.CreateCircle(1.0))
		    fixture.SetFilter(Nil)
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToStringTest()
		  ///
		  ' Tests the ToString method.
		  ///
		  
		  Var c As PKConvex = PKGeometry.CreateCircle(1.0)
		  Var f As PKFixture = New PKFixture(c)
		  
		  Assert.IsTrue(f.ToString.Length > 0)
		  
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
