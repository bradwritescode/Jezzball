import SpriteKit

let canvasWidth: UInt32 = 640
let canvasHeight: UInt32 = 1136

func newBall(x: CGFloat, y: CGFloat) -> SKSpriteNode {
    let ballSprite = SKSpriteNode(imageNamed: "ball.png")

    ballSprite.yScale = 0.25
    ballSprite.xScale = 0.25
    ballSprite.position = CGPointMake(x, y)
    ballSprite.physicsBody = SKPhysicsBody(circleOfRadius: ballSprite.frame.size.width/2)
    ballSprite.physicsBody.friction = 0.3
    ballSprite.physicsBody.restitution = 0.8
    ballSprite.physicsBody.mass = 0.0
    ballSprite.physicsBody.allowsRotation = true

    return ballSprite
}

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        self.physicsWorld.gravity = CGVectorMake(-3, 0)
        let physicsBody = SKPhysicsBody (edgeLoopFromRect: self.frame)
        self.physicsBody = physicsBody

        for i in 1..<20 {
            let ball = newBall(CGFloat(arc4random()%(canvasWidth)), CGFloat(arc4random()%(canvasHeight)))
            self.addChild(ball)
        }
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
