//
//  RoundedButtonAnimationCell.swift
//  DKDetailsParallax
//
//  Created by Tayeb Sedraia on 10/02/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import UIKit

class RoundedButtonAnimationCell: UITableViewCell {
    
    struct DataBundle {
        static let bundle = Bundle.main
    }

    /// MARK: - Private Constants
    /// Cell default height
    public static let defaultHeight: CGFloat = 62
    
    
    /// MARK: - Private Variables
    /// Cell primary color
    public var primaryColor = UIColor.black
    /// Cell secondary color
    public var secondaryColor = UIColor.white
    /// Cell page
    public var storyboardIDpage = "Vue"
    
    
    // MARK: - IBOutlets
    /// Button
    @IBOutlet weak var button: UIButton!
    
    
    /// MARK: - IBActions
    /// IBAction for button tapped
    ///
    /// - Parameter sender: Any - The button
    @IBAction func buttonTapped(_ sender: Any) {
        animateButton()
    }
    
    
    
    /// MARK: - "Default" Methods
    /// Override function awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    /// MARK: - Delegates
    
    
    /// MARK: - Personnal Delegates
    
    
    /// Complex constructor for the cell
    ///
    /// - Parameters:
    ///   - withPrimaryColor: UIColor? - The primary color
    ///   - andSecondaryColor: UIColor? - The secondary color
    ///   - withPlainButton: Bool - If you want this item
    /// - Returns: RoundedButtonCell - The created cell
    open static func buttonCell(withPrimaryColor: UIColor?, andSecondaryColor: UIColor?, withStoryboardIDpage: String?) -> RoundedButtonAnimationCell {
        let nibs = DataBundle.bundle.loadNibNamed("RoundedButtonAnimationCell", owner: self, options: nil)
        let cell: RoundedButtonAnimationCell = nibs![0] as! RoundedButtonAnimationCell
        cell.selectionStyle = .none
        
        if let p = withPrimaryColor {
            cell.primaryColor = p
        }
        
        if let s = andSecondaryColor {
            cell.secondaryColor = s
        }
        
        if let v = withStoryboardIDpage {
            cell.storyboardIDpage = v
        }
        
        initialize(cell: cell)
        
        return cell
    }
    
    /// MARK: - Delegates
    
    
    /// MARK: - Personnal Delegates
    

    /// Initialize function for animation button
    ///
    /// - Parameter cell: nil
    func animateButton() {
        button.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        /* Setup animation button */
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.button.transform = .identity
            },
                       completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            /* Put your code which should be executed with a delay here */
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initViewController: UIViewController = storyBoard.instantiateViewController(withIdentifier: self.storyboardIDpage)
            self.window?.rootViewController? = initViewController
        })
        
    }
    
    
    
    /// Initialize function for plain button
    ///
    /// - Parameter cell: RoundedButtonCell - The cell
    private static func initialize(cell: RoundedButtonAnimationCell) {
        /* Setup outlined button */
        cell.button.layer.borderColor = cell.primaryColor.cgColor
        cell.button.layer.borderWidth = 1.0
        cell.button.layer.cornerRadius = 15.0
        cell.button.backgroundColor = cell.secondaryColor
        cell.button.setTitleColor(cell.primaryColor, for: .normal)
    }
}
