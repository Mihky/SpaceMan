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
//import FontAwesomeKit

class GameViewController : UIViewController {
    var captureSession : AVCaptureSession?
    var device : AVCaptureDevice?
    var deviceInput : AVCaptureDeviceInput?
    var background : AVCaptureVideoPreviewLayer?
    var gameScene : SKScene?
    
    var gameView : SKView?
    var characterSprite : UIImageView?
    var healthBar : SKSpriteNode?
    var scoreTextLabel : UILabel?
    var score : UILabel?
    var ammoLabel : UILabel?
    var settings : UIButton?
    
    var player : SpaceManPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = SpaceManPlayer()

        
        // Create the UI
        characterSprite = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        characterSprite?.image = UIImage(named: "helmet.jpg")
        characterSprite?.backgroundColor = UIColor.clearColor()
        
        scoreTextLabel = UILabel(frame: CGRect(x: 0, y: 60, width: 50, height: 25))
        scoreTextLabel?.text = "Score: "
        scoreTextLabel?.backgroundColor = UIColor.clearColor()
        
        score = UILabel(frame: CGRect(x: 50, y: 60, width: 100, height: 25))
        score?.backgroundColor = UIColor.clearColor()
        score?.text = String(player?.getScore())
        score?.textAlignment = .Left
        
        ammoLabel = UILabel(frame: CGRect(x: self.view.bounds.width - 50, y: self.view.bounds.height - 25, width: 50, height: 25))
        ammoLabel?.backgroundColor = UIColor.clearColor()
        ammoLabel?.textAlignment = .Center
        // FIXME
        ammoLabel?.text = String(player?.getAmmo()) + "/INF"
        
        settings = UIButton(frame: CGRect(x: self.view.bounds.width - 30, y: 0, width: 30, height: 30))
        settings!.backgroundColor = UIColor.clearColor()
        // FIXME
//        settings.setImage(<#T##image: UIImage?##UIImage?#>, forState: UIControlState.)
//        var image = String.fontAwesomeIconWithCode("fa-github")

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
        
        overlay.addSubview(characterSprite!)
        overlay.addSubview(scoreTextLabel!)
        overlay.addSubview(score!)
        overlay.addSubview(ammoLabel!)
        // Create layer to put all the UI on.
        gameView = SKView(frame: self.view.frame)
        gameView?.backgroundColor = UIColor.clearColor()
        self.view.addSubview(gameView!)
        gameScene = SKScene(size: CGSize(width: gameView!.frame.width, height: gameView!.frame.height))
        gameScene?.backgroundColor = UIColor.clearColor()
        gameView?.presentScene(gameScene)
        
        // Create the health bar
        healthBar = SKSpriteNode(color: UIConstants.teal, size: CGSize(width: 150, height: 20))
        healthBar?.anchorPoint = CGPointMake(0, 0.5)
        healthBar?.position = CGPoint(x: 50, y: (gameScene?.frame.height)! - healthBar!.frame.height/2)
        healthBar?.zPosition = 999
        gameScene?.addChild(healthBar!)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        captureSession?.stopRunning()
    }
    

}