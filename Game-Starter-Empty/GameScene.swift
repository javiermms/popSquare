//
//  GameScene.swift
//  Game-Starter-Empty
//
//  Created by mitchell hudson on 9/13/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
  
    var count = 0
    let score = SKLabelNode(fontNamed: "AmericanTypewriter")
  
    override func didMove(to view: SKView) {
        // Called when the scene has been displayed
        label()
        let action = SKAction.run {
           
            self.createSquare()
            
            
            
        }
        let wait = SKAction.wait(forDuration: 2)
        let seq = SKAction.sequence([action, wait])
        let repeating = SKAction.repeatForever(seq)
        self.run(repeating)
    }
    
  
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
    }
    
    func createSquare(){
        let size = CGSize(width: 60, height: 60)
        //let square = SKSpriteNode(texture: nil, color: .green, size: size)
        let box = Boxes(name: "square", color: .green, size: size)
        
        
        
        let randomCGFloat = CGFloat.random(in: 1...view!.bounds.width)
        box.position.x = randomCGFloat
        box.position.y = 0
        
        let moveUp = SKAction.moveBy(x: 0, y: (view?.bounds.height)!, duration: 2)
        let remove = SKAction.removeFromParent()
        let minusOne = SKAction.run {
            self.count -= 1
            self.score.text = "Score \(self.count)"
            
            if self.count <= 0 {
                self.gameOver()
            }
            
        
        }
        let seq = SKAction.sequence([moveUp, remove, minusOne])
        
       
        
        addChild(box)
        box.run(seq)
        //box.name = "square"
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touches = touches.first {
            let location = touches.location(in: self)
            let node = atPoint(location)
            if node.name == "square" {
                node.removeFromParent()
                count += 1
                score.text = "Score \(count)"
            }
            
        }
        
    }
    
    func label() {
        
        score.fontSize = 30
        score.fontColor = SKColor.red
        score.position = CGPoint(x: 70, y: 838)
        
        addChild(score)
        
    }
    
    func gameOver() {
        self.removeAllChildren()
        let gameOverLabel = SKLabelNode(fontNamed: "AmericanTypewriter")
        gameOverLabel.fontSize = 30
        gameOverLabel.text = "GAME OVER"
        gameOverLabel.fontColor = SKColor.red
        let screenSize = UIScreen.main.bounds
        gameOverLabel.position = CGPoint(x:screenSize.width/2 , y: screenSize.height/2)
        
        addChild(gameOverLabel)
    }
    

}
