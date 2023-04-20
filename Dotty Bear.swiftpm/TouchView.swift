//
//  TouchScene.swift
//  DottyBear
//
//  Created by Niko Yejin Kim on 2023/04/20.
//
import Foundation
import UIKit
import SpriteKit
import SwiftUI
import AVFoundation

class TouchScene: SKScene {
    var player = SKSpriteNode()
    var touchPoint: CGPoint = CGPoint()
    var touching: Bool = false
    var background = SKSpriteNode(imageNamed: "grass.png")
    
    
    override func didMove(to view: SKView) {
        //        scene!.scaleMode = .aspectFit
        background.position = CGPoint(x: 0, y: 0)
        background.scale(to: CGSize(width: 1200, height: 2600))
        background.alpha = 0.9
        
        self.addChild(background)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in:self)
        touchPoint = location
        player = SKSpriteNode(imageNamed: "touchpoint")
        player.size = CGSize(width: 80, height: 80)
        self.addChild(player)
        player.position.x = location.x - 5
        player.position.y = location.y + 5
        player.alpha = 0.8
        touching = true
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            player.position.x = location.x - 5
            player.position.y = location.y + 5
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.run(SKAction.removeFromParent())
        touching = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}




struct TouchView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var scene: SKScene {
        let scene = TouchScene()
        scene.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        scene.scaleMode = .aspectFill
        //        scene.backgroundColor = .black
        
        
        
        return scene
        
    }
    

    @State var tag:Int? = nil
    
    
    @State var player: AVAudioPlayer!
    @State var btnIsChangedArray = Array(repeating: false, count: 6)
    @State var trueCount = 0
    @State var count = 0
    @State var letter = ""
    
    @State var touchView: SKView!
    @State var letterLabel: UILabel!
    @State var btn1Image: Image = Image("touchpoint")
    @State var btn2Image: Image = Image("touchpoint")
    @State var btn3Image: Image = Image("touchpoint")
    @State var btn4Image: Image = Image("touchpoint")
    @State var btn5Image: Image = Image("touchpoint")
    @State var btn6Image: Image = Image("touchpoint")
    
    @State var nextBtn: UIButton!
    @State var dotRain: UIImageView!
    
    var body: some View {
        ZStack {
            
            SpriteView(scene: scene)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .ignoresSafeArea()
        
            
            HStack{
                VStack{
                    btn1Image
                        .resizable()
                        .frame(width: 90, height: 90)
                    btn2Image
                        .resizable()
                        .frame(width: 90, height: 90)
                    btn3Image
                        .resizable()
                        .frame(width: 90, height: 90)
                }
                VStack{
                    btn4Image
                        .resizable()
                        .frame(width: 90, height: 90)
                    btn5Image
                        .resizable()
                        .frame(width: 90, height: 90)
                    btn6Image
                        .resizable()
                        .frame(width: 90, height: 90)
                }
            }.frame(width: 400, height: 1000)
//            .scaledToFit()
//            .padding()
            
            
        
        }
        
        
    }
    
    
}


struct TouchScene_Preview: PreviewProvider {
    static var previews: some View {
        TouchView()
    }
}

