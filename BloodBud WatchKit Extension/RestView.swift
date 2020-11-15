//
//  RestView.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

struct RestView: View {
    @EnvironmentObject var donation: DonationInfo
    @Binding var page: Int
    @State var completed: Bool = false
    
//    init() {
//        self.completed = donation.restCompleted
//    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let min = self.donation.restCountdown/60
        let sec = self.donation.restCountdown%60
        let timeString = String(format: "%02d:%02d", min, sec)
        VStack {
            Spacer()
            Text("Rest Period")
            Text("\(timeString)")
                .onReceive(timer){ _ in
                    self.donation.resting()
                }
                .font(Font.largeTitle.monospacedDigit())
            Spacer()
            Button("Skip"){
                donation.restCompleted = true
                self.completed = true
            }
        }
        .alert(isPresented: $completed) {
            Alert(title: Text("Thank you! "), message: Text("Your donation is saving lives."), dismissButton: Alert.Button.default(Text("Ok"), action: { self.page = 1 }))
        }
    }
}

struct RestView_Previews: PreviewProvider {
    static var previews: some View {
        RestView(page: .constant(0)).environmentObject(DonationInfo())
    }
}
