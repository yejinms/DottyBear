//
//  MapView.swift
//  DottyBear
//
//  Created by Niko Yejin Kim on 2023/04/20.
//


import SwiftUI

struct MapView: View {
    @State var tag:Int? = nil
    
    var body: some View {
        ZStack{
            NavigationLink(destination: MainView(), tag: 1, selection: self.$tag ) {
                EmptyView()
            }
            Image("way")
                .offset(y:100)
                .opacity(0.5)
            VStack{
                Text("Let's trace Dotty's pawprints! You should stick your finger out to touch and feel the same how she senses.")
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .frame(maxWidth: 280)
                    .font(Font.custom("Hoefler Text", size: 28))
                
                ZStack{
                    Image("dot_color")
                        .resizable()
                        .frame(width: 60, height: 90)
                        .scaledToFit()
                    
                    Image("draw_w")
                        .resizable()
                        .frame(width: 60, height: 100)
                        .scaledToFit()
                        .offset(x:20, y:-5)
                        .padding(.top, 100)
                    
                        .shadow(radius: 15)
                    
                }
            }
                Button (action:{
                    self.tag = 1
                }) {    Image(systemName: "arrow.right.circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
                .tint(Color(hex:  0xffffff))
                .shadow(radius: 15)
                .offset(x:140, y:360)
            
        }
    }
    
    
}



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        
        MapView()
    }
}
