//
//  RoundedDetailsRectangleProfileTableViewCell.swift
//  DKDetailsParallax
//
//  Created by Pierre on 11/01/2017.
//  Copyright © 2017 Pierre Boudon. All rights reserved.
//

import UIKit

open class RoundedDetailsRectangleProfileCell: UITableViewCell {

    // MARK: - Private Constants
    public static let defaultHeight: CGFloat = 105
    
    
    // MARK: - Private Variables
    public var primaryColor = UIColor.black
    public var secondaryColor = UIColor.gray
    public var delegate: DKDetailsParallaxCellDelegate?
    
    
    // MARK: - IBOutlets
    @IBOutlet public weak var rectangleImageView: UIImageView!
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var subtitleLabel: UILabel!
    @IBOutlet public weak var circleButton: UIButton!
    @IBOutlet public weak var outlinedButton: UIButton!
    @IBOutlet public weak var plainButton: UIButton!
    
    
    // MARK: - IBActions
    @IBAction func plainButtonTapped(_ sender: Any) {
        // Execute when plain button is tapped
        if let d = self.delegate {
            d.roundedDetailsRectangleProfileCellCallback!(cell: self, forPlainButton: self.plainButton)
        }
    }
    @IBAction func outlinedButtonTapped(_ sender: Any) {
        // Execute when outlined button is tapped
        if let d = self.delegate {
            d.roundedDetailsRectangleProfileCellCallback!(cell: self, forOutlinedButton: self.plainButton)
        }
    }
    @IBAction func circleButtonTapped(_ sender: Any) {
        // Execute when circle button is tapped
        if let d = self.delegate {
            d.roundedDetailsRectangleProfileCellCallback!(cell: self, forCircleButton: self.plainButton)
        }
    }
    
    
    
    // MARK: - "Default" Methods
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.rectangleImageView.layer.cornerRadius = 2
        self.rectangleImageView.layer.masksToBounds = true
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    open static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> RoundedDetailsRectangleProfileCell {
        // Call other constructor with default value
        return detailsProfile(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, exceptRectangleImage: false, exceptTitleLabel: false, exceptSubtitleLabel: false, exceptCircleButton: false, exceptOutlinedButton: false, exceptPlainButton: false)
    }
    
    open static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, exceptRectangleImage: Bool, exceptTitleLabel: Bool, exceptSubtitleLabel: Bool, exceptCircleButton: Bool, exceptOutlinedButton: Bool, exceptPlainButton: Bool) -> RoundedDetailsRectangleProfileCell {
        // Retrieve cell
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("RoundedDetailsRectangleProfileCell", owner: self, options: nil)
        let cell: RoundedDetailsRectangleProfileCell = nibs![0] as! RoundedDetailsRectangleProfileCell
        cell.selectionStyle = .none
        
        if exceptRectangleImage {
            // Hide rectangle image
            cell.rectangleImageView.isHidden = true
        }
        
        if exceptTitleLabel {
            // Hide title label
            cell.titleLabel.isHidden = true
        }
        
        if exceptSubtitleLabel {
            // Hide subtitle label
            cell.subtitleLabel.removeFromSuperview()
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
    
    private static func initialize(cell: RoundedDetailsRectangleProfileCell) {
        // Set cell properties for variables
        cell.titleLabel.textColor = cell.primaryColor
        cell.subtitleLabel.textColor = cell.secondaryColor
        
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
