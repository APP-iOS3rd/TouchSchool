//
//  InfoView.swift
//  TouchSchool
//
//  Created by 황성진 on 11/27/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack{
            Color(red: 132/255, green: 194/255, blue: 65/255).edgesIgnoringSafeArea(.bottom)
            Image("blackboard_set")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("멋쟁이 사자처럼 앱스쿨 3기")
                    .font(.custom("Giants-Bold", size: 25))
                    .foregroundStyle(.white)
                    .padding()
                Text("에잇(EIGHT)")
                    .font(.custom("Giants-Bold", size: 25))
                    .foregroundStyle(.white)
                List {
                    Section {
                        Link("김성엽",
                             destination: URL(string: "https://github.com/RapidSloth")!)
                        .font(.custom("Giants-Bold", size: 17))
                        .foregroundColor(Color.pinkcolor)
                        Link("김혜란",
                             destination: URL(string: "https://github.com/hyeran1122")!)
                        .font(.custom("Giants-Bold", size: 17))
                        .foregroundColor(Color.pinkcolor)
                        Link("윤준성",
                             destination: URL(string: "https://github.com/PinkSoju")!)
                        .font(.custom("Giants-Bold", size: 17))
                        .foregroundColor(Color.pinkcolor)
                        Link("최동호",
                             destination: URL(string: "https://github.com/hamfan524")!)
                        .font(.custom("Giants-Bold", size: 17))
                        .foregroundColor(Color.pinkcolor)
                        Link("황성진",
                             destination: URL(string: "https://github.com/Hsungjin")!)
                        .font(.custom("Giants-Bold", size: 17))
                        .foregroundColor(Color.pinkcolor)
                    } header: {
                        Text("팀원")
                            .font(.custom("Giants-Bold", size: 17))
                            .foregroundStyle(.white)
                    }
                    .listRowBackground(Color.darkGrayText.opacity(0.5))
                    
                    Section {
                        Link("폰트(레시피 코리아)",
                             destination: URL(string: "https://recipekorea.com/bbs/board.php?bo_table=ld_0308&wr_id=2479")!)
                        .font(.custom("Giants-Bold", size: 17))
                        .foregroundColor(Color.pinkcolor)
                        Link("폰트(자이언츠)",
                             destination: URL(string: "https://www.giantsclub.com/html/?pcode=1007")!)
                        .font(.custom("Giants-Bold", size: 17))
                        .foregroundColor(Color.pinkcolor)
                        Link("버튼 사운드",
                             destination: URL(string: "https://sellbuymusic.com/md/sqonfxz-acfztwk")!)
                        .font(.custom("Giants-Bold", size: 17))
                        .foregroundColor(Color.pinkcolor)
                        Link("에러 사운드",
                             destination: URL(string: "https://sellbuymusic.com/md/seyunbb-pcfztwk")!)
                        .font(.custom("Giants-Bold", size: 17))
                        .foregroundColor(Color.pinkcolor)
                        Link("메인 사운드",
                             destination: URL(string: "https://sellbuymusic.com/md/moazbzt-gcfztwk")!)
                        .font(.custom("Giants-Bold", size: 17))
                        .foregroundColor(Color.pinkcolor)
                    } header: {
                        Text("사용 저작권")
                            .font(.custom("Giants-Bold", size: 17))
                            .foregroundStyle(.white)
                    }
                    .listRowBackground(Color.darkGrayText.opacity(0.5))
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .frame(width: 390, height: 650)
            }
        }
    }
}

#Preview {
    InfoView()
}
