//
//  InfoView.swift
//  TouchSchool
//
//  Created by 황성진 on 11/27/23.
//

import SwiftUI

struct Introduce {
    let name: String
    let url: String
    var imageURL: String?
}

let creators = [
    Introduce(name: "김성엽",
              url: "https://github.com/RapidSloth", imageURL: "https://avatars.githubusercontent.com/u/144765545?v=4"),
    Introduce(name: "김혜란",
              url: "https://github.com/hyeran1122", imageURL: "https://avatars.githubusercontent.com/u/97385586?v=4"),
    Introduce(name: "윤준성",
              url: "https://github.com/PinkSoju", imageURL: "https://avatars.githubusercontent.com/u/127680963?v=4"),
    Introduce(name: "최동호",
              url: "https://github.com/hamfan524", imageURL: "https://avatars.githubusercontent.com/u/37105602?v=4"),
    Introduce(name: "황성진",
              url: "https://github.com/Hsungjin", imageURL: "https://avatars.githubusercontent.com/u/120264964?v=4")
]

let helpers = [
    Introduce(name: "강치우",
              url: "https://github.com/kangciu", imageURL: "https://avatars.githubusercontent.com/u/112779139?v=4"),
    Introduce(name: "이민영",
              url: "https://github.com/Mminy62", imageURL: "https://avatars.githubusercontent.com/u/66752398?v=4"),
    Introduce(name: "김소혜",
              url: "https://github.com/xohxe", imageURL: "https://avatars.githubusercontent.com/u/75136643?v=4"),
    Introduce(name: "노주영",
              url: "https://github.com/JooYoungNoh", imageURL: "https://avatars.githubusercontent.com/u/96951827?v=4"),
    Introduce(name: "김민재",
              url: "https://github.com/bdrsky2010", imageURL: "https://avatars.githubusercontent.com/u/80156515?v=4"),
    Introduce(name: "황민채",
                  url: "https://github.com/Hminchae", imageURL: "https://avatars.githubusercontent.com/u/103357078?v=4")
]

let rights = [
    Introduce(name: "폰트(레시피 코리아)",
              url: "https://recipekorea.com/bbs/board.php?bo_table=ld_0308&wr_id=2479"),
    Introduce(name: "폰트(자이언츠)",
              url: "https://www.giantsclub.com/html/?pcode=1007"),
    Introduce(name: "버튼 사운드",
              url: "https://sellbuymusic.com/md/sqonfxz-acfztwk"),
    Introduce(name: "에러 사운드",
              url: "https://sellbuymusic.com/md/seyunbb-pcfztwk"),
    Introduce(name: "메인 사운드", url: "https://sellbuymusic.com/md/moazbzt-gcfztwk")
]

struct IntroGridView: View {
    let intros: [Introduce]
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 15), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(intros, id: \.name) { intro in
                GridCell(intro: intro)
            }
        }
    }
}

struct GridCell: View {
    let intro: Introduce
    var body: some View {
        Link(destination: URL(string: intro.url)!) {
            VStack {
                AsyncImage(url: URL(string: intro.imageURL!)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .clipShape(.rect(cornerRadius: 10))
                } placeholder: {
                    ProgressView()
                }
                Text(intro.name)
                    .font(.custom("Giants-Bold", size: 15))
                    .foregroundStyle(.white)
            }
        }
    }
}

struct InfoView: View {
    var body: some View {
        ZStack{
            Color(red: 132/255, green: 194/255, blue: 65/255).edgesIgnoringSafeArea(.bottom)
            Image("blackboard_set")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("에잇(EIGHT)")
                        .font(.custom("Giants-Bold", size: 25))
                        .foregroundStyle(.white)
                    VStack(alignment: .leading) {
                        Text("팀원")
                            .font(.custom("Giants-Bold",
                                          size: 20))
                            .foregroundStyle(.white)
                            .padding(.leading, 10)
                        IntroGridView(intros: creators)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("도와준 사람")
                            .font(.custom("Giants-Bold",
                                          size: 20))
                            .foregroundStyle(.white)
                            .padding(.leading, 10)
                        IntroGridView(intros: helpers)
                    }
                    .padding(.vertical)
                    
                    Section {
                        ForEach(rights, id: \.name) { right in
                            Link(destination: URL(string: right.url)!) {
                                Text(right.name)
                                    .font(.custom("Giants-Bold", size: 15))
                                    .foregroundStyle(.white)
                            }
                        }
                    } header: {
                        Text("사용 저작권")
                            .font(.custom("Giants-Bold",
                                          size: 17))
                            .foregroundStyle(.white)
                    }
                    .listRowBackground(Color.darkGrayText.opacity(0.5))
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    //                .frame(width: 390, height: 650)
                }
            }
            .scrollIndicators(.hidden)
            .padding()
        }
    }
}

//#Preview {
//    InfoView()
//}

