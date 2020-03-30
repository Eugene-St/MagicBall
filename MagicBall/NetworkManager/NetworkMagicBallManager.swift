//
//  MagicBallNetworkManager.swift
//  MagicBall
//
//  Created by Eugene St on 27.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import  UIKit

class NetworkMagicBallManager {
  
  var onCompletion: ((MagicBall) -> Void)?
  
  func fetchAnswer() {
    let urlString = "https://8ball.delegator.com/magic/JSON/test"
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
        guard let magicBall = self.parseJSON(withData: data) else { return }
        self.onCompletion?(magicBall)
      }
    }.resume()
  }
  
  private func parseJSON(withData data: Data) -> MagicBall? {
    let decoder = JSONDecoder()
    
    do {
      let magicBallData = try decoder.decode(MagicBallData.self, from: data)
      guard let magicBall = MagicBall(magicBallData: magicBallData) else {
        return nil
      }
      return magicBall
    } catch let error as NSError {
      print(error.localizedDescription)
    }
    return nil
  }
}
