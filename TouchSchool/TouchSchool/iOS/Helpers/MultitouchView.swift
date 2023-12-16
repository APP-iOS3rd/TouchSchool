//
//  MultitouchView.swift
//  TouchSchool
//
//  Created by 최동호 on 11/22/23.
//

import UIKit

class MultitouchView: UIView {
    var touchBegan: ((CGPoint) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        isMultipleTouchEnabled = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touches.forEach { touch in
            let location = touch.location(in: self)
            touchBegan?(location)
        }
    }
}
