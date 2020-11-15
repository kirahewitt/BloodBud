import SwiftUI

class DonationInfo: ObservableObject {
    @Published var fiveSecCountdown: TimeInterval = 5
    @Published var bloodCountdown: Int = 900
    @Published var restCountdown: Int = 900
    @Published var bloodCompleted: Bool = false
    @Published var restCompleted: Bool = false
    
    func setBloodCountDown(time: Int) {
        bloodCountdown = time
    }
    
    func setWaitCountDown(time: Int) {
        restCountdown = time
    }
    
    func fiveSecondsPassed() {
        if fiveSecCountdown > 0.01 {
            fiveSecCountdown -= 0.01
        }
        else if !bloodCompleted {
            WKInterfaceDevice().play(.notification)
            fiveSecCountdown = 5
        }
    }
    
    func bloodFinishedDrawing() {
        if bloodCountdown > 0 && !bloodCompleted {
            bloodCountdown -= 1
        }
        else {
            bloodCompleted = true
        }
    }
    
    func resting() {
        print("\(restCountdown)")
        print("\(restCompleted)")
        if restCountdown > 0 && !restCompleted {
            restCountdown -= 1
        }
        else {
            restCompleted = true
        }
    }
    
}
