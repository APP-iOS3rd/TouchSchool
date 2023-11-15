
//
//  RankView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI

struct RankView: View {
    
    var body: some View {
        
        ZStack{
            Color(red: 132/255, green: 194/255, blue: 65/255).edgesIgnoringSafeArea(.bottom)
            //꾸밈화면
            VStack{
                ZStack{
                    Image("school1")
                        .resizable()
                        .frame(height: 200)
                        .edgesIgnoringSafeArea(.top)
                    
                    //이부분은 좀더 잘 보이게 꾸밈
                    Text("학교 순위")
                        .fontWeight(.bold)
                        .font(.system(size: 45))
                        .foregroundColor(.black)
                }
                
                // 학교 순위리스트
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(alignment: .leading) {
                        ForEach(allSchoolInfos) { schoolInfo in
                            HStack {
                                if let rank = schoolInfo.rank {
                                    Text("\(rank)")
                                } else {
                                    Text("0")
                                }
                                Text(schoolInfo.name)
                                Text("\(schoolInfo.count)")
                            }
                        }
                    }
                }
                .padding(.top, 20) // 리스트의 상단에 여백 추가
                .padding(.horizontal, 20) // 좌우 여백 추가
                
            }
        }
    }
}
