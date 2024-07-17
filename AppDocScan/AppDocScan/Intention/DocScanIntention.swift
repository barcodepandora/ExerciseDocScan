//
//  DocScanIntention.swift
//  AppDocScan
//
//  Created by Juan Manuel Moreno on 16/07/24.
//

import Foundation
import UIKit

class DocScanIntention {
//    func findDocumentCornersInUIImage(image: UIImage) {
//        let imageAsCGImage = self.uiImageToCGImage(image: image)!
//        let imageAsPixelData = self.extractPixelData(from: imageAsCGImage)
//        if let pointer = convertToUnsafeMutablePointer(data: imageAsPixelData) {
////            findDocumentCornersFromPixel(pointer, 123, 453)
//        }
//    }
                                                               
    func uiImageToCGImage(image: UIImage) -> CGImage? {
        return image.cgImage
    }
   
    func extractPixelData(from image: CGImage) -> [UInt8]? {
        let width = image.width
        let height = image.height
        let bytesPerPixel = 4
        let bytesPerRow = bytesPerPixel * width
        let bitsPerComponent = 8

        var pixelData = [UInt8](repeating: 0, count: width * height * bytesPerPixel)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(
           data: &pixelData,
           width: width,
           height: height,
           bitsPerComponent: bitsPerComponent,
           bytesPerRow: bytesPerRow,
           space: colorSpace,
           bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        )
        context?.draw(image, in: CGRect(x: 0, y: 0, width: width, height: height))
        return pixelData
    }
    
    func convertToUnsafeMutablePointer(data: [UInt8]?) -> UnsafeMutablePointer<UInt8>? {
        guard var data = data else {
            return nil
        }

        return data.withUnsafeMutableBufferPointer { bufferPointer in
            if let baseAddress = bufferPointer.baseAddress {
                return baseAddress
            } else {
                return nil
            }
        }
    }
}
