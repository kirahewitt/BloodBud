//
//  DonationRow.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI
import CoreData

struct DonationRow: View {
    var item: Donation
    
    @Environment(\.managedObjectContext) var moc
    @State private var date = Date()
    @State private var showAlert = false
    
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    var body: some View {
        HStack {
            Text(formatter.string(from: item.date!))
                .frame(width: 90, alignment: .leading)
            Button("Delete") {
                func deleteItems (at offsets: IndexSet) {
                    self.showAlert = true
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Delete Donation?"), message: Text("Are you sure?"),
                  primaryButton: Alert.Button.default(Text("Delete"), action: { moc.delete(item) }), secondaryButton: Alert.Button.cancel(Text("Cancel"), action: {
                    print("Don't delete")
                }))
        }
    }
}
