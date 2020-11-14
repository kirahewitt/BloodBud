//
//  BloodTimer.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import Foundation

class BloodTimer {
    var timeRemaining: TimeInterval
    
    init () {
        self.timeRemaining = 900
    }
    
    func decrement() {
        self.timeRemaining = self.timeRemaining - 1
    }
    
}
