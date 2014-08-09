import SpriteKit

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
