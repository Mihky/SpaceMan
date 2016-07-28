//
//  GameView.swift
//  SpaceMan
//
//  Created by Edward Kim on 7/27/16.
//  Copyright © 2016 Mihky's Laboratory. All rights reserved.
//

import Foundation
import UIKit

class GameView : UIView {
    //    var healthLabel : UILabel
    //    var scoreLabel : UILabel
    //    var ammoLabel : UILabel
    //    var settingsButton : UIButton
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //        healthLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 25)
        //        scoreLabel.frame = CGRect(x: 0, y: 30, width: 200, height: 25)
        //        ammoLabel.frame = CGRect(x: 0, y: 60, width: 50, height: 25)
    }
}