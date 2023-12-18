
//
//  RankView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import SwiftUI

struct RankView: View {
    @ObservedObject var vm: GameVM
    @Binding var showRank: Bool
    
    var body: some View {
        ZStack {
            if vm.visitCount % 8 == 0 {
                InterstitialAdView()
            }
            Image("blackboard_set")
                .resizable()
                .ignoresSafeArea()
                .onAppear() {
                    vm.visitCount += 1
                }
            
            //꾸밈화면
            VStack {
                //돌아가기
                HStack {
                    Button(action: {
                        // Handle back button action here
                        self.showRank = false
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("돌아가기")
                            .font(.custom("Giants-Bold", size: 15))
                            .foregroundColor(.white)
                    }
                    .padding(.leading)
                    Spacer()
                }
                
                //우리학교 순위
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.darkGrayText.opacity(0.5))
                        .frame(height: 130)
                        .padding()
                    
                    VStack {
                        Text("\(vm.mySchoolName)")
                            .foregroundStyle(.mint)
                            .font(.custom("Giants-Bold", size: 30))
                            .padding(.top)
                        
                        HStack {
                            Text("\(mySchoolRank)위 ")
                                .foregroundStyle(.white)
                                .font(.custom("Giants-Bold", size: 30))
                            
                            Text("\(vm.mySchoolCnt)")
                                .foregroundStyle(.white)
                                .font(.custom("Giants-Bold", size: 30))
                            
                        }
                        .padding()
                    }
                }
                
                // 학교 순위리스트
                List {
                    LazyVStack(alignment: .leading) {
                        ForEach(allSchoolInfos) { schoolInfo in
                            HStack {
                                if let rank = schoolInfo.rank {
                                    Text("\(rank)위 ")
                                        .font(.custom("Giants-Bold", size: 15))
                                } else {
                                    Text("0")
                                        .font(.custom("Giants-Bold", size: 15))
                                }
                                Text(schoolInfo.name)
                                    .font(.custom("Giants-Bold", size: 15))
                                    .frame(width: 150, height: 25, alignment: .leading)
                                
                                Text("\(schoolInfo.count)")
                                    .font(.custom("Giants-Bold", size: 15))
                            }
                            .foregroundColor(.white)
                            .bold()
                        }
                    }
                    .listRowBackground(Color.darkGrayText.opacity(0.5))
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            Spacer()
        }
    }
}

#Preview {
    RankView(vm: GameVM(), showRank: MainView().$showRank)
}
