//
//  GridCell.swift
//  TouchSchool
//
//  Created by 최동호 on 12/18/23.
//

import SwiftUI

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
