//
//  CameraView.swift
//  AppDocScan
//
//  Created by Juan Manuel Moreno on 15/07/24.
//

import SwiftUI

protocol CameraViewProtocol {
    func receivePoints(points: [CGPoint])
}

struct CameraView: UIViewControllerRepresentable {
    
    var points: [CGPoint]?
    private var vc: CameraViewController?
    
    init(points: [CGPoint]? = [CGPoint(x: 50, y: 50),CGPoint(x: 194, y: 50), CGPoint(x: 194, y: 194),CGPoint(x: 50, y: 194)], vc: CameraViewController? = CameraViewController()) {
        self.points = points
        self.vc = vc
    }
    
    func makeUIViewController(context: Context) -> CameraViewController {
        return vc!
    }

    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
        // No update needed
    }
}

extension CameraView: CameraViewProtocol {
    func receivePoints(points: [CGPoint]) {
        
    }
}

