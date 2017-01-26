//
//  MoreTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 27/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

/// RoundedButtonCell class
open class RoundedButtonCell: UITableViewCell {
    
    /* MARK: - Private Constants */
    public static let defaultHeight: CGFloat = 62
    
    
    /* MARK: - Private Variables */
    public var primaryColor = UIColor.black
    public var secondaryColor = UIColor.white
    public var delegate: DKDetailsParallaxCellDelegate?
    
    
    /* MARK: - IBOutlets */
    @IBOutlet weak public var button: UIButton!
    
    
    /* MARK: - IBActions */
    /// IBAction for button tapped
    ///
    /// - Parameter sender: Any - The button
    @IBAction func buttonTapped(_ sender: Any) {
        /* Execute when button is tapped */
        if let d = self.delegate {
            d.roundedButtonCellCallback!(cell: self, forButton: self.button)
        }
    }
    
    
    
    /* MARK: - "Default" Methods */
    /// Override function awakeFromNib
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    /* MARK: - Delegates */
    
    
    /* MARK: - Personnal Delegates */
    
    
    /* MARK: - Personnal Methods */
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
        if withPlainButton {
            initializeForPlainButton(cell: cell)
        } else {
            initialize(cell: cell)
        }
        
        return cell
    }
    
    /// Default initialize function
    ///
    /// - Parameter cell: RoundedButtonCell - The cell
    private static func initialize(cell: RoundedButtonCell) {
        /* Setup outlined button */
        cell.button.layer.borderColor = cell.primaryColor.cgColor
        cell.button.layer.borderWidth = 1.0
        cell.button.layer.cornerRadius = 15.0
        cell.button.backgroundColor = cell.secondaryColor
        cell.button.setTitleColor(cell.primaryColor, for: .normal)
    }
    
    /// Initialize function for plain button
    ///
    /// - Parameter cell: RoundedButtonCell - The cell
    private static func initializeForPlainButton(cell: RoundedButtonCell) {
        /* Setup plain button */
        cell.button.layer.cornerRadius = 15.0
        cell.button.backgroundColor = cell.primaryColor
        cell.button.setTitleColor(UIColor.white, for: .normal)
    }
}
