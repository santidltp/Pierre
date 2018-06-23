//
//  GameSprite.swift
//  Penguin
//
//  Created by Santiago De La Torre on 6/23/18.
//  Copyright © 2018 Santiago De La Torre. All rights reserved.
//

import SpriteKit

protocol GameSprite {
    var textureAtlas:SKTextureAtlas { get set }
    func spawn (parentNode: SKNode, position: CGPoint, size: CGSize)
    func onTap()
}
