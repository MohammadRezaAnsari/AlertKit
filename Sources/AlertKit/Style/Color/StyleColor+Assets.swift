//
//  StyleColor+Assets.swift
//
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

import UIKit

public protocol ValuableColor {
    var namePrefix: String { get }
    var value: UIColor { get }
}

extension ValuableColor {
    public var value: UIColor {
        StyleColor.Assets.color(prefix: namePrefix, variation: String(describing: self))
    }
}

extension StyleColor {
    
    public enum Assets {
        
        static func color(prefix: String, variation: String) -> UIColor {
            UIColor(named: prefix+"-"+variation.capitalized, in: .module, compatibleWith: nil)!
        }
        
        public enum Primary: CaseIterable, ValuableColor {
            case blue
            case red
            case green
            
            public var namePrefix: String { "Primary" }
        }
        
        public enum Green: CaseIterable, ValuableColor {
            case b
            case c
            case d
            case e
            case f
            case dark
            
            public var namePrefix: String { "G" }
        }
        
        public enum Blue: CaseIterable, ValuableColor {
            case b
            case c
            case d
            case e
            case f
            case g
            case dark
            
            public var namePrefix: String { "B" }
        }
        
        public enum Red: CaseIterable, ValuableColor {
            case b
            case c
            case d
            case e
            case f
            case dark
            
            public var namePrefix: String { "R" }
        }
        
        public enum Pastel: CaseIterable, ValuableColor {
            case yellow
            case pink
            case blue
            case purple
            case green
            
            public var namePrefix: String { "P" }
        }
        
        public enum Gray: Int, CaseIterable, ValuableColor {
            case a
            case b
            case c
            case d
            case e
            case f
            case white
            
            public var namePrefix: String { "Gray" }
        }
        
        public enum Other: CaseIterable, ValuableColor {
            case green
            case yellow
            case blue
            
            public var namePrefix: String { "O" }
        }
    }
}

