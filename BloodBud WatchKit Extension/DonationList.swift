//
//  DonationList.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import SwiftUI

struct DonationList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: Donation.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Donation.date, ascending: false)]
    ) var donations: FetchedResults<Donation>

    var body: some View {
        
        if (donations.count > 0) {
            let firstDate = donations[0].date
            let lastDonation = Calendar.current.dateComponents([.day], from: firstDate!, to: Date())
            let nextDonation = 56 - lastDonation.day!
            VStack (alignment: .leading) {
                Text("Next Donation").font(.headline)
                HStack {
                    if (nextDonation <= 0){
                        Text("You're eligible for one today")
                    }
                    else {
                        Text("Eligible in \(nextDonation) day(s)")
                    }
                }
                Text("Past Donations").font(.headline)
                List {
                    ForEach(donations) { item in
                        DonationRow(item: item)
                    }.onDelete(perform: deleteItems)
                }
            }
        }
        else {
            VStack (alignment: .leading) {
                Text("No donations on file")
                    .font(.headline)
                    .padding(.bottom)
                Text("Save a life, sign up to donate blood today")
            }
        }
    }
    
    func deleteItems (at offsets: IndexSet) {
        for index in offsets {
            let item = donations[index]
            moc.delete(item)
        }
    }
}

struct DonationList_Previews: PreviewProvider {
    static var previews: some View {
        DonationList()
    }
}

//struct DonationList: View {
//    var body: some View {
//        VStack {
//            Text("Next Donation")
//            Text("Past Donations")
//        }
//    }
//}
