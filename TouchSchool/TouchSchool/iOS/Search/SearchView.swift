//
//  SearchView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var vm: SearchVM
    @Binding var showSearch: Bool
    @State private var searchText = ""
    
    var body: some View {
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        
        ZStack{
            Image("blackboard_set")
                .resizable()
                .ignoresSafeArea()
            VStack{
                HStack{
                    Button(action: {
                        self.showSearch = false
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        Text("돌아가기")
                            .font(.custom("Giants-Bold", size: 15))
                            .foregroundColor(Color.white)
                    }
                    .padding(.leading)
                    Spacer()
                }
                SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
                    .padding()
                VStack{
                    if searchText.isEmpty {
                        SearchGuide()
                    } else if vm.viewState == .empty {
                        Text("검색 결과가 없습니다.")
                            .foregroundColor(Color.grayText)
                            .font(.custom("Giants-Bold", size: 10))
                            .bold()
                            .padding(.top, 150)
                        
                    } else if vm.viewState == .ready {
                        
                        List(vm.searchResult, id:\.seq) { school in
                            Button(action: {
                                let firebaseManager = FirebaseManager(school: school)
                                firebaseManager.isSchoolExists(seq: school.seq) { exists in
                                    if !exists {
                                        firebaseManager.addSchool(a: school)
                                    }
                                    seqValue = school.seq
                                    myTouchCount = 0
                                    self.showSearch = false
                                    self.searchText = ""
                                }
                            }) {
                                VStack(alignment: .leading) {
                                    Text(school.schoolName)
                                        .font(.custom("Giants-Bold", size: 15))
                                        .foregroundColor(.white)
                                    Text(school.adres)
                                        .font(.custom("Giants-Bold", size: 15))
                                        .foregroundColor(Color.grayText)
                                }
                            }
                            .listRowBackground(Color.darkGrayText.opacity(0.5))
                        }
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)

                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    SearchView(showSearch: MainView().$showSearch)
}
