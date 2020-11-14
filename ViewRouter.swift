//
//  ViewRouter.swift
//  Birthdays
//
//  Created by Emily Gavrilenko on 10/28/20.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<ViewRouter, Never>()
    
    var currentView: String = "contentView" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var currentPage: Int = 0 {
        didSet {
            objectWillChange.send(self)
        }
    }
}
