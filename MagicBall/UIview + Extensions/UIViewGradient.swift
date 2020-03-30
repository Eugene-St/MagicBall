//
//  UIViewGradient.swift
//  MagicBall
//
//  Created by Eugene St on 29.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import UIKit

extension UIView {
  func setGradientColor(colorOne: UIColor, colorTwo: UIColor) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
    gradientLayer.locations = [0, 1]
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 0, y: 1)
    layer.insertSublayer(gradientLayer, at: 0)
  }
}


