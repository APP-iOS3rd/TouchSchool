
//
//  RankView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI


struct RankView: View {
    
    @ObservedObject private var schoolViewModel = RankVM()
    @State private var schoolInfos: [SchoolInfo] = []
    
    
    var body: some View {
        
        ZStack{
            Color(red: 132/255, green: 194/255, blue: 65/255).edgesIgnoringSafeArea(.bottom)
            //꾸밈화면
            VStack{
                VStack{
                ZStack{
                    Image("school1")
                        .resizable()
                        .frame(height: 200)
                        .edgesIgnoringSafeArea(.top)
                    
                    ZStack{
                        //이부분은 좀더 잘 보이게 꾸밀 예정.
                        Text("학교 순위")
                            .fontWeight(.bold)
                            .font(.system(size: 45))
                            .foregroundColor(.black)

                    }
                    .offset(y: 85)
                }
                
                    // 학교 순위리스트
                    List(schoolInfos) { schoolInfo in
                        VStack(alignment: .leading) {
                            Text(schoolInfo.name)
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}
