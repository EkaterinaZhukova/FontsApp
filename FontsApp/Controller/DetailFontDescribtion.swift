//
//  DetailFontDescribtion.swift
//  FontsApp
//
//  Created by Екатерина on 21.07.2018.
//  Copyright © 2018 Екатерина. All rights reserved.
//

import UIKit

class DetailFontDescribtion: UIViewController {
    var fontNameFromCollectionView = String()
    var fontFamilyFromCollectionView = String()
    var fontFromCollectionView = UIFont()
    
    @IBOutlet weak var fontFamilyName: UILabel!
    @IBOutlet weak var fontName: UILabel!
    @IBOutlet weak var fontExample: UILabel!
    @IBOutlet weak var fontHeight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontFamilyName.text = fontFamilyFromCollectionView
        fontName.text = fontNameFromCollectionView
        fontHeight.text = String(Float(fontFromCollectionView.lineHeight))
        
        fontExample.font = fontFromCollectionView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
