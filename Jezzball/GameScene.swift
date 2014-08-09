import SpriteKit

let canvasWidth: UInt32 = 640
let canvasHeight: UInt32 = 1136
var ballCategory: UInt32 = 1
var wallCategory: UInt32 = 2

class BallNode: SKSpriteNode {
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    convenience override init() {
        self.init(imageNamed:"ball.png")

        let xPos = CGFloat(arc4random()%(canvasHeight))
        let yPos = CGFloat(arc4random()%(canvasWidth))

        self.position = CGPointMake(xPos, yPos)
        self.yScale = 0.25
        self.xScale = 0.25
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.size.width/2)
        self.physicsBody.friction = 0.0
        self.physicsBody.restitution = 1.0
        self.physicsBody.mass = 1.0
        self.physicsBody.linearDamping = 0.0
        self.physicsBody.allowsRotation = false
        self.physicsBody.affectedByGravity = false
        self.physicsBody.categoryBitMask = ballCategory;
        self.physicsBody.collisionBitMask = wallCategory;
    }

    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
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
