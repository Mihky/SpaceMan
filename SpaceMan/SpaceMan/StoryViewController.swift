//
//  StoryViewController.swift
//  SpaceMan
//
//  Created by Edward Kim on 7/27/16.
//  Copyright © 2016 Mihky's Laboratory. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class StoryViewController : UIViewController {
    var captureSession : AVCaptureSession?
    var device : AVCaptureDevice?
    var deviceInput : AVCaptureDeviceInput?
    var background : AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPresetMedium
        device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        do {
            deviceInput = try AVCaptureDeviceInput(device: device!)
        } catch {
            print(error)
        }
        if ((captureSession?.canAddInput(deviceInput)) != nil) {
            captureSession?.addInput(deviceInput)
        }
        
        background = AVCaptureVideoPreviewLayer(session: captureSession)
        background?.videoGravity = AVLayerVideoGravityResizeAspectFill
//        captureSession.addV
        let overlay = UIView(frame: CGRect(x: 0, y: 0, width: 667, height: 480))
        self.view.addSubview(overlay)
        overlay.layer.addSublayer(background!)
        background!.frame = overlay.frame
        background?.connection.videoOrientation = AVCaptureVideoOrientation.LandscapeRight
        captureSession?.startRunning()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        captureSession?.stopRunning()
    }
    
}