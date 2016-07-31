//
//  GameViewController.swift
//  SpaceMan
//
//  Created by Edward Kim on 7/27/16.
//  Copyright © 2016 Mihky's Laboratory. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import SpriteKit

class GameViewController : UIViewController {
    var captureSession : AVCaptureSession?
    var device : AVCaptureDevice?
    var deviceInput : AVCaptureDeviceInput?
    var background : AVCaptureVideoPreviewLayer?
    var spritesOverlay : SKScene?
    
    var characterSprite : UIImageView?
    var healthBar : SKSpriteNode?
    var scoreTextLabel : UILabel?
    var score : UILabel?
    var ammoLabel : UILabel?
    var settings : UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the UI
        characterSprite = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        characterSprite?.image = UIImage(named: "CHARACTER SPRITE IMAGE GOES HERE")
        characterSprite?.backgroundColor = UIColor.clearColor()
        
        scoreTextLabel = UILabel(frame: CGRect(x: 0, y: 60, width: 50, height: 25))
        scoreTextLabel?.text = "Score: "
        scoreTextLabel?.backgroundColor = UIColor.clearColor()
        
        score = UILabel(frame: CGRect(x: 50, y: 60, width: 100, height: 25))
        score?.backgroundColor = UIColor.clearColor()
        score?.text = "0"
        score?.textAlignment = .Left
        
        ammoLabel = UILabel(frame: CGRect(x: self.view.bounds.width - 50, y: self.view.bounds.height - 25, width: 50, height: 25))
        
//        settings = UIButton(type: UIButtonType.)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Create augmented reality background using camera as live stream.
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
        let overlay = UIView(frame: CGRect(x: 0, y: 0, width: 667, height: 480))
        self.view.addSubview(overlay)
        overlay.layer.addSublayer(background!)
        background!.frame = overlay.frame
        background?.connection.videoOrientation = AVCaptureVideoOrientation.LandscapeRight
        captureSession?.startRunning()
        
        // Create layer to put all the UI on.
        spritesOverlay = SKScene(size: CGSize(width: overlay.frame.width, height: overlay.frame.height))
//        self.view.addSubview(spritesOverlay)
        
        // Create the health bar
        healthBar = SKSpriteNode(color: UIConstants.teal, size: CGSize(width: 150, height: 50))
        spritesOverlay?.addChild(healthBar!)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        captureSession?.stopRunning()
    }
    

}