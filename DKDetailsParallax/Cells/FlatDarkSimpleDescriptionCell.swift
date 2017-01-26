//
//  FlatDarkSimpleDescriptionCell.swift
//  iOSeries
//
//  Created by Pierre on 15/01/2017.
//  Copyright © 2017 Pierre Boudon. All rights reserved.
//

import UIKit

/// FlatDarkSimpleDescriptionCell class
open class FlatDarkSimpleDescriptionCell: UITableViewCell {

    /* MARK: - Private Constants */
    public static let defaultHeight: CGFloat = 50
    
    
    /* MARK: - Private Variables */
    public var primaryColor = UIColor.white
    public var secondaryColor = UIColor.gray
    
    
    /* MARK: - IBOutlets */
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var contentLabel: UILabel!
    
    
    /* MARK: - IBActions */
    
    
    /* MARK: - "Default" Methods */
    /// Override function awakeFromNib
    override open func awakeFromNib() {
        super.awakeFromNib()
        /* Initialization code */
        self.titleLabel.text = self.titleLabel.text?.uppercased()
        self.titleLabel.textColor = self.secondaryColor
        self.contentLabel.textColor = self.primaryColor
    }
    
    /// Override function setSelected
    ///
    /// - Parameters:
    ///   - selected: Bool - Selected value
    ///   - animated: Bool - Animated value
    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        /* Configure the view for the selected state */
    }
    
    /* Use this function instead of property */
    /// Set the title. Use this function instead of property
    ///
    /// - Parameter text: String - The text for the title
    open func setTitleText(text: String) {
        self.titleLabel.text = text.uppercased()
    }
    
    /* MARK: - Delegates */
    
    
    /* MARK: - Personnal Delegates */
    
    
    /* MARK: - Personnal Methods */
    /// Default constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    /// - Returns: FlatDarkSimpleDescriptionCell - The created cell
    open static func simpleDescriptionCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> FlatDarkSimpleDescriptionCell {
        /* Call other constructor with default value */
        return simpleDescriptionCell(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, withoutTitle: false, withoutContent: false)
    }
    
    /// Complex constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    ///   - withoutTitle: Bool - If you don't want this item
    ///   - withoutContent: Bool - If you don't want this item
    /// - Returns: FlatLightSimpleDescriptionCell
    open static func simpleDescriptionCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, withoutTitle: Bool, withoutContent: Bool) -> FlatDarkSimpleDescriptionCell {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("FlatDarkSimpleDescriptionCell", owner: self, options: nil)
        let cell: FlatDarkSimpleDescriptionCell = nibs![0] as! FlatDarkSimpleDescriptionCell
        cell.selectionStyle = .none
        
        /* Set colors */
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        if withoutTitle {
            /* Hide title label */
            cell.titleLabel.isHidden = true
        }
        
        if withoutContent {
            /* Hide content label */
            cell.contentLabel.isHidden = true
        }
        
        return cell
    }
    
}
