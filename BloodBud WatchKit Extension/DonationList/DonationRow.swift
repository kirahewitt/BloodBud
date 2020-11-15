//
//  DonationRow.
//
//  Created by Emily Gavrilenko on 11/14/20.
//

import SwiftUI
import CoreData

struct DonationRow: View {
    var item: Donation
    @State private var date = Date()
    
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = .short
        return formatter
    }
    
    var body: some View {
            HStack {
                Text(formatter.string(from: item.date!))
                    //.frame(width: 130, alignment: .leading)
                Spacer()
            }
        }
    }
}
