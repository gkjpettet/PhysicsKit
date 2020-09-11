#tag Class
Protected Class AbstractDecomposeTest
Inherits TestGroup
	#tag Method, Flags = &h0, Description = 4C6F6164732074686520676976656E207265736F757263652066726F6D207468652066696C652073797374656D20616E6420617474656D70747320746F20696E746572707265742074686520636F6E74656E74732E
		Function Load(file As FolderItem) As PKVector2()
		  ///
		  ' Loads the given resource from the file system and attempts to interpret the contents.
		  '
		  ' - Parameter file: The resource to load.
		  '
		  ' - Returns: An array of points or Nil if an exception occurs.
		  ///
		  
		  If file = Nil Or file.Exists = False Or file.IsFolder Then Return Nil
		  
		  Return Parse(file)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 5061727365732074686520636F6E74656E7473206F6620746865207061737365642066696C652E
		Protected Function Parse(file As FolderItem) As PKVector2()
		  ///
		  ' Parses the contents of the passed file.
		  '
		  ' - Parameter file: The file to parse.
		  '
		  ' - Returns: An array of points or Nil.
		  ///
		  
		  Var points() As PKVector2
		  Var line As String
		  
		  Try
		    Var tin As TextInputStream = TextInputStream.Open(file)
		    While Not tin.EndOfFile
		      line = tin.ReadLine.Trim
		      
		      If line.Length = 0 Or line.BeginsWith("#") Then Continue
		      
		      // This is a line containing a point.
		      Var xy() As String = line.Split(" ")
		      Var x As Double = Double.FromString(xy(0).Trim)
		      Var y As Double = Double.FromString(xy(1).Trim)
		      points.AddRow(New PKVector2(x, y))
		    Wend
		    
		    tin.Close
		    
		    Return points
		  Catch e As IOException
		    // Show the error in the console.
		    System.DebugLog("An IO exception occurred when parsing `" + file.NativePath + "`")
		  End Try
		  
		  Return Nil
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
