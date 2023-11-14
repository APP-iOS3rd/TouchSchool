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

class RankVM: ObservableObject {
    
    //이걸 넣어줘야야 데이터를 변화를 감지함
    @Published var mySchoolInfos = [SchoolInfo]()
    @Published var rank: Int = 0

    private var db = Firestore.firestore()
    private var listener: ListenerRegistration?


    func fetchSchools() {
        listener?.remove()
        
        db.collection("schools").order(by: "count", descending: true).limit(to: 100)
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
            self.mySchoolInfos = schoolInfos
            
              //순위 부여 함수 호출
            self.rankSchoolInfos()
            
        }
    }
    
    func rankSchoolInfos() {
    // count 기준 내림차순으로 정렬
        mySchoolInfos.sort { $0.count > $1.count }
        
        // 각 항목에 순위를 할당합니다.
        for index in mySchoolInfos.indices {
              mySchoolInfos[index].rank = index + 1
              print("Rank assigned for \(mySchoolInfos[index].name): \(mySchoolInfos[index].rank ?? -1)")
          }
      }
}


    
    
//    db.collection("schools").order(by: "count", descending: true).limit(to: 100)
//        .getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("문서 가져오는 중 오류 발생: \(error)")
//            } else if let documents = querySnapshot?.documents {
//                var schoolInfos = [SchoolInfo]()
//                for document in documents {
//                    print("\(document.documentID) => \(document.data())")
//                    
//                    let mySchoolName = document.data()["name"] as? String ?? ""
//                    let mySchoolAdres = document.data()["adres"] as? String ?? ""
//                    let mySchoolCnt = document.data()["count"] as? Int ?? 0
//                    let mySchoolId = document.documentID
//                    
//                    let schoolInfo = SchoolInfo(id: mySchoolId, name: mySchoolName, address: mySchoolAdres, count: mySchoolCnt)
//                    schoolInfos.append(schoolInfo)
//                }
//                self.mySchoolInfos = schoolInfos
//            }
//        }
//    }
//}

