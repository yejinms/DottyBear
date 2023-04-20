import SwiftUI

struct MainView: View {
    
    @State private var showButton = false
    @State var tag:Int? = nil
    
    var body: some View {
        
        NavigationView{
            ZStack{
                NavigationLink(destination: MapView(), tag: 1, selection: self.$tag ) {
                    EmptyView()
                }
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
                            //                            .foregroundColor(Color(hex: 0xfffdf8)) // 아이보리
                            
                        }.padding(.top, -15)
                    }
                }
                
                if showButton {
                    Button (action:{
                        self.tag = 1
                    }) {    Image(systemName: "arrow.right.circle")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    .tint(Color(hex:  0xaee459))
                    .offset(x:140, y:360)
                    .shadow(radius: 15)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                    showButton = true
                } //버튼이 등장하는 데까지 걸리는 시간
            }
        }
    }
}






struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

