﻿
#skipStatic

package  { 


	//import GZ.Base.Thread.ThreadExt;
	import GZ.Sys.System;

	public extension Thread extends Class  {
		
	
		
		public var bRun : Bool = true;
		public var nId : UInt = 0;
		public var nSleepTime : UInt = 1;
		
		
		<cpp_h>
			#include "Lib_GZ/Base/Thread/ThreadExt.h"
		</cpp_h>
		
		
		<cpp_class_h>
			static gzUInt nCurrId; //TODO MAKE IT ATOMIC
			cThreadExt* pThreadExt;
			gzArray<csClass*> st;
			gzSp<cClass> oObj;
			inline void fLinkThreadExt(cThreadExt* _pThreadExt){
				pThreadExt = _pThreadExt;
				pThreadExt->oThread = this;
			};
			inline void fStart(Lib_GZ::Base::cClass* _opObj){
			   oObj  = gzSCastSelf<Lib_GZ::Base::cClass>(_opObj);
				fLoop();
			}
		</cpp_class_h>
		
		<cpp_class>
			gzUInt cThread::nCurrId = 0; //TODO MAKE IT ATOMIC
			cThread* GzThread = 0;
		</cpp_class>
		
		<cpp_initializer_list>
			,pThreadExt(0)
		</cpp_initializer_list>
		
		<cpp_initializer>
				thread = this;
				nId = nCurrId;
				nCurrId++;
		</cpp_initializer>
		
		<cpp_namespace_h>
			}}}//Base, Thread
			
			namespace Base{
				class csClass;
			namespace Thread{
				class cStThread;
				class cThreadExt;
			namespace Thread{
		</cpp_namespace_h>
		
		<cpp_namespace_end_h>
			}}//Base, Thread
			class tApi_Lib_GZ csClass   {
				public:
					gzInt nClassId;
					//Auto Singleton
					gzSp<Lib_GZ::Base::cClass> zInst;
					Lib_GZ::Base::Thread::cThread* thread;//???????????????

					inline csClass(Lib_GZ::Base::Thread::cThread* _thread): thread(_thread), zInst(0) {};
					inline ~csClass(){};
			};

			GZ_mStaticClass(Class)
			namespace Thread{namespace Thread{
		</cpp_namespace_end_h>
		
				
		 public function Thread():Void  {
		 //Warning Not fully initilized
		}
		
		
		public function fLoop():Void {
			<cpp>
			#ifndef GZ_tMonothread
				while(bRun){
					oObj->ThreadLoop();
				    Lib_GZ::Sys::System::GetInst(thread)->fSleep(nSleepTime); //TODO Syteme
				}
			#else
				oObj->ThreadLoop();
			#endif
			</cpp>
		}

	}
}

