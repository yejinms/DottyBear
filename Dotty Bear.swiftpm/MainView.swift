import SwiftUI

struct ContentView: View {
    
    @State private var showButton = false
    
    var body: some View {
        ZStack{
            
            Image("background_green")
            
            VStack {
                Text("Dotty Bear")
                    .fontWeight(.bold)
                    .font(Font.custom("Hoefler Text Black", size: 68))
                    .foregroundColor(Color(hex: 0x5d097e))
                    .padding(.top, 60)
                    .padding(.bottom, -8)
                
                
                Image("dotty1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x: 35, y:10)
                    .scaledToFit()
                    .frame(width: 490)
                    .ignoresSafeArea()
                
                ZStack{
                    
                    NavigationView {
                        
                        List {
                            ImageSlider()
                                .frame(height: 270)
                        }
                    }
                    .frame(height: 330)
                    
                    if showButton {
                        
                        Button (action:{
                            print(true)
                        }) {
                            
                            HStack{
                                Image(systemName: "arrow.right.circle")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            }}
                        .tint(Color(hex:  0xd2ebab))
                        .shadow(radius: 3)
                        .offset(x:140, y:110)
                        
                        
                        
                        
                    }
                    
                    //                    Rectangle()
                    //                        .frame(height: 370.0)
                    //                        .foregroundColor(Color(hex: 0xfffdf8))
                    //                        .padding(.top, -10)
                    //
                    
                }.padding(.top, -15)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                            showButton = true
                            
                            
                        }
                        
                    }
            }
        }
    }
}






struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

