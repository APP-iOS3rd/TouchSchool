//
//  RankVM.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//
//
import Foundation
import FirebaseFirestore
import FirebaseCore

struct SchoolInfo: Identifiable {
    var id: String
    var name: String
    var address: String
    var count: Int
}

class RankVM: ObservableObject {
    @Published var mySchoolInfos = [SchoolInfo]()
    
    private let db: Firestore
    
    init() {
        db = Firestore.firestore()
    }
    
    func fetchSchools(mySeq: String) {
        db.collection("schools")
            .whereField("seq", isEqualTo: mySeq)
            .order(by: "count", descending: true)
            .limit(to: 100)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("문서 가져오는 중 오류 발생: \(error)")
                } else if let documents = querySnapshot?.documents {
                    var schoolInfos = [SchoolInfo]()
                    for document in documents {
                        print("\(document.documentID) => \(document.data())")
                        
                        let mySchoolName = document.data()["name"] as? String ?? ""
                        let mySchoolAdres = document.data()["adres"] as? String ?? ""
                        let mySchoolCnt = document.data()["count"] as? Int ?? 0
                        let mySchoolId = document.documentID
                        
                        let schoolInfo = SchoolInfo(id: mySchoolId, name: mySchoolName, address: mySchoolAdres, count: mySchoolCnt)
                        schoolInfos.append(schoolInfo)
                    }
                    self.mySchoolInfos = schoolInfos
                }
            }
    }
}


//import Foundation
//import FirebaseFirestoreSwift
//import FirebaseFirestore
//import FirebaseCore
//
//class RankVM: ObservableObject {
//
//    @Published var mySchoolName: String = ""
//    @Published var mySchoolAdres: String = ""
//    @Published var mySchoolCnt: Int = 0
//    @Published var mySchoolId: String = ""
//
//    func fetchSchools() {
//        let db = Firestore.firestore()
//
//        db.collection("schools")
//                    .order(by: "count", descending: true)
//                    .limit(to: 100)
//                    .getDocuments { (querySnapshot, error) in
//                        if let error = error {
//                            print("문서 가져오는 중 오류 발생: \(error)")
//                        } else if let documents = querySnapshot?.documents {
//                            for document in documents {
//                                print("\(document.documentID) => \(document.data())")
//
//                    self.mySchoolName = document.data()["name"] as? String ?? ""
//                    self.mySchoolAdres = document.data()["adres"] as? String ?? ""
//                    self.mySchoolCnt = document.data()["count"] as? Int ?? 0
//                    self.mySchoolId = document.documentID
//                }
//            }
//        }
//    }
//}
