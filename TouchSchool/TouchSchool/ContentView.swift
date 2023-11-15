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
            VStack{
                if vm.isDownloading {
                    ProgressView("학교 정보 받아오는 중..", value: vm.progress)
                        .progressViewStyle(CircularProgressViewStyle())
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

}

#Preview {
    ContentView()
}
