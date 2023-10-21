//
//  School.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation

struct DataSearch: Codable {
    var content: [School]
}

struct School: Codable {
    var link: String
    var adres: String
    var schoolName: String
    var region: String
    var totalCount: String
    var estType: String
    var seq: String
}
