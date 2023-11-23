//
//  School.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import Alamofire
import SwiftUI



struct schoolData: Codable {
    var dataSearch: DataSearch
}

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
    
    var dictionary: [String: Any] {
        return [
            "name": schoolName,
            "adres": adres,
            "seq": seq,
            "count": 0
        ]
    }
}

let headers: HTTPHeaders = [
    "Accept": "application/json"
]

var seqValue: String {
    get {
        UserDefaults.standard.string(forKey: "seqValue") ?? ""
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "seqValue")
    }
}

var myID = ""
var mySchoolRank: Int = 0
var allSchoolInfos = [SchoolInfo]()
var myTouchCount: Int {
    get {
        UserDefaults.standard.integer(forKey: "myTouchCount")
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "myTouchCount")
    }
}

let eSchoolUrl = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=elem_list&perPage=1000000"
let mSchoolUrl = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=midd_list&perPage=1000000"
let hSchoolUrl = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&perPage=1000000"
