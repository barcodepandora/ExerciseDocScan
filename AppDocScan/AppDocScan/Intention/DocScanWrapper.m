//
//  DocScanWrapper.cpp
//  AppDocScan
//
//  Created by Juan Manuel Moreno on 15/07/24.
//

//#import <Foundation/Foundation.h>
//#import "DocScan.hpp"
//
//@interface DocScanWrapper : NSObject
//
//- (instancetype)init;
//- (void)findDocumentCornersInImage:(UIImage *)image withCompletion:(void (^)(NSArray<NSValue *> *corners))completion;
//
//@end
//
//@implementation DocScanWrapper
//
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        // Inicialización si es necesario
//    }
//    return self;
//}
//
//- (void)findDocumentCornersInImage:(UIImage *)image withCompletion:(void (^)(NSArray<NSValue *> *corners))completion {
//    cv::Mat cvImage;
//    UIImageToMat(image, cvImage); // Esta función convierte UIImage a cv::Mat
//    std::vector<cv::Point> corners;
//    findDocumentCorners(cvImage, corners);
//    
//    NSMutableArray<NSValue *> *cornerValues = [NSMutableArray array];
//    for (const auto& point : corners) {
//        [cornerValues addObject:[NSValue valueWithCGPoint:CGPointMake(point.x, point.y)]];
//    }
//    completion(cornerValues);
//}
//
//// Función para convertir UIImage a cv::Mat (puedes implementar esta función según tus necesidades)
//void UIImageToMat(UIImage *image, cv::Mat& mat) {
//    // Aquí va la implementación de la conversión de UIImage a cv::Mat
//}
//
//@end
