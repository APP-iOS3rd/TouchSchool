//
//  School.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation

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
    var region: Region
    var totalCount: String
    var estType: EstType
    var seq: String
}

enum EstType: String, Codable {
    case 공립 = "공립"
    case 국립 = "국립"
    case 사립 = "사립"
}

enum Region: String, Codable {
    case 강원특별자치도 = "강원특별자치도"
    case 경기도 = "경기도"
    case 경상남도 = "경상남도"
    case 경상북도 = "경상북도"
    case 광주광역시 = "광주광역시"
    case 대구광역시 = "대구광역시"
    case 대전광역시 = "대전광역시"
    case 부산광역시 = "부산광역시"
    case 서울특별시 = "서울특별시"
    case 세종특별자치시 = "세종특별자치시"
    case 울산광역시 = "울산광역시"
    case 인천광역시 = "인천광역시"
    case 전라남도 = "전라남도"
    case 전라북도 = "전라북도"
    case 제주특별자치도 = "제주특별자치도"
    case 충청남도 = "충청남도"
    case 충청북도 = "충청북도"
}
