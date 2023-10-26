//
//  MainView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI

struct MainView: View {
    @Binding var showMain: Bool

    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 132/255, green: 194/255, blue: 65/255).edgesIgnoringSafeArea(.bottom)
                VStack{
                    ZStack{
                        Image("school1")
                            .resizable()
                            .frame(height: 200)
                            .edgesIgnoringSafeArea(.top)
                        HStack{
                            Spacer()
                            Button(action: {
                                self.showMain = false
                            }) {
                                Text("학교 선택")
                                    .font(.system(size: 15))
                                    .padding(3)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.white)
                                    .background(Color.cyan)
                                    .cornerRadius(30)
                                    .padding(5)
                                    .overlay(RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.cyan, lineWidth: 3)
                                    )
                            }
                            .padding(.trailing, 5)
                        }
                    }
                    Text("TouchSchool")
                        .font(.system(size: 60, weight: .black, design: .rounded))
                        .fontWeight(.heavy)
//                    
//                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                        Text("게임 시작")
//                            .font(.largeTitle)
//                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                            .padding()
//                            .background(Color.mint)
//                            .cornerRadius(40)
//                            .foregroundColor(.white)
//                            .padding(10)
//                            .overlay(RoundedRectangle(cornerRadius: 40)
//                                .stroke(Color.mint, lineWidth: 3)
//                            )})
//                    
                    
                    NavigationLink(destination: GameView()) {
                        Text("게임 시작")
                    }  .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.red, lineWidth: 3)
                        )
                    
                    .padding()
                    
                    NavigationLink(destination: GameView()) {
                        Text("랭킹 보기")
                    }  .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.yellow, lineWidth: 3)
                        )
                    
                    
                    Spacer()
                }
                
                
            }
             }
         }
}


#Preview {
    MainView(showMain: SearchView().$showMain)
}
