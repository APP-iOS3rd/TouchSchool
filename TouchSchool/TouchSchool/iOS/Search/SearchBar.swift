//
//  SearchBar.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    @State private var isEditing = true
    
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack(alignment: .leading, content: {
            
            Color.navyBackground
                .frame(width: 270, height: 36)
                .cornerRadius(8)
            
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.navyText)
                    .padding(.leading, 10)
                TextField("Search",
                          text: $text, onEditingChanged: { check in
                    if check {
                        //
                    }
                })
                .padding(7)
                .padding(.leading, -7)
                .background(Color.navyBackground)
                .cornerRadius(8)
                .onTapGesture {
                    isEditing = true
                }
                .animation(.default, value: 1)
                
                if isEditing {
                    Button {
                        text = ""
                        isEditing = false
                        hideKeyboard()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(Color.navyText)
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default, value: 1)

                }
            }
            
        })
        
    }
}


#Preview {
    ZStack{
        Color.white
            .edgesIgnoringSafeArea(.all)
        SearchBar(text: .constant(""), isLoading: .constant(false))
            .padding()
    }
}
