//
//  ViewController.swift
//  AnimationApp
//
//  Created by Дарья Носова on 11.01.2022.
//

import Spring

class ViewController: UIViewController {
  
  // MARK: - IB Outlets
  @IBOutlet var springAnimationView: SpringView!
  @IBOutlet var animationLabel: SpringLabel!
  @IBOutlet var runButton: SpringButton!
  
  // MARK: - Private Properties
  private var animation = Animation.getAnimation()
  private var animationIndex = 0
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    animationLabel.text =
      """
      preset:
      curve:
      force:
      duration:
      delay:
      """
  }
  
  // MARK: - IB Actions
  @IBAction func runSpringAnimation(_ sender: SpringButton) {
    animationLabel.text = animation.description
    
    springAnimationView.animation = animation.preset
    springAnimationView.curve = animation.curve
    springAnimationView.force = animation.force
    springAnimationView.duration = animation.duration
    springAnimationView.delay = animation.delay
    springAnimationView.animate()
    
    sender.animation = "pop"
    sender.force = 0.1
    sender.animate()

    animation = Animation.getAnimation()
    sender.setTitle("Run \(animation.preset)", for: .normal)
  }
}
