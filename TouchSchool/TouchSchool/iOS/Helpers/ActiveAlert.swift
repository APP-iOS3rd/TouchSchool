//
//  ActiveAlert.swift
//  TouchSchool
//
//  Created by 최동호 on 12/18/23.
//

import Foundation

enum ActiveAlert: Identifiable {
    case schoolSelect
    case schoolChange
    
    var id: Self {
        self
    }
}
