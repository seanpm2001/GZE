﻿package  { 

	import GZ.Sys.Context;
	import GZ.Base.Thread.Thread;
	import GZ.Sys.ThreadObj;

	public class ThreadItf extends Thread  {
		
		public var oWindow : Context;
		
		public function ThreadItf():Void{
			
			//Create default debug singleton for this new thread
			Debug = new Debug();
			Debug.fInfo("-- New ThreadItf --");
			<cpp>
			//printf("\n-- New ThreadItf -- %p ", thread);
			printf("\n-- New ThreadItf -- %p , id: %d", thread, thread->nId);
			</cpp>
		}

		
		
	}
}
