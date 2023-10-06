import SwiftUI

struct ContentView: View {
    @State var clickCheck1 = 0
    @State var clickCheck2 = 0
    @State var clickCheck3 = 0
    @State var clickCheck4 = 0
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {self.clickCheck1+=1}, label: {
                    Text("\(clickCheck1)")
                }) .buttonStyle(.bordered)
                Button(action: {self.clickCheck2+=1}, label: {
                    Text("\(clickCheck2)")
                }) .buttonStyle(.bordered)
            }
            HStack{
                Button(action: {self.clickCheck3+=1}, label: {
                    Text("\(clickCheck3)")
                }) .buttonStyle(.bordered)
                Button(action: {self.clickCheck4+=1}, label: {
                    Text("\(clickCheck4)")
                }) .buttonStyle(.bordered)
            }
        }
    }
}
