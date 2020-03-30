//
//  LaunchViewController.swift
//  MagicBall
//
//  Created by Eugene St on 27.03.2020.
//  Copyright © 2020 Eugene St. All rights reserved.
//

import UIKit
import AVFoundation

class LaunchViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var startButtonLabel: UIButton!
  
  // MARK: - Private properties
  private var audioPlayer = AVAudioPlayer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addShadow(for: startButtonLabel)
    
    playBackgroundMusic()
  }
  
  // MARK: - Private methods
  private func playBackgroundMusic() {
    let assortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Elven_Forest", ofType: "mp3")!)
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: assortedMusics as URL)
    } catch {
      print(error)
    }
    audioPlayer.prepareToPlay()
    audioPlayer.numberOfLoops = -1
    audioPlayer.play()
  }
  
  private func addShadow(for button: UIButton) {
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOffset = CGSize(width: 5, height: 5)
    button.layer.shadowRadius = 5
    button.layer.shadowOpacity = 0.3
  }
}
