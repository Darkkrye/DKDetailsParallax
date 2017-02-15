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
    @IBOutlet public weak var titleLabel: UILabel!
    /// Subtitle Label
    @IBOutlet public weak var subtitleLabel: UILabel!
    /// Circle Button
    @IBOutlet public weak var circleButton: UIButton!
    /// Outlined Button
    @IBOutlet public weak var outlinedButton: UIButton!
    /// Plain Button
    @IBOutlet public weak var plainButton: UIButton!
    
    
    /// MARK: - IBActions
    /// IBAction for plain button
    ///
    /// - Parameter sender: Any - The button
    @IBAction func plainButtonTapped(_ sender: Any) {
        /* Execute when plain button is tapped */
        if let d = self.delegate {
            d.topImageDetailsTextProfileCellCallback!(cell: self, forPlainButton: self.plainButton)
        }
    }
    /// IBAction for outlined button
    ///
    /// - Parameter sender: Any - The button
    @IBAction func outlinedButtonTapped(_ sender: Any) {
        /* Execute when outlined button is tapped */
        if let d = self.delegate {
            d.topImageDetailsTextProfileCellCallback!(cell: self, forOutlinedButton: self.plainButton)
        }
    }
    /// IBAction for circle button
    ///
    /// - Parameter sender: Any - The button
    @IBAction func circleButtonTapped(_ sender: Any) {
        /* Execute when circle button is tapped */
        if let d = self.delegate {
            d.topImageDetailsTextProfileCellCallback!(cell: self, forCircleButton: self.plainButton)
        }
    }
    
    
    
    /// MARK: - "Default" Methods
    /// Override function awakeFromNib
    override open func awakeFromNib() {
        super.awakeFromNib()
        /* Initialization code */
        self.rectangleImageView.layer.cornerRadius = 2
        self.rectangleImageView.layer.masksToBounds = true
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
        return detailsProfile(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, exceptRectangleImage: false, exceptTitleLabel: false, exceptSubtitleLabel: false, exceptCircleButton: false, exceptOutlinedButton: false, exceptPlainButton: false)
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
    open static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, exceptRectangleImage: Bool, exceptTitleLabel: Bool, exceptSubtitleLabel: Bool, exceptCircleButton: Bool, exceptOutlinedButton: Bool, exceptPlainButton: Bool) -> TopImageDetailsTextProfileCell {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("TopImageDetailsTextProfileCell", owner: self, options: nil)
        let cell: TopImageDetailsTextProfileCell = nibs![0] as! TopImageDetailsTextProfileCell
        cell.selectionStyle = .none
        
        if exceptRectangleImage {
            /* Hide rectangle image */
            cell.rectangleImageView.isHidden = true
        }
        
        if exceptTitleLabel {
            /* Hide title label */
            cell.titleLabel.isHidden = true
        }
        
        if exceptSubtitleLabel {
            /* Hide subtitle label */
            cell.subtitleLabel.removeFromSuperview()
        }
        
        if exceptCircleButton {
            /* Hide circle button */
            cell.circleButton.isHidden = true
        }
        
        if exceptOutlinedButton {
            /* Hide outlined button */
            cell.outlinedButton.isHidden = true
        }
        
        if exceptPlainButton {
            /* Hide plain button */
            cell.plainButton.isHidden = true
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
        cell.titleLabel.textColor = cell.primaryColor
        cell.subtitleLabel.textColor = cell.secondaryColor
        
        /* Set plain button properties */
        cell.plainButton.layer.borderColor = cell.primaryColor.cgColor
        cell.plainButton.backgroundColor = cell.primaryColor
        cell.plainButton.layer.cornerRadius = 15.0
        cell.plainButton.setTitleColor(UIColor.white, for: .normal)
        
        /* Set outlined button properties */
        cell.outlinedButton.layer.borderColor =  cell.primaryColor.cgColor
        cell.outlinedButton.setTitleColor(cell.primaryColor, for: .normal)
        cell.outlinedButton.layer.borderWidth = 1.0
        cell.outlinedButton.layer.cornerRadius = 15.0
    }
}
