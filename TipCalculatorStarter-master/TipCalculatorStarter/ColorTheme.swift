//
//  ColorTheme.swift
//  TipCalculatorStarter
//
//  Created by Macbook on 1/27/20.
//
//

import UIKit

struct ColorTheme {
    // Instance vars for color theme

    let isDefaultStatusBar: Bool
    let viewControllerBackgroundColor: UIColor
    
    let primaryColor: UIColor
    let primaryTextColor: UIColor
    
    let secondaryColor: UIColor
    
    let accentColor: UIColor
    let outputTextColor: UIColor
    
    // class vars
    
    static let light = ColorTheme(isDefaultStatusBar: true, viewControllerBackgroundColor: .tcOffWhite, primaryColor: .tcWhite, primaryTextColor: .tcCharcoal, secondaryColor: .tcDarkBlue, accentColor: .tcHotPink, outputTextColor: .tcAlmostBlack)
        


    static let dark = ColorTheme(isDefaultStatusBar: false,
                                 viewControllerBackgroundColor: .tcAlmostBlack,
                                 primaryColor: .tcMediumBlack,
                                 primaryTextColor: .tcWhite,
                                 secondaryColor: .tcBlueBlack,
                                 accentColor: .tcSeafoamGreen,
                                 outputTextColor: .tcWhite)
    
}



