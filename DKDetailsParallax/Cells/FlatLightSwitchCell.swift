//
//  FlatLightSwitchCell.swift
//  iOSeries
//
//  Created by Pierre on 17/01/2017.
//  Copyright © 2017 Pierre Boudon. All rights reserved.
//

import UIKit

/// FlatLightSwitchCell class
open class FlatLightSwitchCell: UITableViewCell {

    /// MARK: - Private Constants
    /// Cell default height
    public static let defaultHeight: CGFloat = 50
    
    
    /// MARK: - Private Variables
    /// Cell primary color
    public var primaryColor = UIColor.black
    /// Cell secondary color
    public var secondaryColor = UIColor.gray
    /// Cell delegate
    public var delegate: DKDetailsParallaxCellDelegate?
    
    
    /// MARK: - IBOutlets
    /// Title Label
    @IBOutlet public weak var titleLabel: UILabel!
    /// Switch
    @IBOutlet public weak var switchView: Switch!
    
    
    /// MARK: - IBActions
    
    
    /// MARK: - "Default" Methods
    /// Override function awakeFromNib
    override open func awakeFromNib() {
        super.awakeFromNib()
        /* Initialization code */
    }
    
    /// Set title text. Use this function instead of the property
    ///
    /// - Parameter text: String - The wanted text
    open func setTitleText(text: String) {
        self.titleLabel.text = text.uppercased()
    }
    
    /// MARK: - Delegates
    
    
    /// MARK: - Personnal Delegates
    
    
    /// MARK: - Personnal Methods
    /// Default constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    /// - Returns: FlatLightSwitchCell - The created cell
    open static func switchCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> FlatLightSwitchCell {
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
    open static func switchCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, withoutTitle: Bool) -> FlatLightSwitchCell {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("FlatLightSwitchCell", owner: self, options: nil)
        let cell: FlatLightSwitchCell = nibs![0] as! FlatLightSwitchCell
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
    
    /// Action when the value of the switch has been changed
    ///
    /// - Parameter theSwitch: Switch - The switch
    @objc private func switchDidChangeValue(_ theSwitch: Switch) {
        /* Execute when user change the switch value */
        if let d = self.delegate {
            d.flatLightSwitchCellCallback!(cell: self, onSwitchUpdate: theSwitch, toTheValue: "\(theSwitch.rightSelected ? theSwitch.rightText ?? "" : theSwitch.leftText ?? "")")
        }
    }
    
    /// Initialize function
    ///
    /// - Parameter cell: FlatLightSwitchCell - The cell
    private static func initialize(cell: FlatLightSwitchCell) {
        /* Initialize the switch view */
        cell.switchView.tintColor = cell.primaryColor
        cell.switchView.disabledColor = cell.switchView.tintColor.withAlphaComponent(0.4)
        cell.switchView.sizeToFit()
        cell.switchView.addTarget(cell, action: #selector(FlatLightSwitchCell.switchDidChangeValue(_:)), for: .valueChanged)
    }
}
