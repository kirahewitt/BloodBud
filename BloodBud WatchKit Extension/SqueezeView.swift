//
//  SqueezeView.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

struct SqueezeView: View {
    @Binding var pushed: Bool
    @State var timeCountdown = 900
    @State var completed = false
    @State var secondPushed: Bool = false
    let timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timer2 = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let min = self.timeCountdown/60
        let sec = self.timeCountdown%60
        let timeString = String(format: "%02d:%02d", min, sec)
        VStack {
            Text("Next Squeeze")
            Text("02:45")
                .font(.largeTitle)
                .padding()
            Text("Time remaining: \(timeString)")
                .onReceive(timer1){ _ in
                    if self.timeCountdown > 0 {
                        self.timeCountdown -= 1
                    }
                    else {
                        self.completed = true
                    }
                }
            Spacer()
            ZStack {
                NavigationLink(destination:RestView(pushed: self.$secondPushed, secondPushed: self.$secondPushed), isActive: self.$secondPushed) {}
                Button("Finished"){
                    self.secondPushed = true
                }
            }
        }
        .alert(isPresented: $completed) {
            Alert(title: Text("Thank you! "), message: Text("Your donation is saving lives."), dismissButton: Alert.Button.default(Text("Ok")))
        }
    }
}

//struct SqueezeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SqueezeView(self.$true)
//    }
//}
