//
//  CameraViewController.swift
//  AppDocScan
//
//  Created by Juan Manuel Moreno on 15/07/24.
//

import UIKit
import AVFoundation
import FrameworkDocScan

class CameraViewController: UIViewController {
    
    var delegate: CameraViewProtocol?
    
    // AVCaptureSession, AVCaptureVideoPreviewLayer
    let captureSession = AVCaptureSession()
    let previewLayer = AVCaptureVideoPreviewLayer()

    // Image to share
    var capturedFrame: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Prepare cam
        guard let camera = AVCaptureDevice.default(for: .video) else {
            print("No cam")
            return
        }

        do {
            
            // Sessuin
            let input = try AVCaptureDeviceInput(device: camera)
            captureSession.addInput(input)

            // Picture
            let videoOutput = AVCaptureVideoDataOutput()
            videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
            captureSession.addOutput(videoOutput)

            // Preview
            previewLayer.session = captureSession
            previewLayer.frame = view.bounds
            view.layer.addSublayer(previewLayer)

            // Session launch
            captureSession.startRunning()
        } catch {
            print("Error setting up camera: \(error)")
        }
    }
}

// Output
extension CameraViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput!, didOutput sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {
        
        // Get the image buffer from the sample buffer
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            print("Error getting image buffer")
            return
        }

//        // Create CIImage
        let ciImage = CIImage(cvImageBuffer: imageBuffer)
//
//        // Create UIImage
        let uiImage = UIImage(ciImage: ciImage)
//
//        // Store the captured frame in the capturedFrame property
        capturedFrame = uiImage
//
//        // Use
//        DispatchQueue.main.async { [self] in
        DocScanIntention().findDocumentCorners(image: capturedFrame!)
        delegate?.receivePoints(points: [])
//            let imageView = UIImageView(image: self.capturedFrame)
//            self.view.addSubview(imageView)
//        }
    }
}
