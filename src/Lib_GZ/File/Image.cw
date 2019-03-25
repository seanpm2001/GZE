//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

#Wrapper

package  {
	
	import GZ.File.RcImg;
	
	public class Image  {
			
		public pure function fOpen(_oRc : RcImg): Int;
		
		public pure function fDelete(_oRc : RcImg): Void;
		
	}
}