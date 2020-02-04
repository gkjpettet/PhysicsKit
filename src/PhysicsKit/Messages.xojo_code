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

	#tag Constant, Name = GEOMETRY_CIRCLE_INVALID_COUNT, Type = String, Dynamic = False, Default = \"The number of vertices must be greater than 2.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_CIRCLE_INVALID_RADIUS, Type = String, Dynamic = False, Default = \"The radius must be greater than zero.", Scope = Protected
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

	#tag Constant, Name = GEOMETRY_INVALID_RADIUS, Type = String, Dynamic = False, Default = \"The radius must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_SIZE, Type = String, Dynamic = False, Default = \"The size must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_INVALID_SIZE_POINT_ARRAY1, Type = String, Dynamic = False, Default = \"The points array must have at least one point.", Scope = Protected
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

	#tag Constant, Name = GEOMETRY_NIL_POINT_ARRAY, Type = String, Dynamic = False, Default = \"The points array cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_POINT_ARRAY_ELEMENTS, Type = String, Dynamic = False, Default = \"The points array cannot contain Nil points.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_NIL_POLYGON_POINT, Type = String, Dynamic = False, Default = \"A polygon cannot contain Nil points.", Scope = Protected
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


End Module
#tag EndModule
