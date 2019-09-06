﻿package  { 

	import GzOpenGL.OpenGL;
	
	import GZ.Gpu.Gpu;
	import GZ.Gpu.GpuInfo;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	import GzOpenGL.OpGpu;
	import GZ.Gpu.ShaderBase.FragmentShader;
	
	<cpp>
		Lib_GZ::Gpu::ShaderModel::GzModel::cGzShModel* ptrGzShModel = 0;
		
		
//extern "C" {
	
		gzInt UpdateFragmentShader(std::string _sSrc) {
			static int _nTest = 0;
			_nTest++;
			if(_nTest == 150){
				printf("\n\nCalllll yeahhhhh: %s\n", _sSrc.c_str());
				ptrGzShModel->oFragement->fUpdateShader(gzStrC(_sSrc.c_str()));
			}
			
			return 1;
		}

		EMSCRIPTEN_BINDINGS(my_module) {
			function("UpdateFragmentShader", &UpdateFragmentShader);
		}
		
//	}
	</cpp>
	
	
	

	public class SOpGpu overplace OpGpu  {
		
		public function SOpGpu(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Void {
		
		}
		
		
		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):Void{
			Debug.fTrace("Load Img");
		}
		
		override public function fContextIni(_nHandleId : UIntX, _bGlobalSharedContext : Bool):Bool{
		//			 Debug.fTrace("fContextIni blit disabled");
		//	return true;
		
			Debug.fTrace("*********** SOP EMSC!! fContextIni GPU : " );
			
			
			OpenGL.fClearColor(1.0, 0.0, 0.0, 0.5);
			
			OpenGL.fClear(COLOR_BUFFER_BIT);
			
			fLoadDefaultShader();
			
			Debug.fTrace("Finish" );
			

			
			return true;
		}
		
		
				
		 override public function fBlit():Void {
		 
		 
		//	 Debug.fTrace("GPU blit disabled");
			// return;
			 
			 <cpp>
			//val window = val::global("window");
			val FPSMeter = val::global("meter");
			if(!FPSMeter.isUndefined()){
				 FPSMeter.call<Void>("tickStart");
			}
			//val FPSMeter = window.get("FPSMeter");
			
			  </cpp>
			// Debug.fTrace("fBlit: Gpu");
			oGzShModel.fDraw();
			<cpp>
			if(!FPSMeter.isUndefined()){
				FPSMeter.call<Void>("tick");
			}
			</cpp>
		 }
		
		
		
		 public function fLoadDefaultShader():Bool {

			oGzShModel = new GzShModel();
			<cpp>
				ptrGzShModel = oGzShModel.get();
			</cpp>
		 }
		
		
		 override public function fClear():Void {
		
		 }
		 
		 
		 
		

	}
}