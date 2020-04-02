package  { 

	import GZ.Sys.Timer;
	import GZ.File.Resource;
	
	<cpp_h>
		//#include "Lib_GzWeb_Emsc/Emscripten/EmscHeader.h"
	</cpp_h>
	
	
	public class OpTimer overplace Timer {
		
		
		public var nConterStart : Float = 0;
		
		override   function fStart() : Void { //Return the full path with exe name
			
			<cpp>
				//gzFloat _nTime = emscripten_get_now();
				gzFloat _nTime = 0;
				GZ_printf("\nTime %f", _nTime);
			</cpp>		
		}
		
			
		override   function fGet() : Float { //Return the full path with exe name
			
			<cpp>
				nConterStart+=10;
				//return  0-nConterStart;
				return nConterStart;
				//return  emscripten_get_now()-nConterStart;
			</cpp>
		}

		
	}
}

