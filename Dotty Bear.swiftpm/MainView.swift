import SwiftUI

struct ContentView: View {
    @State private var showModal = false
     
    
    
    var body: some View {
        ZStack{
            
            Image("background_green")
            
            VStack {
                Text("Dotty Bear")
                    .fontWeight(.bold)
                    .font(Font.custom("Hoefler Text Black", size: 65))
                    .foregroundColor(Color(hex: 0x5d097e))
                    .padding(.top, 60)
                    .padding(.bottom, -8)
                
                
                Image("dotty1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x: 35, y:10)
                    .scaledToFit()
                    .frame(width: 470)
                    .ignoresSafeArea()
                
                ZStack{
                    Rectangle()
                        .frame(height: 370.0)
                        .foregroundColor(Color(hex: 0xfffdf8))
                        .padding(.top, -10)
                        
                    
                    Text("Long, long ago, in the mystical woods, there was a fairy bear named Dotty. \nShe had the fluffiest paws you've ever seen!")
                        .multilineTextAlignment(.center)
                        .lineSpacing(10)
                        .frame(maxWidth: 320)
                        .padding(.bottom, 50)
                    
                    
                    Button {
                        print(true)                    }label: {
                    Text("Let's Start!")
                            .font(.system(size: 20))
                            .foregroundColor(Color(hex: 0xffffff))
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hex: 0x9940ff).opacity(0.5))
                    .shadow(radius: 3)
                    .offset(y:100)
                    .opacity(0)
                    
                    
                }.padding(.top, -15)
                
            }
        }
    }
    
    
    
    
}




struct ContentView_Preview: PreviewProvider {
static var previews: some View {
    ContentView()
}
}

