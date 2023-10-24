//
//  AlertAction.swift
//
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

public struct AlertAction {
    
    let title: String?
    let style: Style
    let handler: (() -> Void)?
    
    public init(
        title: String? = nil,
        style: AlertAction.Style = .default,
        handler: (() -> Void)? = nil
    ) {
        self.title = title
        self.style = style
        self.handler = handler
    }
}


// MARK: - Style
extension AlertAction {
    
    public enum Style {
        case `default`
        case cancel
        case destructive
    }
}

