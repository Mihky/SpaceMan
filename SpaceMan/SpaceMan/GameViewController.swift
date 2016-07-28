//
//  GameViewController.swift
//  SpaceMan
//
//  Created by Edward Kim on 7/27/16.
//  Copyright © 2016 Mihky's Laboratory. All rights reserved.
//

import Foundation
import UIKit

class GameViewController : UIViewController {
    var gameView = GameView()
    //    var player = SpaceManPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        self.view = self.gameView
    }
    
    //    func updateHealth() {
    //        self.gameScreenView.healthLabel.text = "HP: " + String(self.player.getHealth())
    //    }
    //
    //    func updateScore() {
    //        self.gameScreenView.scoreLabel.text = "Score: " + String(self.player.getScore())
    //    }
    //
    //    func updateAmmo() {
    //        self.gameScreenView.ammoLabel.text = String(self.player.getAmmo()) + "/infinity"
    //    }
}