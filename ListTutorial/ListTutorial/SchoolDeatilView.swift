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
        
        Form {
            Section {
                Image(selectedSchool.img)
                    .resizable()
                    .cornerRadius(12)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedSchool.schoolName)
                    .font(.headline)
                
                Text(selectedSchool.adres)
                    .font(.body)
                
                Text(selectedSchool.link)
                
                Link("학교 홈페이지", destination: linkURL!)
                
            }
        }
    }
}

#Preview {
    SchoolDeatilView(selectedSchool: schoolData[0])
}
