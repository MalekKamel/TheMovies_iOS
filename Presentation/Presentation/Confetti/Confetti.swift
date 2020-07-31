//
// Created by Shaban Kamel on 05/03/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import UIKit

enum Colors {
    static let red = UIColor(red: 1.0, green: 0.0, blue: 77.0/255.0, alpha: 1.0)
    static let blue = UIColor.blue
    static let green = UIColor(red: 35.0/255.0 , green: 233/255, blue: 173/255.0, alpha: 1.0)
    static let yellow = UIColor(red: 1, green: 209/255, blue: 77.0/255.0, alpha: 1.0)
}

enum Images {
    static let box = Asset.Assets.box.image
    static let triangle = Asset.Assets.triangle.image
    static let circle = Asset.Assets.circle.image
    static let swirl = Asset.Assets.spiral.image
}

public class Confetti {
    var emitter = CAEmitterLayer()

    var colors:[UIColor] = [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.yellow
    ]

    var images:[UIImage] = [
        Images.circle,
        Images.box,
        Images.circle,
        Images.box
    ]

    var velocities:[Int] = [
        100,
        90,
        150,
        200
    ]

    public init() {}

   public func start(view: UIView) {
        emitter.emitterPosition = CGPoint(x: view.frame.size.width / 2, y: -10)
        emitter.emitterShape = .line
        emitter.emitterSize = CGSize(width: view.frame.size.width, height: 2.0)
        emitter.emitterCells = generateEmitterCells()
        view.layer.addSublayer(emitter)
    }

    private func generateEmitterCells() -> [CAEmitterCell] {
        var cells:[CAEmitterCell] = [CAEmitterCell]()
        for index in 0..<6 {

            let cell = CAEmitterCell()

            cell.birthRate = 4.0
            cell.lifetime = 14.0
            cell.lifetimeRange = 0
            cell.velocity = CGFloat(getRandomVelocity())
            cell.velocityRange = 0
            cell.emissionLongitude = CGFloat(Double.pi)
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 0
            cell.color = getNextColor(i: index)
            cell.contents = getNextImage(i: index)
            cell.scaleRange = 0.25
            cell.scale = 0.1

            cells.append(cell)

        }
        return cells
    }

    private func getRandomVelocity() -> Int { velocities[getRandomNumber(4)] }

    private func getRandomNumber(_ bound: UInt32) -> Int { Int(arc4random_uniform(bound)) }

    private func getNextColor(i: Int) -> CGColor { colors[getRandomNumber(4)].cgColor }

    private func getNextImage(i:Int) -> CGImage { images[getRandomNumber(4)].cgImage! }

}
