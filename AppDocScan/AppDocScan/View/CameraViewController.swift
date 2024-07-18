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
    // Create a AVCaptureSession and AVCaptureVideoPreviewLayer
    let captureSession = AVCaptureSession()
    let previewLayer = AVCaptureVideoPreviewLayer()

    // Create a UIImage to store the captured frame
    var capturedFrame: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the camera
        guard let camera = AVCaptureDevice.default(for: .video) else {
            print("No camera available")
            return
        }

        do {
            let input = try AVCaptureDeviceInput(device: camera)
            captureSession.addInput(input)

            // Create a AVCaptureVideoDataOutput to capture frames
            let videoOutput = AVCaptureVideoDataOutput()
            videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
            captureSession.addOutput(videoOutput)

            // Set up the preview layer
            previewLayer.session = captureSession
            previewLayer.frame = view.bounds
            view.layer.addSublayer(previewLayer)

            // Start the capture session
            captureSession.startRunning()
        } catch {
            print("Error setting up camera: \(error)")
        }
    }
}

extension CameraViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput!, didOutput sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {
        // Get the image buffer from the sample buffer
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            print("Error getting image buffer")
            return
        }

        // Create a CIImage from the image buffer
        let ciImage = CIImage(cvImageBuffer: imageBuffer)

        // Create a UIImage from the CIImage
        let uiImage = UIImage(ciImage: ciImage)

        // Store the captured frame in the capturedFrame property
        capturedFrame = uiImage

        // You can now use the capturedFrame property to display the image
        DispatchQueue.main.async { [self] in
            // Update the UI on the main thread
            DocScanIntention().findDocumentCorners(image: capturedFrame!)
            let imageView = UIImageView(image: self.capturedFrame)
            self.view.addSubview(imageView)
        }
    }
}
