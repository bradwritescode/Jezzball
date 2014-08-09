import SpriteKit

let canvasWidth: UInt32 = 640
let canvasHeight: UInt32 = 1136
let ballCategory: UInt32 = 1
let wallCategory: UInt32 = 2

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        let physicsBody = SKPhysicsBody (edgeLoopFromRect: self.frame)
        physicsBody.categoryBitMask = wallCategory
        physicsBody.restitution = 1.0
        physicsBody.friction = 0.0
        physicsBody.mass = 100.0
        self.physicsBody = physicsBody

        for i in 1...20 {
            var ball = BallNode()

            self.addChild(ball)

            var xSpeed: CGFloat = 250
            var ySpeed: CGFloat = 250

            xSpeed = (Int(arc4random()%2) == 1) ? xSpeed : -xSpeed
            ySpeed = (Int(arc4random()%2) == 1) ? ySpeed : -ySpeed

            ball.physicsBody.applyImpulse(CGVectorMake(xSpeed, ySpeed))
        }
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
