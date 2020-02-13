#tag Module
Protected Module Messages
	#tag Constant, Name = ADAPTIVE_DECIMAL_INDEX_OUT_OF_RANGE, Type = String, Dynamic = False, Default = \"The requested index is out of range.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ADAPTIVE_DECIMAL_INSUFFICIENT_CAPACITY, Type = String, Dynamic = False, Default = \"This AdaptiveDecimal has insufficient capacity to perform that operation.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ADAPTIVE_DECIMAL_INVALID_LENGTH, Type = String, Dynamic = False, Default = \"The `length` property must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ADAPTIVE_DECIMAL_INVALID_REPRESENTATION, Type = String, Dynamic = False, Default = \"This AdaptiveDecimal has an invalid representation.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ADAPTIVE_DECIMAL_OTHER_COMPONENTS_TOO_LARGE, Type = String, Dynamic = False, Default = \"`other` has too many components to fit in this AdaptvieDecimal.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_AABB_INVALID_MIN_MAX, Type = String, Dynamic = False, Default = \"The min cannot be greater than the max.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_AABB_INVALID_RADIUS, Type = String, Dynamic = False, Default = \"The radius must be greater than or equal to zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_CAPSULE_DEGENERATE, Type = String, Dynamic = False, Default = \"The width and height cannot be close to equal\x2C instead use a Circle shape type.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_CAPSULE_INVALID_COUNT, Type = String, Dynamic = False, Default = \"The number of cap vertices must be greater than or equal to 1.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_CAPSULE_INVALID_HEIGHT, Type = String, Dynamic = False, Default = \"The height must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_CAPSULE_INVALID_WIDTH, Type = String, Dynamic = False, Default = \"The width must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_CIRCLE_INVALID_COUNT, Type = String, Dynamic = False, Default = \"The number of vertices must be greater than 2.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_CIRCLE_INVALID_RADIUS, Type = String, Dynamic = False, Default = \"The radius must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_ELLIPSE_INVALID_COUNT, Type = String, Dynamic = False, Default = \"The number of vertices must be greater than 3.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_ELLIPSE_INVALID_HEIGHT, Type = String, Dynamic = False, Default = \"An ellipse must have a positive non-zero height.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_ELLIPSE_INVALID_WIDTH, Type = String, Dynamic = False, Default = \"An ellipse must have a positive non-zero width.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_ELLIPSE_SAT_NOT_SUPPORTED, Type = String, Dynamic = False, Default = \"The Ellipse shape type is not supported by the SAT collision detection algorithm. Use `Geometry.CreatePolygonalEllipse`\x2C GJK\x2C or `FallbackNarrowphaseDetector` with SAT as the primary and GJK as the fallback.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_HALF_ELLIPSE_INVALID_COUNT, Type = String, Dynamic = False, Default = \"The number of vertices must be greater than or equal to 1.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_HALF_ELLIPSE_INVALID_HEIGHT, Type = String, Dynamic = False, Default = \"A half ellipse must have a positive non-zero height.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_HALF_ELLIPSE_INVALID_WIDTH, Type = String, Dynamic = False, Default = \"A half ellipse must have a positive non-zero width.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_HALF_ELLIPSE_SAT_NOT_SUPPORTED, Type = String, Dynamic = False, Default = \"The HalfEllipse shape type is not supported by the SAT collision detection algorithm. Use `Geometry.CreatePolygonalHalfEllipse`\x2C GJK\x2C or the `FallbackNarrowphaseDetector` with SAT as the primary and GJK as the fallback.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INTERVAL_INVALID, Type = String, Dynamic = False, Default = \"The minimum cannot be larger than the maximum.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INTERVAL_INVALID_MAXIMUM, Type = String, Dynamic = False, Default = \"The maximum value must be greater than or equal to the minimum.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INTERVAL_INVALID_MINIMUM, Type = String, Dynamic = False, Default = \"The minimum value must be less than or equal to the maximum.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_HEIGHT, Type = String, Dynamic = False, Default = \"The height must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_LENGTH, Type = String, Dynamic = False, Default = \"The length must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_MINKOWSKI_SUM_COUNT, Type = String, Dynamic = False, Default = \"The vertex count must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_MINKOWSKI_SUM_RADIUS, Type = String, Dynamic = False, Default = \"The radius must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_MINKOWSKI_SUM_SEGMENTS, Type = String, Dynamic = False, Default = \"The segments cannot be colinear.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_RADIUS, Type = String, Dynamic = False, Default = \"The radius must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_SCALE, Type = String, Dynamic = False, Default = \"The scaling factor must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_SIZE, Type = String, Dynamic = False, Default = \"The size must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_SIZE_POINT_ARRAY1, Type = String, Dynamic = False, Default = \"The points array must have at least one point.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_SIZE_POINT_ARRAY2, Type = String, Dynamic = False, Default = \"The points array must contain at least 2 non-Nil points.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_VERTICES_SIZE, Type = String, Dynamic = False, Default = \"The number of vertices must be greater than 2.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_WIDTH, Type = String, Dynamic = False, Default = \"The width must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_MASS_INVALID_INERTIA, Type = String, Dynamic = False, Default = \"The inertia tensor must be greater than or equal to zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_MASS_INVALID_MASS, Type = String, Dynamic = False, Default = \"The mass must be greater than or equal to zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_MASS_INVALID_MASS_ARRAY_SIZE, Type = String, Dynamic = False, Default = \"The `masses` array must contain at least one non-Nil element.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_MASS_NIL_CENTER, Type = String, Dynamic = False, Default = \"The center point cannot be NIL.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_MASS_NIL_MASS, Type = String, Dynamic = False, Default = \"Cannot copy a Nil Mass.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_MASS_NIL_MASS_ARRAY, Type = String, Dynamic = False, Default = \"The `masses` array cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_MASS_NIL_MASS_ARRAY_ELEMENT, Type = String, Dynamic = False, Default = \"The `masses` array cannot contain Nil elements.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_MATRIX_INVALID_LENGTH_4, Type = String, Dynamic = False, Default = \"The values array must have 4 elements.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_MATRIX_INVALID_LENGTH_9, Type = String, Dynamic = False, Default = \"The `values` array must have exactly 9 elements.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_MATRIX_NIL_ARRAY, Type = String, Dynamic = False, Default = \"The values array cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_MINKOWSKI_SUM_INVALID_CONVEX1, Type = String, Dynamic = False, Default = \"`convex1` must implement both the Convex and Wound interfaces.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_MINKOWSKI_SUM_INVALID_CONVEX2, Type = String, Dynamic = False, Default = \"`convex2` must implement both the Convex and Wound interfaces.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_FLIP_AXIS, Type = String, Dynamic = False, Default = \"The flip axis cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_FLIP_POLYGON, Type = String, Dynamic = False, Default = \"The polygon cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_MINKOWSKI_SUM_CIRCLE, Type = String, Dynamic = False, Default = \"The circle cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_MINKOWSKI_SUM_CONVEX, Type = String, Dynamic = False, Default = \"Both convex shapes must be non-Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_MINKOWSKI_SUM_POLYGON, Type = String, Dynamic = False, Default = \"The polygon cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_POINT_ARRAY, Type = String, Dynamic = False, Default = \"The points array cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_POINT_ARRAY_ELEMENTS, Type = String, Dynamic = False, Default = \"The points array cannot contain Nil points.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_POLYGON_POINT, Type = String, Dynamic = False, Default = \"A polygon cannot contain Nil points.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_SEGMENT_POINT, Type = String, Dynamic = False, Default = \"A segment cannot contain a Nil point.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_SHAPE, Type = String, Dynamic = False, Default = \"The shape cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_TRIANGLE_POINT, Type = String, Dynamic = False, Default = \"A triangle cannot contain a Nil point.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_VERTICES_ARRAY, Type = String, Dynamic = False, Default = \"The vertices array cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_POLYGON_COINCIDENT_VERTICES, Type = String, Dynamic = False, Default = \"A polygon cannot have coincident vertices.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_POLYGON_INVALID_WINDING, Type = String, Dynamic = False, Default = \"A polygon must have Counter-Clockwise vertex winding.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_POLYGON_LESS_THAN_3_VERTICES, Type = String, Dynamic = False, Default = \"A polygon must have 3 or more vertices.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_POLYGON_NIL_ARRAY, Type = String, Dynamic = False, Default = \"The vertices array cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_POLYGON_NIL_VERTICES, Type = String, Dynamic = False, Default = \"The vertices array cannot contain Nil points.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_POLYGON_NON_CONVEX, Type = String, Dynamic = False, Default = \"A polygon must be convex.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_POLYGON_ZERO_AREA, Type = String, Dynamic = False, Default = \"A polygon cannot have zero area.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_RAY_NIL_DIRECTION, Type = String, Dynamic = False, Default = \"The direction cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_RAY_NIL_START, Type = String, Dynamic = False, Default = \"The start point cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_RAY_ZERO_DIRECTION, Type = String, Dynamic = False, Default = \"A ray cannot have a zero direction vector.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_RECTANGLE_INVALID_HEIGHT, Type = String, Dynamic = False, Default = \"A rectangle must have a positive non-zero height.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_RECTANGLE_INVALID_WIDTH, Type = String, Dynamic = False, Default = \"A rectangle must have a positive non-zero width.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_ROTATION_INVALID_POINT, Type = String, Dynamic = False, Default = \"The given values do not lie on the unit circle.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_SEGMENT_NIL_POINT1, Type = String, Dynamic = False, Default = \"Point 1 cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_SEGMENT_NIL_POINT2, Type = String, Dynamic = False, Default = \"Point 2 cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_SEGMENT_SAME_POINT, Type = String, Dynamic = False, Default = \"A line segment must have two different vertices.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_SLICE_INVALID_COUNT, Type = String, Dynamic = False, Default = \"The number of vertices must be greater than or equal to 1.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_SLICE_INVALID_RADIUS, Type = String, Dynamic = False, Default = \"A circular section must have a positive non-zero radius.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_SLICE_INVALID_THETA, Type = String, Dynamic = False, Default = \"A circular section must have a positive non-zero theta less than \xCF\x80.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_ZERO_FLIP_AXIS, Type = String, Dynamic = False, Default = \"The flip axis cannot be the zero vector.", Scope = Protected
	#tag EndConstant


End Module
#tag EndModule
