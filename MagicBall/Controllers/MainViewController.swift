//
//  MainViewController.swift
//  MagicBall
//
//  Created by Eugene St on 27.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var predictionLabel: UILabel!
  @IBOutlet weak var circleLabel: UIImageView!
  @IBOutlet weak var tapButtonLabel: UIButton!
  
  
  // MARK: - Public properties
  var networkManager = NetworkMagicBallManager()
  
  // MARK: - Private properties
  //  private var audioPlayer = AVAudioPlayer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.becomeFirstResponder()
    networkManager.onCompletion = { [weak self] magicball in
      guard let self = self else { return }
      self.updateInterfaceWith(ball: magicball)
    }
    addShadow(for: tapButtonLabel)
  }
  
  // MARK: - IBActions
  @IBAction func tabButtonPressed() {
    self.networkManager.fetchAnswer()
    UIDevice.vibrate()
  }
  
  // MARK: - Private methods
  private func updateInterfaceWith(ball: MagicBall) {
    DispatchQueue.main.async {
      self.predictionLabel.text = ball.answer
      self.circleLabel.image = UIImage(named: ball.imageColor)
    }
  }
  
  private func addShadow(for button: UIButton) {
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOffset = CGSize(width: 5, height: 5)
    button.layer.shadowRadius = 5
    button.layer.shadowOpacity = 0.3
  }
  
  // We are willing to become first responder to get shake motion
  internal override var canBecomeFirstResponder: Bool {
    get {
      return true
    }
  }
  
  // Enable detection of shake motion
  internal override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      self.networkManager.fetchAnswer()
      UIDevice.vibrate()
    }
  }
}

// MARK: - Vibration
extension UIDevice {
  static func vibrate() {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
  }
}

