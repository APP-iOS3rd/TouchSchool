//
//  ContentView.swift
//  ToyProject
//
//  Created by 윤준성 on 10/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Number: Int = 0
    
    var body: some View {
        VStack {
            Text("\(Number)")
                .font(.system(size: 50))
                .border(Color.blue)
                .padding(50)
            
            HStack {
                Button(action: {
                    if Number == 0 {
                        Number = 1
                    } else {
                        Number += 1
                    }
                }, label: {
                    Text("1")
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 130, alignment: .center)
                        .fontWeight(.bold)
                        .font(.system(size: 130))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                })
                
                
                Button(action: {
                    if Number == 0 {
                        Number = 2
                    } else {
                        Number += 2
                    }
                }, label: {
                    Text("2")
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 130, alignment: .center)
                        .fontWeight(.bold)
                        .font(.system(size: 130))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                })
            }
            
            
            HStack {
                Button(action: {
                    if Number == 0 {
                        Number = 3
                    } else {
                        Number += 3
                    }
                }, label: {
                    Text("3")
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 130, alignment: .center)
                        .fontWeight(.bold)
                        .font(.system(size: 130))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                })
                
                
                Button(action: {
                    if Number == 0 {
                        Number = 4
                    } else {
                        Number += 4
                    }
                }, label: {
                    Text("4")
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 130, alignment: .center)
                        .fontWeight(.bold)
                        .font(.system(size: 130))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                })
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
