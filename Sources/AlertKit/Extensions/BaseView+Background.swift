//
//  BaseView+Background.swift
//
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

import SwiftMessages
import ExtensionKit

extension BaseView {
    var defaultBackgroundView: CornerRoundingView {
        CornerRoundingView() .. {
            $0.cornerRadius = 8
            $0.layer.masksToBounds = true
        }
    }
}
