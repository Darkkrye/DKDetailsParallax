//
//  FlatDarkSimpleDescriptionCell.swift
//  iOSeries
//
//  Created by Pierre on 15/01/2017.
//  Copyright © 2017 Pierre Boudon. All rights reserved.
//

import UIKit

open class FlatDarkSimpleDescriptionCell: UITableViewCell {

    // MARK: - Private Constants
    public static let defaultHeight: CGFloat = 50
    
    
    // MARK: - Private Variables
    public var primaryColor = UIColor.white
    public var secondaryColor = UIColor.gray
    
    
    // MARK: - IBOutlets
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var contentLabel: UILabel!
    
    
    // MARK: - IBActions
    
    
    // MARK: - "Default" Methods
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.titleLabel.text = self.titleLabel.text?.uppercased()
        self.titleLabel.textColor = self.secondaryColor
        self.contentLabel.textColor = self.primaryColor
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
    open static func simpleDescriptionCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> FlatDarkSimpleDescriptionCell {
        return simpleDescriptionCell(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, withoutTitle: false, withoutContent: false)
    }
    
    open static func simpleDescriptionCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, withoutTitle: Bool, withoutContent: Bool) -> FlatDarkSimpleDescriptionCell {
        let nibs = DataBundle.bundle.loadNibNamed("FlatDarkSimpleDescriptionCell", owner: self, options: nil)
        let cell: FlatDarkSimpleDescriptionCell = nibs![0] as! FlatDarkSimpleDescriptionCell
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
        
        if withoutContent {
            cell.contentLabel.isHidden = true
        }
        
        return cell
    }
    
}
