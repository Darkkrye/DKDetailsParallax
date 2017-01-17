//
//  MoreTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 27/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class RoundedButtonCell: UITableViewCell {
    
    // MARK: - Private Constants
    public static let defaultHeight: CGFloat = 62
    
    
    // MARK: - Private Variables
    public var primaryColor = UIColor.black
    public var secondaryColor = UIColor.white
    
    
    // MARK: - IBOutlets
    @IBOutlet weak public var button: UIButton!
    
    
    // MARK: - IBActions
    @IBAction func buttonTapped(_ sender: Any) {
    }
    
    
    
    // MARK: - "Default" Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    open static func buttonCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> RoundedButtonCell {
        let nibs = DataBundle.bundle.loadNibNamed("RoundedButtonCell", owner: self, options: nil)
        let cell: RoundedButtonCell = nibs![0] as! RoundedButtonCell
        cell.selectionStyle = .none
        
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        initialize(cell: cell)
        
        return cell
    }
    
    private static func initialize(cell: RoundedButtonCell) {
        cell.button.layer.borderColor = cell.primaryColor.cgColor
        cell.button.layer.borderWidth = 1.0
        cell.button.layer.cornerRadius = 15.0
        cell.button.backgroundColor = cell.secondaryColor
        cell.button.setTitleColor(cell.primaryColor, for: .normal)
    }
}
