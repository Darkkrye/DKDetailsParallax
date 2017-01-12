//
//  RoundedDetailsRectangleProfileTableViewCell.swift
//  iOSeries
//
//  Created by Pierre on 11/01/2017.
//  Copyright © 2017 Pierre Boudon. All rights reserved.
//

import UIKit

class RoundedDetailsRectangleProfile: UITableViewCell {

    // MARK: - Private Constants
    static let defaultHeight: CGFloat = 105
    
    
    // MARK: - Private Variables
    var primaryColor = UIColor.black
    var secondaryColor = UIColor.gray
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var rectangleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var circleButton: UIButton!
    @IBOutlet weak var outlinedButton: UIButton!
    @IBOutlet weak var plainButton: UIButton!
    
    
    // MARK: - IBActions
    
    
    // MARK: - "Default" Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    internal static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> RoundedDetailsRectangleProfile {
        return detailsProfile(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, exceptRectangleImage: false, exceptTitleLabel: false, exceptSubtitleLabel: false, exceptCircleButton: false, exceptOutlinedButton: false, exceptPlainButton: false)
    }
    
    internal static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, exceptRectangleImage: Bool, exceptTitleLabel: Bool, exceptSubtitleLabel: Bool, exceptCircleButton: Bool, exceptOutlinedButton: Bool, exceptPlainButton: Bool) -> RoundedDetailsRectangleProfile {
        let nibs = Bundle.main.loadNibNamed("RoundedDetailsRectangleProfile", owner: self, options: nil)
        let cell: RoundedDetailsRectangleProfile = nibs![0] as! RoundedDetailsRectangleProfile
        cell.selectionStyle = .none
        
        if exceptRectangleImage {
            cell.rectangleImageView.isHidden = true
        }
        
        if exceptTitleLabel {
            cell.titleLabel.isHidden = true
        }
        
        if exceptSubtitleLabel {
            cell.subtitleLabel.removeFromSuperview()
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
    
    private static func initialize(cell: RoundedDetailsRectangleProfile) {
        cell.titleLabel.textColor = cell.primaryColor
        cell.subtitleLabel.textColor = cell.secondaryColor
        
        cell.plainButton.layer.borderColor = cell.primaryColor.cgColor
        cell.plainButton.backgroundColor = cell.primaryColor
        cell.plainButton.layer.cornerRadius = 15.0
        
        cell.outlinedButton.layer.borderColor =  cell.primaryColor.cgColor
        cell.outlinedButton.setTitleColor(cell.primaryColor, for: .normal)
        cell.outlinedButton.layer.borderWidth = 1.0
        cell.outlinedButton.layer.cornerRadius = 15.0
    }
}
