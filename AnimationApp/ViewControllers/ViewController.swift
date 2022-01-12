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
  @IBOutlet var presetLabel: SpringLabel!
  @IBOutlet var curveLabel: SpringLabel!
  @IBOutlet var forceLabel: SpringLabel!
  @IBOutlet var durationLabel: SpringLabel!
  @IBOutlet var delayLabel: SpringLabel!
  @IBOutlet var runButton: SpringButton!
  
  // MARK: - Private Properties
  let animations = Animation.getAnimation()
  var labels: [SpringLabel] = []
  private var animationIndex = 0
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    labels = [presetLabel, curveLabel, forceLabel, durationLabel, delayLabel]
  }
  
  // MARK: - IB Actions
  @IBAction func runSpringAnimation(_ sender: SpringButton) {
    
    customizeViewAnimation(animationIndex)
    
    setLabelsAnimation(labels)
    
    sender.animation = "pop"
    sender.force = 0.1
    sender.animate()

    
    animationIndex = animationIndex >= animations.count - 1 ? 0 : animationIndex + 1
    
    customizeButton()
  }
}

// MARK: - Private Methods
extension ViewController {
  
  private func customizeViewAnimation(_ index: Int) {
    presetLabel.text = "preset: " + animations[animationIndex].preset
    curveLabel.text = "curve: " + animations[animationIndex].curve
    forceLabel.text = "force: \(animations[animationIndex].force)"
    durationLabel.text = "duration: \(animations[animationIndex].force)"
    delayLabel.text = "delay: \(animations[animationIndex].delay)"
    
    springAnimationView.animation = animations[animationIndex].preset
    springAnimationView.curve = animations[animationIndex].curve
    springAnimationView.force = animations[animationIndex].force
    springAnimationView.duration = animations[animationIndex].duration
    springAnimationView.delay = animations[animationIndex].delay

    springAnimationView.animate()
    
    }
  
  private func customizeButton() {
    if animationIndex < animations.count {
      runButton.setTitle("Run \(animations[animationIndex].preset)", for: .normal)
    } else {
      runButton.setTitle("Run \(animations[0].preset)", for: .normal)
    }
  }
  
  private func setLabelsAnimation(_ labels: [SpringLabel]) {
    labels.forEach { label in
      label.animation = "pop"
      label.delay = animations[animationIndex].delay + 1
      label.animate()
    }
  }
}
