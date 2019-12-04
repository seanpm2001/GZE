//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Base.Math.Math;
	import GZ.Base.Vec3;
	import GZ.Base.Quaternion;

	/**
	 * @author Maeiky
	 */
	public vector Pt extends Vec3  {

		public function Pt(_nX : Number = 0, _nY : Number = 0, _nZ : Number = 0):Void  {
			//Vec3(_nX, _nY, _nZ);
		}

		
		//TODO TEMP already in VEC3!!!!!!!!!!!!!!!
		public function  fCross(_oOther : Vec3<Number>):Void {
			
			var _nTempX : Number = (nZ * _oOther.nY ) - (nY * _oOther.nZ);
			var _nTempY : Number = (nX * _oOther.nZ ) - (nZ * _oOther.nX);
			nZ = 				  (nY * _oOther.nX ) - (nX * _oOther.nY);
			nX = _nTempX;
			nY = _nTempY;
		}	
		
		public function  fRevCross(_oOther : Vec3<Number>):Void {
			
			var _nTempX : Number = (_oOther.nZ * nY ) - (_oOther.nY * nZ);
			var _nTempY : Number = (_oOther.nX * nZ ) - (_oOther.nZ * nX);
			nZ = 				  (_oOther.nY * nX ) - (_oOther.nX * nY);
			nX = _nTempX;
			nY = _nTempY;
		}
		
		public function fRotate(_oQuat : Quaternion<Number> ):Void{
			// return pt + 2.0*cross(rot.xyz, cross(rot.xyz,pt) + rot.w*pt);
			var _nTempX : Number = nX;
			var _nTempY : Number = nY;
			var _nTempZ : Number = nZ;
			
			/*
			evar _oTemp : Vec3;
			_oTemp = this;
			_oTemp.fRevCross(_oQuat);
			_oTemp.nX += _oQuat.nW * _oTemp.nX;
			_oTemp.nY += _oQuat.nW * _oTemp.nY;
			_oTemp.nZ += _oQuat.nW * _oTemp.nZ;
			*/
			
			
			<cpp>
			fCross(GZ_VecUpCast( gzVecVec3<T>,_oQuat)); //TODO autocast in C~
			</cpp>
			
			//fCross(_oQuat)
			
			
			
			nX += _nTempX * _oQuat.nW;
			nY += _nTempY * _oQuat.nW;
			nZ += _nTempZ * _oQuat.nW;
			
			<cpp>
			fCross(GZ_VecUpCast( gzVecVec3<T>,_oQuat)); //TODO autocast in C~
			</cpp>
			
			//fCross(_oQuat);
			nX = 2 * nX + _nTempX;
			nY = 2 * nY + _nTempY;
			nZ = 2 * nZ + _nTempZ;
		}
		//////////////////////////////////////////////////
		
		public function fSetDist(_vPtFrom : Pt<Number>, _nAngle : Float, _nDistance : Float):Void {
			nX = _vPtFrom.nX + Math.fSin(_nAngle) * _nDistance;
			nY = _vPtFrom.nY + Math.fCos(_nAngle) * _nDistance;
		}
		
		
		
		
		
		

	}
}
