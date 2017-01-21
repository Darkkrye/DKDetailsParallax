//
//  RoundedDetailsProfile.swift
//  DKDetailsParallax
//
//  Created by Pierre on 26/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

open class RoundedDetailsProfileCell: UITableViewCell {
    
    // MARK: - Private Constants
    public static let defaultHeight: CGFloat = 105
    
    
    // MARK: - Private Variables
    public var primaryColor = UIColor.black
    public var secondaryColor = UIColor.gray
    public var delegate: DKDetailsParallaxCellDelegate?
    
    
    // MARK: - IBOutlets
    @IBOutlet public weak var squareImageView: UIImageView!
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var subtitleLabel: UILabel!
    @IBOutlet public weak var circleButton: UIButton!
    @IBOutlet public weak var outlinedButton: UIButton!
    @IBOutlet public weak var plainButton: UIButton!
    
    // MARK: - IBActions
    @IBAction func plainButtonTapped(_ sender: Any) {
        // Execute when plain button is tapped
        if let d = self.delegate {
            d.roundedDetailsProfileCellCallback!(cell: self, forPlainButton: self.plainButton)
        }
    }
    @IBAction func outlinedButtonTapped(_ sender: Any) {
        // Execute when outlined button is tapped
        if let d = self.delegate {
            d.roundedDetailsProfileCellCallback!(cell: self, forOutlinedButton: self.outlinedButton)
        }
    }
    @IBAction func circleButtonTapped(_ sender: Any) {
        // Execute when circle button is tapped
        if let d = self.delegate {
            d.roundedDetailsProfileCellCallback!(cell: self, forCircleButton: self.circleButton)
        }
    }
    
    
    // MARK: - "Default" Methods
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    open static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> RoundedDetailsProfileCell {
        // Call other constructor with default value
        return detailsProfile(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, exceptSquareImage: false, exceptTitleLabel: false, exceptSubtitleLabel: false, exceptCircleButton: false, exceptOutlinedButton: false, exceptPlainButton: false)
    }
    
    open static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, exceptSquareImage: Bool, exceptTitleLabel: Bool, exceptSubtitleLabel: Bool, exceptCircleButton: Bool, exceptOutlinedButton: Bool, exceptPlainButton: Bool) -> RoundedDetailsProfileCell {
        // Retrieve cell
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("RoundedDetailsProfileCell", owner: self, options: nil)
        let cell: RoundedDetailsProfileCell = nibs![0] as! RoundedDetailsProfileCell
        cell.selectionStyle = .none
        
        if exceptSquareImage {
            // Hide square image
            cell.squareImageView.isHidden = true
        }
        
        if exceptTitleLabel {
            // Hide title label
            cell.titleLabel.isHidden = true
        }
        
        if exceptSubtitleLabel {
            // Hide subtitle label
            cell.subtitleLabel.isHidden = true
        }
        
        if exceptCircleButton {
            // Hide circle button
            cell.circleButton.isHidden = true
        }
        
        if exceptOutlinedButton {
            // Hide outlined button
            cell.outlinedButton.isHidden = true
        }
        
        if exceptPlainButton {
            // Hide plain button
            cell.plainButton.isHidden = true
        }
        
        // Set colors
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        // Call initialize function
        initialize(cell: cell)
        
        return cell
    }
    
    private static func initialize(cell: RoundedDetailsProfileCell) {
        // Set cell properties for variables
        cell.titleLabel.textColor = cell.primaryColor
        cell.subtitleLabel.textColor = cell.secondaryColor
        
        // Set cell square image properties
        cell.squareImageView.layer.cornerRadius = cell.squareImageView.frame.size.width/2
        cell.squareImageView.layer.masksToBounds = true
        
        // Set plain button properties
        cell.plainButton.layer.borderColor = cell.primaryColor.cgColor
        cell.plainButton.backgroundColor = cell.primaryColor
        cell.plainButton.layer.cornerRadius = 15.0
        cell.plainButton.setTitleColor(UIColor.white, for: .normal)
        
        // Set outlined button properties
        cell.outlinedButton.layer.borderColor =  cell.primaryColor.cgColor
        cell.outlinedButton.setTitleColor(cell.primaryColor, for: .normal)
        cell.outlinedButton.layer.borderWidth = 1.0
        cell.outlinedButton.layer.cornerRadius = 15.0
    }
}
