//
//  Alert.Style+Theme.swift
//
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

import UIKit

extension Alert.Style {
    
    var theme: AlertTheme {
        switch self {
        case .alert: return AlertViewTheme
        case .banner(.error): return BannerErrorTheme
        case .banner(.info): return BannerInfoTheme
        case .banner(.success): return BannerSuccessTheme
        case .fullScreen: return AlertViewTheme
        }
    }
        
    
    private var AlertViewTheme: AlertTheme {
        let theme = StyleTheme.shared.current
        return AlertTheme(
            backgroundColor: .white,
            title: .init(
                color: theme.color.text.body.colorA,
                font: UIFont.systemFont(ofSize: 18)),
            message: .init(
                color: theme.color.text.caption.colorB,
                font: UIFont.systemFont(ofSize: 12))
        )
    }
    
    private var BannerErrorTheme: AlertTheme {
        let theme = StyleTheme.shared.current
        return AlertTheme(
            backgroundColor: theme.color.state.error,
            title: .init(
                color: theme.color.text.subtitle.colorD,
                font: UIFont.systemFont(ofSize: 18)),
            message: .init(
                color: theme.color.text.subtitle.colorD,
                font: UIFont.systemFont(ofSize: 12)),
            image: .init(
                backgroundColor: theme.color.button.overlayA,
                contentMode: .scaleAspectFit)
        )
    }
    
    private var BannerInfoTheme: AlertTheme {
        let theme = StyleTheme.shared.current
        return AlertTheme(
            backgroundColor: theme.color.surface.cardA,
            title: .init(
                color: theme.color.text.subtitle.colorA,
                font: UIFont.systemFont(ofSize: 18)),
            message: .init(
                color: theme.color.text.caption.colorA,
                font: UIFont.systemFont(ofSize: 12)),
            image: .init(
                backgroundColor: theme.color.button.overlayA,
                contentMode: .scaleAspectFit)
        )
    }
    
    private var BannerSuccessTheme: AlertTheme {
        let theme = StyleTheme.shared.current
        return AlertTheme(
            backgroundColor: theme.color.state.success,
            title: .init(
                color: theme.color.text.subtitle.colorD,
                font: UIFont.systemFont(ofSize: 18)),
            message: .init(
                color: theme.color.text.subtitle.colorD,
                font: UIFont.systemFont(ofSize: 12)),
            image: .init(
                backgroundColor: theme.color.button.overlayA,
                contentMode: .scaleAspectFit)
        )
    }
}

