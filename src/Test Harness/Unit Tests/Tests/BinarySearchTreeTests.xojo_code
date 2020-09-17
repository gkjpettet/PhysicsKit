#tag Class
Protected Class BinarySearchTreeTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  ///
		  ' Sets up the binary tree and populates it with data.
		  ///
		  
		  Using TestSupportClasses
		  
		  Tree = New PKBinarySearchTree
		  Call Tree.Insert(New ComparableInteger(10))
		  Call Tree.Insert(New ComparableInteger(3))
		  Call Tree.Insert(New ComparableInteger(-3))
		  Call Tree.Insert(New ComparableInteger(4))
		  Call Tree.Insert(New ComparableInteger(0))
		  Call Tree.Insert(New ComparableInteger(1))
		  Call Tree.Insert(New ComparableInteger(11))
		  Call Tree.Insert(New ComparableInteger(19))
		  Call Tree.Insert(New ComparableInteger(6))
		  Call Tree.Insert(New ComparableInteger(-1))
		  Call Tree.Insert(New ComparableInteger(2))
		  Call Tree.Insert(New ComparableInteger(9))
		  Call Tree.Insert(New ComparableInteger(-4))
		  
		End Sub
	#tag EndEvent

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
		  ' Tests creation with a subtree.
		  ///
		  
		  Using TestSupportClasses
		  
		  Var t2 As PKBinarySearchTree= New PKBinarySearchTree(Self.Tree)
		  Assert.AreEqual(Tree.Size, t2.Size)
		  Assert.IsTrue(t2.Contains(New ComparableInteger(10)))
		  Assert.IsTrue(t2.Contains(New ComparableInteger(3)))
		  Assert.IsTrue(t2.Contains(New ComparableInteger(-3)))
		  Assert.IsTrue(t2.Contains(New ComparableInteger(4)))
		  Assert.IsTrue(t2.Contains(New ComparableInteger(0)))
		  Assert.IsTrue(t2.Contains(New ComparableInteger(1)))
		  Assert.IsTrue(t2.Contains(New ComparableInteger(11)))
		  Assert.IsTrue(t2.Contains(New ComparableInteger(19)))
		  Assert.IsTrue(t2.Contains(New ComparableInteger(6)))
		  Assert.IsTrue(t2.Contains(New ComparableInteger(-1)))
		  Assert.IsTrue(t2.Contains(New ComparableInteger(2)))
		  Assert.IsTrue(t2.Contains(New ComparableInteger(9)))
		  Assert.IsTrue(t2.Contains(New ComparableInteger(-4)))
		  
		  Var t3 As PKBinarySearchTree = New PKBinarySearchTree(Self.Tree, True)
		  Assert.AreEqual(Tree.Size, t3.Size)
		  Assert.IsTrue(t3.Contains(New ComparableInteger(10)))
		  Assert.IsTrue(t3.Contains(New ComparableInteger(3)))
		  Assert.IsTrue(t3.Contains(New ComparableInteger(-3)))
		  Assert.IsTrue(t3.Contains(New ComparableInteger(4)))
		  Assert.IsTrue(t3.Contains(New ComparableInteger(0)))
		  Assert.IsTrue(t3.Contains(New ComparableInteger(1)))
		  Assert.IsTrue(t3.Contains(New ComparableInteger(11)))
		  Assert.IsTrue(t3.Contains(New ComparableInteger(19)))
		  Assert.IsTrue(t3.Contains(New ComparableInteger(6)))
		  Assert.IsTrue(t3.Contains(New ComparableInteger(-1)))
		  Assert.IsTrue(t3.Contains(New ComparableInteger(2)))
		  Assert.IsTrue(t3.Contains(New ComparableInteger(9)))
		  Assert.IsTrue(t3.Contains(New ComparableInteger(-4)))
		  Assert.IsTrue(t3.GetHeight <= Tree.GetHeight)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertTest()
		  ///
		  ' Tests the insert methods.
		  ///
		  
		  Using TestSupportClasses
		  
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(5)))
		  Assert.IsTrue(Tree.Insert(New ComparableInteger(5)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(5)))
		  Assert.AreEqual(14, Tree.Size)
		  
		  Var t2 As PKBinarySearchTree = New PKBinarySearchTree
		  Call t2.Insert(New ComparableInteger(14))
		  Call t2.Insert(New ComparableInteger(8))
		  Call t2.Insert(New ComparableInteger(16))
		  Call t2.Insert(New ComparableInteger(15))
		  
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(14)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(8)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(16)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(15)))
		  
		  // Insert into a populated tree.
		  Assert.IsTrue(Tree.InsertSubtree(t2))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(14)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(8)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(16)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(15)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(5)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(10)))
		  Assert.AreEqual(18, Tree.Size)
		  
		  // Insert into an empty tree.
		  Tree.Clear
		  Assert.IsTrue(Tree.InsertSubtree(t2))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(14)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(8)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(16)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(15)))
		  Assert.AreEqual(4, Tree.Size)
		  
		  // Insert a Nil tree.
		  Assert.IsFalse(Tree.InsertSubtree(Nil))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(14)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(8)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(16)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(15)))
		  Assert.AreEqual(4, Tree.Size)
		  
		  // Insert a tree who's root is Nil.
		  t2.Clear
		  Assert.IsTrue(Tree.InsertSubtree(t2))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(14)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(8)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(16)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(15)))
		  Assert.AreEqual(4, Tree.Size)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 5468652062696E61727920747265652E
		Tree As PKBinarySearchTree
	#tag EndProperty


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
