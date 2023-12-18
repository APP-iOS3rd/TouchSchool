//
//  MainView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import SwiftUI


struct MainView: View {
    @State var showSearch: Bool = false
    @State var showGame: Bool = false
    @State var showRank: Bool = false
    @State private var activeAlert: ActiveAlert?
    @State private var showSchoolChangeAlert = false
    @State private var showInfo = false
    @ObservedObject var vm = MainVM()
    private let soundSetting = SoundSetting.instance
    
    var body: some View {
        ZStack{
            if showGame {
                GameView(vm: GameVM(), mainVM: MainVM(), showGame: self.$showGame)
            } else if showSearch {
                SearchView(showSearch: self.$showSearch)
            } else if showRank {
                RankView(vm: GameVM(), showRank: self.$showRank)
            } else {
                Image("blackboard_set")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    //정보를 나타내 주는 버튼 표시
                    HStack {
                        Spacer()
                        Button(action: {
                            showInfo = true
                        }) {
                            Image(systemName: "info.circle")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
                        .sheet(isPresented: $showInfo) {
                            InfoView()
                        }
                    }
                    
                    Text("터치!터치!")
                        .font(.custom("Giants-Bold", size: 55))
                        .foregroundColor(.rankcolor)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                        .shadow(color: .white, radius: 70)
                        .onAppear() {
                            soundSetting.playLoop(sound: .mainBGM)
                        }
                        .onDisappear() {
                            soundSetting.stopSounds(sound: .mainBGM)
                        }
                    
                    Text("학교대항전")
                        .font(.custom("Recipekorea", size: 65))
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                        .shadow(color: .white, radius: 70)
                    
                    VStack {
                        Button(action: {
                            if seqValue.isEmpty {
                                soundSetting.playSound(sound: .buttonBGM)
                                activeAlert = .schoolSelect
                            } else {
                                soundSetting.playSound(sound: .buttonBGM)
                                self.showGame = true
                            }
                            self.vm.fetchSchools()
                        }) {
                            Text("게임 시작")
                                .font(.custom("Giants-Bold", size: 30))
                                .frame(width: 200, height: 30)
                                .padding()
                                .background(Color("button_color"))
                                .cornerRadius(24)
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                        Button(action: {
                            soundSetting.playSound(sound: .buttonBGM)
                            self.showRank = true
                            @ObservedObject var gameVm = GameVM()
                            self.vm.fetchSchools()
                        }) {
                            Text("랭킹 보기")
                                .font(.custom("Giants-Bold", size: 30))
                                .frame(width: 200, height: 30)
                                .padding()
                                .background(Color("yellows"))
                                .cornerRadius(24)
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                        Button(action: {
                            soundSetting.playSound(sound: .buttonBGM)
                            if myTouchCount != 0 {
                                activeAlert = .schoolChange
                            } else {
                                self.showSearch = true
                            }
                        }) {
                            Text("학교 선택")
                                .font(.custom("Giants-Bold", size: 30))
                                .frame(width: 200, height: 30)
                                .padding()
                                .background(Color("button_color3"))
                                .cornerRadius(24)
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                        Spacer()
                    }
                }
                .alert(item: $activeAlert) { active in
                    switch active {
                    case .schoolChange:
                        return  Alert(
                            title: Text("")
                                .font(.custom("Giants-Bold", size: 10)),
                            message: Text("학교를 변경하신다면, 현재 학교에서 터치한 점수는 0으로 돌아갑니다")
                                .font(.custom("Giants-Bold", size: 6)),
                            dismissButton: .default(Text("확인")
                                .font(.custom("Giants-Bold", size: 8))) {
                                    self.showSearch = true
                                }
                        )
                    case .schoolSelect:
                        return Alert(
                            title: Text("")
                                .font(.custom("Giants-Bold", size: 10)),
                            message: Text("학교를 먼저 선택해주세요.")
                                .font(.custom("Giants-Bold", size: 6)),
                            dismissButton: .default(Text("확인")
                                .font(.custom("Giants-Bold", size: 8)))
                        )
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
    }
}
