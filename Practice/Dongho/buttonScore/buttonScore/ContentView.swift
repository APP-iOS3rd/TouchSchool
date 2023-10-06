//
//  ContentView.swift
//  buttonScore
//
//  Created by 최동호 on 2023/10/05.
//

import SwiftUI

struct ContentView: View {
    @State private var score: [Int] = [0, 0, 0, 0]
    
    var body: some View {
        VStack {
            Text("Touch Buttons")
                .font(.title)
                .padding()
            LazyVGrid(columns: Array(repeating: GridItem(),
                                     count: 2),
                      spacing: 30) {
                ForEach(0 ..< 4) {  index in
                    Button(action: {
                        score[index] += 1
                    }, label: {
                        Text("\(score[index])")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                    .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
