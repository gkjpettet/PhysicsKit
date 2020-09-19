#tag Class
Protected Class BalancedBinarySearchTreeTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  ///
		  ' Sets up the binary tree and populates it with data.
		  ///
		  
		  tree = New PKBinarySearchTree(True)
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
		Sub ClearTest()
		  ///
		  ' Tests the Clear method.
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
		  
		  Assert.IsTrue(Tree.contains(New ComparableInteger(9)))
		  Assert.IsFalse(Tree.contains(New ComparableInteger(14)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetDepthTest()
		  ///
		  ' Tests the GetDepth methods.
		  ///
		  
		  Assert.AreEqual(4, Tree.GetHeight)
		  
		  Var node As PKBinarySearchTreeNode = Tree.Get(New ComparableInteger(-3))
		  Assert.AreEqual(2, Tree.GetHeight(node))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E732074686520686569676874206C696D6974206F6620612062616C616E6365642062696E6172792074726565206F662074686520676976656E2073697A652E
		Private Shared Function GetHeightLimit(size As Integer) As Double
		  ///
		  ' Returns the height limit of a balanced binary tree of the given size.
		  '
		  ' - Parameter size: The size of the tree.
		  '
		  ' - Returns: The height limit.
		  ///
		  
		  Return Log((size + 2.0) - 1.0) / Log(GOLDEN_RATIO)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetMaximumTest()
		  ///
		  ' Tests the GetMaximum methods.
		  ///
		  
		  Assert.AreEqual(19, ComparableInteger(Tree.GetMaximum).Value)
		  
		  Var node As PKBinarySearchTreeNode = Tree.Get(New ComparableInteger(-3))
		  Assert.AreEqual(-1, ComparableInteger(Tree.GetMaximum(node).Comparable).Value)
		  
		  node = Tree.Get(New ComparableInteger(6))
		  Assert.AreEqual(9, ComparableInteger(Tree.GetMaximum(node).Comparable).Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetMinimumTest()
		  ///
		  ' Tests the GetMinimum methods.
		  ///
		  
		  Assert.AreEqual(-4, ComparableInteger(Tree.getMinimum).Value)
		  
		  Var node AS PKBinarySearchTreeNode = Tree.Get(New ComparableInteger(10))
		  Assert.AreEqual(4, ComparableInteger(Tree.GetMinimum(node).Comparable).Value)
		  
		  node = Tree.Get(New ComparableInteger(1))
		  Assert.AreEqual(1, ComparableInteger(Tree.GetMinimum(node).Comparable).Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetTest()
		  ///
		  ' Tests the Get method.
		  ///
		  
		  Assert.IsNotNil(Tree.Get(New ComparableInteger(-3)))
		  Assert.IsNil(Tree.Get(New ComparableInteger(45)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HeadIteratorMissingTest()
		  ///
		  ' Tests the head iterator with a value that's not in the tree.
		  ///
		  
		  Var it As Iterator= Tree.HeadIterator(New ComparableInteger(5))
		  Var last As Integer = MathsKit.INT32_MIN_VALUE
		  Var n As Integer = 0
		  While it.MoveNext
		    Var i As Integer = ComparableInteger(it.Value).Value
		    If i < last Then
		      Assert.Fail("")
		    End If
		    last = i
		    n = n +1
		  Wend
		  
		  Assert.AreEqual(8, n)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HeadIteratorTest()
		  ///
		  ' Tests the head iterator.
		  ///
		  
		  Var it As Iterator = Tree.HeadIterator(New ComparableInteger(6))
		  Var last As Integer = MathsKit.INT32_MIN_VALUE
		  Var n As Integer = 0
		  While it.MoveNext
		    Var i As Integer = ComparableInteger(it.Value).Value
		    If i < last Then
		      Assert.Fail("")
		    End If
		    last = i
		    n = n + 1
		  Wend
		  
		  Assert.AreEqual(9, n)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertTest()
		  ///
		  ' Tests the Insert methods.
		  ///
		  
		  // after setup the tree should be balanced
		  Var hl As Double = GetHeightLimit(Tree.Size)
		  Assert.IsTrue(Tree.GetHeight < hl)
		  
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(5)))
		  Assert.IsTrue(Tree.Insert(New ComparableInteger(5)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(5)))
		  
		  Var t2 As PKBinarySearchTree = New PKBinarySearchTree(True)
		  Call t2.Insert(New ComparableInteger(14))
		  Call t2.Insert(New ComparableInteger(8))
		  Call t2.Insert(New ComparableInteger(16))
		  Call t2.Insert(New ComparableInteger(15))
		  
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(14)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(8)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(16)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(15)))
		  
		  Call Tree.InsertSubtree(t2)
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(14)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(8)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(16)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(15)))
		  
		  hl = GetHeightLimit(Tree.Size)
		  Assert.IsTrue(Tree.GetHeight < hl)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsEmptyTest()
		  ///
		  ' Tests the IsEmpty method.
		  ///
		  
		  Assert.IsFalse(Tree.IsEmpty)
		  
		  Var test As PKBinarySearchTree = New PKBinarySearchTree(True)
		  Assert.IsTrue(test.IsEmpty)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IteratorTest()
		  ///
		  ' Tests the iterators.
		  ///
		  
		  // Test in order traversal.
		  Var it As Iterator = tree.InOrderIterator
		  Var last As Integer = MathsKit.INT32_MIN_VALUE
		  While it.MoveNext
		    Var i As Integer = ComparableInteger(it.Value).Value
		    If i < last Then
		      Assert.Fail("")
		    End If
		    last = i
		  Wend
		  
		  // Test reverse order traversal.
		  it = Tree.ReverseOrderIterator
		  last = MathsKit.INT32_MAX_VALUE
		  While it.MoveNext
		    Var i As Integer = ComparableInteger(it.Value).Value
		    If i > last Then
		      Assert.Fail("")
		    End If
		    last = i
		  Wend
		  
		  Assert.Pass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveNotFoundTest()
		  ///
		  ' Tests the remove methods with non-existing values.
		  ///
		  
		  Assert.IsFalse(Tree.Remove(New ComparableInteger(7)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveTest()
		  ///
		  ' Tests the remove method with a valid value.
		  ///
		  
		  Call Tree.Remove(New ComparableInteger(-3))
		  Assert.IsNotNil(Tree)
		  
		  // Make sure it was removed.
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(-3)))
		  
		  // Make sure the other values around that node are still there.
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(-4)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(0)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(1)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(2)))
		  Assert.IsTrue(Tree.Contains(New ComparableInteger(3)))
		  
		  // Remove the minimum of the entire tree.
		  Var size As Integer = Tree.Size
		  Call Tree.RemoveMinimum
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(-4)))
		  Assert.AreEqual(size - 1, Tree.Size)
		  
		  Var node As PKBinarySearchTreeNode = Tree.Get(New ComparableInteger(10))
		  Call Tree.RemoveMinimum(node)
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(4)))
		  Assert.AreEqual(size - 2, Tree.Size)
		  
		  Call Tree.RemoveMaximum
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(19)))
		  Assert.AreEqual(size - 3, Tree.Size)
		  
		  node = Tree.Get(New ComparableInteger(0))
		  Call Tree.RemoveMaximum(node)
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(2)))
		  Assert.AreEqual(size - 4, Tree.Size)
		  
		  Var hl As Double = GetHeightLimit(Tree.Size)
		  Assert.IsTrue(Tree.GetHeight < hl)
		  
		  Call Tree.RemoveSubtree(New ComparableInteger(0))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(0)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(-1)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(1)))
		  Assert.IsFalse(Tree.Contains(New ComparableInteger(2)))
		  Assert.AreEqual(Tree.Size, 5)
		  
		  hl = GetHeightLimit(Tree.Size)
		  Assert.IsTrue(Tree.GetHeight < hl)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SizeTest()
		  ///
		  ' Tests the Size methods.
		  ///
		  
		  Assert.AreEqual(13, Tree.Size)
		  
		  Var node AS PKBinarySearchTreeNode = Tree.Get(New ComparableInteger(-3))
		  Assert.AreEqual(3, Tree.Size(node))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SubsetIteratorMissingTest()
		  ///
		  ' Tests the subset iterator with values that are not in the tree.
		  ///
		  
		  Var it As Iterator = Tree.SubsetIterator(New ComparableInteger(-2), New ComparableInteger(5))
		  Var last As Integer = MathsKit.INT32_MIN_VALUE
		  Var n As Integer = 0
		  While it.MoveNext
		    Var i As Integer = ComparableInteger(it.Value).Value
		    If i < last Then
		      Assert.Fail("")
		    End If
		    last = i
		    n = n + 1
		  Wend
		  
		  Assert.AreEqual(6, n)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SubsetIteratorTest()
		  ///
		  ' Tests the subset iterator.
		  ///
		  
		  Var it As Iterator = Tree.SubsetIterator(New ComparableInteger(1), New ComparableInteger(6))
		  Var last As Integer = MathsKit.INT32_MIN_VALUE
		  Var n As Integer = 0
		  While it.MoveNext
		    Var i As Integer = ComparableInteger(it.Value).Value
		    If i < last Then
		      Assert.Fail("")
		    End If
		    last = i
		    n = n + 1
		  Wend
		  
		  Assert.AreEqual(5, n)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TailIteratorMissingTest()
		  ///
		  ' Tests the tail iterator with a value that's not in the tree.
		  ///
		  
		  Var it As Iterator= Tree.TailIterator(New ComparableInteger(5))
		  Var last As Integer = MathsKit.INT32_MIN_VALUE
		  Var n As Integer = 0
		  While it.MoveNext
		    Var i As Integer = ComparableInteger(it.Value).Value
		    If i < last Then
		      Assert.Fail("")
		    End If
		    last = i
		    n = n + 1
		  Wend
		  
		  Assert.AreEqual(5, n)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TailIteratorTest()
		  ///
		  ' Tests the tail iterator.
		  ///
		  
		  Var it As Iterator = Tree.TailIterator(New ComparableInteger(1))
		  Var last As Integer = MathsKit.INT32_MIN_VALUE
		  Var n As Integer = 0
		  While it.MoveNext
		    Var i As Integer = ComparableInteger(it.Value).Value
		    If i < last Then
		      Assert.Fail("")
		    End If
		    last = i
		    n = n + 1
		  Wend
		  
		  Assert.AreEqual(9, n)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h21, Description = 54686520676F6C64656E20726174696F20666F722074657374696E672074686520686569676874206F6620612062616C616E6365642062696E61727920747265652E
		#tag Getter
			Get
			  Static gr As Double = (1.0 + Sqrt(5.0)) / 2.0
			  Return gr
			  
			End Get
		#tag EndGetter
		Private Shared GOLDEN_RATIO As Double
	#tag EndComputedProperty

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
