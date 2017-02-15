//
//  TopImageDetailsProfileCell.swift
//  DKDetailsParallax
//
//  Created by Thomas on 15/02/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import UIKit

/// TopImageDetailsProfileCell class
open class TopImageDetailsProfileCell: UITableViewCell {

    /// MARK: - Private Constants
    /// Cell default height
    public static let defaultHeight: CGFloat = 105
    
    
    /// MARK: - Private Variables
    /// Cell primary color
    public var primaryColor = UIColor.black
    /// Cell secondary color
    public var secondaryColor = UIColor.gray
    /// Cell delegate
    public var delegate: DKDetailsParallaxCellDelegate?
    
    
    /// MARK: - IBOutlets
    /// Square ImageView
    @IBOutlet public weak var squareImageView: UIImageView!
    /// Outlined Button
    @IBOutlet public weak var leftButton: UIButton!
    /// Right Button
    @IBOutlet public weak var rightButton: UIButton!
    
    /// MARK: - IBActions
    /// IBAction for right button
    ///
    /// - Parameter sender: Any - The button
    @IBAction func rightButtonTapped(_ sender: Any) {
        /* Execute when right button is tapped */
        if let d = self.delegate {
            d.topImageDetailsProfileCellCallback!(cell: self, forLeftButton: self.leftButton)
        }
    }
    /// IBAction for outlined button
    ///
    /// - Parameter sender: Any - The button
    @IBAction func outlinedButtonTapped(_ sender: Any) {
        /* Execute when outlined button is tapped */
        if let d = self.delegate {
            d.topImageDetailsProfileCellCallback!(cell: self, forRightButton: self.rightButton)
        }
    }
    
    
    /// MARK: - "Default" Methods
    /// Override function awakeFromNib
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    /// MARK: - Delegates
    
    
    /// MARK: - Personnal Delegates
    
    
    /// MARK: - Personnal Methods
    /// Default constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor ? - The secondary color
    /// - Returns: TopImageDetailsProfileCell - The created cell
    open static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> TopImageDetailsProfileCell {
        /* Call other constructor with default value */
        return detailsProfile(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, exceptSquareImage: false, exceptLeftButton: false, exceptRightButton: false)
    }
    
    /// Complex constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    ///   - exceptSquareImage: Bool - If you don't want this item
    ///   - exceptTitleLabel: Bool - If you don't want this item
    ///   - exceptSubtitleLabel: Bool - If you don't want this item
    ///   - exceptCircleButton: Bool - If you don't want this item
    ///   - exceptOutlinedButton: Bool - If you don't want this item
    ///   - exceptPlainButton: Bool - If you don't want this item
    /// - Returns: TopImageDetailsProfileCell - The created cell
    open static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, exceptSquareImage: Bool,  exceptLeftButton: Bool, exceptRightButton: Bool) -> TopImageDetailsProfileCell {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("TopImageDetailsProfileCell", owner: self, options: nil)
        let cell: TopImageDetailsProfileCell = nibs![0] as! TopImageDetailsProfileCell
        cell.selectionStyle = .none
        
        if exceptSquareImage {
            /* Hide square image */
            cell.squareImageView.isHidden = true
        }
        
        /* Set colors */
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        /* Call initialize function */
        initialize(cell: cell)
        
        return cell
    }
    
    /// Initialize function
    ///
    /// - Parameter cell: TopImageDetailsProfileCell - The cell
    private static func initialize(cell: TopImageDetailsProfileCell) {
        
        /* Set cell square image properties */
//        cell.squareImageView.layer.cornerRadius = 15.0
//        cell.squareImageView.layer.masksToBounds = true
        
        /* Set plain button properties */
        cell.leftButton.layer.borderColor = cell.primaryColor.cgColor
        cell.leftButton.backgroundColor = cell.primaryColor
        cell.leftButton.layer.cornerRadius = 15.0
        cell.leftButton.setTitleColor(UIColor.white, for: .normal)
        
        /* Set outlined button properties */
        cell.rightButton.layer.borderColor =  cell.primaryColor.cgColor
        cell.rightButton.setTitleColor(cell.primaryColor, for: .normal)
        cell.rightButton.layer.borderWidth = 1.0
        cell.rightButton.layer.cornerRadius = 15.0
        cell.rightButton.backgroundColor = UIColor.white
    }
}
