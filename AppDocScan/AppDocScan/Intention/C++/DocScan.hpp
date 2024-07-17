//
//  DocScan.hpp
//  AppDocScan
//
//  Created by Juan Manuel Moreno on 15/07/24.
//

#ifndef DocScan_hpp
#define DocScan_hpp

#include <stdio.h>
#include "Point.h"

#endif /* DocScan_h */

#ifdef __cplusplus
extern "C" {
#endif

//void findDocumentCornersFromPixel(unsigned char* pixelData, int width, int height, APoint*& points);
void findDocumentCornersFromPixel(unsigned char* pixelData, int width, int height, APoint** points);

//void findDocumentCornersFromPixel(unsigned char* pixelData, int width, int height);

#ifdef __cplusplus
}
#endif
