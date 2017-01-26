//
//  FlatLightSimpleLabelCell.swift
//  iOSeries
//
//  Created by Pierre on 13/01/2017.
//  Copyright © 2017 Pierre Boudon. All rights reserved.
//

import UIKit

/// FlatLightSimpleLabelCell class
open class FlatLightSimpleLabelCell: UITableViewCell {
    
    /* MARK: - Private Constants */
    public static let defaultHeight: CGFloat = 44
    
    
    /* MARK: - Private Variables */
    public var primaryColor = UIColor.black
    public var secondaryColor = UIColor.gray
    
    
    /* MARK: - IBOutlets */
    @IBOutlet public weak var contentLabel: UILabel!
    
    
    /* MARK: - IBActions */
    
    
    /* MARK: - "Default" Methods */
    /// Override function awakeFromNib
    override open func awakeFromNib() {
        super.awakeFromNib()
        /* Initialization code */
    }
    
    /* MARK: - Delegates */
    
    
    /* MARK: - Personnal Delegates */
    
    
    /* MARK: - Personnal Methods */
    /// Default constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    /// - Returns: FlatLightSimpleLabelCell - The created cell
    open static func simpleCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> FlatLightSimpleLabelCell {
        /* Call other constructor with default value */
        return simpleCell(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, wantsEmptyCell: false)
    }
    
    /// Complex constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    ///   - wantsEmptyCell: Bool - If you want this item
    /// - Returns: FlatLightSimpleLabelCell
    open static func simpleCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, wantsEmptyCell: Bool) -> FlatLightSimpleLabelCell {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("FlatLightSimpleLabelCell", owner: self, options: nil)
        let cell: FlatLightSimpleLabelCell = nibs![0] as! FlatLightSimpleLabelCell
        cell.selectionStyle = .none
        
        /* Set colors */
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        if wantsEmptyCell {
            /* Hide content label */
            cell.contentLabel.isHidden = true
        }
        
        return cell
    }
}
