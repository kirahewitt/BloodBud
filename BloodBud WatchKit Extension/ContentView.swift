//
//  ContentView.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

struct ContentView: View {
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

struct ContentViewRoot: View {
    @State var pushed: Bool = false
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination:ContentViewFirst(pushed: self.$pushed), isActive: self.$pushed) { EmptyView() }
                    .navigationBarTitle("Root")
                Button("push"){
                    self.pushed = true
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ContentViewFirst: View {
    @Binding var pushed: Bool
    @State var secondPushed: Bool = false
    var body: some View {
        VStack{
            NavigationLink(destination: ContentViewSecond(pushed: self.$pushed, secondPushed: self.$secondPushed), isActive: self.$secondPushed) { EmptyView() }
                .navigationBarTitle("1st")
            Button("push"){
                self.secondPushed = true;
            }
        }
    }
}



struct ContentViewSecond: View {
    @Binding var pushed: Bool
    @Binding var secondPushed: Bool

    var body: some View {
        VStack{
            Spacer()
            Button("PopToRoot"){
                self.pushed = false
            } .navigationBarTitle("2st")

            Spacer()
            Button("Pop"){
                         self.secondPushed = false
                     } .navigationBarTitle("1st")
            Spacer()
        }
    }
}
