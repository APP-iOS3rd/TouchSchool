//
//  FirebaseManager.swift
//  TouchSchool
//
//  Created by 김성엽 on 10/31/23.
//
import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore
import FirebaseCore

var seqValue = ""

class FireStoreManager: ObservableObject {
    
    @Published var mySchoolName: String = ""
    @Published var mySchoolAdres: String = ""
    @Published var mySchoolCnt: Int = 0
    @Published var mySchoolId: String = ""
    
    init() {
        getAllSchool2(mySeq: seqValue)
    }
    
    // 파라미터로 받은 값을 특정 필드의 값으로 가지고 있는 문서의 id값 불러오기 -> 이 함수에서는 seq값을 사용
    func getAllSchool2(mySeq: String) {
        let db = Firestore.firestore()
        db.collection("schools").whereField("seq", isEqualTo: mySeq)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                       
                        self.mySchoolName = document.data()["name"] as? String ?? ""
                        self.mySchoolAdres = document.data()["adres"] as? String ?? ""
                        self.mySchoolCnt = document.data()["count"] as? Int ?? 0
                        self.mySchoolId = document.documentID
                    }
                }
            }
    }

    
    //  파라미터로 넣은 id값을 가진 문서 내용들 불러오는 스냅샷
    func addSnapShot(id: String) {
        let db = Firestore.firestore()
        let _ = db.collection("schools").document(id).addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            guard let data = document.data() else {
                print("Document data was empty.")
                return
            }
            print("Current data: \(data)")
            self.mySchoolCnt = data["count"] as? Int ?? 0
        }
    }
    
    
    //  파라미터로 전달받은 id 값을 가진 문서의 count에 +1을 해주는 트랜잭션 (버튼에 구현)
    func newAdd() {
        let db = Firestore.firestore()
        let sfReference = db.collection("schools").document(self.mySchoolId)
        
        db.runTransaction({ (transaction, errorPointer) -> Any? in
            let sfDocument: DocumentSnapshot
            do { // 쓰기전에 한번 읽어옴. 쓰는동안 락을 검. 데이터 점유를 한다.
                try sfDocument = transaction.getDocument(sfReference)
                
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }
            
            guard let oldcount = sfDocument.data()?["count"] as? Int else {
                return nil
            }
            
            transaction.updateData(["count": oldcount + 1], forDocument: sfReference)
            return nil
        }) { (object, error) in
            if let error = error {
                print("Transaction failed: \(error)")
            } else {
                print("Transaction successfully committed!")
            }
        }

    }
    
}

