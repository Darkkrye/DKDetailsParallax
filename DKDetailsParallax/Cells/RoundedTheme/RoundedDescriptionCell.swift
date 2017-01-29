//
//  RoundedDescriptionCell.swift
//  DKDetailsParallax
//
//  Created by Pierre on 28/01/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import UIKit

/// RoundedDescriptionCell class
public class RoundedDescriptionCell: UITableViewCell {
    
    /// MARK: - Private Constants
    /// Cell xs height
    public static let xsHeight: CGFloat = 44
    /// Cell small height
    public static let smallHeight: CGFloat = 80
    /// Cell medium height
    public static let mediumHeight: CGFloat = 125
    /// Cell big height
    public static let bigHeight: CGFloat = 250
    /// Cell enormous height
    public static let enormousHeight: CGFloat = 500
    
    
    /// MARK: - Private Variables
    /// Cell primary color
    public var primaryColor = UIColor.black
    /// Cell secondary color
    public var secondaryColor = UIColor.white
    
    
    /// MARK: - IBOutlets
    /// The icon
    @IBOutlet public weak var cellIcon: UIImageView!
    /// The description label
    @IBOutlet public weak var descriptionLabel: UILabel!
    

    /// MARK: - "Default" Methods
    /// Override function awakeFromNib
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /// Function to set the icon from exisiting icons - Use it instead of the property
    ///
    /// - Parameter icon: RoundedIcon - The icon
    public func setIcon(icon: RoundedIcon) {
        self.cellIcon.image = UIImage(named: icon.rawValue, in: DKDetailsParallax.bundle(), compatibleWith: nil)
    }
    
    /// Function to set the icon from image - Use it instead of the property
    ///
    /// - Parameter icon: UIImage - The icon
    public func setIcon(icon: UIImage) {
        self.cellIcon.image = icon
    }
    
    /// Function to set the description label from the text - Use it instead of the property
    ///
    /// - Parameter text: String - The text
    public func setText(text: String) {
        self.descriptionLabel.text = text
    }
    
    /// Function to set the description label with a bullet list from the array - Use it instead of the property
    ///
    /// - Parameters:
    ///   - texts: [String] - The list of strings you want to show
    ///   - typeList: RoundedTypeList - The bullet type you want
    public func setText(texts: [String], typeList: RoundedTypeList) {
        let v = typeList.rawValue
        
        var text = ""
        for i in 0..<texts.count {
            text += "\(v) \(texts[i])"
            
            if i != texts.count - 1 {
                text += "\r\n"
            }
        }
        
        self.descriptionLabel.text = text
    }
    
    /// MARK: - Personnal Methods
    /// Default constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    /// - Returns: RoundedDescriptionCell - The created cell
    open static func descriptionCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> RoundedDescriptionCell {
        /* Call other constructor with default value */
        return descriptionCell(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, exceptIcon: false)
    }
    
    /// Complex constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    ///   - exceptIcon: Bool - If you don't want this item
    /// - Returns: RoundedDescriptionCell - The created cell
    open static func descriptionCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, exceptIcon: Bool) -> RoundedDescriptionCell {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("RoundedDescriptionCell", owner: self, options: nil)
        let cell: RoundedDescriptionCell = nibs![0] as! RoundedDescriptionCell
        cell.selectionStyle = .none
        
        /* Set colors */
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        cell.cellIcon.isHidden = exceptIcon
        
        return cell
    }
}


/// The enum for the bullet type
public enum RoundedTypeList: String {
    /// - dash: -
    case dash = "-"
    /// - middleDot: ·
    case middleDot = "·"
    /// - dot: .
    case dot = "."
    /// - bullet: ●
    case bullet = "●"
    /// - star: *
    case star = "*"
    /// - underscore: _
    case underscore = "_"
    /// - tilde: ~
    case tilde = "~"
    /// - currency: ¤
    case currency = "¤"
    /// - degree: °
    case degree = "°"
    /// - notSign: ¬
    case notSign = "¬"
    /// - thorn: Þ
    case thorn = "Þ"
    /// - slashedO: ø
    case slashedO = "ø"
    /// - eth: ð
    case eth = "ð"
}

/// The enum for the icons
public enum RoundedIcon: String {
    /// - advice: Advice icon
    case advice = "adviceIcon"
    /// - baking: Baking icon
    case baking = "bakingIcon"
    /// - cooking: Cooking icon
    case cooking = "cookingIcon"
    /// - gift: Gift icon
    case gift = "giftIcon"
    /// - info: Info icon
    case info = "infoIcon"
    /// - ingredients: Ingredients icon
    case ingredients = "ingredientsIcon"
    /// - more: More icon
    case more = "moreIcon"
    /// - next: Next icon
    case next = "nextIcon"
    /// - serving: Serving icon
    case serving = "servingIcon"
}
