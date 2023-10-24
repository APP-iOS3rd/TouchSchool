//
//  ContentView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//
import Foundation
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = MainVM()
    
    var body: some View {
        ZStack{
            VStack{
                if vm.isLoading {
                    ProgressView("학교 정보 받아오는 중..", value: vm.progress) // Display a progress view with the current progress
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                        .onAppear {
                            Task {
                                await vm.fetchData()
                            }
                        }
                } else {
                    SearchView()
                }
   
            }
        }
    }
}

#Preview {
    ContentView()
}
