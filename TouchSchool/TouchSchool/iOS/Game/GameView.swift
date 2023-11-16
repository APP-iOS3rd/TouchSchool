//
//  GameView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI

struct GameView: View {
    @ObservedObject var vm: GameVM
    @ObservedObject var mainVM: MainVM
    @Binding var showGame: Bool
    @State private var count: Int = 0
    @State private var isImage: Bool = false
    @State private var stars: [Sparkle] = []
    
    var body: some View {
        ZStack {
            Image("blackboard_set")
                .resizable()
                .ignoresSafeArea()
            VStack {
                HStack{
                    Button(action: {
                        // Handle back button action here
                        self.showGame = false
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.grayText)
                            .imageScale(.large)
                        Text("돌아가기")
                            .foregroundColor(Color.grayText)
                    }
                    .padding(.leading)
                    Spacer()
                }
                Text("\(mySchoolRank)")
                    .foregroundStyle(.mint)
                    .font(.system(size: 30))
                    .bold()
                
                Text("\(vm.mySchoolName)")
                    .foregroundStyle(.mint)
                    .font(.system(size: 30))
                    .bold()
                Text("\(count)")
                    .foregroundStyle(.white)
                    .font(.system(size: 60))
                    .bold()
                    .padding()
                
                Spacer()
                
                Image( isImage ?  "noname" : "achievement-1293132_1280")
                    .resizable()
                    .frame(width: 180, height: 180)
                
                Spacer()
                
                HStack {
                    Image("achievement-1293132_1280")
                        .resizable()
                        .frame(width: 40, height: 50)
                    
                    Text("\(vm.mySchoolCnt)")
                        .foregroundStyle(.white)
                        .font(.system(size: 50))
                }
                .padding()
                
            }
            // Effect View
            ForEach(stars.indices, id: \.self) { index in
                let star = stars[index]
                if star.showEffect {
                    SparkleEffectView()
                        .rotationEffect(.degrees(star.angle))
                        .opacity(star.opacity)
                        .offset(x: star.location.x - UIScreen.main.bounds.width / 2,
                                y: star.location.y - UIScreen.main.bounds.height / 2)
                        .onAppear {
                            withAnimation(.linear(duration: 1)) {
                                stars[index].location = CGPoint(x: star.location.x, y: -100)
                                stars[index].opacity = 0
                                stars[index].angle += 30 // Tilt more as it moves up
                            }
                        }
                }
            }
        }
        .onAppear() {
            self.mainVM.fetchSchools()
        }
        .onTapGesture { location in
            let angle = Double.random(in: -30...30)
            stars.append(Sparkle(location: location,
                                 showEffect: true,
                                 angle: angle,
                                 opacity: 1))
            vm.newAdd()
            count += 1
            isImage.toggle()
        }
    }
}

struct SparkleEffectView: View {
    var body: some View {
        Image(systemName: "sparkles") // Example: using a sparkles system image
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .foregroundColor(.yellow)
    }
}

#Preview {
    GameView(vm: GameVM(), mainVM: MainVM(), showGame: MainView().$showGame)
}
