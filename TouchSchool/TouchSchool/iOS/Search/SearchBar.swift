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
    
    @State private var isEditing = false
    
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color(Color.darkGrayText)
                .frame(width: 270, height: 36)
                .cornerRadius(8)
        
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.grayText)
                    .padding(.leading, 10)
                
                TextField("", text: $text,
                          prompt: Text("검색")
                    .font(.custom("Giants-Bold", size: 16))
                    .foregroundColor(Color.grayText))
                    .padding(7)
                    .padding(.leading, -7)
                    .background(Color(Color.darkGrayText))
                    .foregroundColor(Color.white)
                    .accentColor(Color.grayText)
                    .cornerRadius(8)
                    .onTapGesture {
                        isEditing = true
                    }
                    .animation(.default)
                    .overlay{
                        HStack{
                            Spacer()
                            if !text.isEmpty {
                                if isLoading {
                                    Button {
                                        text = ""
                                    } label: {
                                        ActivityIndicator(style: .medium,
                                                          animate: .constant(true))
                                        .configure({
                                            $0.color = .white
                                        })
                                    }
                                    .padding(.trailing, 15)
                                    .frame(width: 35, height: 35)
                                } else {
                                    Button(action: {
                                        text = ""
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(Color.grayText)
                                            .frame(width: 35, height: 35)
                                    }
                                    .padding(.trailing, 5)
                                }
                            }
                        }
                    }
                
                if isEditing {
                    Button {
                        text = ""
                        isEditing = false
                        hideKeyboard()
                    } label: {
                        Text("취소")
                            .font(.custom("Giants-Bold", size: 15))
                            .foregroundColor(Color.white)
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
        }
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
