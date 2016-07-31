//
//  HomeScreenViewController.swift
//  SpaceMan
//
//  Created by Edward Kim on 7/26/16.
//  Copyright © 2016 Mihky's Laboratory. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    var homeScreenView = HomeScreenView()
    var gameViewController : GameViewController?
    var storyViewController : StoryViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreenView.playButton.addTarget(self, action: #selector(HomeScreenViewController.playGame), forControlEvents: UIControlEvents.TouchUpInside)
        self.homeScreenView.storyButton.addTarget(self, action: #selector(HomeScreenViewController.goToStoryScreen), forControlEvents: UIControlEvents.TouchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func loadView() {
        self.view = self.homeScreenView
    }
    
    func playGame() {
        let allowCameraAccessAlertController = UIAlertController(title: "\"SpaceMan\" Would Like to Access the Camera", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        let noAllowAction = UIAlertAction(title: "Don't Allow", style: .Default, handler: {action in
            allowCameraAccessAlertController.dismissViewControllerAnimated(true, completion: nil)
        })
        let allowAction = UIAlertAction(title: "OK", style: .Default, handler: {action in
            allowCameraAccessAlertController.dismissViewControllerAnimated(true, completion: nil)
            // Creates/initializes game
            self.gameViewController = GameViewController()
            self.presentViewController(self.gameViewController!, animated: true, completion: nil)
        })
        allowCameraAccessAlertController.addAction(noAllowAction)
        allowCameraAccessAlertController.addAction(allowAction)
        
        presentViewController(allowCameraAccessAlertController, animated: true, completion: nil)
    }
    
    func goToStoryScreen() {
        self.storyViewController = StoryViewController()
        self.presentViewController(self.storyViewController!, animated: true, completion: nil)
    }
    
    
}

