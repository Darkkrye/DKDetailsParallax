//
//  RoundedDetailsProfile.swift
//  DetailsParallaxView
//
//  Created by Pierre on 26/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class RoundedDetailsProfile: UITableViewCell {
    
    // MARK: - Private Constants
    static let defaultHeight: CGFloat = 105
    
    
    // MARK: - Private Variables
    var primaryColor = UIColor.black
    var secondaryColor = UIColor.gray
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var squareImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var circleButton: UIButton!
    @IBOutlet weak var outlinedButton: UIButton!
    @IBOutlet weak var plainButton: UIButton!
    
    
    // MARK: - IBActions
    
    
    // MARK: - "Default" Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    internal static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> RoundedDetailsProfile {
        return detailsProfile(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, exceptSquareImage: false, exceptTitleLabel: false, exceptSubtitleLabel: false, exceptCircleButton: false, exceptOutlinedButton: false, exceptPlainButton: false)
    }
    
    internal static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, exceptSquareImage: Bool, exceptTitleLabel: Bool, exceptSubtitleLabel: Bool, exceptCircleButton: Bool, exceptOutlinedButton: Bool, exceptPlainButton: Bool) -> RoundedDetailsProfile {
        let nibs = Bundle.main.loadNibNamed("RoundedDetailsProfile", owner: self, options: nil)
        let cell: RoundedDetailsProfile = nibs![0] as! RoundedDetailsProfile
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
    
    private static func initialize(cell: RoundedDetailsProfile) {
        cell.titleLabel.textColor = cell.primaryColor
        cell.subtitleLabel.textColor = cell.secondaryColor
        
        cell.squareImageView.layer.cornerRadius = cell.squareImageView.frame.size.width/2
        cell.squareImageView.layer.masksToBounds = true
        
        cell.plainButton.layer.borderColor = cell.primaryColor.cgColor
        cell.plainButton.backgroundColor = cell.primaryColor
        cell.plainButton.layer.cornerRadius = 15.0
        
        cell.outlinedButton.layer.borderColor =  cell.primaryColor.cgColor
        cell.outlinedButton.setTitleColor(cell.primaryColor, for: .normal)
        cell.outlinedButton.layer.borderWidth = 1.0
        cell.outlinedButton.layer.cornerRadius = 15.0
    }
}
