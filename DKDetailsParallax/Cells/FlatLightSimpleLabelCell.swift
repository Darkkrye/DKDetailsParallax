//
//  FlatLightSimpleLabelCell.swift
//  iOSeries
//
//  Created by Pierre on 13/01/2017.
//  Copyright © 2017 Pierre Boudon. All rights reserved.
//

import UIKit

open class FlatLightSimpleLabelCell: UITableViewCell {
    
    // MARK: - Private Constants
    public static let defaultHeight: CGFloat = 44
    
    
    // MARK: - Private Variables
    public var primaryColor = UIColor.black
    public var secondaryColor = UIColor.gray
    
    
    // MARK: - IBOutlets
    @IBOutlet public weak var contentLabel: UILabel!
    
    
    // MARK: - IBActions
    
    
    // MARK: - "Default" Methods
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    open static func simpleCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> FlatLightSimpleLabelCell {
        return simpleCell(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, wantsEmptyCell: false)
    }
    
    open static func simpleCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, wantsEmptyCell: Bool) -> FlatLightSimpleLabelCell {
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("FlatLightSimpleLabelCell", owner: self, options: nil)
        let cell: FlatLightSimpleLabelCell = nibs![0] as! FlatLightSimpleLabelCell
        cell.selectionStyle = .none
        
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        if wantsEmptyCell {
            cell.contentLabel.isHidden = true
        }
        
        return cell
    }
}
