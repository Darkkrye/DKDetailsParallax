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
        if let d = self.delegate {
            d.roundedDetailsProfileCellCallback!(cell: self, forPlainButton: self.plainButton)
        }
    }
    @IBAction func outlinedButtonTapped(_ sender: Any) {
        if let d = self.delegate {
            d.roundedDetailsProfileCellCallback!(cell: self, forOutlinedButton: self.outlinedButton)
        }
    }
    @IBAction func circleButtonTapped(_ sender: Any) {
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
        return detailsProfile(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, exceptSquareImage: false, exceptTitleLabel: false, exceptSubtitleLabel: false, exceptCircleButton: false, exceptOutlinedButton: false, exceptPlainButton: false)
    }
    
    open static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, exceptSquareImage: Bool, exceptTitleLabel: Bool, exceptSubtitleLabel: Bool, exceptCircleButton: Bool, exceptOutlinedButton: Bool, exceptPlainButton: Bool) -> RoundedDetailsProfileCell {
        let nibs = DataBundle.bundle.loadNibNamed("RoundedDetailsProfileCell", owner: self, options: nil)
        let cell: RoundedDetailsProfileCell = nibs![0] as! RoundedDetailsProfileCell
        cell.selectionStyle = .none
        
        if exceptSquareImage {
            cell.squareImageView.isHidden = true
        }
        
        if exceptTitleLabel {
            cell.titleLabel.isHidden = true
        }
        
        if exceptSubtitleLabel {
            cell.subtitleLabel.isHidden = true
        }
        
        if exceptCircleButton {
            cell.circleButton.isHidden = true
        }
        
        if exceptOutlinedButton {
            cell.outlinedButton.isHidden = true
        }
        
        if exceptPlainButton {
            cell.plainButton.isHidden = true
        }
        
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        initialize(cell: cell)
        
        return cell
    }
    
    private static func initialize(cell: RoundedDetailsProfileCell) {
        cell.titleLabel.textColor = cell.primaryColor
        cell.subtitleLabel.textColor = cell.secondaryColor
        
        cell.squareImageView.layer.cornerRadius = cell.squareImageView.frame.size.width/2
        cell.squareImageView.layer.masksToBounds = true
        
        cell.plainButton.layer.borderColor = cell.primaryColor.cgColor
        cell.plainButton.backgroundColor = cell.primaryColor
        cell.plainButton.layer.cornerRadius = 15.0
        cell.plainButton.setTitleColor(UIColor.white, for: .normal)
        
        cell.outlinedButton.layer.borderColor =  cell.primaryColor.cgColor
        cell.outlinedButton.setTitleColor(cell.primaryColor, for: .normal)
        cell.outlinedButton.layer.borderWidth = 1.0
        cell.outlinedButton.layer.cornerRadius = 15.0
    }
}
