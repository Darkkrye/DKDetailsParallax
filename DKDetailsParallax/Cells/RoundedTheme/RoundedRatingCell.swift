//
//  RoundedRatingCell.swift
//  DKDetailsParallax
//
//  Created by Pierre on 09/02/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import UIKit

public class RoundedRatingCell: UITableViewCell {
    
    /// MARK: - Private Constants
    /// The default height cell
    public static let defaultHeight: CGFloat = 65
    
    
    /// MARK: - Private Variables
    /// Cell primary color
    public var primaryColor = UIColor.green
    /// Cell secondary color
    public var secondaryColor = UIColor.white
    
    
    /// MARK: - IBOutlets
    /// The number of votes label
    @IBOutlet public weak var votesLabel: UILabel!
    /// The rating Cosmos View
    @IBOutlet public weak var ratingCosmosView: CosmosView!
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// MARK: - Personnal Methods
    /// Default constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    /// - Returns: RoundedRatingCell - The created cell
    open static func ratingCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> RoundedRatingCell {
        /* Call other constructor with default value */
        return ratingCell(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, exceptRatingView: false, exceptVotesLabel: false)
    }
    
    /// Complex constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    ///   - exceptRatingView: Bool - If you don't want this item
    ///   - exceptVotesLabel: Book - If you don't want this item
    /// - Returns: RoundedRatingCell - The created cell
    open static func ratingCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, exceptRatingView: Bool, exceptVotesLabel: Bool) -> RoundedRatingCell {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("RoundedRatingCell", owner: self, options: nil)
        let cell: RoundedRatingCell = nibs![0] as! RoundedRatingCell
        cell.selectionStyle = .none
        
        /* Set colors */
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        cell.ratingCosmosView.isHidden = exceptRatingView
        cell.votesLabel.isHidden = exceptVotesLabel
        
        self.initialize(cell: cell)
        
        return cell
    }
    
    /// Default initialize function
    ///
    /// - Parameter cell: RoundedButtonCell - The cell
    private static func initialize(cell: RoundedRatingCell) {
        /* Setup outlined button */
        cell.votesLabel.layer.cornerRadius = cell.votesLabel.frame.height / 2 - 2
        cell.votesLabel.textColor = cell.secondaryColor
        cell.votesLabel.backgroundColor = cell.primaryColor
        
        cell.ratingCosmosView.settings.filledColor = cell.primaryColor
        cell.ratingCosmosView.settings.emptyBorderColor = cell.primaryColor
        cell.ratingCosmosView.settings.filledBorderColor = cell.primaryColor
    }
}
