//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.File.RcImg;
	import GZ.File.RcImgSequence;

	<cpp_h>
		#include "Lib_GZ/3rdparty/Image/stb_rect_pack.h"
	</cpp_h>
	
	<cpp_class>
		stbrp_context context;
	</cpp_class>
	
	
	/**
	 * @author Maeiky
	 */
	public class RcAtlas extends RcImg {
	
		public var aSubImg : Array<RcImg>; 
		
		<cpp_class>
		gzArray<stbrp_rect> aStbRect;
		stbrp_node* nodes;
		</cpp_class>
			
			
		public function RcAtlas(_nSize:Int = 0):Void {
			<cpp>
			nodes = 0;
			</cpp>
			RcImg("");
			if(_nSize != 0){
				fCreate(_nSize, _nSize);
			}
		}
		

		public function fCreate(_nWidth:Int, _nHeight:Int) : Bool {
			<cpp>
			if(nodes != 0){
				GZ_fFree(nodes);
				GZ_fFree(aImg);
			}
			gzUInt _nTotalNode = _nWidth*2; //2 is a random value just to be safe
			nodes = (stbrp_node*)GZ_fMalloc(_nTotalNode, sizeof(stbrp_node));
			//nodes = GZ_fSafeMalloc( _nTotalNode, stbrp_node); //TODO free
			stbrp_init_target(&context, _nWidth, _nHeight, nodes, _nTotalNode);
			

			///// Alloc ////////
			gzUInt _nSizeOfPtr = _nHeight * sizeof(void*);
			gzInt32* _a1dArray = (gzInt32*)GZ_fCalloc(_nWidth * (_nHeight) + _nSizeOfPtr, sizeof(gzInt32));
			gzUIntX _n2dIndex = _nWidth * _nHeight;
			aImg = (gzInt32**)&_a1dArray[_n2dIndex];
			for(gzUInt i = 0; i < _nHeight; i++){
				aImg[i] = _a1dArray +  _nWidth * i;
			}
			nWidth = _nWidth;
			nHeight = _nHeight;
			///////////////////
			
			</cpp>
		}
	
	
		public function fAdd(_oImg : RcImg) : Bool {
			
			<cpp>
			stbrp_rect _rect;
			_rect.id = aStbRect.GnSize();
			_rect.w = _oImg->nWidth;
			_rect.h = _oImg->nHeight;
			_rect.x = 0;
			_rect.y = 0;
			
			aStbRect.fPush(_rect);
			</cpp>
			
			aSubImg.fPush(_oImg);
		}
		
		public function fAddSequence(_oImg : RcImgSequence) : Bool {
			for(var i : Int = 0; i < _oImg.aImg.nSize; i++){
				fAdd(_oImg.aImg[i]);
			}
		}
		
		public function fPack() : Bool {	
			<cpp>
			stbrp_pack_rects(&context, (stbrp_rect*)aStbRect.m.array(), aStbRect.GnSize());
			</cpp>
			return fCpuLoad();
		}
	
		override public function fCpuLoad():Bool {
			for(var i : UInt = 0; i < aSubImg.nSize; i++){
				var _nX : Int;
				var _nY : Int;
				var  _bIsPack : Bool;
				<cpp>
					stbrp_rect* _rect = &aStbRect[i];
					//printf("\n _rect->x %d : %d", _rect->x, _rect->y );
					_nX = _rect->x;
					_nY = _rect->y;
					_bIsPack = _rect->was_packed;
				</cpp>
				if(_bIsPack){}
					fCopy(aSubImg[i], _nX, _nY);
				}
			}
		}
		
		public function fCopy(_oImg: RcImg, _nX: UInt, _nY: UInt) : Bool {
			for(var y : UInt = 0; y < _oImg.nHeight; y++){
				for(var x : UInt = 0; x < _oImg.nWidth; x++){
					aImg[_nX + y][_nY + x] = _oImg.aImg[y][x];
				}
			}
		}
		
		public function fLoad() : Bool {
			
			Debug.fPass("RcAtlas Success");
			return true;
		}
		
		
		destructor {
			<cpp>
				if(nodes != 0){
					GZ_fFree(nodes);
					//GZ_fFree(aImg);
					GZ_fFree(aImg[0]);
					
				}
			</cpp>
		}
		
		
	}
}
