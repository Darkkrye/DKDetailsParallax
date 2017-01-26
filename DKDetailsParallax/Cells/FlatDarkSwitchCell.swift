//
//  FlatDarkSwitchCell.swift
//  iOSeries
//
//  Created by Pierre on 17/01/2017.
//  Copyright © 2017 Pierre Boudon. All rights reserved.
//

import UIKit

/// FlatDarkSwitchCell class
open class FlatDarkSwitchCell: UITableViewCell {

    /* MARK: - Private Constants */
    public static let defaultHeight: CGFloat = 50
    
    
    /* MARK: - Private Variables */
    public var primaryColor = UIColor.white
    public var secondaryColor = UIColor.gray
    public var delegate: DKDetailsParallaxCellDelegate?
    
    
    /* MARK: - IBOutlets */
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var switchView: Switch!
    
    
    /* MARK: - IBActions */
    
    
    /* MARK: - "Default" Methods */
    /// Override function awakeFromNib
    override open func awakeFromNib() {
        super.awakeFromNib()
        /* Initialization code */
    }

    /// Override function setSelected
    ///
    /// - Parameters:
    ///   - selected: Bool - Selected value
    ///   - animated: Bool - AnimatedValue
    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        /* Configure the view for the selected state */
    }
    
    /// Set title text. Use this function instead of the property
    ///
    /// - Parameter text: String - The wanted text
    open func setTitleText(text: String) {
        self.titleLabel.text = text.uppercased()
    }
    
    /* MARK: - Delegates */
    
    
    /* MARK: - Personnal Delegates */
    
    
    /* MARK: - Personnal Methods */
    /// Default constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    /// - Returns: FlatDarkSwitchCell - The created cell
    open static func switchCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> FlatDarkSwitchCell {
        /* Call other constructor with default value */
        return switchCell(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, withoutTitle: false)
    }
    
    /// Complex constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    ///   - withoutTitle: Bool - If you don't want this item
    /// - Returns: FlatLightSwitchCell - The created cell
    open static func switchCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, withoutTitle: Bool) -> FlatDarkSwitchCell {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("FlatDarkSwitchCell", owner: self, options: nil)
        let cell: FlatDarkSwitchCell = nibs![0] as! FlatDarkSwitchCell
        cell.selectionStyle = .none
        
        /* Set colors */
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        if withoutTitle {
            /* Hide title label */
            cell.titleLabel.isHidden = true
        }
        
        /* Call intialize function */
        initialize(cell: cell)
        
        return cell
    }
    
    @objc private func switchDidChangeValue(_ theSwitch: Switch) {
        /* Execute when user change the switch value */
        if let d = self.delegate {
            d.flatDarkSwitchCellCallback!(cell: self, onSwitchUpdate: theSwitch, toTheValue: "\(theSwitch.rightSelected ? theSwitch.rightText ?? "" : theSwitch.leftText ?? "")")
        }
    }
    
    private static func initialize(cell: FlatDarkSwitchCell) {
        /* Initialize the switch view */
        cell.switchView.tintColor = cell.primaryColor
        cell.switchView.disabledColor = cell.switchView.tintColor.withAlphaComponent(0.4)
        cell.switchView.sizeToFit()
        cell.switchView.addTarget(cell, action: #selector(FlatDarkSwitchCell.switchDidChangeValue(_:)), for: .valueChanged)
    }
}
