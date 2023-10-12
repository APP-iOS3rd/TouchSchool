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
    
    @Binding var showSearch: Bool
    
    @State private var searchText = ""
    
    var body: some View {
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
        }
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        self.showSearch = false
                    }) {
                        Text(Image(systemName: "xmark.app.fill"))
                            .foregroundColor(Color.navyText)
                    }
                    .padding(.trailing, 10)
                }
                HStack{
                    Text("학교 검색")
                        .foregroundColor(Color.navyText)
                        .padding(.leading, 20)
                    Spacer()
                }
                SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
                
                ScrollView{
                    
                }
            }
        }
    }
}
