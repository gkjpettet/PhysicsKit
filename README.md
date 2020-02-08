# PhysicsKit
A 2D collision detection and physics engine written in Xojo. A direct port of [dyn4j], a Java 2D physics engine (version 3.4.0).

## Port Progress

Ported `RobustGeometry.java` but it's test are failing.

Part ported `Geometry.java` up to and including `flipAlongTheYAxis(polygon)`.

## Main Files To Port
- [ ] BinarySearchTree.java
- [ ] BinarySearchTreeIterator.java
- [ ] BinarySearchTreeNode.java
- [ ] BinarySearchTreeSearchCriteria.java
- [ ] collision
	- [ ] AbstractBounds.java
	- [ ] AbstractCollidable.java
	- [ ] AxisAlignedBounds.java
	- [ ] Bounds.java
	- [ ] BoundsAdaptor.java
	- [ ] BoundsListener.java
	- [ ] broadphase
		- [ ] AbstractBroadphaseDetector.java
		- [ ] BatchBroadphaseDetector.java
		- [ ] BroadphaseDetector.java
		- [ ] BroadphaseFilter.java
		- [ ] BroadphaseFilterAdaptro.java
		- [ ] BroadphaseItem.java
		- [ ] BroadphaseKey.java
		- [ ] BruteForceBroadphase.java
		- [ ] BruteForceBroadphaseNode.java
		- [ ] DefaultBroadphaseFilter.java
		- [ ] DynamicAABBTree.java
		- [ ] DynamicAABBTreeLeaf.java
		- [ ] DynamicAABBTreeNode.java
		- [ ] LazyAABBTree.java
		- [ ] LazyAABBTreeLeaf.java
		- [ ] LazyAABBTreeNode.java
		- [ ] Sap.java
		- [ ] SapProxy.java				
	- [ ] CategoryFilter.java
	- [ ] Collidable.java
	- [ ] Collisions.java
	- [ ] continuous
		- [ ] ConservativeAdvancement.java
		- [ ] TimeOfImpact.java
		- [ ] TimeOfImpactDetector.java		
	- [ ] Filter.java
	- [ ] Fixture.java
	- [ ] FixtureIterator.java
	- [ ] manifold
		- [ ] ClippingManifoldSolver.java
		- [ ] IndexedManifoldPointId.java
		- [ ] Manifold.java
		- [ ] ManifoldPointId.java
		- [ ] ManifoldSolver.java		
	- [ ] narrowphase
		- [ ] AbstractFallbackPosition.java
		- [ ] CircleDetector.java
		- [ ] DistanceDetector.java
		- [ ] Epa.java
		- [ ] ExpandingSimplex.java
		- [ ] ExpandingSimplexEdge.java
		- [ ] FallbackCondition.java
		- [ ] FallbackNarrowphaseDetector.java
		- [ ] Gjk.java
		- [ ] LinkPostProcessor.java
		- [ ] MinkowskiPenetrationSolver.java
		- [ ] MinkowskiSum.java
		- [ ] MinkowskiSumPoint.java
		- [ ] NarrowphaseDetector.java
		- [ ] NarrowphasePostProcessor.java
		- [ ] PairwiseTypedFallbackCondition.java
		- [ ] Penetration.java
		- [ ] Raycast.java
		- [ ] RaycastDetector.java
		- [ ] Sat.java
		- [ ] SegmentDetector.java
		- [ ] Separation.java
		- [ ] SingleTypedFallbackCondition.java
		- [ ] TypedFallbackCondition.java
	- [ ] TypeFilter.java
- [x] DataContainer.java
- [ ] dynamics
	- [ ] AABBBroadphaseFilter.java
	- [ ] Body.java
	- [ ] BodyFixture.java
	- [ ] BodyIterator.java
	- [ ] Capacity.java
	- [ ] CoefficientMixer.java
	- [ ] CollisionAdaptor.java
	- [ ] CollisionListener.java
	- [ ] Constraint.java
	- [ ] contact
		- [ ] Contact.java
		- [ ] ContactAdaptor.java
		- [ ] ContactConstraint.java
		- [ ] ContactConstraintId.java
		- [ ] ContactConstraintSolver.java
		- [ ] ContactListener.java
		- [ ] ContactManager.java
		- [ ] ContactPoint.java
		- [ ] ContactPointId.java
		- [ ] DefaultContactManager.java
		- [ ] PersistedContactPoint.java
		- [ ] SequentialImpulses.java
		- [ ] SimpleContactManager.java
		- [ ] SolvedContactPoint.java
		- [ ] TimeOfImpactSolver.java
		- [ ] WarmStartingContactManager.java
	- [ ] ContactEdge.java
	- [ ] ContinuousDetectionMode.java
	- [ ] ConvexCastAdaptor.java
	- [ ] ConvexCastListener.java
	- [ ] ConvexCastResult.java
	- [ ] DestructionAdaptor.java
	- [ ] DestructionListener.java
	- [ ] DetectAdaptor.java
	- [ ] DetectBroadphaseFilter.java
	- [ ] DetectListener.java
	- [ ] DetectResult.java
	- [ ] Force.java
	- [ ] InteractionEdge.java
	- [ ] Island.java
	- [ ] joint
		- [ ] AngleJoint.java
		- [ ] DistanceJoint.java
		- [ ] FrictionJoint.java
		- [ ] Joint.java
		- [ ] LimitState.java
		- [ ] MotorJoint.java
		- [ ] PinJoint.java
		- [ ] PrismaticJoint.java
		- [ ] PulleyJoint.java
		- [ ] RevoluteJoint.java
		- [ ] RopeJoint.java
		- [ ] WeldJoint.java
		- [ ] WheelJoint.java
	- [ ] JointEdge.java
	- [ ] JointIterator.java
	- [ ] RaycastAdaptor.java
	- [ ] RaycastBroadphaseFilter.java
	- [ ] RaycastListener.java
	- [ ] RaycastResult.java
	- [ ] Settings.java
	- [ ] Step.java
	- [ ] StepAdaptor.java
	- [ ] StepListener.java
	- [ ] TimeOfImpactAdaptor.java
	- [ ] TimeOfImpactListener.java
	- [ ] Torque.java
	- [ ] World.java
- [x] Epsilon.java
- [ ] geometry
	- [x] AABB.java
	- [x] AbstractShape.java
	- [x] AdaptiveDecimal.java
	- [x] Capsule.java
	- [x] Circle.java
	- [x] Convex.java
	- [ ] decompose
		- [ ] Bayazit.java
		- [ ] ClosestEdgeToVertexSearchCriteria.java
		- [ ] Decomposer.java
		- [ ] DoubleEdgeList.java
		- [ ] DoubleEdgeListFace.java
		- [ ] DoubleEdgeListHalfEdge.java
		- [ ] DoubleEdgeListVertex.java
		- [ ] EarClipping.java
		- [ ] EarClippingVertex.java
		- [ ] MonotoneChainType.java
		- [ ] MonotonePolygon.java
		- [ ] MonotonePolygonType.java
		- [ ] MonotoneVertex.java
		- [ ] SweepLine.java
		- [ ] SweepLineEdge.java
		- [ ] SweepLineState.java
		- [ ] SweepLineVertex.java
		- [ ] SweepLineVertexType.java
		- [ ] Triangulator.java
	- [x] EdgeFeature.java
	- [x] Ellipse.java
	- [x] Feature.java
	- [ ] Geometry.java
	- [x] HalfEllipse.java
	- [ ] hull
		- [ ] DivideAndConquer.java
		- [ ] GiftWrap.java
		- [ ] GrahamScan.java
		- [ ] HullGenerator.java
		- [ ] LinkedVertex.java
		- [ ] LinkedVertexHull.java
		- [ ] MinXYPointComparator.java
		- [ ] MonotoneChain.java
		- [ ] ReferencePointComparator.java
	- [x] Interval.java
	- [ ] Link.java
	- [x] Mass.java
	- [x] MassType.java
	- [ ] Matrix22.java
	- [ ] Matrix33.java
	- [x] PointFeature.java
	- [x] Polygon.java
	- [ ] Ray.java
	- [x] Rectangle.java
	- [x] RobustGeometry.java
	- [x] Rotatable.java
	- [x] Rotation.java
	- [x] Segment.java
	- [x] Shape.java
	- [ ] Shiftable.java
	- [x] Slice.java
	- [x] Transform.java
	- [x] Transformable.java
	- [x] Translatable.java
	- [x] Triangle.java
	- [x] Vector2.java
	- [ ] Vector3.java
	- [x] Wound.java
	- [x] WoundIterator.java
- [ ] Listener.java
- [ ] Reference.java
- [ ] UnitConversion.java
- [ ] Version.java

## Tests To Port
- [ ] BalancedBinarySearchTreeTest.java
- [ ] BinarySearchTreeTest.java
- [ ] collision
	- [ ] AbstractTest.java
	- [ ] AxisAlignedBoundsTest.java
	- [ ] BroadphaseTest.java
	- [ ] CapsuleCapsuleTest.java
	- [ ] CapsuleSliceTest.java
	- [ ] CategoryFilterTest.java
	- [ ] CircleCapsuleTest.java
	- [ ] CircleCircleTest.java
	- [ ] CircleEllipseTest.java
	- [ ] CircleHalfEllipseTest.java
	- [ ] CirclePolygonTest.java
	- [ ] CircleRectangleTest.java
	- [ ] CircleSegmentTest.java
	- [ ] CircleSliceTest.java
	- [ ] CircleTriangleTest.java
	- [ ] CollidableTest.java
	- [ ] ConservativeAdvancementTest.java
	- [ ] DefaultFilterTest.java
	- [ ] EllipseCapsuleTest.java
	- [ ] EllipseEllipseTest.java
	- [ ] EllipseHalfEllipseTest.java
	- [ ] EllipseSliceTest.java
	- [ ] FallbackNarrowphaseDetectorTest.java
	- [ ] FixtureTest.java
	- [ ] GjkRaycastTest.java
	- [ ] HalfEllipseCapsuleTest.java
	- [ ] HalfEllipseHalfEllipseTest.java
	- [ ] HalfEllipseSliceTest.java
	- [ ] PolygonCapsuleTest.java
	- [ ] PolygonEllipseTest.java
	- [ ] PolygonHalfEllipseTest.java
	- [ ] PolygonPolygonTest.java
	- [ ] PolygonRectangleTest.java
	- [ ] PolygonSegmentTest.java
	- [ ] PolygonSliceTest.java
	- [ ] PolygonTriangleTest.java
	- [ ] RectangleCapsuleTest.java
	- [ ] RectangleEllipseTest.java
	- [ ] RectangleHalfEllipseTest.java
	- [ ] RectangleRectangleTest.java
	- [ ] RectangleSegmentTest.java
	- [ ] RectangleSliceTest.java
	- [ ] RectangleTriangleTest.java
	- [ ] SegmentCapsuleTest.java
	- [ ] SegmentDetectorTest.java
	- [ ] SegmentEllipseTest.java
	- [ ] SegmentHalfEllipseTest.java
	- [ ] SegmentSegmentTest.java
	- [ ] SegmentSliceTest.java
	- [ ] SegmentTriangleTest.java
	- [ ] SliceSliceTest.java
	- [ ] TriangleCapsuleTest.java
	- [ ] TriangleEllipseTest.java
	- [ ] TriangleHalfEllipseTest.java
	- [ ] TriangleSliceTest.java
	- [ ] TriangleTriangleTest.java
	- [ ] TypeFilterTest.java
- [ ] dynamics
	- [ ] AngleJointTest.java
	- [ ] BodyFixtureTest.java
	- [ ] BodyTest.java
	- [ ] CapacityTest.java
	- [ ] ContactConstraintIDTest.java
	- [ ] ContactManagerTest.java
	- [ ] DistanceJointTest.java
	- [ ] ForceTest.java
	- [ ] FrictionJointTest.java
	- [ ] IslandTest.java
	- [ ] PinJointTest.java
	- [ ] PrismaticJointTest.java
	- [ ] PulleyJointTest.java
	- [ ] RevoluteJointTest.java
	- [ ] RopeJointTest.java
	- [ ] SettingsTest.java
	- [ ] TorqueTest.java
	- [ ] WeldJointTest.java
	- [ ] WheelJointTest.java
	- [ ] WorldTest.java
- [x] EpsilonTest.java
- [ ] geometry
	- [x] AABBTest.java
	- [ ] AbstractDecomposeTest.java
	- [x] AbstractShapeTest.java
	- [x] AdaptiveDecimalTest.java
	- [ ] BayazitTest.java
	- [x] CapsuleTest.java
	- [x] CircleTest.java
	- [ ] DivideAndConquerTest.java
	- [ ] EarClippingTest.java
	- [x] EllipseTest.java
	- [ ] GeometryTest.java
	- [ ] GiftWrapTest.java
	- [ ] GrahamScanTest.java
	- [x] HalfEllipseTest.java
	- [x] IntervalTest.java
	- [x] MassTest.java
	- [ ] Matrix22Test.java
	- [ ] Matrix33Test.java
	- [ ] MonotoneChainTest.java
	- [x] PolygonTest.java
	- [ ] RayTest.java
	- [x] RectangleTest.java
	- [ ] RobustGeometryTest.java
	- [x] RotationTest.java
	- [x] SegmentTest.java
	- [x] SliceTest.java
	- [ ] SweepLineTest.java
	- [x] TransformTest.java
	- [ ] TriangleTest.java
	- [x] Vector2Test.java
	- [ ] Vector3Test.java
	- [x] WoundTest.java
- [ ] UnitConversionTest.java
- [ ] VersionTest.java

[dyn4j]: https://github.com/dyn4j/dyn4j
