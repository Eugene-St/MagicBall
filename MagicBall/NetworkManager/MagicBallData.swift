//
//  MagicBallData.swift
//  MagicBall
//
//  Created by Eugene St on 27.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

struct MagicBallData: Codable {
  let magic: Magic
}

struct Magic: Codable {
  let answer: String
  let type: String
}
