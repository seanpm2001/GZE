//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Base.PtA;
	import GZ.Base.Pod.Point;

	/**
	 * @author Maeiky
	 */
	public extension Attribute extends Root {

		public var oGblPt : PtA;
				
				
		public var nGAttRed  : Float;
		public var nGAttGreen : Float;
		public var nGAttBlue : Float;
		public var nGAttAlpha : Float = 1.0;
	
	
		public var nGAttRoll : Float;
		public var nGAttYaw : Float;
		public var nGAttPitch : Float;
		

		public var nGAttWidth  : Float = 1.0;
		public var nGAttHeight : Float = 1.0;
		public var nGAttLength : Float = 1.0;
		public var nGAttType : Float = 1.0;

		
		
		public  var nAttX : Float;
		public  var nAttY : Float;
		public  var nAttZ : Float;
		//
		private  var nAttRoll : Float;
		private  var nAttYaw : Float;
		private  var nAttPitch : Float;
		//
		private  var nAttWidth : Float = 1;
		private  var nAttHeight : Float = 1;
		private  var nAttLength : Float=  1;
		//
		private  var nAttRed : Float;
		private  var nAttGreen : Float;
		private  var nAttBlue : EaseFloat;
		private  var nAttAlpha : EaseFloat = 1.0;

		
		private  var vPos : Point<EaseFloat>;
		
		
		
		
		public function Attribute( _oParent : Root):Void {
			Root(_oParent);
			 oGblPt : PtA = new PtA();
			//hRotateOrder = eRotateOrder.YawPitchRoll;
			
			//oQuaternion = new Quaternion();
			//oCopyQuater = oQuaternion;
		}

		////////////////////////////////////////////////////////
		//////////////////// Position //////////////////////////
		////////////////////////////////////////////////////////

		//////////////// Wrap ////////////////
		public function TnX(_nVal : Float):Void {
			<cpp>
		//	vPos.nX.fTo( _nVal);
			</cpp>
			
			vPos.nX.fTo( _nVal);
		}
		
		
		public function WnX(_nVal : Float):Void {
			nAttX = _nVal;
			vPos.nX  = _nVal;
		}
		public function WnY(_nVal : Float):Void {
			nAttY = _nVal;
			vPos.nY  = _nVal;
		}
		public function WnZ(_nVal : Float):Void {
			nAttZ = _nVal;
			vPos.nZ  = _nVal;
		}
		
		////////////////	////////////////

		//////////////////////////////
		public function fApplyColor():Void {

		}





		override public function  fApplyPos():Void {
			
			<cpp>
			//vPos.vSpeed.nVal = 10;
			//vPos.vSpeed.nTo = 2;
			
			//vPos.fStep();
			</cpp>
			
			vPos.fSetSpeed(-100);
			vPos.fSetLimit(99900);
			
			vPos.fStep();
			
			/*
			vPos.nX.fStep();
			vPos.nY.fStep();
			vPos.nZ.fStep();
			*/
			
		/*
	nAttX = 100;
	nAttY = 100;
	nAttZ = 0;
	*/
	/*
			oGblPt.nX = nAttX * oParent.nGAttWidth;
			oGblPt.nY = nAttY * oParent.nGAttHeight;
			oGblPt.nZ = nAttZ * oParent.nGAttLength;
			*/
			
			oGblPt.nX = vPos.nX  * oParent.nGAttWidth;
			oGblPt.nY = vPos.nY  * oParent.nGAttHeight;
			oGblPt.nZ = vPos.nZ  * oParent.nGAttLength;
			
		//	oGblPt.fRotate(oParent.oQuaternion);
			
			oGblPt.nX += oParent.oGblPt.nX;
			oGblPt.nY += oParent.oGblPt.nY;
			oGblPt.nZ += oParent.oGblPt.nZ;
			

			nGAttRoll = nAttRoll + oParent.nGAttRoll;
			nGAttYaw = nAttYaw + oParent.nGAttYaw;
			nGAttPitch = nAttPitch + oParent.nGAttPitch;

			nGAttRed  = nAttRed  + oParent.nGAttRed;
			nGAttGreen = nAttGreen + oParent.nGAttGreen;
			nGAttBlue = nAttBlue + oParent.nGAttBlue;

			nGAttWidth = nAttWidth * oParent.nGAttWidth;
			nGAttHeight = nAttHeight * oParent.nGAttHeight;
			nGAttLength = nAttLength * oParent.nGAttLength;

			nGAttAlpha = nAttAlpha * oParent.nGAttAlpha;

		}

	}
}
