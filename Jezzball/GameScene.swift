import SpriteKit

let canvasWidth: UInt32 = 640
let canvasHeight: UInt32 = 1136
var balls = [AnyObject]()

class BallNode: NSObject {
    var yDirection: CGFloat? = 1.0;
    var xDirection: CGFloat? = 1.0;
    var ySpeed: CGFloat? = 5.0;
    var xSpeed: CGFloat? = 5.0;
    var ballSprite: SKSpriteNode;

    init(x: CGFloat, y: CGFloat) {
        self.ballSprite = SKSpriteNode(imageNamed: "ball.png")
        self.ballSprite.yScale = 0.25
        self.ballSprite.xScale = 0.25
        self.ballSprite.position = CGPointMake(x, y)
        self.ballSprite.physicsBody = SKPhysicsBody(circleOfRadius: ballSprite.frame.size.width/2)
        self.ballSprite.physicsBody.friction = 0.3
        self.ballSprite.physicsBody.restitution = 0.8
        self.ballSprite.physicsBody.mass = 0.0
        self.ballSprite.physicsBody.allowsRotation = true
    }

    func move() {
        if yDirection == 1 {
            ballSprite.position = CGPoint(x: ballSprite.position.x, y: ballSprite.position.y+ySpeed!)
        } else if yDirection == -1 {
            ballSprite.position = CGPoint(x: ballSprite.position.x, y: ballSprite.position.y-ySpeed!)
        }

        if xDirection == 1 {
            ballSprite.position = CGPoint(x: ballSprite.position.x+xSpeed!, y: ballSprite.position.y)
        } else if xDirection == -1 {
            ballSprite.position = CGPoint(x: ballSprite.position.x-xSpeed!, y: ballSprite.position.y)
        }
    }

    func checkForCollision() {
        if ballSprite.position.y <= 0 && yDirection == 1 {
            yDirection = -1
        } else if ballSprite.position.y >= 640.0 && yDirection == -1 {
            yDirection = 1
        }

        if ballSprite.position.x <= 0 && xDirection == 1 {
            xDirection = -1
        } else if ballSprite.position.x  >= 1136 && yDirection == -1 {
            xDirection = 1
        }
    }
}

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        let physicsBody = SKPhysicsBody (edgeLoopFromRect: self.frame)
        self.physicsBody = physicsBody

        for i in 1..<20 {
            let ball = BallNode(x: CGFloat(arc4random()%(canvasWidth)),
                                y: CGFloat(arc4random()%(canvasHeight)))
            balls.append(ball)

            self.addChild(ball.ballSprite)
        }
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */

        for ball in balls {
            ball.checkForCollision()
            ball.move()
        }
    }
}
