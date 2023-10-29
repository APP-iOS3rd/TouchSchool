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
//                            .background(.white)

                    }
                    .offset(y: 85)
                }
                
                    // 학교 정보 받아서 넣기
                    List{
                        Text("1위 : 학교이름")
                        Text("1위 : 학교이름")
                    }
                    .scrollContentBackground(.hidden)
                    .offset(y: -20)
                }
            }
        }
    }
}


struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}

