import SpriteKit

let canvasWidth: UInt32 = 640
let canvasHeight: UInt32 = 1136
var ballCategory: UInt32 = 1
var wallCategory: UInt32 = 2

class BallNode: NSObject {
    var ballSprite: SKSpriteNode;

    init(x: CGFloat, y: CGFloat) {
        self.ballSprite = SKSpriteNode(imageNamed: "ball.png")
        self.ballSprite.yScale = 0.25
        self.ballSprite.xScale = 0.25
        self.ballSprite.position = CGPointMake(x, y)
        self.ballSprite.physicsBody = SKPhysicsBody(circleOfRadius: self.ballSprite.frame.size.width/2)
        self.ballSprite.physicsBody.friction = 0.0
        self.ballSprite.physicsBody.restitution = 1.0
        self.ballSprite.physicsBody.mass = 1.0
        self.ballSprite.physicsBody.linearDamping = 0.0
        self.ballSprite.physicsBody.allowsRotation = false
        self.ballSprite.physicsBody.affectedByGravity = false
        self.ballSprite.physicsBody.categoryBitMask = ballCategory;
        self.ballSprite.physicsBody.collisionBitMask = wallCategory;
    }
}

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        let physicsBody = SKPhysicsBody (edgeLoopFromRect: self.frame)
        physicsBody.categoryBitMask = wallCategory
        physicsBody.restitution = 1.0
        physicsBody.friction = 0.0
        physicsBody.mass = 100.0
        self.physicsBody = physicsBody

        for i in 1..<20 {
            let ball = BallNode(x: CGFloat(arc4random()%(canvasWidth)),
                                y: CGFloat(arc4random()%(canvasHeight)))

            self.addChild(ball.ballSprite)

            var xSpeed: CGFloat = 250
            var ySpeed: CGFloat = 250

            xSpeed = (Int(arc4random()%2) == 1) ? xSpeed : -xSpeed
            ySpeed = (Int(arc4random()%2) == 1) ? ySpeed : -ySpeed

            ball.ballSprite.physicsBody.applyImpulse(CGVectorMake(xSpeed, ySpeed))
        }
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
