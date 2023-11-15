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
    var rank: Int?
}

class MainVM: ObservableObject {
    //이걸 넣어줘야야 데이터를 변화를 감지함

    private var db = Firestore.firestore()
    private var listener: ListenerRegistration?
    
    func fetchSchools() {
        listener?.remove()
        
        db.collection("schools").order(by: "count", descending: true)
            .addSnapshotListener { (querySnapshot, err) in
                guard let documents = querySnapshot?.documents else {
                    print("문서 없음")
                    return
                }
                
                var schoolInfos = [SchoolInfo]()
                
                for document in documents {
                    let mySchoolName = document.data()["name"] as? String ?? ""
                    let mySchoolAdres = document.data()["adres"] as? String ?? ""
                    let mySchoolCnt = document.data()["count"] as? Int ?? 0
                    let mySchoolId = document.documentID
                    
                    let schoolInfo = SchoolInfo(id: mySchoolId, name: mySchoolName, address: mySchoolAdres, count: mySchoolCnt)
                    print(schoolInfo)
                    schoolInfos.append(schoolInfo)
                }
                allSchoolInfos = schoolInfos
                
                //순위 부여 함수 호출
                self.rankSchoolInfos()
            }
    }
    
    func rankSchoolInfos() {
        // count 기준 내림차순으로 정렬
        allSchoolInfos.sort { $0.count > $1.count }
        
        // 각 항목에 순위를 할당합니다.
        for index in allSchoolInfos.indices {
            print(allSchoolInfos[index].address)
            print(myAddress)
            if allSchoolInfos[index].address == myAddress {
                mySchoolRank = index + 1
                print(mySchoolRank)
            }
            allSchoolInfos[index].rank = index + 1
            
            print("Rank assigned for \(allSchoolInfos[index].name): \(allSchoolInfos[index].rank ?? -1)")
        }
    }
}
