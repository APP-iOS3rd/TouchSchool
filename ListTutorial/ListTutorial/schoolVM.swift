//
//  schoolVM.swift
//  ListTutorial
//
//  Created by 황성진 on 11/2/23.
//

import Foundation

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }

    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }

}

struct School: Codable, Identifiable {
    var id: String
    var schoolType: String
    var link: String
    var schoolGubun: String
    var adres: String
    var schoolName: String
    var region: String
    var totalCount: String
    var estType: String
    var seq: String
    var img: String
}

var schoolData: [School] = loadJson("hschoolList.json")

class SchoolStore: ObservableObject {
    
    @Published var schools: [School]
    
    init(schools: [School]) {
        self.schools = schools
    }
    
}
