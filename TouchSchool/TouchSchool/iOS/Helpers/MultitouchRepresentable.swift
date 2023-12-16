//
//  MultitouchRepresentable.swift
//  TouchSchool
//
//  Created by 최동호 on 11/22/23.
//

import SwiftUI

struct MultitouchRepresentable: UIViewRepresentable {
    var touchBegan: ((CGPoint) -> Void)

    func makeUIView(context: Context) -> MultitouchView {
        let view = MultitouchView()
        view.touchBegan = touchBegan
        return view
    }

    func updateUIView(_ uiView: MultitouchView, context: Context) {
    }
}
