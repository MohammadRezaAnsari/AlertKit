//
//  Alert.swift
//  
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

import UIKit
import SwiftMessages
import ExtensionKit

public class Alert {
    
    private let title: String?
    private let message: String?
    private let image: String?
    private let description: String?
    private let style: Style
    private let isCancelable: Bool
    
    private var actions: [AlertAction] = []
    private var topAlertView: AlertInterface? = nil
    
    public init(title: String? = nil, message: String? = nil, description: String? = nil, image: String? = nil, preferredStyle: Alert.Style, isCancelable: Bool = true) {
        self.title = title
        self.message = message
        self.description = description
        self.image = image
        self.style = preferredStyle
        self.isCancelable = isCancelable
    }
    
    private func alertView(for preferredStyle: Alert.Style) -> AlertInterface {
        switch preferredStyle {
        case .banner:
            return BannerView(
                AlertModel(title: title, message: message, image: image, actions: actions),
                preferredStyle.theme,
                isCancelable: isCancelable
            )
            
        case .alert:
            return AlertView(
                AlertModel(title: title, message: message, image: image, actions: actions),
                preferredStyle.theme,
                isCancelable: isCancelable
            )
        case .fullScreen:
            return FullScreenViewController(
                AlertModel(title: title, message: message, description: description, image: image, actions: actions)
            )
        }
    }
}

// MARK: - Public Methods
extension Alert {
    
    public func show(for time: TimeInterval = .infinity) {
        if (title == nil || title == "") && (message == nil || message == "") {
            return
        }

        let alertView = alertView(for: style)
        topAlertView = alertView
        guard let view = alertView as? Presentable else {
            assertionFailure("This view is not `Presentable`!")
            return
        }
        view.present(style: style, for: time)
    }

    public func dismiss() {
        guard let view = topAlertView as? Dismissible else {
            assertionFailure("This alert view is not `Dismissible`!")
            return
        }
        view.dismiss()
    }
    
    public func addAction(_ action: AlertAction) {
        actions.append(action)
    }
}


// MARK: - Enums
extension Alert {
    
    public enum Style: Equatable {
        case banner(_ theme: Theme)
        case alert
        case fullScreen
    }
    
    public enum Theme {
        case error
        case success
        case info
    }
}

