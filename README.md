# Xope
A 2D physics engine written in native Xojo. A direct port of [dyn4j], a Java 2D physics engine (version 3.4.0).

## Port Progress

Currently porting `Rotation.java`. Up to but not including the first constructor.

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
- [ ] DataContainer.java
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
	- [ ] AABB.java
	- [ ] AbstractShape.java
	- [ ] AdaptiveDecimal.java
	- [ ] Capsule.java
	- [ ] Circle.java
	- [ ] Convex.java
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
	- [ ] EdgeFeature.java
	- [ ] Ellipse.java
	- [ ] Feature.java
	- [ ] Geometry.java
	- [ ] HalfEllipse.java
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
	- [ ] Interval.java
	- [ ] Link.java
	- [ ] Mass.java
	- [ ] MassType.java
	- [ ] Matrix22.java
	- [ ] Matrix33.java
	- [ ] PointFeature.java
	- [ ] Polygon.java
	- [ ] Ray.java
	- [ ] Rectangle.java
	- [ ] RobustGeometry.java
	- [ ] Rotatable.java
	- [ ] Rotation.java
	- [ ] Segment.java
	- [ ] Shape.java
	- [ ] Shiftable.java
	- [ ] Slice.java
	- [ ] Transform.java
	- [ ] Transformable.java
	- [ ] Translatable.java
	- [ ] Triangle.java
	- [x] Vector2.java
	- [ ] Vector3.java
	- [ ] Wound.java
	- [ ] WoundIterator.java
- [ ] Listener.java
- [ ] Reference.java
- [ ] UnitConversion.java
- [ ] Version.java

[dyn4j]: https://github.com/dyn4j/dyn4j
