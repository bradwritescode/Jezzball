import SpriteKit

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

    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */

        if touches.count == 2 {
            let locations = [touches.allObjects[0].locationInNode(self),
                             touches.allObjects[1].locationInNode(self)]

            var xDifference = locations[0].x - locations[1].x
            var yDifference = locations[0].y - locations[1].y

            if yDifference > xDifference {
                println("vertical unpinch")
            } else if yDifference < xDifference {
                println("horizontal unpinch")
            } else {
                assert(true, "danger! danger!")
            }
        }
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
