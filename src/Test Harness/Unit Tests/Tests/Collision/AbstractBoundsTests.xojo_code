#tag Class
Protected Class AbstractBoundsTests
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
		Sub CreateTest()
		  ///
		  ' Tests the constructors.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As PKBounds = New TestBounds
		  Assert.AreEqual(0.0, b.GetTranslation.X)
		  Assert.AreEqual(0.0, b.GetTranslation.Y)
		  
		  b = New TestBounds(1.0, 2.0)
		  Assert.AreEqual(1.0, b.GetTranslation.X)
		  Assert.AreEqual(2.0, b.GetTranslation.Y)
		  
		  b = New TestBounds(New PKVector2(1.0, 2.0))
		  Assert.AreEqual(1.0, b.GetTranslation.X)
		  Assert.AreEqual(2.0, b.GetTranslation.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShiftCoordinatesTest()
		  ///
		  ' Tests shifting the coordinates of the bounds.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As PKBounds = New TestBounds
		  Assert.AreEqual(0.0, b.GetTranslation.X)
		  Assert.AreEqual(0.0, b.GetTranslation.Y)
		  
		  // Test the shifting which is really just a translation.
		  b.Shift(New PKVector2(1.0, 1.0))
		  Assert.AreEqual(1.0, b.GetTranslation.X)
		  Assert.AreEqual(1.0, b.GetTranslation.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslationTest()
		  ///
		  ' Tests the Translate and GetTranslation methods.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var b As PKBounds = New TestBounds
		  Assert.AreEqual(0.0, b.GetTranslation.X)
		  Assert.AreEqual(0.0, b.GetTranslation.Y)
		  
		  b.Translate(1.0, 0.0)
		  Assert.AreEqual(1.0, b.GetTranslation.X)
		  Assert.AreEqual(0.0, b.GetTranslation.Y)
		  
		  b.Translate(5.0, 6.0)
		  Assert.AreEqual(6.0, b.GetTranslation.X)
		  Assert.AreEqual(6.0, b.GetTranslation.Y)
		  
		  b.Translate(New PKVector2(-2.0, 1.5))
		  Assert.AreEqual(4.0, b.GetTranslation.X)
		  Assert.AreEqual(7.5, b.GetTranslation.Y)
		  
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
