//
//  AlertTheme.swift
//  
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

import UIKit

struct AlertTheme {
    
    var backgroundColor: UIColor
    var title: Title
    var message: Message
    var image: Image = Image()
    
    struct Title {
        var color: UIColor
        var font: UIFont
        var lineNumber: Int = 0
    }
    
    struct Message {
        var color: UIColor
        var font: UIFont
        var lineNumber: Int = 0
    }
    
    struct Image {
        var backgroundColor: UIColor = .clear
        var contentMode: UIImageView.ContentMode = .center
    }
}
