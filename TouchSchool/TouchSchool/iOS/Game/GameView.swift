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

    @GestureState var isDetectingLongPress = false
    @State var totalNumberOfTaps = 0
    
    var body: some View {
        ZStack {
            let press = LongPressGesture(minimumDuration: 10)
                .updating($isDetectingLongPress) { currentState, gestureState, transaction in
                    gestureState = currentState
                }.onChanged { _ in
                    self.totalNumberOfTaps += 1
                }
            Image("blackboard_set")
                .ignoresSafeArea(.all)
                .gesture(press)
            VStack {
                Text("\(totalNumberOfTaps)")
                    .font(.largeTitle)
                    .padding(30)
                Spacer()
                
                Rectangle()
                    .fill(isDetectingLongPress ? Color.yellow : Color.green)
                    .frame(width: 100, height: 100, alignment: .center)
                Spacer()
                
                Text("\(gamevm.mySchoolCnt)")
                    .font(.system(size: 50))
            }
            
            Text("Clicks: \(gamevm.mySchoolCnt)")
//            Button(action: gamevm.newAdd(), label: {
//                Text("Button")
//                
//            })
        }
        .onTapGesture {
            self.totalNumberOfTaps += 1
            print(self.totalNumberOfTaps)
        }
    }
}


#Preview {
    GameView(gamevm: FireStoreManager())
}
