//
//  SearchView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @ObservedObject var vm = SearchVM()
    
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
            VStack{
                SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
                    .padding()
                
                ScrollView {
                    if searchText.isEmpty {
                        SearchGuide()
                    }
                    if vm.viewState == .empty {
                        Text("검색 결과가 없습니다.")
                            .foregroundColor(Color.grayText)
                            .font(.title3)
                            .bold()
                            .padding(.top, 150)
                    } else if vm.viewState == .ready {
                        List(vm.searchResult, id: \.adres) { school in
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
                .padding()
            }
        }
    }
}

#Preview {
    SearchView()
}
