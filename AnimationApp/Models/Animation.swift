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

  var description: String {
    """
    preset: \(preset)
    curve: \(curve)
    force: \(String(format: "%.02f", force))
    duration: \(String(format: "%.02f", duration))
    delay: \(String(format: "%.02f", delay))
    """
  }
  static func getAnimation() -> Animation {
    Animation(
      preset: DataManager.shared.presets.randomElement()?.rawValue ?? "wobble",
      curve: DataManager.shared.curves.randomElement()?.rawValue ?? "easeIn",
      force: Double.random(in: 0.2...3),
      duration: Double.random(in: 0.2...3),
      delay: Double.random(in: 0.2..<0.5)
    )
  }
}
