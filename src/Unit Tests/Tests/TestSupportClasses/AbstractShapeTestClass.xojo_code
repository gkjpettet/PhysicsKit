#tag Class
Protected Class AbstractShapeTestClass
Inherits PhysicsKit.AbstractShape
	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor(New PKVector2, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(point As PKVector2, transform As PhysicsKit.Transform) As Boolean
		  #Pragma Unused point
		  #Pragma Unused transform
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAABB(transform As PhysicsKit.Transform) As PKAABB
		  #Pragma Unused transform
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateMass(density As Double) As PhysicsKit.Mass
		  #Pragma Unused density
		  
		  Return New PhysicsKit.Mass
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRadius(center As PKVector2) As Double
		  #Pragma Unused center
		  
		  Return 0.0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project(n As PKVector2, transform As PhysicsKit.Transform) As PhysicsKit.Interval
		  #Pragma Unused n
		  #Pragma Unused transform
		  
		  Return Nil
		  
		End Function
	#tag EndMethod


End Class
#tag EndClass
