//
//  ContentView.swift
//  toy
//
//  Created by 김혜란 on 2023/10/05.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [0, 0, 0, 0]

    var body: some View {
        VStack {
            ForEach(0..<numbers.count, id: \.self) { index in
                VStack {
                    Text("\(numbers[index])")
                        .font(.largeTitle)
                        .padding()

                    Button(action: {
                        numbers[index] += 1
                    }) {
                        Text("증가")
                            .font(.title)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView() // 초기 뷰
        }
    }
}
