//
//  SearchView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @EnvironmentObject var vm: SearchVM
    
    @State var showMain = false
    
    @State private var searchText = ""
    
    var body: some View {
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            if showMain {
                MainView(showMain: self.$showMain)
            } else {
                VStack{
                    SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
                        .padding()
                    
                    VStack{
                        if searchText.isEmpty {
                            SearchGuide()
                        } else if vm.viewState == .empty {
                            Text("검색 결과가 없습니다.")
                                .foregroundColor(Color.grayText)
                                .font(.title3)
                                .bold()
                                .padding(.top, 150)
                            
                        } else if vm.viewState == .ready {
                            List(vm.searchResult, id:\.seq) { school in
                                Button(action: {
                                    // Set the selected school when the button is tapped
                                    self.showMain = true
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
                        
                        Spacer()
                    }
                    
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
