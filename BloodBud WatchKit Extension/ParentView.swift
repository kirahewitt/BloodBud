//
//  ParentView.swift
//  BloodBud WatchKit Extension
//
//  Created by Kira Hewitt on 11/14/20.
//

import Foundation
import SwiftUI

struct ParentView: View {
    @State private var currentPage = 0
    
    var body: some View {
        
        //Pager Manager
        VStack{
            PagerManager(pageCount: 2, currentIndex: $currentPage) {
                ContentView(page: $currentPage)
                DonationList()
            }

            Spacer()

            //Page Control
            HStack{
                Circle()
                    .frame(width: 7, height: 7)
                    .foregroundColor(currentPage==1 ? Color.gray:Color.white)
                Circle()
                    .frame(width: 7, height: 7)
                    .foregroundColor(currentPage==1 ? Color.white:Color.gray)
            }
        }
    }
}


struct ParentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ParentView()
    }
}
