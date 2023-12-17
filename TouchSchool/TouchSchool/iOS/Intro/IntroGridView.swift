//
//  IntroGridView.swift
//  TouchSchool
//
//  Created by 최동호 on 12/17/23.
//

import SwiftUI

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
