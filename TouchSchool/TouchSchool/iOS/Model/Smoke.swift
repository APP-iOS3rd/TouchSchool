//
//  Sparkle.swift
//  TouchSchool
//
//  Created by 최동호 on 11/16/23.
//

import Foundation

struct Smoke: Identifiable {
    let id = UUID()
    var location: CGPoint
    var showEffect: Bool
    var angle: Double
    var opacity: Double
}
