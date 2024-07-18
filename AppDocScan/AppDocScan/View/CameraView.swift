//
//  CameraView.swift
//  AppDocScan
//
//  Created by Juan Manuel Moreno on 15/07/24.
//

import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    private var vc: CameraViewController?
    
    init(vc: CameraViewController? = CameraViewController()) {
        self.vc = vc
    }
    
    func makeUIViewController(context: Context) -> CameraViewController {
        return vc!
    }
    
//    func captureAsIs() {
//        vc?.captureOutput(<#T##output: AVCaptureOutput!##AVCaptureOutput!#>, didOutput: <#T##CMSampleBuffer!#>, from: <#T##AVCaptureConnection!#>)
//    }
//    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
        // No update needed
    }
}
