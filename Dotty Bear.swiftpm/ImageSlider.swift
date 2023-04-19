//
//  ImageSlider.swift
//  DottyBear
//
//  Created by Niko Yejin Kim on 2023/04/20.
//

import SwiftUI

struct ImageSlider: View {
    
    
    private let texts = [
        "Long, long ago, in the mystical woods, there was a fairy bear named Dotty. She had the fluffiest paws you've ever seen!",
        "Dotty was a special bear, because she had a magical power. She could read the minds of anything, without even seeing it.",
        "Legend has it that if you follow Dotty's pawprints, you might be able to feel the same magic that she felt.",
        "Why don't you try following her pawprints right now?"]
    
    var body: some View {
        
        TabView {
            ForEach(texts, id: \.self) { item in
                
                Text(item)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .frame(maxWidth: 280)
                    .font(Font.custom("Hoefler Text", size: 20))
                    
                    
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        
        ImageSlider()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
