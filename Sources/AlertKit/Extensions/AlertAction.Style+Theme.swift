//
//  AlertAction.Style+Theme.swift
//
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

import UIKit

extension AlertAction.Style {
    
    var theme: AlertActionTheme {
        switch self {
            case .cancel: return cancelTheme
            case .destructive: return destructiveTheme
            case .`default`: return defaultTheme
        }
    }
    
    private var cancelTheme: AlertActionTheme {
        let theme = StyleTheme.shared.current
        return AlertActionTheme(
            backgroundColor: .clear,
            title: .init(
                color: theme.color.text.button.colorA,
                font: UIFont.systemFont(ofSize: 18))
        )
    }
    
    private var destructiveTheme: AlertActionTheme {
        let theme = StyleTheme.shared.current
        return AlertActionTheme(
            backgroundColor: theme.color.input.error,
            title: .init(
                color: theme.color.state.error,
                font: UIFont.systemFont(ofSize: 18))
        )
    }
    
    private var defaultTheme: AlertActionTheme {
        let theme = StyleTheme.shared.current
        return AlertActionTheme(
            backgroundColor: theme.color.button.normalB,
            title: .init(
                color: theme.color.text.button.colorD,
                font: UIFont.systemFont(ofSize: 18))
        )
    }
}
