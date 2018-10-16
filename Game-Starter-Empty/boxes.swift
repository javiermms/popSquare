//
//  boxes.swift
//  Game-Starter-Empty
//
//  Created by Javier Mendoza on 10/15/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class Boxes: SKSpriteNode {
    
    init(name: String, color: UIColor, size:CGSize) {
        super.init(texture: nil, color: color, size: size)
        self.name = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
