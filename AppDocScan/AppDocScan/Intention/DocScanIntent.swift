//
//  DocScanIntention.swift
//  AppDocScan
//
//  Created by Juan Manuel Moreno on 16/07/24.
//

import Foundation
import UIKit

class DocScanIntent {
    
    func findDocumentCornersInUIImage(image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        let width = cgImage.width
        let height = cgImage.height
        let bytesPerPixel = 4 // Assuming RGBA
        let bytesPerRow = width * bytesPerPixel
        let rawData = UnsafeMutablePointer<UInt8>.allocate(capacity: height * bytesPerRow)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: rawData, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: CGImageAlphaInfo.none.rawValue)
        let pixelData = rawData
        var points: UnsafeMutablePointer<APoint>? = nil
        findDocumentCornersFromPixel(pixelData, 153, 367, &points)
        print(points)

    }
}
