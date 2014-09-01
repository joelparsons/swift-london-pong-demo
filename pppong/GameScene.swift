//
//  GameScene.swift
//  pppong
//
//  Created by Joel Parsons on 01/09/2014.
//  Copyright (c) 2014 swift. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var paddle : SKShapeNode?
    var ball : SKShapeNode?

    override func didMoveToView(view: SKView) {

        self.physicsWorld.gravity = CGVectorMake(0, -0.4)
        self.physicsWorld.contactDelegate = self
        let leftEdgeRect = CGRect(x:0.0, y:0.0, width:2.0, height:CGRectGetHeight(view.bounds))
        let leftEdge :SKShapeNode = SKShapeNode(rect:leftEdgeRect)
        leftEdge.fillColor = UIColor.greenColor()
        self.addChild(leftEdge)

        let rightEdgeRect = CGRect(x: CGRectGetMaxX(view.bounds) - 2.0, y: 0.0, width: 2.0, height: CGRectGetHeight(view.bounds))
        let rightEdge = SKShapeNode(rect: rightEdgeRect)
        rightEdge.fillColor = UIColor.greenColor()
        self.addChild(rightEdge)

        let topEdgeRect = CGRect(x: 0, y: CGRectGetMaxY(view.bounds) - 2.0, width: CGRectGetWidth(view.bounds), height: 2.0)
        let topEdge = SKShapeNode(rect: topEdgeRect);
        topEdge.fillColor = UIColor.greenColor();
        self.addChild(topEdge)

        let paddleRect = CGRect(x:-25.0, y: -10.0, width: 50.0, height: 20.0)
        self.paddle = SKShapeNode(rect: paddleRect)
        self.paddle?.position = CGPoint(x: 50.0, y: 20.0)
        self.paddle?.fillColor = SKColor.redColor()
        let paddleBody = SKPhysicsBody(rectangleOfSize: paddleRect.size)
        paddleBody.affectedByGravity = false
        paddleBody.dynamic = false
        paddleBody.contactTestBitMask = 1
        self.paddle?.physicsBody = paddleBody
        self.addChild(self.paddle)

        let ballRect = CGRect(x: -5.0, y: -5.0, width: 10.0, height: 10.0);
        self.ball = SKShapeNode(rect: ballRect);
        self.ball?.fillColor = UIColor.blackColor()
        self.ball?.position = CGPoint(x: 100.0, y: 300)
        let ballBody = SKPhysicsBody(rectangleOfSize: ballRect.size)
        ballBody.contactTestBitMask = 1
        self.ball?.physicsBody = ballBody

        self.addChild(self.ball)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let touchPoint = touch.locationInView(self.view)
            self.paddle?.position.x = touchPoint.x
        }
    }

    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
        for touch: AnyObject in touches {
            let touchPoint = touch.locationInView(self.view)
            self.paddle?.position.x = touchPoint.x
        }
    }

    func didBeginContact(contact: SKPhysicsContact!) {
        self.ball?.physicsBody.applyImpulse(CGVectorMake(0, 0.8))
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
