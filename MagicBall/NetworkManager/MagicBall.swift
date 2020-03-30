//
//  MagicBall.swift
//  MagicBall
//
//  Created by Eugene St on 27.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import UIKit

struct MagicBall {
  let answer: String
  
  let answerType: String
  var imageColor: String {
    switch answerType {
    case "Affirmative": return "green"
    case "Contrary": return "red"
    case "Neutral": return "yellow"
    default: return "purple"
    }
  }
  
  init?(magicBallData: MagicBallData) {
    answer = magicBallData.magic.answer
    answerType = magicBallData.magic.type
  }
}
