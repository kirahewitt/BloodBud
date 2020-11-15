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
            VStack {
                Text("Last Donation")
                HStack {
                    Text("\(lastDonation.day!) days ago")
                }
                Text("Next Donation")
                HStack {
                    if (nextDonation <= 0){
                        Text("You're eligible for one today")
                    }
                    else {
                        Text("\(nextDonation) days from today")
                    }
                }

                Text("Past Donations")
                List {
                    ForEach(donations) { item in
                        DonationRow(item: item)
                    }
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
