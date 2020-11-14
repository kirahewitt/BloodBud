//
//  SqueezeView.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

struct SqueezeView: View {
    var body: some View {
        NavigationView {

            VStack {
                Text("Next Squeeze")
                    .padding()
                NavigationLink(destination: RestView()) {
                    Text("Start")
                    
                }
            }
        }
    }
}

struct SqueezeView_Previews: PreviewProvider {
    static var previews: some View {
        SqueezeView()
    }
}
