//
//  FlatDarkSwitchCell.swift
//  iOSeries
//
//  Created by Pierre on 17/01/2017.
//  Copyright © 2017 Pierre Boudon. All rights reserved.
//

import UIKit

open class FlatDarkSwitchCell: UITableViewCell {

    // MARK: - Private Constants
    public static let defaultHeight: CGFloat = 50
    
    
    // MARK: - Private Variables
    public var primaryColor = UIColor.white
    public var secondaryColor = UIColor.gray
    public var delegate: DKDetailsParallaxCellDelegate?
    
    
    // MARK: - IBOutlets
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var switchView: Switch!
    
    
    // MARK: - IBActions
    
    
    // MARK: - "Default" Methods
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    open func setTitleText(text: String) {
        self.titleLabel.text = text.uppercased()
    }
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    open static func switchCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> FlatDarkSwitchCell {
        return switchCell(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, withoutTitle: false)
    }
    
    open static func switchCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, withoutTitle: Bool) -> FlatDarkSwitchCell {
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("FlatDarkSwitchCell", owner: self, options: nil)
        let cell: FlatDarkSwitchCell = nibs![0] as! FlatDarkSwitchCell
        cell.selectionStyle = .none
        
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        if withoutTitle {
            cell.titleLabel.isHidden = true
        }
        
        initialize(cell: cell)
        
        return cell
    }
    
    @objc private func switchDidChangeValue(_ theSwitch: Switch) {
        if let d = self.delegate {
            d.flatDarkSwitchCellCallback!(cell: self, onSwitchUpdate: theSwitch, toTheValue: "\(theSwitch.rightSelected ? theSwitch.rightText ?? "" : theSwitch.leftText ?? "")")
        }
    }
    
    private static func initialize(cell: FlatDarkSwitchCell) {
        cell.switchView.tintColor = cell.primaryColor
        cell.switchView.disabledColor = cell.switchView.tintColor.withAlphaComponent(0.4)
        cell.switchView.sizeToFit()
        cell.switchView.addTarget(cell, action: #selector(FlatDarkSwitchCell.switchDidChangeValue(_:)), for: .valueChanged)
    }
}
