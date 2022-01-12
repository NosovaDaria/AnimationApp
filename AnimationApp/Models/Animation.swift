//
//  Animation.swift
//  AnimationApp
//
//  Created by Дарья Носова on 12.01.2022.
//

import Foundation

struct Animation {
  let preset: String
  let curve: String
  let force: Double
  let duration: Double
  let delay: Double
}


extension Animation {
}
extension Animation {
  static func getAnimation() -> [Animation] {
    var animations: [Animation] = []
    
    let presets = [
                  "slideUp",
                  "squeezeRight",
                  "fadeIn",
                  "fadeInLeft",
                  "zoomIn",
                  "shake",
                  "pop",
                  "morph",
                  "wobble"
                  ]
    
    let curves = [
                  "linear",
                  "spring",
                  "easeInSine",
                  "easeInOutQuad",
                  "easeInQuart",
                  "easeOutQuint",
                  "easeOutExpo",
                  "easeInCirc",
                  "easeInOutBack"
                  ]
    
    let iterationCount = min(
      presets.count,
      curves.count
    )
    
    for index in 0..<iterationCount {
      let animation = Animation(
        preset: presets[index],
        curve: curves[index],
        force: round(Double.random(in: 0.2..<3) * 10) / 10,
        duration: round(Double.random(in: 0.2..<3) * 10) / 10,
        delay: round(Double.random(in: 0.2..<1) * 10) / 10
      )
      animations.append(animation)
    }
    return animations
  }
}
