//
//  TopImageDetailsTextProfileCell.swift
//  DKDetailsParallax
//
//  Created by Thomas on 15/02/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import UIKit

/// TopImageDetailsTextProfileCell class
open class TopImageDetailsTextProfileCell: UITableViewCell {

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
    /// Rectangle ImageView
    @IBOutlet public weak var rectangleImageView: UIImageView!
    /// Title Label
    @IBOutlet public weak var messageLabel: UILabel!
    /// Left Button
    @IBOutlet public weak var leftButton: UIButton!
    /// Right Button
    @IBOutlet public weak var rightButton: UIButton!
    
    
    /// MARK: - IBActions
    /// IBAction for plain button
    ///
    /// - Parameter sender: Any - The button
    @IBAction func rightButtonTapped(_ sender: Any) {
        /* Execute when plain button is tapped */
        if let d = self.delegate {
            d.topImageDetailsTextProfileCellCallback!(cell: self, forLeftButton: self.leftButton)
        }
    }
    /// IBAction for outlined button
    ///
    /// - Parameter sender: Any - The button
    @IBAction func leftButtonTapped(_ sender: Any) {
        /* Execute when outlined button is tapped */
        if let d = self.delegate {
            d.topImageDetailsTextProfileCellCallback!(cell: self, forRightButton: self.rightButton)
        }
    }
    
    
    
    /// MARK: - "Default" Methods
    /// Override function awakeFromNib
    override open func awakeFromNib() {
        super.awakeFromNib()
        /* Initialization code */
//        self.rectangleImageView.layer.cornerRadius = 2
//        self.rectangleImageView.layer.masksToBounds = true
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
    
    /// MARK: - Delegates
    
    
    /// MARK: - Personnal Delegates
    
    
    /// MARK: - Personnal Methods
    /// Default constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    /// - Returns: TopImageDetailsTextProfileCell - The created cell
    open static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> TopImageDetailsTextProfileCell {
        /* Call other constructor with default value */
        return detailsProfile(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, exceptRectangleImage: false, exceptLeftButton: false, exceptRightButton: false)
    }
    
    /// Complex constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    ///   - exceptRectangleImage: Bool - If you don't want this item
    ///   - exceptTitleLabel: Bool - If you don't want this item
    ///   - exceptSubtitleLabel: Bool - If you don't want this item
    ///   - exceptCircleButton: Bool - If you don't want this item
    ///   - exceptOutlinedButton: Bool - If you don't want this item
    ///   - exceptPlainButton: Bool - If you don't want this item
    /// - Returns: TopImageDetailsTextProfileCell - The created cell
    open static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, exceptRectangleImage: Bool, exceptLeftButton: Bool, exceptRightButton: Bool) -> TopImageDetailsTextProfileCell {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("TopImageDetailsTextProfileCell", owner: self, options: nil)
        let cell: TopImageDetailsTextProfileCell = nibs![0] as! TopImageDetailsTextProfileCell
        cell.selectionStyle = .none
        
        if exceptRectangleImage {
            /* Hide rectangle image */
            cell.rectangleImageView.isHidden = true
        }
        
        if exceptLeftButton {
            /* Hide outlined button */
            cell.leftButton.isHidden = true
        }
        
        if exceptRightButton {
            /* Hide plain button */
            cell.rightButton.isHidden = true
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
    /// - Parameter cell: TopImageDetailsTextProfileCell - The cell
    private static func initialize(cell: TopImageDetailsTextProfileCell) {
        /* Set cell properties for variables */
        cell.messageLabel.textColor = cell.primaryColor
        
        /* Set plain button properties */
        cell.rightButton.layer.borderColor = cell.primaryColor.cgColor
        cell.rightButton.backgroundColor = cell.primaryColor
        cell.rightButton.layer.cornerRadius = cell.rightButton.frame.height / 2 - 2
        cell.rightButton.setTitleColor(UIColor.white, for: .normal)
        
        /* Set outlined button properties */
        cell.leftButton.layer.borderColor =  cell.primaryColor.cgColor
        cell.leftButton.setTitleColor(cell.primaryColor, for: .normal)
        cell.leftButton.layer.borderWidth = 1.0
        cell.leftButton.layer.cornerRadius = cell.leftButton.frame.height / 2 - 2
    }
}
