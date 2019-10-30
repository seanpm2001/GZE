//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Sff.Xml.Xml;
	import GZ.Sff.Xml.XmlNode;
	import GZ.Sff.Xml.XmlElement;
	import GZ.Sff.Xml.XmlText;
	import GZ.Gfx.Tile.MapData;

	/**
	 * @author Maeiky
	 */
	public class Tmx extends Xml {

		public var oXml : Xml;
		public var oCurrNode : XmlNode;

		public var nWidth : UInt;
		public var nHeight : UInt;

		//public var oMainMap : TmxMap;
		public var oMainMap : MapData;


		public function Tmx(_oParentNode:XmlNode):Void {
			oMainMap = new MapData();
		}

		public function fLoad( _sPath : String = ""):Bool {

			if(xXml.fLoad(_sPath)){
			
				oCurrNode = fFirst();
				if(oCurrNode.hType == XmlNode.eType.Element){
					var _oElement : XmlElement = oCurrNode;
					oMainMap.fLoadTxmNode(_oElement);
				}
				return false;
			}
			
			Debug.fError("Unable to load:" + _sPath );

			return false;
		}



		public function fTest( _sElement : String = ""):XmlNode{
			return this;
		}


	}
}
