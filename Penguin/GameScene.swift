//
//  GameScene.swift
//  Penguin
//
//  Created by Santiago De La Torre on 6/16/18.
//  Copyright © 2018 Santiago De La Torre. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        // set the scene's background to a nice sky blue
        // Note: UIColor uses a scale from o to 1 for its colors
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue:0.95, alpha: 1.0)
        
        // create our bee sprite node
        let bee = SKSpriteNode()
        // size our bee node
        bee.size = CGSize(width: 28, height: 24)
        // position our bee node
        bee.position = CGPoint(x: 250, y: 250)
        // attach our bee to the scene's node tree
        self.addChild(bee)
        
        // Find our new bee texture atlas
        
        let beeFrames: [SKTexture] = [
            SKTexture(imageNamed: "bee.png"),
            SKTexture(imageNamed: "bee_fly.png")]
        let flyAction = SKAction.animate(with: beeFrames, timePerFrame: 0.14)
        let forever = SKAction.repeatForever(flyAction)
        bee.run(forever)
        let pathLeft = SKAction.moveBy(x: -200, y: -10, duration: 2)
        let pathRight = SKAction.moveBy(x: 200, y: 10, duration: 2)
        
        let flipTextureNegtive = SKAction.scaleX(to: -1, duration: 0)
        let flipTexturePositive = SKAction.scaleX(to: 1, duration: 0)
        let flightBothofTheBees = SKAction.sequence([pathLeft,flipTextureNegtive,pathRight, flipTexturePositive])
        let neverEnding = SKAction.repeatForever(flightBothofTheBees)
        bee.run(neverEnding)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
