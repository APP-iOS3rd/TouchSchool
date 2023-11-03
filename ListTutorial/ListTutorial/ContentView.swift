//
//  ContentView.swift
//  ListTutorial
//
//  Created by 황성진 on 11/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var schoolStore = SchoolStore(schools: schoolDatas)
    @State private var stackPath = NavigationPath()
    @EnvironmentObject var vm: SchoolStore
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach (0..<schoolStore.schools.count, id: \.self) { i in
                    NavigationLink(value: i) {
                        ListCell(school: schoolStore.schools[i])
                    }
                }
                .onDelete(perform: deleteItems) // 이 부분이 올바르게 수정됨
                .onMove(perform: moveItems)
            }
            .navigationDestination(for: Int.self) { i in
                SchoolDeatilView(selectedSchool: schoolStore.schools[i])
            }
            .navigationDestination(for: String.self) { _ in
                AddNewSchool(schoolStore: self.schoolStore, path: $stackPath)
            }
            .navigationTitle("학교 정보")
            .toolbar {
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    NavigationLink(value: "학교추가") {
                        Text("추가")
                    }
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    EditButton()
                }
            }
            
        }
    }
    
    
    func deleteItems(at offsets: IndexSet) {
        schoolStore.schools.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        schoolStore.schools.move(fromOffsets: source, toOffset: destination)
    }
    
    struct ListCell: View {
        
        var school: School
        
        var body: some View {
            HStack {
                Image(school.img ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150,height: 40)
                Spacer()
                Text(school.schoolName)
            }
        }
    }
}
#Preview {
    ContentView()
}
