//
//  TouchScene.swift
//  DottyBear
//
//  Created by Niko Yejin Kim on 2023/04/20.
//

import UIKit
import SpriteKit

class touchScene: SKScene {
    var player = SKSpriteNode()
    var touchPoint: CGPoint = CGPoint()
    var touching: Bool = false
    var background = SKSpriteNode(imageNamed: "grass.png")
    
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: 0, y: 0)
            background.size.width = self.size.width
            background.size.height = self.size.height
            background.anchorPoint = CGPoint(x: 0.5,y: 0.5)
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


