#tag Class
Protected Class PolygonTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  Prop2 = Prop2 + 1
		  
		  IDENTITY = New PhysicsKit.Transform
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
		Sub CreateCCWTest()
		  ///
		  ' Tests that the triangle is CCW.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As Polygon = New Polygon(Array(New Vector2(0.5, 0.5), New Vector2(-0.3, -0.5), _
		    New Vector2(1.0, -0.3)))
		    #Pragma Unused p
		  Catch e As RuntimeException
		    Assert.Fail("Unexpected constructor failure.")
		    Return
		  End Try
		  
		  Assert.Pass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCoincidentTest()
		  ///
		  ' Tests coincident points.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As Polygon = New Polygon(Array(New Vector2, New Vector2(2.0, 2.0), _
		    New Vector2(2.0, 2.0), New Vector2(1.0, 0.0)))
		    #Pragma Unused p
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as points coincident.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNonConvexTest()
		  ///
		  ' Tests non-convex points.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As Polygon = New Polygon(Array(New Vector2(1.0, 1.0), New Vector2(-1.0, 1.0), _
		    New Vector2(-0.5, 0.0), New Vector2(-1.0, -1.0), New Vector2(1.0, -1.0)))
		    #Pragma Unused p
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as points are non-convex")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNotCCWTest()
		  ///
		  ' Tests not CCW.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As Polygon = New Polygon(Array(New Vector2, New Vector2(2.0, 2.0), New Vector2(1.0, 0.0)))
		    #Pragma Unused p
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as vertices not CCW")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNotEnoughPointsTest()
		  ///
		  ' Tests not enough points.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As Polygon = New Polygon(Array(New Vector2, New Vector2))
		    #Pragma Unused p
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as not enough points passed to constructor.")
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private IDENTITY As PhysicsKit.Transform
	#tag EndProperty

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
