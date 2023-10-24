//
//  Theme.swift
//
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

import Foundation

public struct StyleTheme {
    public static let shared = StyleTheme()
    public var current: Theme = .light
}

public struct Theme {
    public let color: StyleColor
//    public let typography: Typography
}

extension Theme {
    public static let light = Theme(color: StyleColor.default)
}
