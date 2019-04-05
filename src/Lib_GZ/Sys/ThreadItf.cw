﻿package  { 

	import GZ.Sys.Interface.Context;
	import GZ.Base.Thread.Thread;
	import GZ.Sys.ThreadObj;
	import GZ.File.File;
	import GZ.Sys.System;

	public class ThreadItf extends Thread  {
		
		public var oWindow : Context;
		
		public function ThreadItf():Void{
			
			//Create default debug singleton for this new thread
			Debug = new Debug();
			System = new System();
			File = new File("Sys|CurrentModule");
			Debug.fInfo("-- New ThreadItf --");
			<cpp>
			//printf("\n-- New ThreadItf -- %p ", thread);
			printf("\n-- New ThreadItf -- %p , id: %d", thread, thread->nId);
			</cpp>
		}

		
		
	}
}
