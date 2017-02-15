//
//  RoundedDetailsNumbersCell.swift
//  DKDetailsParallax
//
//  Created by Pierre on 10/02/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import UIKit

public class RoundedDetailsNumbersCell: UITableViewCell {
    
    /// MARK: - Private Constants
    /// The default height cell
    public static let defaultHeight: CGFloat = 80
    
    
    /// MARK: - Private Variables
    /// Cell primary color
    public var primaryColor = UIColor.green
    /// Cell secondary color
    public var secondaryColor = UIColor.white
    
    
    /// MARK: - IBOutlets
    /// The details image view
    @IBOutlet public weak var detailsImageView: UIImageView!
    
    /// The first label
    @IBOutlet public weak var firstLabel: UILabel!
    /// The second label
    @IBOutlet public weak var secondLabel: UILabel!
    /// The third label
    @IBOutlet public weak var thirdLabel: UILabel!
    /// The fourth label
    @IBOutlet public weak var fourthLabel: UILabel!
    
    /// The first number label
    @IBOutlet public weak var firstNumberLabel: UILabel!
    /// The second number label
    @IBOutlet public weak var secondNumberLabel: UILabel!
    /// The third number label
    @IBOutlet public weak var thirdNumberLabel: UILabel!
    /// The fourth number label
    @IBOutlet public weak var fourthNumberLabel: UILabel!

    /// Override awakeFromNib method
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /// Override setSelected method
    ///
    /// - Parameters:
    ///   - selected: Bool - Selected value
    ///   - animated: Bool - Animated value
    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setLabel(forFirst: String?, andSecond: String?, andThird: String?, andFourth: String?) {
        if let f = forFirst {
            self.firstLabel.text = f.uppercased()
        } else {
            self.firstLabel.text = ""
        }
        
        if let s = andSecond {
            self.secondLabel.text = s.uppercased()
        } else {
            self.secondLabel.text = ""
        }
        
        if let t = andThird {
            self.thirdLabel.text = t.uppercased()
        } else {
            self.thirdLabel.text = ""
        }
        
        if let f = andFourth {
            self.fourthLabel.text = f.uppercased()
        } else {
            self.fourthLabel.text = ""
        }
    }
    
    /// Simple constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    /// - Returns: RoundedDetailsNumbersCell - The created cell
    open static func numberCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> RoundedDetailsNumbersCell {
        return numberCell(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, replaceCircleWithRoundedCorner: false, exceptFirstLabels: false, exceptSecondLabels: false, exceptThirdLabels: false, exceptFourthLabels: false)
    }
    
    /// Complex constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    ///   - replaceCircleWithRoundedCorner: Bool - If you prefer square image with rounded corner instead of circle image
    ///   - exceptFirstLabels: Bool - If you don't want this item
    ///   - exceptSecondLabels: Bool - If you don't want this item
    ///   - exceptThirdLabels: Bool - If you don't want this item
    ///   - exceptFourthLabels: Bool - If you don't want this item
    /// - Returns: RoundedDetailsNumbersCell - The created cell
    open static func numberCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, replaceCircleWithRoundedCorner: Bool, exceptFirstLabels: Bool, exceptSecondLabels: Bool, exceptThirdLabels: Bool, exceptFourthLabels: Bool) -> RoundedDetailsNumbersCell {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("RoundedDetailsNumbersCell", owner: self, options: nil)
        let cell: RoundedDetailsNumbersCell = nibs![0] as! RoundedDetailsNumbersCell
        cell.selectionStyle = .none
        
        /* Set colors */
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        /* Set the properties */
        cell.firstLabel.isHidden = exceptFirstLabels
        cell.firstNumberLabel.isHidden = exceptFirstLabels
        
        cell.secondLabel.isHidden = exceptSecondLabels
        cell.secondNumberLabel.isHidden = exceptSecondLabels
        
        cell.thirdLabel.isHidden = exceptThirdLabels
        cell.thirdNumberLabel.isHidden = exceptThirdLabels
        
        cell.fourthLabel.isHidden = exceptFourthLabels
        cell.fourthNumberLabel.isHidden = exceptFourthLabels
        
        cell.firstNumberLabel.textColor = cell.primaryColor
        cell.secondNumberLabel.textColor = cell.primaryColor
        cell.thirdNumberLabel.textColor = cell.primaryColor
        cell.fourthNumberLabel.textColor = cell.primaryColor
        
        cell.detailsImageView.layer.masksToBounds = true
        
        if replaceCircleWithRoundedCorner {
            cell.detailsImageView.layer.cornerRadius = 2
        } else {
            cell.detailsImageView.layer.cornerRadius = cell.detailsImageView.frame.width / 2
        }
        
        return cell
    }
}
