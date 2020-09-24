#tag Class
Protected Class TypeFilterTests
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
		Sub FilterTest()
		  ///
		  ' Tests the filter method of the PKTypeFilter class.
		  ///
		  
		  // All should let all of them work.
		  Assert.IsTrue(ALL.IsAllowed(ALL))
		  Assert.IsTrue(ALL.IsAllowed(CATEGORY_1))
		  Assert.IsTrue(ALL.IsAllowed(CATEGORY_2))
		  Assert.IsTrue(ALL.IsAllowed(CATEGORY_3))
		  Assert.IsTrue(ALL.IsAllowed(CATEGORY_4))
		  Assert.IsTrue(CATEGORY_1.IsAllowed(ALL))
		  Assert.IsTrue(CATEGORY_2.IsAllowed(ALL))
		  Assert.IsTrue(CATEGORY_3.IsAllowed(ALL))
		  Assert.IsTrue(CATEGORY_4.IsAllowed(ALL))
		  
		  // Since these are not in the same branch they should not be allowed.
		  Assert.IsFalse(CATEGORY_1.IsAllowed(CATEGORY_2))
		  Assert.IsFalse(CATEGORY_3.IsAllowed(CATEGORY_2))
		  Assert.IsFalse(CATEGORY_4.IsAllowed(CATEGORY_2))
		  Assert.IsFalse(CATEGORY_3.IsAllowed(CATEGORY_4))
		  
		  // Try the reverse.
		  Assert.IsFalse(CATEGORY_2.IsAllowed(CATEGORY_1))
		  Assert.IsFalse(CATEGORY_2.IsAllowed(CATEGORY_3))
		  Assert.IsFalse(CATEGORY_2.IsAllowed(CATEGORY_4))
		  Assert.IsFalse(CATEGORY_4.IsAllowed(CATEGORY_3))
		  
		  Assert.IsTrue(CATEGORY_1.IsAllowed(CATEGORY_3))
		  Assert.IsTrue(CATEGORY_1.IsAllowed(CATEGORY_4))
		  Assert.IsTrue(CATEGORY_3.IsAllowed(CATEGORY_1))
		  Assert.IsTrue(CATEGORY_4.IsAllowed(CATEGORY_1))
		  
		  // Nil and any other type should return False.
		  Assert.IsFalse(ALL.IsAllowed(Nil))
		  Assert.IsFalse(ALL.IsAllowed(New PKCategoryFilter))
		  
		  Assert.IsTrue(ALL.ToString.Length > 0)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Test case for the PKTypeFilter class.
		
		This test case builds the following structure.
		
		             All Categories
		             /           \
		        Category1     Category2
		        /      \
		 Category 3  Category 4
		
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h21, Description = 54686520416C6C2063617465676F72792E
		#tag Getter
			Get
			  Static mAll As TypeFilterAll = New TypeFilterAll
			  
			  Return mAll
			  
			End Get
		#tag EndGetter
		Private Shared ALL As PKTypeFilter
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21, Description = 43617465676F727920312E
		#tag Getter
			Get
			  Static mCATEGORY_1 As TypeFilterCategory1 = New TypeFilterCategory1
			  
			  Return mCATEGORY_1
			  
			End Get
		#tag EndGetter
		Private Shared CATEGORY_1 As PKTypeFilter
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21, Description = 43617465676F727920322E
		#tag Getter
			Get
			  Static mCategory_2 As PKTypeFilter = New TypeFilterCategory2
			  
			  Return mCategory_2
			  
			End Get
		#tag EndGetter
		Private Shared CATEGORY_2 As PKTypeFilter
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21, Description = 43617465676F727920332E
		#tag Getter
			Get
			  Static mCategory_3 As PKTypeFilter = New TypeFilterCategory3
			  
			  Return mCategory_3
			  
			End Get
		#tag EndGetter
		Private Shared CATEGORY_3 As PKTypeFilter
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21, Description = 43617465676F727920342E
		#tag Getter
			Get
			  Static mCategory_4 As PKTypeFilter = New TypeFilterCategory4
			  
			  Return mCategory_4
			  
			End Get
		#tag EndGetter
		Private Shared CATEGORY_4 As PKTypeFilter
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
