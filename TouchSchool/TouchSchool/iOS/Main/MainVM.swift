//
//  MainVM.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI

class MainVM: ObservableObject {
    @Published var schoolName: String = ""
    
    @Published var count: Int = 0
    
    @Published var adres: String = ""
    
    @Published var seq: String = ""
        
}

