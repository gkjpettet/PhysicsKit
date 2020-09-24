#tag Class
Protected Class CategoryFilterTests
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
		  ' Tests the create method with no arguments.
		  ///
		  
		  Var f As PKCategoryFilter = New PKCategoryFilter
		  Assert.AreEqual(1, f.Category)
		  Assert.IsTrue(MathsKit.INT64_MAX_VALUE = f.Mask)
		  
		  Assert.AreEqual(1, f.GetCategory)
		  Assert.IsTrue(MathsKit.INT64_MAX_VALUE = f.GetMask)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EqualsAndHashCodeTest()
		  ///
		  ' Tests the Equals and HashCode methods.
		  ///
		  
		  Var f1 As PKCategoryFilter = New PKCategoryFilter
		  Var f2 As PkCategoryFilter = New PKCategoryFilter
		  
		  Assert.IsTrue(f1.Equals(f2))
		  Assert.AreEqual(f1.HashCode, f2.HashCode)
		  
		  Var f3 As PKCategoryFilter = New PKCategoryFilter(1, 2)
		  
		  Assert.IsFalse(f1.Equals(f3))
		  Assert.IsFalse(f1.HashCode = f3.HashCode)
		  
		  Var f4 As PKCategoryFilter = New PKCategoryFilter(1, 2)
		  
		  Assert.IsTrue(f3.Equals(f4))
		  Assert.AreEqual(f3.HashCode, f4.HashCode)
		  
		  Var f5 As PkCategoryFilter = New PKCategoryFilter(1, 3)
		  
		  Assert.IsFalse(f3.Equals(f5))
		  
		  Assert.IsTrue(f1.Equals(f1))
		  Assert.IsFalse(f1.Equals(Nil))
		  
		  Var tmp As PKCircle = PKGeometry.CreateCircle(1.0)
		  Assert.IsFalse(f1.Equals(tmp))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FilterTest()
		  ///
		  ' Tests the PkCategoryFilter.
		  ///
		  
		  // Category 1. Can collide with any category.
		  Var f1 As PKCategoryFilter = New PKCategoryFilter(1, MathsKit.INT64_MAX_VALUE)
		  
		  // Category 2. Can collide with category 1 and 2.
		  Var f2 As PKCategoryFilter = New PKCategoryFilter(2, 3)
		  
		  // Category 3. Can collide with category 1, 2, and 3.
		  Var f3 As PKCategoryFilter = New PKCategoryFilter(4, 7)
		  
		  // Allowed.
		  Assert.IsTrue(f1.IsAllowed(f2))
		  Assert.IsTrue(f1.IsAllowed(f3))
		  Assert.IsTrue(f2.IsAllowed(f1))
		  Assert.IsTrue(f3.IsAllowed(f1))
		  
		  // Allowed, not same type.
		  Assert.IsTrue(f1.IsAllowed(PKDefaultFilter.Get))
		  Assert.IsTrue(f2.IsAllowed(PKDefaultFilter.Get))
		  Assert.IsTrue(f3.IsAllowed(PKDefaultFilter.Get))
		  
		  // Not allowed.
		  Assert.IsFalse(f2.IsAllowed(f3))
		  Assert.IsFalse(f3.IsAllowed(f2))
		  
		  // Test Nil.
		  Assert.IsTrue(f1.IsAllowed(Nil))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToStringTest()
		  ///
		  ' Tests the ToString method.
		  ///
		  
		  Var f1 As New PKCategoryFilter
		  Assert.IsTrue(f1.ToString.Length > 0)
		  
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
