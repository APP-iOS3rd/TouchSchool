//
//  ContentView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//
import Foundation
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: SearchVM

    var body: some View {
        ZStack{
            if vm.isDownloading {
                Image("blackboard_set")
                    .resizable()
                    .ignoresSafeArea()
                
                ProgressView("학교 정보 받아오는 중..", value: vm.progress)
                    .foregroundColor(Color.white)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    .padding()
                    .onAppear {
                        Task {
                            await vm.fetchData()
                        }
                    }
                
                
            } else {
                MainView()
            }
            
            
        }
    }
    
}

#Preview {
    ContentView()
}
