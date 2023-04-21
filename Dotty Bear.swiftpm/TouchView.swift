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
    @State var btn1ImageOn: Image = Image("touchpoint")
    @State var btn2ImageOn: Image = Image("touchpoint")
    @State var btn3ImageOn: Image = Image("touchpoint")
    @State var btn4ImageOn: Image = Image("touchpoint")
    @State var btn5ImageOn: Image = Image("touchpoint")
    @State var btn6ImageOn: Image = Image("touchpoint")
    @State var btn1ImageOff: Image = Image("touchpoint3")
    @State var btn2ImageOff: Image = Image("touchpoint3")
    @State var btn3ImageOff: Image = Image("touchpoint3")
    @State var btn4ImageOff: Image = Image("touchpoint3")
    @State var btn5ImageOff: Image = Image("touchpoint3")
    @State var btn6ImageOff: Image = Image("touchpoint3")
    
    
    @State var btn1IsHidden = false
    @State var btn2IsHidden = false
    @State var btn3IsHidden = false
    @State var btn4IsHidden = false
    @State var btn5IsHidden = false
    @State var btn6IsHidden = false
    
    
    @State var dotRain = Image("dot_rain")
    
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        //player.numberOfLoops = 1
        player.play()
    }
    
    func r(){
        
        btn1ImageOn = Image("touchpoint2")
        btn2ImageOn = Image("touchpoint2")
        btn3ImageOn = Image("touchpoint2")
        btn4ImageOn = Image("touchpoint3")
        btn5ImageOn = Image("touchpoint2")
        btn6ImageOn = Image("touchpoint3")
        count = 4
        letter = "r"
        
    }
    
    func a(){
        btn1ImageOn = Image("touchpoint2")
        btn2ImageOn = Image("touchpoint3")
        btn3ImageOn = Image("touchpoint3")
        btn4ImageOn = Image("touchpoint3")
        btn5ImageOn = Image("touchpoint3")
        btn6ImageOn = Image("touchpoint3")
        count = 1
        letter = "a"
    }
    
    func i(){
        btn1ImageOn = Image("touchpoint3")
        btn2ImageOn = Image("touchpoint2")
        btn3ImageOn = Image("touchpoint3")
        btn4ImageOn = Image("touchpoint2")
        btn5ImageOn = Image("touchpoint3")
        btn6ImageOn = Image("touchpoint3")
        count = 2
        letter = "i"
    }
    
    
    func n(){
        btn1ImageOn = Image("touchpoint2")
        btn2ImageOn = Image("touchpoint3")
        btn3ImageOn = Image("touchpoint2")
        btn4ImageOn = Image("touchpoint2")
        btn5ImageOn = Image("touchpoint2")
        btn6ImageOn = Image("touchpoint3")
        count = 4
        letter = "n"
    }
    

    func rain(){
        btn1IsHidden = true
        btn2IsHidden = true
        btn3IsHidden = true
        btn4IsHidden = true
        btn5IsHidden = true
        btn6IsHidden = true
        letter = "rain"
        
//        navigationController?.pushViewController(RainViewController(), animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            
            
            self.letterLabel.alpha = 0.0
            self.letterLabel.text = "RAIN"
            self.playSound(soundName: "sound_rain")
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
                self.letterLabel.alpha = 1.0 // animate the alpha to 1.0 (fully opaque)
            }, completion: nil)
            //글자 등장
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                TTSManager.shared.play(self.letter) //읽기
            })
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
                Image(systemName: "arrow.right.circle")
                    .opacity(1.0)// animate the alpha to 1.0 (fully opaque)
            }, completion: nil)
            
            
            
            
                })
    }
    
    
    
    
    
    
    
    
    var body: some View {
        ZStack {
            
            SpriteView(scene: scene)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .ignoresSafeArea()
        
            
            HStack{
                VStack{
                    btn1ImageOn
                        .resizable()
                        .frame(width: 90, height: 90)
                    btn2ImageOn
                        .resizable()
                        .frame(width: 90, height: 90)
                    btn3ImageOn
                        .resizable()
                        .frame(width: 90, height: 90)
                }
                VStack{
                    btn4ImageOff
                        .resizable()
                        .frame(width: 90, height: 90)
                    btn5ImageOn
                        .resizable()
                        .frame(width: 90, height: 90)
                    btn6ImageOff
                        .resizable()
                        .frame(width: 90, height: 90)
                }
            }.frame(width: 400, height: 1000)
//            .scaledToFit()
//            .padding()
            
            
            Text("R")
                .fontWeight(.bold)
                .font(Font.custom("Hoefler Text Black", size: 68))
                .foregroundColor(.white)
                .padding(.top, 500)
                
        
            
            Button (action:{
                self.tag = 1
            }) {    Image(systemName: "arrow.right.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            .tint(Color(hex:  0xffffff))
            .shadow(radius: 15)
            .offset(x:140, y:350)
        
        }
        
        
    }
    
    
}


struct TouchScene_Preview: PreviewProvider {
    static var previews: some View {
        TouchView()
    }
}

