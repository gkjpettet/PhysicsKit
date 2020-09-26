#tag Class
Protected Class TestCollisionBody
Inherits PKAbstractCollisionBody
	#tag Method, Flags = &h0
		Function AddFixture(convex As PKConvex) As PKFixture
		  Var bf As PKFixture = New PKFixture(convex)
		  Call Super.AddFixture(bf)
		  Return bf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ///
		  ' Default constructor.
		  ///
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(shape As PKConvex)
		  ///
		  ' Optional constructor.
		  '
		  ' - Parameter shape: The shape to use.
		  '
		  ' - Notes:
		  ' Uses default fixture settings.
		  ///
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Self.Fixtures.AddRow(New PKFixture(shape))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(fixtures() As PKFixture)
		  ///
		  ' Full constructor.
		  '
		  ' - Parameter fixtures(): The array of fixtures.
		  ///
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Self.Fixtures.AddAll(fixtures)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(fixture As PKFixture)
		  ///
		  ' Optional constructor.
		  '
		  ' - Parameter fixture: The fixture to use.
		  ///
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Self.Fixtures.AddRow(fixture)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLocalCenter() As PKVector2
		  Raise New UnsupportedOperationException
		  
		End Function
	#tag EndMethod


End Class
#tag EndClass
