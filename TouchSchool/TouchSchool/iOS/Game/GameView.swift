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
        }
        .onAppear() {
            self.mainVM.fetchSchools()
        }
        .onTapGesture {
            vm.newAdd()
            count += 1
            isImage.toggle()
        }
    }
}


#Preview {
    GameView(vm: GameVM(), mainVM: MainVM(), showGame: MainView().$showGame)
}

//학교
