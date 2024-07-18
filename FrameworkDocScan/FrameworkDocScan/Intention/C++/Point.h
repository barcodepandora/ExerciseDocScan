//
//  Point.hpp
//  AppDocScan
//
//  Created by Juan Manuel Moreno on 16/07/24.
//

#ifndef Point_hpp
#define Point_hpp

#include <stdio.h>

//namespace MyNamespace {
//struct APoint {
//    int x;
//    int y;
//
//    // Add a constructor
//    APoint(int x, int y) : x(x), y(y) {}
//};
//}

typedef struct APoint {
    int x;
    int y;
} APoint;

#endif /* InC_hpp */

#ifdef __cplusplus
extern "C" {
#endif

void myPFunction();

#ifdef __cplusplus
}
#endif
