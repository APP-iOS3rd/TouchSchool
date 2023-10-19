//
//  ContentView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var showSearch = false
    
    var body: some View {
        ZStack{
            if showSearch {
                SearchView(showSearch: self.$showSearch)
            } else {
                VStack{
                    Button {
                        self.showSearch = true
                    } label: {
                        Text("학교 선택하기")
                            .foregroundColor(Color.grayText)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
