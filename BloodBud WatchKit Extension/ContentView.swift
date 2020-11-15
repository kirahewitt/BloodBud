//
//  ContentView.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

struct ContentView: View {
    @State var pushed: Bool = false
    var body: some View {
        NavigationView {
            Spacer()
            VStack {
                Text("New Donation")
                    .padding()
                ZStack {
                    NavigationLink(destination:SqueezeView(pushed: self.$pushed), isActive: self.$pushed) {}
                    Button("Start"){
                        self.pushed = true
                    }
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

