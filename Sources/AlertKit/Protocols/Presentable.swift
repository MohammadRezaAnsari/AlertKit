//
//  Presentable.swift
//
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

import Foundation

public protocol Presentable {
    func present(style: Alert.Style, for time: TimeInterval)
}
