//
//  SearchGuide.swift
//  TouchSchool
//
//  Created by 최동호 on 10/13/23.
//

import Foundation
import SwiftUI

struct SearchGuide: View {
    var body: some View {
        VStack{
            Text(Image(systemName: "magnifyingglass"))
                .font(.system(size: 40))
                .foregroundColor(Color.grayText)
                .padding(.top, 150)
                .padding(.bottom, 3)
            Text("학교를 검색해주세요")
                .foregroundColor(Color.grayText)
                .font(.title3)
                .bold()
        }
    }
}

#Preview {
    SearchGuide()
}
