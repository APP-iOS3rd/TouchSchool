//
//  ContentView.swift
//  buttonPractice
//
//  Created by 황성진 on 2023/10/05.
//

import SwiftUI

struct ContentView: View {
    @State private var counter1: Int = 0
    @State private var counter2: Int = 0
    @State private var counter3: Int = 0
    @State private var counter4: Int = 0
 
    var body: some View {
        VStack {
            Text("숫자 카운트 : \(counter1)")
            Button(action: {
                self.counter1 += 1
            }) {
                Text("1번버튼")
                    .bold()
                    .padding()
                    .frame(width: 150)
                    .background(.red   )
                    .cornerRadius(12)
                    .foregroundColor(.black)
            }

        }
        VStack {
            Text("숫자 카운트 : \(counter2)")
            Button(action: {
                self.counter2 += 1
            }) {
                Text("2번버튼")
                    .font(.system(size: 30))
                    .padding()
                    .frame(width: 150)
                    .background(.yellow)
                    .cornerRadius(12)
                    .foregroundColor(.black)
            }

        }
        VStack {
            Text("숫자 카운트 : \(counter3)")
            Button(action: {
                self.counter3 += 1
            }) {
                Text("3번버튼")
                    .padding()
                    .frame(width: 150)
                    .background(.mint)
                    .cornerRadius(12)
                    .foregroundColor(.black)
                    .underline()
            }

        }
        VStack {
            Text("숫자 카운트 : \(counter4)")
            Button(action: {
                self.counter4 += 1
            }) {
                Text("4번버튼")
                    .padding()
                    .frame(width: 150)
                    .background(.gray)
                    .cornerRadius(12)
                    .foregroundColor(.black)
                    .italic()
            }

        }
    }
}

#Preview {
    ContentView()
}

