//
//  RoundedDescriptionCell.swift
//  DKDetailsParallax
//
//  Created by Pierre on 28/01/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import UIKit

/// RoundedDescriptionCell class
class RoundedDescriptionCell: UITableViewCell {
    
    /// MARK: - Private Constants
    /// Cell small height
    public static let smallHeight: CGFloat = 44
    /// Cell medium height
    public static let mediumHeight: CGFloat = 75
    /// Cell big height
    public static let bigHeight: CGFloat = 100
    
    
    /// MARK: - IBOutlets
    

    /// MARK: - "Default" Methods
    /// Override function awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setIcon(icon: RoundedIcon) {
        
    }
    
    public func setText(text: String) {
        
    }
    
    public func setText(texts: [String], typeList: RoundedTypeList) {
        let v = typeList.rawValue
    }
    
    /// MARK: - Personnal Methods
    /// Default constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    /// - Returns: RoundedButtonCell - The created cell
    open static func buttonCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> RoundedButtonCell {
        /* Call other constructor with default value */
        return buttonCell(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, withPlainButton: false)
    }
    
    /// Complex constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    ///   - withPlainButton: Bool - If you want this item
    /// - Returns: RoundedButtonCell - The created cell
    open static func buttonCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, withPlainButton: Bool) -> RoundedButtonCell {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("RoundedButtonCell", owner: self, options: nil)
        let cell: RoundedButtonCell = nibs![0] as! RoundedButtonCell
        cell.selectionStyle = .none
        
        /* Set colors */
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        /* Call intialize function */
//        if withPlainButton {
//            initializeForPlainButton(cell: cell)
//        } else {
//            initialize(cell: cell)
//        }
        
        return cell
    }
}

public enum RoundedIcon: String {
    case info = "infos_icon"
}

public enum RoundedTypeList: String {
    case dash = "-"
    case middle_dot = "·"
    case dot = "."
    case bullet = "●"
    case star = "*"
    case underscore = "_"
    case tilde = "~"
    case currency = "¤"
    case degree = "°"
    case not_sign = "¬"
    case thorn = "Þ"
    case slashed_o = "ø"
    case eth = "ð"
}
