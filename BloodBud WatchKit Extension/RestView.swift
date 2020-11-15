//
//  RestView.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

struct RestView: View {
    @Environment(\.managedObjectContext) var moc
    
    @Binding var page: Int
    @State var restCountdown = 900
    @State var restCompleted = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let min = self.restCountdown/60
        let sec = self.restCountdown%60
        let timeString = String(format: "%02d:%02d", min, sec)
        VStack {
            Spacer()
            Text("Rest Period")
            Text("\(timeString)")
                .onReceive(timer){ _ in
                    if restCountdown > 0 && !restCompleted {
                        self.restCountdown -= 1
                    }
                    else {
                        self.restCompleted = true
                    }
                }
                .font(Font.largeTitle.monospacedDigit())
            Spacer()
            Button("Skip"){
                self.restCompleted = true
            }
        }
        .alert(isPresented: $restCompleted) {
            Alert(title: Text("Thank you! "), message: Text("Your donation is saving lives."), dismissButton: Alert.Button.default(Text("Ok"), action: { self.createDonation() }))
        }
    }
    
    func createDonation() {
        let donation = Donation(context: moc)
        donation.date = Date()
        if self.moc.hasChanges {
            try? self.moc.save()
        }
        self.page = 1
    }
}

struct RestView_Previews: PreviewProvider {
    static var previews: some View {
        RestView(page: .constant(0)).environmentObject(DonationInfo())
    }
}
