//
//  MainView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI
import AVKit

struct MainView: View {
    @State var showSearch: Bool = false
    @State var showGame: Bool = false
    @State var showRank: Bool = false
    @State private var showAlert = false
    @ObservedObject var vm = MainVM()
    private let soundSetting = SoundSetting.instance

    var body: some View {
        NavigationView {
            ZStack{
                if showGame {
                    GameView(vm: GameVM(), mainVM: MainVM(), showGame: self.$showGame)
                } else if showSearch {
                    SearchView(showSearch: self.$showSearch)
                } else if showRank {
                    RankView(showRank: self.$showRank)
                } else {
                    // 원래는 .frame(height: .infinity)를 사용하려했는데
                    // Invalid frame dimension (negative or non-finite). -> 프레임 수치가 정확하지 않다.
                    // GeometryReader를 사용해야 함.
                    GeometryReader { proxy in
                        Image("blackboard_set")
                            .resizable()
                            .ignoresSafeArea()
                    }
                    VStack{
//                        titleImage()
                        //shadow 하얀색으로 넣어서 칠판 느낌 나게 한번 해봤습니다
                        Text("터치!터치!")
                            .font(.custom("Giants-Bold", size: 55))
                            .foregroundColor(.rankcolor)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                            .shadow(color: .white, radius: 70)
                        Text("학교대항전")
                            .font(.custom("Recipekorea", size: 65))
                            .foregroundStyle(.white)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                            .shadow(color: .white, radius: 70)
                        
                        VStack {
                            Button(action: {
                                if seqValue.isEmpty {
                                    showAlert = true
                                } else {
                                    self.showGame = true
                                }
                            }) {
                                Text("게임 시작")
                                    .font(.largeTitle)
                                    .frame(width: 200, height: 30)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(24)
                                    .foregroundColor(.white)
                                    .padding(10)
                            }
                            Button(action: {
                                soundSetting.playSound(sound: .buttonBGM)
                                self.showRank = true
                            }) {
                                Text("랭킹 보기")
                            }
                            .frame(width: 200, height: 30)
                            .padding()
                            .background(Color.rankcolor)
                            .cornerRadius(24)
                            .foregroundColor(.white)
                            .padding(10)
                            
                            Button(action: {
                                self.showSearch = true
                            }) {
                                Text("학교 선택")
                                    .font(.custom("ShinDongYupHandwriting-B", size: 40))
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.white)
                                    .shadow(color: .white, radius: 25)
                            }
                            .padding()
                            
                            Button {
                                soundSetting.playSound(sound: .mainBGM)
                            } label: {
                                Text("mainBGM")
                            }
                            
                            
                            Button {
                                soundSetting.playSound(sound: .mainBGM)
                            } label: {
                                Text("buttonBGM")
                            }
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("알림"),
                            message: Text("학교를 먼저 선택해주세요."),
                            dismissButton: .default(Text("확인"))
                        )
                    }
                    .onAppear() {
                        self.vm.fetchSchools()
                    }
                }
            }
        }
    }
    
}

struct titleImage: View {
    var body: some View {
        Image("noname")
            .resizable()
            .aspectRatio(contentMode: .fit)
        //.frame(width: 300, height: 200)
    }
}
                                       
#Preview {
    MainView()
   
}
