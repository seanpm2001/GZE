//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.




#if !( defined tHDef_GZ_SharedCount)
#define tHDef_GZ_SharedCount

#include "Lib_GZ/Base/GzTypes.h"

namespace Lib_GZ{namespace Base{namespace SmartPtr{


//class SharedCount : gzAny {
class SharedCount : gzAny {
    public:
	
 	gzInt nSharedCount;
 	gzInt nWeakCount;
   
    inline SharedCount() : gzAny(), nSharedCount(0), nWeakCount(0){
   
   }
   
   
	inline void AddInst() const {
	
		//if(nSharedCount > 300){
		//	printf("\nnSharedCount: %d", nSharedCount);
		//}
		const_cast<SharedCount*>(this)->nSharedCount++;
		ViewAddInst();
	}; 
	inline void SubInst() const {
		const_cast<SharedCount*>(this)->nSharedCount--;
		ViewSubInst();
				
		//if(nSharedCount > 300){
	//		printf("\nnDelSharedCount: %d", nSharedCount);
		//}

		if(nSharedCount <= 0){
		//	printf("\nDelete ");
			delete this;
		}
	};
	
	//Only on debug
	inline virtual void ViewAddInst() const {
		
	}
	inline virtual void ViewSubInst() const {
		
	}
	
    virtual inline ~SharedCount(){
	};
};

}}
}

typedef Lib_GZ::Base::SmartPtr::SharedCount gzSharedCount;

#endif
