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
    
    @State private var searchText = ""
    @State private var img: String = ""
    @State private var schoolName: String = ""
    
    var body: some View {
        
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            schoolStore.updateSearchText(with: $0)
        }
        if schoolStore.isDownloading {
            ProgressView("학교 정보 받아오는 중..", value: schoolStore.progress) // Display a progress view with the current progress
                .progressViewStyle(CircularProgressViewStyle())
                .padding()
                .onAppear {
                    Task {
                        await schoolStore.fetchData()
                    }
                }
        } else {
            Form{
                Section {
                    Image(systemName: "graduationcap")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    DataInput(title: "학교명", userInput: searchTextBinding)
                    if !searchText.isEmpty {
                        List(schoolStore.searchResult, id:\.seq) { school in
                            Button(action: {
                                // Set the selected school when the button is tapped
                                schoolStore.schools.append(school)
                                self.searchText = ""
                                
                            }) {
                                VStack(alignment: .leading) {
                                    Text(school.schoolName)
                                        .font(.headline)
                                    Text(school.adres)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    func addNewSchool(_ school: School) {

        //        let newSchool = School(id: UUID().uuidString, schoolType: "", link: link, schoolGubun: "", adres: adres, schoolName: schoolName, region: "", totalCount: "", estType: "", seq: "", img: "garak")
        
        //        schoolStore.schools.append(newSchool)
        
        //        path.removeLast()
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
