#tag Class
Protected Class WoundTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  Prop2 = Prop2 + 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TearDown()
		  Prop2 = Prop2 - 1
		  
		  
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
		Sub GetRadiusCenterTest()
		  ///
		  ' Tests the GetRadius(PKVector2) method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var c As PKVector2 = New PKVector2(1.0, 0.0)
		  
		  Var p As PKPolygon= PKGeometry.CreateUnitCirclePolygon(5, 0.5)
		  Assert.AreEqual(1.434, p.GetRadius(c), 1.0e-3)
		  
		  Var s As Segment= PKGeometry.CreateHorizontalSegment(4.0)
		  Assert.AreEqual(3.000, s.GetRadius(c), 1.0e-3)
		  
		  Var r As Rectangle= PKGeometry.CreateRectangle(3.0, 2.0)
		  Assert.AreEqual(2.692, r.GetRadius(c), 1.0e-3)
		  
		  Var t As Triangle= PKGeometry.CreateEquilateralTriangle(2.0)
		  Assert.AreEqual(2.255, t.GetRadius(c), 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetRadiusTest()
		  ///
		  ' Tests the GetRadius method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var p As PKPolygon= PKGeometry.CreateUnitCirclePolygon(5, 0.5)
		  Assert.AreEqual(0.500, p.GetRadius, 1.0e-3)
		  
		  Var s As Segment= PKGeometry.CreateHorizontalSegment(4.0)
		  Assert.AreEqual(2.000, s.GetRadius, 1.0e-3)
		  
		  Var r As Rectangle= PKGeometry.CreateRectangle(3.0, 2.0)
		  Assert.AreEqual(1.802, r.GetRadius, 1.0e-3)
		  
		  Var t As Triangle= PKGeometry.CreateEquilateralTriangle(2.0)
		  Assert.AreEqual(1.333, t.GetRadius, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WoundIteratorCountTest()
		  ///
		  ' Test to ensure that the entire set of vertices are returned.
		  ///
		  
		  Using PhysicsKit
		  
		  Var w As PKWound= PKGeometry.CreatePolygon(Array(_
		  New PKVector2(0.0, 0.0), _
		  New PKVector2(1.0, 0.0), _
		  New PKVector2(0.0, 1.0)))
		  
		  Var it As Iterator = w.GetVertexIterator
		  Var i As Integer = 0
		  While it.MoveNext
		    Call it.Value
		    i = i + 1
		  Wend
		  
		  Assert.AreEqual(w.GetVertices.Count, i)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WoundIteratorStartIndexTest()
		  ///
		  ' Test to ensure that the first element returned is the first vertex.
		  ///
		  
		  Using PhysicsKit
		  
		  Var w As PKWound= PKGeometry.CreatePolygon(Array(_
		  New PKVector2(0.0, 0.0), _
		  New PKVector2(1.0, 0.0), _
		  New PKVector2(0.0, 1.0)))
		  
		  Var it As Iterator = w.GetVertexIterator
		  Var i As Integer = 0
		  Var verts() As PKVector2 = w.GetVertices
		  While it.MoveNext
		    Var v As PKVector2 = it.Value
		    Assert.IsTrue(verts(i).Equals(v))
		    i = i + 1
		  Wend
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Prop1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Prop2 As Integer
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
