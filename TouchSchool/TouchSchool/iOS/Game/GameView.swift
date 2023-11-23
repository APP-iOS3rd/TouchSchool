//
//  GameView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI
import AVKit

struct GameView: View {
    @ObservedObject var vm: GameVM
    @ObservedObject var mainVM: MainVM
    @Binding var showGame: Bool
    @State private var isImage: Bool = false
    @State private var smokes: [Smoke] = []
    @State private var animationAmount = 0.0
    private let soundSetting = SoundSetting.instance
    
    var body: some View {
        ZStack {
            Image("blackboard_set")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Text("\(mySchoolRank)위")
                        .foregroundStyle(.mint)
                        .font(.custom("Giants-Bold", size: 30))
                        .bold()
                    Text("\(vm.mySchoolName)")
                        .foregroundStyle(.mint)
                        .font(.custom("Giants-Bold", size: 30))
                        .bold()
                }
                Text("\(myTouchCount)")
                    .foregroundStyle(.white)
                    .font(.custom("Giants-Bold", size: 60))
                    .bold()
                    .padding()
                
                Spacer()
                
                Image("11111")
                    .resizable()
                    .frame(width: 120, height: 80)
                    .rotation3DEffect(
                        .degrees(animationAmount),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                
                Spacer()
                
                HStack {
                    Image("achievement-1293132_1280")
                        .resizable()
                        .frame(width: 40, height: 50)
                    
                    Text("\(vm.mySchoolCnt)")
                        .foregroundStyle(.white)
                        .font(.custom("Giants-Bold", size: 50))
                }
                .padding()
                Spacer()
            }
            
            // Effect View
            ForEach(smokes.indices, id: \.self) { index in
                let smoke = smokes[index]
                if smoke.showEffect {
                    SmokeEffectView()
                        .rotationEffect(.degrees(smoke.angle))
                        .opacity(smoke.opacity)
                        .offset(x: smoke.location.x - UIScreen.main.bounds.width / 2,
                                y: smoke.location.y - UIScreen.main.bounds.height / 2)
                        .onAppear {
                            withAnimation(.linear(duration: 1)) {
                                smokes[index].opacity = 0
                                smokes[index].angle += 30
                            }
                        }
                }
            }
            
            MultitouchRepresentable { location in
                handleTap(location: location)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack{
                HStack{
                    Button(action: {
                        // Handle back button action here
                        self.showGame = false
                        myTouchCount = 0
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.grayText)
                            .imageScale(.large)
                        Text("돌아가기")
                            .font(.custom("Giants-Bold", size: 15))
                            .foregroundColor(Color.grayText)
                    }
                    .padding(.leading)
                    Spacer()
                }
                .padding(.top)
                Spacer()
            }
        }
        
        .onAppear() {
            self.mainVM.fetchSchools()
        }
        .alert(isPresented: $vm.showWarningAlert) {
            Alert(
                title: Text("경고")
                    .font(.custom("Giants-Bold", size: 10)),
                message: Text("비정상적인 터치 수가 감지되었습니다.")
                    .font(.custom("Giants-Bold", size: 7)),
                dismissButton: .default(Text("확인")
                    .font(.custom("Giants-Bold", size: 8)))
            )
        }
    }
    private func handleTap(location: CGPoint) {
        let angle = Double.random(in: -30...30)
        smokes.append(Smoke(location: location, showEffect: true, angle: angle, opacity: 1))
        myTouchCount += 1
        soundSetting.playSound(sound: .buttonBGM)
        vm.newAdd()
        
        withAnimation {
            self.animationAmount += 360
        }
    }
}

struct SmokeEffectView: View {
    var body: some View {
        Image("smoke")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
    }
}

//#Preview {
//    GameView(vm: GameVM(), mainVM: MainVM(), showGame: MainView().$showGame)
//}
