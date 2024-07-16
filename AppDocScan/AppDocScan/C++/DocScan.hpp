//
//  DocScan.hpp
//  AppDocScan
//
//  Created by Juan Manuel Moreno on 15/07/24.
//

//#ifndef DocScan_hpp
//#define DocScan_hpp
//
//#include <stdio.h>
//
//#endif /* DocScan_hpp */

//#ifndef DocScan_hpp
//#define DocScan_hpp
//
////#include <opencv2/opencv.hpp>
//
//#include <opencv2/core/core.hpp>
//#include <vector>
//
//void findDocumentCorners(const cv::Mat& image, std::vector<cv::Point>& corners);
//
//#endif /* DocScan_hpp */

#ifndef DocScan_hpp
#define DocScan_hpp


#include <opencv2/opencv.hpp>

inline double angle(const cv::Point& pt1, const cv::Point& pt2, const cv::Point& pt0);

inline void findDocumentCorners(const cv::Mat& image, std::vector<cv::Point>& corners);

#endif /* DocScan_h */
