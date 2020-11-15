//
//  BloodBudApp.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

@main
struct BloodBudApp: App {
    var donationInfo = DonationInfo()
    let context = PersistentCloudKitContainer.persistentContainer.viewContext
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ParentView()
                    .environmentObject(donationInfo)
                    .environment(\.managedObjectContext, context)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

struct BloodBudApp_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistentCloudKitContainer.persistentContainer.viewContext
        ParentView()
            .environmentObject(DonationInfo())
            .environment(\.managedObjectContext, context)

    }
}
