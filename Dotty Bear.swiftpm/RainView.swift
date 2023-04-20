//
//  RainView.swift
//  DottyBear
//
//  Created by Niko Yejin Kim on 2023/04/20.
//

import UIKit
import AVFoundation
import SwiftUI
import SpriteKit


struct RainView: View {
    @State var tag:Int? = nil
    
    
    @State var player: AVAudioPlayer!
    @State var btnIsChangedArray = Array(repeating: false, count: 6)
    @State var trueCount = 0
    @State var count = 0
    @State var letter = ""
    
    @State var touchView: SKView!
    @State var letterLabel: UILabel!
    @State var btn1Image: UIImageView!
    @State var btn2Image: UIImageView!
    @State var btn3Image: UIImageView!
    @State var btn4Image: UIImageView!
    @State var btn5Image: UIImageView!
    @State var btn6Image: UIImageView!
    
    @State var nextBtn: UIButton!
    @State var dotRain: UIImageView!
    
    
    func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let position = touch.location(in: self.touchView)
            
            
            /*
             // UIButton 일 때 위치 불러오기
             func ifTouchedChangeBtn(btnImage: UIButton){
             let btnPositionX = Int(btnImage.convert(btnImage.bounds.origin, to: self.view).x)+Int(btn1Image.frame.size.width)/2
             let btnPositionY = Int(btnImage.convert(btnImage.bounds.origin, to: self.view).y)+Int(btn1Image.frame.size.height)/2
             
             if Int(position.x) > btnPositionX - 10 && Int(position.x) < btnPositionX + 10
             && Int(position.y) > btnPositionY - 10 && Int(position.y) < btnPositionY + 10 {
             feelBtnImage(btnImage: btnImage)
             }
             }*/
            
            func ifTouchedChangeBtn(btnImage: UIImageView){
                
                let btnPositionX = Int(touchView.convert(touchView.frame.origin, from:btnImage).x)+Int(btn1Image.frame.size.width)/2 //btnImage 중심 x 위치
                let btnPositionY = Int(touchView.convert(touchView.frame.origin, from:btnImage).y)+Int(btn1Image.frame.size.height)/2 //btnImage 중심 y 위치
                
                var btnNum = 0
                switch (btnPositionX,btnPositionY){
                case (Int(touchView.convert(touchView.frame.origin, from:btn1Image).x)+Int(btn1Image.frame.size.width)/2,Int(touchView.convert(touchView.frame.origin, from:btn1Image).y)+Int(btn1Image.frame.size.height)/2):
                    btnNum = 1
                case (Int(touchView.convert(touchView.frame.origin, from:btn2Image).x)+Int(btn2Image.frame.size.width)/2,Int(touchView.convert(touchView.frame.origin, from:btn2Image).y)+Int(btn2Image.frame.size.height)/2):
                    btnNum = 2
                case (Int(touchView.convert(touchView.frame.origin, from:btn3Image).x)+Int(btn3Image.frame.size.width)/2,Int(touchView.convert(touchView.frame.origin, from:btn3Image).y)+Int(btn3Image.frame.size.height)/2):
                    btnNum = 3
                case (Int(touchView.convert(touchView.frame.origin, from:btn4Image).x)+Int(btn4Image.frame.size.width)/2,Int(touchView.convert(touchView.frame.origin, from:btn4Image).y)+Int(btn4Image.frame.size.height)/2):
                    btnNum = 4
                case (Int(touchView.convert(touchView.frame.origin, from:btn5Image).x)+Int(btn5Image.frame.size.width)/2,Int(touchView.convert(touchView.frame.origin, from:btn5Image).y)+Int(btn5Image.frame.size.height)/2):
                    btnNum = 5
                case (Int(touchView.convert(touchView.frame.origin, from:btn6Image).x)+Int(btn6Image.frame.size.width)/2,Int(touchView.convert(touchView.frame.origin, from:btn6Image).y)+Int(btn6Image.frame.size.height)/2):
                    btnNum = 6
                default :
                    print((Int(touchView.convert(touchView.frame.origin, from:btn6Image).x)+Int(btn1Image.frame.size.width)/2,Int(touchView.convert(touchView.frame.origin, from:btn6Image).y)+Int(btn1Image.frame.size.height)/2))
                    print(btnPositionX, btnPositionY)
                    print("spoiled")
                }
                
                
                if Int(position.x) > btnPositionX - 20 && Int(position.x) < btnPositionX + 20
                    && Int(position.y) > btnPositionY - 20 && Int(position.y) < btnPositionY + 20 &&
                    btnIsChangedArray[btnNum-1] == false {
                    
                    
                    feelBtnImage(btnImage: btnImage)
//                    btnIsChangedArray[btnNum-1] = true
//                    trueCount += 1
                    
                    
                } else if Int(position.x) > btnPositionX - 20 && Int(position.x) < btnPositionX + 20
                    && Int(position.y) > btnPositionY - 20 && Int(position.y) < btnPositionY + 20 &&
                            btnIsChangedArray[btnNum-1] == true {
                    feelBtnImage(btnImage: btnImage)
                }
                
                
                // 버튼 클릭했을 때 해당 버튼 이미지 바꾸고 false -> true 로 전환
                
                
                
                
                func feelBtnImage(btnImage: UIImageView) {
                    
                    
                    if btnImage.image == UIImage(named: "touchpoint2") {
                        playSound(soundName: "drop1")
                        Vibration.allCases[5].vibrate()
                        btnImage.image = UIImage(named: "touchpoint")  //버튼 이미지 체인지
                        btnIsChangedArray[btnNum-1] = true
                        trueCount += 1
                        
                        
                    } else if btnImage.image == UIImage(named: "touchpoint"){
                        playSound(soundName: "drop1")
                        Vibration.allCases[5].vibrate()
                        
                    }
                    else {
                        playSound(soundName: "drop2")
                    }
                    print(btnIsChangedArray)
                    
                    print(trueCount)
                }
                
                
                print("touch X: \(Int(position.x)) Y: \(Int(position.y))")
                
            }
            
            
            
            
            
            ifTouchedChangeBtn(btnImage: btn1Image)
            ifTouchedChangeBtn(btnImage: btn2Image)
            ifTouchedChangeBtn(btnImage: btn3Image)
            ifTouchedChangeBtn(btnImage: btn4Image)
            ifTouchedChangeBtn(btnImage: btn5Image)
            ifTouchedChangeBtn(btnImage: btn6Image)
            
            
        }
    }
    
    
    
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        //player.numberOfLoops = 1
        player.play()
    }
    
     
     func r(){
         
         nextBtn.isHidden = true
         dotRain.isHidden = true
         btn1Image.image = UIImage(named: "touchpoint2")
         btn2Image.image = UIImage(named: "touchpoint2")
         btn3Image.image = UIImage(named: "touchpoint2")
         btn4Image.image = UIImage(named: "touchpoint3")
         btn5Image.image = UIImage(named: "touchpoint2")
         btn6Image.image = UIImage(named: "touchpoint3")
         count = 4
         letter = "r"
         
     }
     
     func a(){
         btn1Image.image = UIImage(named: "touchpoint2")
         btn2Image.image = UIImage(named: "touchpoint3")
         btn3Image.image = UIImage(named: "touchpoint3")
         btn4Image.image = UIImage(named: "touchpoint3")
         btn5Image.image = UIImage(named: "touchpoint3")
         btn6Image.image = UIImage(named: "touchpoint3")
         count = 1
         letter = "a"
     }
     
     func i(){
         btn1Image.image = UIImage(named: "touchpoint3")
         btn2Image.image = UIImage(named: "touchpoint2")
         btn3Image.image = UIImage(named: "touchpoint3")
         btn4Image.image = UIImage(named: "touchpoint2")
         btn5Image.image = UIImage(named: "touchpoint3")
         btn6Image.image = UIImage(named: "touchpoint3")
         count = 2
         letter = "i"
     }
     
     
     func n(){
         btn1Image.image = UIImage(named: "touchpoint2")
         btn2Image.image = UIImage(named: "touchpoint3")
         btn3Image.image = UIImage(named: "touchpoint2")
         btn4Image.image = UIImage(named: "touchpoint2")
         btn5Image.image = UIImage(named: "touchpoint2")
         btn6Image.image = UIImage(named: "touchpoint3")
         count = 4
         letter = "n"
     }
     

     func rain(){
         btn1Image.isHidden = true
         btn2Image.isHidden = true
         btn3Image.isHidden = true
         btn4Image.isHidden = true
         btn5Image.isHidden = true
         btn6Image.isHidden = true
         letter = "rain"
         
 //        navigationController?.pushViewController(RainViewController(), animated: true)
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
             
             self.dotRain.isHidden = false

             
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
                 self.nextBtn.isHidden = false
                 self.nextBtn.alpha = 1.0 // animate the alpha to 1.0 (fully opaque)
             }, completion: nil)
             
             
             
             
                 })
     }
    
    
    func initializeView() {
        letterLabel.text = ""
            r()
        }
    
    
    
    
    
    
    var body: some View {
        
        
        
        ZStack{
            NavigationLink(destination: MainView(), tag: 1, selection: self.$tag ) {
                EmptyView()
            }
            
            ZStack {
                
//                SpriteView(scene: scene)
//                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
//                    .ignoresSafeArea()
                
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




struct RainView_Previews: PreviewProvider {
    static var previews: some View {
        
        RainView()
    }
}
