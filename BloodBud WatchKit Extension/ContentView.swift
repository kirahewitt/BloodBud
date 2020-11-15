//
//  ContentView.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @Binding var page : Int
    @State var pushed: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("New Donation")
                    .padding()
                NavigationLink(destination: SqueezeView(page: $page)) {
                    Text("Start")
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(page: .constant(0)).environmentObject(DonationInfo())
    }
}

