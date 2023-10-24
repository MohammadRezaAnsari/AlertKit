//
//  StyleColor.swift
//  
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

import UIKit

public struct StyleColor {
    
    public let state: State
    public let surface: Surface
    public let button: Button
    public let background: Background
    public let input: Input
    public let text: Text
    
    public struct State {
        public let success: UIColor
        public let error: UIColor
        public let warning: UIColor
        public let disabled: UIColor
    }
    
    public struct Surface {
        public let cardA: UIColor
        public let cardB: UIColor
        public let cardC: UIColor
        public let cardD: UIColor
    }
    
    public struct Button {
        public let normalA: UIColor
        public let normalB: UIColor
        public let normalC: UIColor
        public let normalD: UIColor
        public let normalE: UIColor
        public let normalF: UIColor
        public let overlayA: UIColor
        public let overlayB: UIColor
        public let overlayC: UIColor
    }
    
    public struct Background {
        public let a: UIColor
        public let b: UIColor
    }
        
    public struct Input {
        public let normal: UIColor
        public let activated: UIColor
        public let focused: UIColor
        public let fill: UIColor
        public let error: UIColor
        public let hover: UIColor
        public let success: UIColor
    }
}


extension StyleColor {
    public static let `default` = StyleColor(
        
        state: State(
            success: StyleColor.Assets.Other.green.value,
            error: StyleColor.Assets.Red.dark.value,
            warning: StyleColor.Assets.Other.yellow.value,
            disabled: StyleColor.Assets.Gray.e.value
        ),
        
        surface: Surface(
            cardA: UIColor.white,
            cardB: StyleColor.Assets.Primary.blue.value,
            cardC: StyleColor.Assets.Blue.f.value,
            cardD: StyleColor.Assets.Blue.e.value
        ),
        
        button: Button(
            normalA: StyleColor.Assets.Primary.green.value,
            normalB: StyleColor.Assets.Primary.blue.value,
            normalC: StyleColor.Assets.Gray.c.value,
            normalD: StyleColor.Assets.Blue.e.value,
            normalE: UIColor.white,
            normalF: StyleColor.Assets.Blue.b.value,
            overlayA: UIColor.white,
            overlayB: StyleColor.Assets.Primary.green.value,
            overlayC: StyleColor.Assets.Primary.blue.value
        ),
        
        background: Background(
            a: UIColor.white,
            b: StyleColor.Assets.Blue.f.value
        ),
        
        input: Input(
            normal: StyleColor.Assets.Gray.c.value,
            activated: StyleColor.Assets.Gray.b.value,
            focused: StyleColor.Assets.Primary.green.value,
            fill: StyleColor.Assets.Gray.c.value,
            error: StyleColor.Assets.Red.e.value,
            hover: StyleColor.Assets.Gray.a.value,
            success: StyleColor.Assets.Green.f.value
        ),

        text: Text(
            headline: Headline(
                colorA: StyleColor.Assets.Primary.blue.value,
                colorB: StyleColor.Assets.Primary.green.value,
                colorC: .white),
            
            subtitle: Subtitle(
                colorA: StyleColor.Assets.Primary.blue.value,
                colorB: StyleColor.Assets.Gray.a.value,
                colorC: StyleColor.Assets.Gray.b.value,
                colorD: .white,
                colorE: StyleColor.Assets.Blue.c.value,
                colorF: StyleColor.Assets.Primary.green.value
            ),
            
            button: ButtonText(
                colorA: StyleColor.Assets.Primary.blue.value,
                colorB: StyleColor.Assets.Primary.green.value,
                colorC: StyleColor.Assets.Green.b.value,
                colorD: .white),
            
            body: Body(
                colorA: StyleColor.Assets.Primary.blue.value,
                colorB: StyleColor.Assets.Gray.b.value,
                colorC: StyleColor.Assets.Gray.c.value,
                colorD: .white,
                colorE: StyleColor.Assets.Blue.c.value),
            
            caption: Caption(
                colorA: StyleColor.Assets.Gray.b.value,
                colorB: StyleColor.Assets.Gray.c.value,
                colorC: StyleColor.Assets.Blue.d.value,
                colorD: .white,
                colorE: StyleColor.Assets.Primary.blue.value,
                colorF: StyleColor.Assets.Blue.b.value),
            
            overLine: OverLine(
                colorA: StyleColor.Assets.Primary.blue.value,
                colorB: StyleColor.Assets.Gray.b.value,
                colorC: StyleColor.Assets.Gray.c.value,
                colorD: .white))
    )
}
