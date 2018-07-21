//
//  FontsInformarion.swift
//  FontsApp
//
//  Created by Екатерина on 21.07.2018.
//  Copyright © 2018 Екатерина. All rights reserved.
//
import UIKit
import Foundation

func createArrayOfFonts(size:CGFloat) -> [UIFont]{
    var arrayOfFonts = [UIFont]()
    var count = 0
    let fontsFamilyNames = UIFont.familyNames
    print(fontsFamilyNames.count)
    for name in fontsFamilyNames{
        let fontNamesForFamily = UIFont.fontNames(forFamilyName: name)
        count += fontNamesForFamily.count
        for font in fontNamesForFamily{
            arrayOfFonts.append(UIFont(name: font, size: size)!)
        }
    }
    
    return arrayOfFonts
}
