//
//  File.swift
//  TouchSchool
//
//  Created by 최동호 on 11/3/23.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore
import FirebaseCore

class FirebaseManager {
    @Published var mySchool: School
    
    init(school: School) {
        self.mySchool = school
    }
    
    //    파라미터로 받은 Codable 업로드 (id 자동생성)
    func addSchool(a: School) {
        let db = Firestore.firestore()
        
        let _ = db.collection("schools").addDocument(data: a.dictionary)
    }
    
    func isSchoolExists(seq: String, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        db.collection("schools").whereField("seq", isEqualTo: seq)
            .getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error checking for school: \(err.localizedDescription)")
                    completion(false)
                } else {
                    if querySnapshot!.documents.isEmpty {
                        completion(false)
                    } else {
                        completion(true)
                    }
                }
            }
    }
}
