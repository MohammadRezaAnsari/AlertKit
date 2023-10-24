//
//  AlertViewConfigurable.swift
//
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

import UIKit
import ExtensionKit
import SwiftMessages

public protocol AlertViewConfigurable: UIView {
    var configuration: SwiftMessages.Config { get set }
    func baseView(from view: AlertViewConfigurable) -> BaseView
}

public extension AlertViewConfigurable {
    func baseView(from view: AlertViewConfigurable) -> BaseView {
        BaseView(frame: .zero) .. {
            $0.layoutMargins = .zero
            $0.installBackgroundView($0.defaultBackgroundView)
            $0.installContentView(view)
            $0.layoutMarginAdditions = UIEdgeInsets(top: 45, left: 16, bottom: 10, right: 16)
            $0.configureDropShadow()
        }
    }
}
