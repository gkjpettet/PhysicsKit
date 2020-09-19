#tag Class
Protected Class BinarySearchTreeTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  ///
		  ' Sets up the binary tree and populates it with data.
		  ///
		  
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
		Sub BalanceTest()
		  ///
		  ' Tests the conversion from not self balancing to self balancing.
		  ///
		  
		  Assert.IsFalse(Tree.IsSelfBalancing)
		  
		  Assert.AreEqual(6, Tree.GetHeight)
		  
		  Tree.SetSelfBalancing(True)
		  
		  Assert.AreEqual(4, Tree.GetHeight)
		  
		  Assert.IsTrue(Tree.IsSelfBalancing)
		  
		  Assert.IsNil(Tree.balance(Nil))
		  
		  Tree.Clear
		  Call Tree.Insert(New ComparableInteger(1))
		  Assert.IsTrue(Tree.Root.Equals(Tree.Balance(Tree.Root)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearTest()
		  ///
		  ' Tests the clear method.
		  ///
		  
		  Assert.IsFalse(Tree.IsEmpty)
		  Assert.AreEqual(13, Tree.Size)
		  Tree.Clear
		  Assert.IsTrue(Tree.IsEmpty)
		  Assert.AreEqual(0, Tree.Size)
		  Assert.AreEqual(0, Tree.GetHeight)
		  Assert.IsNil(Tree.GetRoot)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContainsTest()
		  ///
		  ' Tests the Contains method.
		  ///
		  
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(9)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(14)))
		  
		  Assert.IsFalse(Tree.Contains(Nil))
		  
		  Tree.Clear
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(9)))
		  
		  Var t2 As PKBinarySearchTree = New PKBinarySearchTree
		  Call t2.Insert(New InconsistentElementType(0))
		  Call t2.Insert(New InconsistentElementType(2))
		  Call t2.Insert(New InconsistentElementType(10))
		  Call t2.Insert(New InconsistentElementType(7))
		  Call t2.Insert(New InconsistentElementType(1))
		  
		  Assert.IsFalse(t2.Contains(New InconsistentElementType(7)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTest()
		  ///
		  ' Tests creation with a subtree.
		  ///
		  
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
		Sub GetDepthTest()
		  ///
		  ' Tests the `GetDepth` methods.
		  ///
		  
		  Assert.AreEqual(6, Tree.GetHeight)
		  
		  Var node As PKBinarySearchTreeNode = Tree.Get(New ComparableInteger(-3))
		  Assert.AreEqual(4, Tree.GetHeight(node))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetMaximumTest()
		  ///
		  ' Tests the GetMaximum methods.
		  ///
		  
		  Assert.AreEqual(19, ComparableInteger(Tree.GetMaximum).Value)
		  
		  Var node As PKBinarySearchTreeNode = Tree.Get(New ComparableInteger(-3))
		  Assert.AreEqual(2, ComparableInteger(Tree.GetMaximum(node).Comparable).Value)
		  
		  node = Tree.Get(New ComparableInteger(11))
		  Assert.AreEqual(19, ComparableInteger(Tree.GetMaximum(node).Comparable).Value)
		  
		  Tree.Clear
		  Assert.IsNil(Tree.GetMaximum)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetMinimumTest()
		  ///
		  ' Tests the GetMinimum methods.
		  ///
		  
		  Assert.AreEqual(-4, ComparableInteger(Tree.GetMinimum).Value)
		  
		  Var node As PKBinarySearchTreeNode = Tree.Get(New ComparableInteger(4))
		  Assert.AreEqual(4, ComparableInteger(Tree.GetMinimum(node).Comparable).Value)
		  
		  node = Tree.Get(New ComparableInteger(0))
		  Assert.AreEqual(-1, ComparableInteger(Tree.GetMinimum(node).Comparable).Value)
		  
		  Tree.Clear
		  Assert.IsNil(Tree.GetMinimum)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetTest()
		  ///
		  ' Tests the Get method.
		  ///
		  
		  Assert.IsNotNil(Tree.Get(New ComparableInteger(-3)))
		  Assert.IsNil(Tree.Get(New ComparableInteger(45)))
		  Assert.AreEqual(10, ComparableInteger(Tree.GetRoot).Value)
		  
		  Tree.Clear
		  Assert.IsNil(Tree.GetRoot)
		  Assert.IsNil(Tree.Get(New ComparableInteger(0)))
		  Assert.IsNil(Tree.Get(Nil))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertNilTest()
		  ///
		  ' Tests insertion of Nil into the BST (it just returns False).
		  ///
		  
		  Var nilObject As ComparableInteger
		  Assert.IsFalse(Tree.Insert(nilObject))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertTest()
		  ///
		  ' Tests the insert methods.
		  ///
		  
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

	#tag Method, Flags = &h0
		Sub IsEmptyTest()
		  ///
		  ' Tests the IsEmpty method.
		  ///
		  
		  Assert.IsFalse(Tree.IsEmpty)
		  
		  Var test As PKBinarySearchTree = New PKBinarySearchTree
		  Assert.IsTrue(test.IsEmpty)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IteratorTest()
		  ///
		  ' Tests the iterators.
		  ///
		  
		  // Test in order traversal.
		  Var it As Iterator = Tree.InOrderIterator
		  Var last As Integer = MathsKit.INT32_MIN_VALUE
		  While it.MoveNext
		    Var i As Integer = ComparableInteger(it.Value).Value
		    If i < last Then
		      Assert.Fail("The next item was not greater than the last. In order traversal failed.")
		    End If
		    last = i
		  Wend
		  
		  // Test reverse order traversal.
		  it = Tree.ReverseOrderIterator
		  last = MathsKit.INT32_MAX_VALUE
		  While it.MoveNext
		    Var i As Integer = ComparableInteger(it.Value).Value
		    If i > last Then
		      Assert.Fail("The next item was not less than the last. Reverse order traversal failed.")
		    End If
		    last = i
		  Wend
		  
		  Assert.Pass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IteratorWithNoElementsTest()
		  ///
		  ' Tests the iterator for an empty tree.
		  ///
		  
		  Var tree As PKBinarySearchTree = New PKBinarySearchTree
		  Var it As Iterator = Tree.InOrderIterator
		  While it.MoveNext
		    Call it.Value
		  Wend
		  
		  Assert.Pass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NodeComparableTest()
		  ///
		  ' Tests the storage of the comparable in the node.
		  ///
		  
		  Var node As PKBinarySearchTreeNode = New PKBinarySearchTreeNode(New ComparableInteger(-3))
		  Assert.AreEqual(-3, ComparableInteger(node.GetComparable).Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NodeNilComparableTest()
		  ///
		  ' Test creating a BST node with a Nil comparable.
		  ///
		  
		  Try
		    Var node As PKBinarySearchTreeNode = New PKBinarySearchTreeNode(Nil)
		    #Pragma Unused node
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected a NilObjectException")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveMaximumTest()
		  ///
		  ' Tests the remove method with a valid value.
		  ///
		  
		  Call Tree.RemoveMaximum
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(19)))
		  Assert.AreEqual(12, Tree.Size)
		  
		  Var node As PKBinarySearchTreeNode = Tree.Get(New ComparableInteger(0))
		  Call Tree.RemoveMaximum(node)
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(2)))
		  Assert.AreEqual(11, Tree.Size)
		  
		  // Test removing Nil.
		  Assert.IsNil(Tree.RemoveMaximum(Nil))
		  
		  Tree.Clear
		  Call Tree.Insert(New ComparableInteger(0))
		  Call Tree.Insert(New ComparableInteger(-1))
		  Assert.AreEqual(0, ComparableInteger(Tree.RemoveMaximum(Tree.Root).Comparable).Value)
		  
		  Tree.Clear
		  Call Tree.Insert(New ComparableInteger(0))
		  Call Tree.Insert(New ComparableInteger(-1))
		  Call Tree.Insert(New ComparableInteger(1))
		  Assert.AreEqual(-1, ComparableInteger(Tree.RemoveMaximum(Tree.Get(New ComparableInteger(-1))).Comparable).Value)
		  
		  // Test removing when empty.
		  Tree.Clear
		  Assert.IsNil(Tree.RemoveMaximum)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveMinimumTest()
		  ///
		  ' Tests the remove method with a valid value.
		  ///
		  
		  Call Tree.RemoveMinimum
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(-4)))
		  Assert.AreEqual(12, Tree.Size)
		  
		  Var node As PKBinarySearchTreeNode = Tree.Get(New ComparableInteger(11))
		  Call Tree.RemoveMinimum(node)
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(11)))
		  Assert.AreEqual(11, Tree.Size)
		  
		  // Test removing Nil.
		  Assert.IsNil(Tree.RemoveMinimum(Nil))
		  
		  Tree.Clear
		  Call Tree.Insert(New ComparableInteger(0))
		  Call Tree.Insert(New ComparableInteger(1))
		  Assert.AreEqual(0, ComparableInteger(Tree.RemoveMinimum(Tree.Root).Comparable).Value)
		  
		  Tree.Clear
		  Call Tree.Insert(New ComparableInteger(0))
		  Call Tree.Insert(New ComparableInteger(-1))
		  Call Tree.Insert(New ComparableInteger(1))
		  Assert.AreEqual(1, ComparableInteger(Tree.Get(New ComparableInteger(1)).Comparable).Value)
		  
		  // Test removing when empty.
		  Tree.Clear
		  Assert.IsNil(Tree.RemoveMinimum)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSubtreeTest()
		  ///
		  ' Tests the `RemoveSubTree` method.
		  ///
		  
		  Call Tree.RemoveSubtree(New ComparableInteger(-3))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(0)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(-1)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(1)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(-4)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(2)))
		  Assert.AreEqual(7, Tree.Size)
		  
		  // Test not found.
		  Assert.IsFalse(Tree.RemoveSubtree(New ComparableInteger(8)))
		  Assert.IsFalse(Tree.RemoveSubtree(New ComparableInteger(5)))
		  
		  // Test found.
		  Assert.IsTrue(Tree.RemoveSubtree(New ComparableInteger(4)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(4)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(6)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(9)))
		  Assert.AreEqual(4, Tree.Size)
		  
		  // Remove Nil.
		  Assert.IsFalse(Tree.RemoveSubtree(Nil))
		  
		  // Remove from empty.
		  Tree.Clear
		  Assert.AreEqual(0, Tree.Size)
		  Assert.IsFalse(Tree.RemoveSubtree(New ComparableInteger(4)))
		  
		  Var t2 As PKBinarySearchTree = New PKBinarySearchTree
		  Call t2.Insert(New InconsistentElementType(0))
		  Call t2.Insert(New InconsistentElementType(2))
		  Call t2.Insert(New InconsistentElementType(10))
		  Call t2.Insert(New InconsistentElementType(7))
		  Call t2.Insert(New InconsistentElementType(1))
		  
		  Assert.IsFalse(t2.RemoveSubtree(New InconsistentElementType(7)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveTest()
		  ///
		  ' Tests the remove method with a valid value.
		  ///
		  
		  Assert.IsTrue(Tree.Remove(New ComparableInteger(-3)))
		  
		  // Make sure it was removed.
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(-3)))
		  
		  // Make sure the other values around that node are still there.
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(-4)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(0)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(1)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(2)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(-1)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(3)))
		  
		  // Test removing Nil.
		  Assert.IsFalse(Tree.Remove(Nil))
		  
		  // Test removing from empty tree.
		  Tree.Clear
		  Assert.IsFalse(Tree.Remove(New ComparableInteger(4)))
		  
		  Var t2 As PKBinarySearchTree = New PKBinarySearchTree
		  Call t2.Insert(New InconsistentElementType(0))
		  Call t2.Insert(New InconsistentElementType(2))
		  Call t2.Insert(New InconsistentElementType(10))
		  Call t2.Insert(New InconsistentElementType(7))
		  Call t2.Insert(New InconsistentElementType(1))
		  
		  Assert.IsFalse(t2.Remove(New InconsistentElementType(7)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SizeTest()
		  ///
		  ' Tests the ASize methods.
		  ///
		  
		  Assert.AreEqual(13, Tree.Size)
		  
		  Var node As PKBinarySearchTreeNode = Tree.Get(New ComparableInteger(-3))
		  Assert.AreEqual(6, Tree.Size(node))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToStringTest()
		  ///
		  ' Tests the `ToString` method. Should print whatever the comparable is.
		  ///
		  
		  Var node As PKBinarySearchTreeNode = New PKBinarySearchTreeNode(New ComparableInteger(-3))
		  Var s As String = node.ToString
		  Var i As Integer = -3
		  Assert.AreEqual(i.ToString, s)
		  
		  s = Tree.ToString
		  Assert.IsFalse(s = "")
		  Assert.IsTrue(s.Length > 0)
		  
		  Tree.Clear
		  s = Tree.ToString
		  Assert.IsFalse(s = "")
		  Assert.IsTrue(s.Length > 0)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 5468652062696E61727920747265652E
		Tree As PKBinarySearchTree
	#tag EndProperty


	#tag Using, Name = TestSupportClasses
	#tag EndUsing


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
