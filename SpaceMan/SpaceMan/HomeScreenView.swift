//
//  HomeScreenView.swift
//  SpaceMan
//
//  Created by Edward Kim on 7/26/16.
//  Copyright © 2016 Mihky's Laboratory. All rights reserved.
//

import Foundation
import UIKit
import SceneKit
import CoreMotion

class HomeScreenView : UIView {
    var backgroundView : SCNView!
    let motionManager = CMMotionManager()
    let cameraNode = SCNNode()
    var gameTitle = UIView()
    var playButton = UIButton()
    var storyButton = UIButton()
    
    //
    // MARK: - Initialization
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        let backgroundImage = UIImage(named: "background.jpg")
        backgroundView = SCNView(frame: CGRect(x: 0, y: 0, width: 667, height: 375))
        let scene = SCNScene()
        backgroundView.scene = scene
        backgroundView.allowsCameraControl = true
        
        // Material
        let sphere = SCNSphere(radius: 20.0)
        sphere.firstMaterial!.doubleSided = true
        sphere.firstMaterial!.diffuse.contents = backgroundImage
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3Make(0,0,0)
        scene.rootNode.addChildNode(sphereNode)
        backgroundView.userInteractionEnabled = false
        
        // Camera
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 0)
        scene.rootNode.addChildNode(cameraNode)
        
        // Movement
        if motionManager.deviceMotionAvailable {
            // Action
            motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
            motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: cameraRotate)
        }
        self.addSubview(backgroundView)
        
        // Play button
        playButton.setTitle("Play", forState: UIControlState.Normal)
        playButton.setTitleColor(UIConstants.teal, forState: UIControlState.Normal)
        let playText = NSAttributedString(string: (playButton.titleLabel?.text)!, attributes: [NSKernAttributeName:5.0, NSFontAttributeName:playButton.titleLabel!.font, NSForegroundColorAttributeName:playButton.titleLabel!.textColor])
        playButton.setAttributedTitle(playText, forState: .Normal)
        playButton.backgroundColor = UIColor.blackColor()
        playButton.alpha = 0.75
        playButton.layer.borderWidth = 1.0
        playButton.layer.borderColor = UIConstants.teal.CGColor
        playButton.layer.cornerRadius = 20;
        self.addSubview(self.playButton)
        
        // Story button
        storyButton.setTitle("Story", forState: UIControlState.Normal)
        storyButton.setTitleColor(UIConstants.teal, forState: UIControlState.Normal)
        let storyText = NSAttributedString(string:(storyButton.titleLabel?.text)!, attributes: [NSKernAttributeName:5.0, NSFontAttributeName:storyButton.titleLabel!.font, NSForegroundColorAttributeName:storyButton.titleLabel!.textColor])
        storyButton.setAttributedTitle(storyText, forState: .Normal)
        storyButton.backgroundColor = UIColor.blackColor()
        storyButton.alpha = 0.75
        storyButton.layer.borderWidth = 1.0
        storyButton.layer.borderColor = UIConstants.teal.CGColor
        storyButton.layer.cornerRadius = 20;
        self.addSubview(self.storyButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.playButton.frame = CGRect(x: 100, y: self.frame.height/2 - 25 + (self.frame.height*0.25), width: 150, height: 50)
        self.storyButton.frame = CGRect(x: 400, y: self.frame.height/2 - 25 + (self.frame.height*0.25), width: self.playButton.frame.width, height: self.playButton.frame.height)
    }
    
    func cameraRotate(motion: CMDeviceMotion?, error: NSError?) {
        let attitude: CMAttitude = motion!.attitude
        self.cameraNode.eulerAngles = SCNVector3Make(Float(attitude.roll - M_PI/2), Float(attitude.yaw), Float(attitude.pitch))
    }
}