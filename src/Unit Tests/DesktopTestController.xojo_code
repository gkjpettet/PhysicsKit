#tag Class
Protected Class DesktopTestController
Inherits TestController
	#tag Event
		Sub InitializeTestGroups()
		  // Instantiate TestGroup subclasses here so that they can be run
		  
		  Dim group As TestGroup
		  
		  group = New GrahamScanTests(Self, "GrahamScan")
		  group = New GiftWrapTests(Self, "GiftWrap")
		  group = New Vector3Tests(Self, "PKVector3")
		  group = New Matrix33Tests(Self, "Matrix33")
		  group = New Matrix22Tests(Self, "Matrix22")
		  group = New RayTests(Self, "Ray")
		  group = New GeometryTests(Self, "Geometry")
		  group = New HalfEllipseTests(Self, "HalfEllipse")
		  group = New EllipseTests(Self, "Ellipse")
		  group = New SliceTests(Self, "Slice")
		  group = New EpsilonTests(Self, "Epsilon")
		  group = New SegmentTests(Self, "Segment")
		  group = New PKRobustGeometryTests(Self, "PKRobustGeometry") // Broken.
		  group = New CapsuleTests(Self, "Capsule")
		  group = New WoundTests(self, "Wound")
		  group = New AdaptiveDecimalTest(Self, "AdaptiveDecimal")
		  group = New AbstractShapeTest(Self, "AbstractShape")
		  group = New PolygonTests(Self, "Polygon")
		  group = New RectangleTests(Self, "Rectangle")
		  group = New CircleTests(Self, "Circle")
		  group = New MassTests(Self, "Mass")
		  group = New IntervalTests(Self, "Interval")
		  group = New AABBTests(Self, "AABB")
		  group = New TransformTests(Self, "Transform")
		  group = New RotationTests(Self, "Rotation")
		  group = New Vector2Tests(Self, "PKVector2")
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Duration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GroupCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="PassedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunGroupCount"
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
			Name="SkippedCount"
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
