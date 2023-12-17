//
//  InfoView.swift
//  TouchSchool
//
//  Created by 황성진 on 11/27/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack{
            Color(red: 132/255, green: 194/255, blue: 65/255).edgesIgnoringSafeArea(.bottom)
            Image("blackboard_set")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("에잇(EIGHT)")
                        .font(.custom("Giants-Bold", size: 25))
                        .foregroundStyle(.white)
                    VStack(alignment: .leading) {
                        Text("팀원")
                            .font(.custom("Giants-Bold",
                                          size: 20))
                            .foregroundStyle(.white)
                            .padding(.leading, 10)
                        IntroGridView(intros: creators)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("도와준 사람")
                            .font(.custom("Giants-Bold",
                                          size: 20))
                            .foregroundStyle(.white)
                            .padding(.leading, 10)
                        IntroGridView(intros: helpers)
                    }
                    .padding(.vertical)
                    
                    Section {
                        ForEach(rights, id: \.name) { right in
                            Link(destination: URL(string: right.url)!) {
                                Text(right.name)
                                    .font(.custom("Giants-Bold", size: 15))
                                    .foregroundStyle(.white)
                            }
                        }
                    } header: {
                        Text("사용 저작권")
                            .font(.custom("Giants-Bold",
                                          size: 17))
                            .foregroundStyle(.white)
                    }
                    .listRowBackground(Color.darkGrayText.opacity(0.5))
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
            }
            .scrollIndicators(.hidden)
            .padding()
        }
    }
}
