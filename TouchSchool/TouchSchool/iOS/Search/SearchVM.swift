//
//  SearchVM.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI

class SearchVM: ObservableObject {
    @Published var isLoading: Bool = false
    
    @Published var viewState: ViewState = ViewState.ready
    
}


enum ViewState {
    case empty
    case loading
    case ready
    case error
}
