//
//  BloodBudApp.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

@main
struct BloodBudApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ParentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

//import SwiftUI
//
//@main
//struct BloodBudApp: App {
//    
//    @SceneBuilder var body: some Scene {
//        WindowGroup {
//            NavigationView {
//                ParentView().environmentObject(ViewRouter())
//            }
//        }
//
//        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
//    }
//}
//
//struct BloodBudApp_Previews: PreviewProvider {
//    static var previews: some View {
//        ParentView().environmentObject(ViewRouter())
//    }
//}
