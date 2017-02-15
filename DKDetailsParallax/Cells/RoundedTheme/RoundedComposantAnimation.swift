//
//  RoundedComposantAnimation.swift
//  DKDetailsParallax
//
//  Created by Tayeb Sedraia on 15/02/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import UIKit

open class RoundedComposantAnimation: UITableViewCell {

    /// MARK: - Private Constants
    /// Cell default height
    public static let defaultHeight: CGFloat = 105
    
    
    /// MARK: - Private Variables
    /// Cell primary color
    public var primaryColor = UIColor.black
    /// Cell secondary color
    public var secondaryColor = UIColor.gray
    
    /// Cell delegate
    public var delegate: DKDetailsParallaxCellDelegate?
    
    
    
    /// MARK: - IBOutlets
    /// Square ImageView
    @IBOutlet public weak var squareImageView: UIImageView!
    
    /// Title Label
    @IBOutlet public weak var titleLabel: UILabel!
    
    /// Subtitle Label
    @IBOutlet public weak var subtitleLabel: UILabel!
    
    /// Circle Button
    @IBOutlet public weak var circleButton: UIButton!
    
    /// Outlined Button
    @IBOutlet public weak var outlinedButton: UIButton!
    
    /// Plain Button
    @IBOutlet public weak var plainButton: UIButton!
    
    
    /// MARK: - IBActions
    /// IBAction for plain button
    ///
    /// - Parameter sender: Any - The button
    @IBAction func plainButtonTapped(_ sender: Any) {
        /* Execute when plain button is tapped */
        if let d = self.delegate {
            d.roundedComposantAnimationCellCallback!(cell: self, forPlainButton: self.plainButton)
        }
    }
    
    /// IBAction for outlined button
    ///
    /// - Parameter sender: Any - The button
    @IBAction func outlinedButtonTapped(_ sender: Any) {
        /* Execute when outlined button is tapped */
        if let d = self.delegate {
            d.roundedComposantAnimationCellCallback!(cell: self, forOutlinedButton: self.outlinedButton)
        }
    }
    
    /// IBAction for circle button
    ///
    /// - Parameter sender: Any - The button
    @IBAction func circleButtonTapped(_ sender: Any) {
        /* Execute when circle button is tapped */
        if let d = self.delegate {
            d.roundedComposantAnimationCellCallback!(cell: self, forCircleButton: self.circleButton)
        }
    }
    
    
    
    /// MARK: - "Default" Methods
    /// Override function awakeFromNib
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    /// MARK: - Delegates
    
    
    /// MARK: - Personnal Delegates
    
    
    /// MARK: - Personnal Methods
    /// Default constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor ? - The secondary color
    /// - Returns: RoundedComposantAnimation - The created cell
    open static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?) -> RoundedComposantAnimation {
        
        /* Call other constructor with default value */
        return detailsProfile(withPrimaryColor: withPrimaryColor, andSecondaryColor: andSecondaryColor, exceptSquareImage: false, exceptTitleLabel: false, exceptSubtitleLabel: false, exceptCircleButton: false, exceptOutlinedButton: false, exceptPlainButton: false)
    }
    
    /// Complex constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    ///   - exceptSquareImage: Bool - If you don't want this item
    ///   - exceptTitleLabel: Bool - If you don't want this item
    ///   - exceptSubtitleLabel: Bool - If you don't want this item
    ///   - exceptCircleButton: Bool - If you don't want this item
    ///   - exceptOutlinedButton: Bool - If you don't want this item
    ///   - exceptPlainButton: Bool - If you don't want this item
    /// - Returns: RoundedComposantAnimation - The created cell
    open static func detailsProfile(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, exceptSquareImage: Bool, exceptTitleLabel: Bool, exceptSubtitleLabel: Bool, exceptCircleButton: Bool, exceptOutlinedButton: Bool, exceptPlainButton: Bool) -> RoundedComposantAnimation {
        /* Retrieve cell */
        let nibs = DKDetailsParallax.bundle()?.loadNibNamed("RoundedComposantAnimation", owner: self, options: nil)

        let cell: RoundedComposantAnimation = nibs![0] as! RoundedComposantAnimation
        cell.selectionStyle = .none
        
        
        if exceptSquareImage {
            /* Hide square image */
            cell.squareImageView.isHidden = true
        }
        
        if exceptTitleLabel {
            /* Hide title label */
            cell.titleLabel.isHidden = true
        }
        
        if exceptSubtitleLabel {
            /* Hide subtitle label */
            cell.subtitleLabel.isHidden = true
        }
        
        if exceptCircleButton {
            /* Hide circle button */
            cell.circleButton.isHidden = true
        }
        
        if exceptOutlinedButton {
            /* Hide outlined button */
            cell.outlinedButton.isHidden = true
        }
        
        if exceptPlainButton {
            /* Hide plain button */
            cell.plainButton.isHidden = true
        }
        
        /* Set colors */
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        
        /* Call initialize function */
        initialize(cell: cell)
        
        return cell
    }
    
    /// Initialize function
    ///
    /// - Parameter cell: RoundedComposantAnimation - The cell
    private static func initialize(cell: RoundedComposantAnimation) {
        
        /* Set cell properties for variables */
        cell.titleLabel.textColor = cell.primaryColor
        cell.subtitleLabel.textColor = cell.secondaryColor
        
        
        /* Set cell square image properties */
        cell.squareImageView.layer.cornerRadius = cell.squareImageView.frame.size.width/2
        cell.squareImageView.layer.masksToBounds = true
        
        /* Set plain button properties */
        cell.plainButton.layer.borderColor = cell.primaryColor.cgColor
        cell.plainButton.backgroundColor = cell.primaryColor
        cell.plainButton.layer.cornerRadius = 15.0
        cell.plainButton.setTitleColor(UIColor.white, for: .normal)
        
        /* Set outlined button properties */
        cell.outlinedButton.layer.borderColor =  cell.primaryColor.cgColor
        cell.outlinedButton.setTitleColor(cell.primaryColor, for: .normal)
        cell.outlinedButton.layer.borderWidth = 1.0
        cell.outlinedButton.layer.cornerRadius = 15.0
        
        
        /* set direction increases */
        cell.titleLabel.center.x -= defaultHeight
        cell.subtitleLabel.center.x -= defaultHeight
        cell.plainButton.center.x -= defaultHeight
        cell.outlinedButton.center.x -= defaultHeight
        cell.squareImageView.center.y -= defaultHeight
        
        
        
        /* animate titleLabel right to left */
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [],
                       animations: {
                        cell.titleLabel.center.x -= defaultHeight
        },
                       completion: nil
        )
        
        /* animate subtitleLabel right to left */
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [],
                       animations: {
                        cell.subtitleLabel.center.x -= defaultHeight
        },
                       completion: nil
        )
        
        /* animate plainButton right to left */
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [],
                       animations: {
                        cell.plainButton.center.x -= defaultHeight
        },
                       completion: nil
        )
        
        /* animate outlinedButton right to left */
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [],
                       animations: {
                        cell.outlinedButton.center.x -= defaultHeight
        },
                       completion: nil
        )
        
        
        /* animate squareImageView top to bas */
        UIView.animate(withDuration: 2) {
            cell.squareImageView.center.y += defaultHeight
        }
        
        
        
    }
}
