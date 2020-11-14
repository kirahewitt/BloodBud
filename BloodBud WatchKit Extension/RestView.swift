//
//  RestView.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

struct RestView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var timeCountdown = 900
    @State var completed = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let min = self.timeCountdown/60
        let sec = self.timeCountdown%60
        let timeString = String(format: "%02d:%02d", min, sec)
        VStack {
            Spacer()
            Text("Rest Period")
            Text("\(timeString)")
                .onReceive(timer){ _ in
                    if self.timeCountdown > 0 {
                        self.timeCountdown -= 1
                    }
                    else {
                        self.completed = true
                    }
                }
                .font(.largeTitle)
            Spacer()
            Button("Skip"){
                self.completed = true
            }


        }
        .alert(isPresented: $completed) {
            Alert(title: Text("Thank you! "), message: Text("Your donation is saving lives."), dismissButton: Alert.Button.default(Text("Ok"), action: {viewRouter.currentPage = 1}))
        }
    }
}

struct RestView_Previews: PreviewProvider {
    static var previews: some View {
        RestView()
    }
}
