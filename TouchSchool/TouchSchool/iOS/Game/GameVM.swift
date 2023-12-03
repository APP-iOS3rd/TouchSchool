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

class GameVM: ObservableObject {
    @Published var visitCount = 0
    @Published var mySchoolName: String = ""
    @Published var mySchoolAdres: String = ""
    @Published var mySchoolCnt: Int = 0
    @Published var mySchoolId: String = ""
    @Published var touchCount: Int = 0
    @Published var showWarningAlert = false
    
    private var isTimerActive = false
    
    init() {
        getAllSchool(mySeq: seqValue)
    }
    
    // 파라미터로 받은 값을 특정 필드의 값으로 가지고 있는 문서의 id값 불러오기 -> 이 함수에서는 seq값을 사용
    func getAllSchool(mySeq: String) {
        let db = Firestore.firestore()
        db.collection("schools").whereField("seq", isEqualTo: mySeq)
            .addSnapshotListener() { (querySnapshot, err) in
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
                myID = self.mySchoolId
            }
    }
    
    //  파라미터로 넣은 id값을 가진 문서 내용들 불러오는 스냅샷
    func addSnapShot(id: String) {
        let db = Firestore.firestore()
        db.collection("schools").document(id).addSnapshotListener { documentSnapshot, error in
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
        touchCount += 1
        
        if !isTimerActive {
            isTimerActive = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                if self.touchCount >= 230 {
                    self.showWarningAlert = true
                } else {
                    self.submitCount()
                }
                self.isTimerActive = false
            }
        }
    }
    
    private func submitCount() {
        let db = Firestore.firestore()
        let sfReference = db.collection("schools").document(self.mySchoolId)
        
        db.runTransaction({ (transaction, errorPointer) -> Any? in
            let sfDocument: DocumentSnapshot
            do {
                try sfDocument = transaction.getDocument(sfReference)
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }
            
            guard let oldCount = sfDocument.data()?["count"] as? Int else {
                return nil
            }
            
            transaction.updateData(["count": oldCount + self.touchCount], forDocument: sfReference)
            return nil
        }) { (object, error) in
            if let error = error {
                print("Transaction failed: \(error)")
            } else {
                print("Transaction successfully committed!")
                self.touchCount = 0 // Reset touch count after successful submission
            }
        }
    }
}
