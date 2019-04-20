package  { 

	import GZ.Sys.Timer;
	import GZ.File.Resource;
	
	<cpp_h>
		#include "Lib_GzWeb_Emsc/Emscripten/EmscHeader.h"
	</cpp_h>
	
	
	public class OpTimer overplace Timer {
		
		
		public var nConterStart : Float = 0;
		
		public   function fStart() : Void { //Return the full path with exe name
			
			<cpp>
				gzFloat _nTime = emscripten_get_now();
				printf("\nTime %f", _nTime);
			</cpp>		
		}
		
			
		public   function fGet() : Float { //Return the full path with exe name
			
			<cpp>
				return  emscripten_get_now()-nConterStart;
			</cpp>
		}

		
	}
}

