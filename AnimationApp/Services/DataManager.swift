//
//  DataManager.swift
//  AnimationApp
//
//  Created by Дарья Носова on 14.01.2022.
//

import Spring

class DataManager {
  static let shared = DataManager()
  
  let presets: [Spring.AnimationPreset] = [
      .fadeIn,
      .fadeInDown,
      .fadeInLeft,
      .fadeInDown,
      .fadeInRight,
      .fadeInUp,
      .fadeOut,
      .fall,
      .flash,
      .flipX,
      .flipY,
      .morph,
      .pop,
      .shake,
      .slideDown,
      .squeezeUp,
      .swing,
      .wobble,
      .zoomOut
    
  ]
  
  let curves = Spring.AnimationCurve.allCases
  
  private init() {}
}
