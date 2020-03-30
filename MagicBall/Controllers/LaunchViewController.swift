//
//  LaunchViewController.swift
//  MagicBall
//
//  Created by Eugene St on 27.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var startButtonLabel: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startButtonLabel.layer.shadowColor = UIColor.black.cgColor
    startButtonLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
    startButtonLabel.layer.shadowRadius = 5
    startButtonLabel.layer.shadowOpacity = 0.3
  }
}
