//
//  ContentView.swift
//  AppDocScan
//
//  Created by Juan Manuel Moreno on 15/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cameraView = CameraView()
    @State private var corners: [CGPoint] = []
    
    var body: some View {
        VStack {
            Button(action: { doLa() }) {
                Text("Test")
            }
            cameraView.edgesIgnoringSafeArea(.all)
            Rectangle()
                .fill(Color.green)
            //                .frame(width: corners.distance(x: 0, y: 1) + corners.distance(x: 2, y: 3),
            //                       height: corners.distance(x: 0, y: 3) + corners.distance(x: 1, y: 2))
            //                .offset(x: (corners[0].x + corners[2].x) / 2, y: (corners[0].y + corners[1].y) / 2)
                .frame(width: 124,
                       height: 312)
                .offset(x: 0, y: 0)

        }
    }
    
    func doLa() {
        myCFunction()
        findDocumentCornersInUIImage(image: UIImage(named: "Test")!)
    }
    
    func findDocumentCornersInUIImage(image: UIImage) {
        var intention = DocScanIntention()
        let imageAsCGImage = intention.uiImageToCGImage(image: image)!
        let imageAsPixelData = intention.extractPixelData(from: imageAsCGImage)
        if let pointer = intention.convertToUnsafeMutablePointer(data: imageAsPixelData) {
            var points: UnsafeMutablePointer<APoint>? = nil
            findDocumentCornersFromPixel(pointer, 153, 367, &points)

//            // Use the result
//            if let points = points {
//                // points now points to an array of APoint structs
//                // You can access the points like this:
//                let pointCount = 4 // assuming the function returns 4 points
//                for i in 0..<pointCount {
//                    let point = points[i]
//                    print("Point \(i): (\(point.x), \(point.y))")
//                }
//                // Don't forget to free the memory allocated by the function
//                points.deallocate()
//            } else {
//                print("Error: points is nil")
//            }
//
//            // Deallocate the pixel data buffer
//            pixelData.deallocate()
            
//            findDocumentCornersFromPixel(pointer, 112, 345, )
        }
    }

}

#Preview {
    ContentView()
}
