//
//  MainScreenCollectionViewController.swift
//  FontsApp
//
//  Created by Екатерина on 21.07.2018.
//  Copyright © 2018 Екатерина. All rights reserved.
//

import UIKit

private let reuseIdentifier = "fontItem"
private let sizeOfTitleLabel:CGFloat = 20
private let sizeOfDescribtionLabel:CGFloat = 15
private let idDetailFontIndormation = "showDetailFontInformation"


extension MainScreenCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let indent = self.navigationController?.navigationBar.frame.height
        return CGSize(width: self.view.frame.width/2, height: (self.view.frame.height - indent!)/4)
    }
    
}



class MainScreenCollectionViewController: UICollectionViewController {
    var allFonts = [UIFont]()
    override func viewDidLoad() {
        super.viewDidLoad()
        allFonts = createArrayOfFonts(size: sizeOfTitleLabel)
        self.collectionView?.reloadData()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == idDetailFontIndormation){
            let vc = segue.destination as! DetailFontDescribtion
            let font = allFonts[(self.collectionView?.indexPathsForSelectedItems?.first?.row)!].withSize(17)
            vc.fontNameFromCollectionView = font.fontName
            vc.fontFamilyFromCollectionView = font.familyName
            vc.fontFromCollectionView = font
            
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: idDetailFontIndormation, sender: self)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFonts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FontItemCell
        
        let font  = allFonts[indexPath.row]
        
        cell.titleFont.text = font.familyName
        cell.titleFont.font = font
        
        let fontForDescribtionLabel = font.withSize(sizeOfDescribtionLabel)
        cell.describtionFont.text = fontForDescribtionLabel.fontName
        cell.describtionFont.font = fontForDescribtionLabel
        return cell
    }
}
