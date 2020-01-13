#tag Class
Protected Class Epsilon
	#tag Method, Flags = &h0
		Shared Function Compute() As Double
		  // Computes an approximation of machine epsilon.
		  
		  Var e As Double = 0.5
		  
		  While (1.0 + e > 1.0)
		    e = e * 0.5
		  Wend
		  
		  Return e
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // Hidden default constructor.
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass
