//
//  AddNewSchool.swift
//  ListTutorial
//
//  Created by 황성진 on 11/2/23.
//

import SwiftUI

struct AddNewSchool: View {
    
    @StateObject var schoolStore: SchoolStore
    @Binding var path: NavigationPath
    
    @State private var img: String = ""
    @State private var schoolName: String = ""
    @State private var adres: String = ""
    @State private var link: String = ""
    
    
    var body: some View {
        Form{
            Section {
                Image(systemName: "graduationcap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "학교명", userInput: $schoolName)
                DataInput(title: "주소", userInput: $adres)
                DataInput(title: "홈페이지", userInput: $link)
            }
            .padding()
        }
        Button {
            addNewSchool()
        } label: {
            Text("학교추가")
        }
    }
    
    func addNewSchool() {
        let newSchool = School(id: UUID().uuidString, schoolType: "", link: link, schoolGubun: "", adres: adres, schoolName: schoolName, region: "", totalCount: "", estType: "", seq: "", img: "garak")
        
        schoolStore.schools.append(newSchool)
        
        path.removeLast()
    }
}

struct DataInput: View {
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            TextField("\(title)을 입력해주세요", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

//#Preview {
//    AddNewSchool(schoolStore: SchoolStore(schools: schoolData))
//}
