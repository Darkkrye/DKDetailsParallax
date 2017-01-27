//
//  FlatDarkSimpleLabelCell.swift
//  iOSeries
//
//  Created by Pierre on 15/01/2017.
//  Copyright © 2017 Pierre Boudon. All rights reserved.
//

import UIKit

/// FlatDarkSimpleLabelCell class
open class FlatDarkSimpleLabelCell: UITableViewCell {

    /// MARK: - Private Constants
    /// Cell default height
    public static let defaultHeight: CGFloat = 44
    
    
    /// MARK: - Private Variables
    /// Cell primary color
    public var primaryColor = UIColor.white
    /// Cell secondary color
    public var secondaryColor = UIColor.gray
    
    
    /// MARK: - IBOutlets
    /// Content Label
    @IBOutlet public weak var contentLabel: UILabel!
    
    
    /// MARK: - IBActions
    
    
    /// MARK: - "Default" Methods
    /// Override function awakeFromNib
    override open func awakeFromNib() {
        super.awakeFromNib()
        /* Initialization code */
    }
    
    /// MARK: - Delegates
    
    
    /// MARK: - Personnal Delegates
    
    
    /// MARK: - Personnal Methods
    /// Default constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    /// - Returns: FlatDarkSimpleLabelCell - The created cell
    open static func simpleCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> FlatDarkSimpleLabelCell {
        /* Call other constructor with default value */
        return simpleCell(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, wantsEmptyCell: false)
    }
    
    /// Complex constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    ///   - wantsEmptyCell: Bool - If you want this item
    /// - Returns: FlatDarkSimpleLabelCell
    open static func simpleCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, wantsEmptyCell: Bool) -> FlatDarkSimpleLabelCell {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("FlatDarkSimpleLabelCell", owner: self, options: nil)
        let cell: FlatDarkSimpleLabelCell = nibs![0] as! FlatDarkSimpleLabelCell
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
