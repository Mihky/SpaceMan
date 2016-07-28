//
//  Alien.swift
//  SpaceMan
//
//  Created by Edward Kim on 7/27/16.
//  Copyright © 2016 Mihky's Laboratory. All rights reserved.
//

import Foundation

class Alien : NSObject {
    var enemyHealth : Int
    
    override init() {
        self.enemyHealth = 100
    }
    
    func reduceHealth(damage: Int) {
        self.enemyHealth -= damage
        if (self.enemyHealth <= 0) {
            self.enemyDies()
        }
    }
    
    func enemyDies() {
        // get rid of them
    }
}