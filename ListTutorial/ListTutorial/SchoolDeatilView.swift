//
//  SchoolDeatilView.swift
//  ListTutorial
//
//  Created by 황성진 on 11/2/23.
//

import SwiftUI

struct SchoolDeatilView: View {
    
    let selectedSchool : School
    
    var body: some View {
        
        let linkURL = URL(string: selectedSchool.link)

        ZStack{
        
            Form {
                Section("학교 로고") {
                    Image(selectedSchool.img ?? "lion")
                        .resizable()
                        .cornerRadius(12)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                .foregroundColor(.white)
                .listRowBackground(Color.clear)
                .font(.title)
                .bold()
                
                Section("학교명") {
                    Text(selectedSchool.schoolName)
                        .font(.headline)
                        .bold()
                }
                .foregroundColor(.white)
                .listRowBackground(Color.clear)
                .font(.title)
                .bold()
                
                Section("주소") {
                    Text(selectedSchool.adres)
                        .font(.body)
                }
                .foregroundColor(.white)
                .listRowBackground(Color.clear)
                .font(.title)
                .bold()
                
                Section("홈페이지") {
                    Link("학교 홈페이지 바로가기", destination: linkURL!)
                        .font(.body)
                }
                .foregroundColor(.white)
                .listRowBackground(Color.clear)
                .font(.title)
                .bold()
            }
            .scrollContentBackground(.hidden) // new in iOS 16
            .background {
                Image("213213")
                    .resizable()
                    //.scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#Preview {
    SchoolDeatilView(selectedSchool: schoolDatas[0])
}
