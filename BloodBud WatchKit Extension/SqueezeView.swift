//
//  SqueezeView.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

struct SqueezeView: View {
    @EnvironmentObject var donation: DonationInfo
    @Binding var page : Int
    
    let timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timer2 = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let min = self.donation.bloodCountdown/60
        let sec = self.donation.bloodCountdown%60
        let timeString = String(format: "%02d:%02d", min, sec)
        VStack {
            Text("Next Squeeze")
            Text(String(format: "%.2f", self.donation.fiveSecCountdown))
                .font(Font.title.monospacedDigit())
                .onReceive(timer2){ _ in
                    self.donation.fiveSecondsPassed()
                }
            Text("Time remaining: \(timeString)")
                .font(Font.caption.monospacedDigit())
                .onReceive(timer1){ _ in
                    self.donation.bloodFinishedDrawing()
                }
            Spacer()
            NavigationLink(destination: RestView(page: $page)) {
                Text("Finished")
            }
            .simultaneousGesture(TapGesture().onEnded{ self.donation.bloodCompleted = true })
        }
    }
}

struct SqueezeView_Previews: PreviewProvider {
    static var previews: some View {
        SqueezeView(page: .constant(0))
            .environmentObject(DonationInfo())
    }
}
