//
//  SqueezeView.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

struct SqueezeView: View {
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var publisher = PassthroughSubject<Void, Never>()

    @Binding var page : Int
    @State var fiveSecCountdown = TimeInterval(5)
    @State var bloodCountdown = 900
    @State var bloodCompleted = false
    
    let timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timer2 = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let min = self.bloodCountdown/60
        let sec = self.bloodCountdown%60
        let timeString = String(format: "%02d:%02d", min, sec)
        VStack {
            Text("Next Squeeze")
            Text(String(format: "%.2f", self.fiveSecCountdown))
                .font(Font.title.monospacedDigit())
                .onReceive(timer2){ _ in
                    if fiveSecCountdown > 0.01 {
                        fiveSecCountdown -= 0.01
                    }
                    else if !self.bloodCompleted {
                        WKInterfaceDevice().play(.notification)
                        fiveSecCountdown = 5
                    }
                }
            Text("Time remaining: \(timeString)")
                .font(Font.caption.monospacedDigit())
                .onReceive(timer1){ _ in
                    if self.bloodCountdown > 0 && !self.bloodCompleted {
                        bloodCountdown -= 1
                    }
                    else {
                        bloodCompleted = true
                    }
                }
            Spacer()
            NavigationLink(destination: RestView(page: $page)) {
                Text("Finished")
            }
            .simultaneousGesture(TapGesture().onEnded{ self.bloodCompleted = true })
        }
        .onReceive(publisher, perform: { _ in
            DispatchQueue.main.async {
                print("Go Back to Master")
                self.presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

struct SqueezeView_Previews: PreviewProvider {
    static var previews: some View {
        SqueezeView(page: .constant(0))
    }
}
