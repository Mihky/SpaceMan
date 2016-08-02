//
//  SpaceManPlayer.swift
//  SpaceMan
//
//  Created by Edward Kim on 7/27/16.
//  Copyright © 2016 Mihky's Laboratory. All rights reserved.
//

import Foundation

class SpaceManPlayer : NSObject {
    var playerHealth : Int
    var playerScore : Int
    var playerAmmo : Int
    
    override init() {
        self.playerHealth = 100
        self.playerScore = 0
        self.playerAmmo = 20
    }
    
    func reduceHealth(damage: Int) {
        self.playerHealth -= damage
        if (self.playerHealth <= 0) {
            self.playerHealth = 0
            self.playerDies()
        }
    }
    
    func increaseScore(points: Int) {
        self.playerScore += points
    }
    
    func reduceAmmo(ammoUsed: Int) {
        self.playerAmmo -= ammoUsed
    }
    
    func getHealth() -> Int {
        return self.playerHealth
    }
    
    func getScore() -> Int {
        return self.playerScore
    }
    
    func getAmmo() -> Int {
        return self.playerAmmo
    }
    
    func playerDies() {
        //do dead animation or end screen
    }
}