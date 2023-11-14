//
//  GameView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI

struct GameView: View {
    @ObservedObject var gamevm: FireStoreManager
    @ObservedObject var gamevm2: RankVM
    @State private var count: Int = 0
    @State private var isImage: Bool = false

    var body: some View {
        ZStack {
            Image("blackboard_set")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("\(mySchoolRank)")
                    .foregroundStyle(.mint)
                    .font(.system(size: 30))
                    .bold()
                
                Text("\(gamevm.mySchoolName)")
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
                
                Text("\(gamevm.mySchoolCnt)")
                    .foregroundStyle(.white)
                    .font(.system(size: 50))
                }
                .padding()
            }
        }
        .onTapGesture {
            gamevm.newAdd()
            count += 1
            isImage.toggle()
        }
    }
}


#Preview {
    GameView(gamevm: FireStoreManager(), gamevm2: RankVM())
}

//학교
