//
//  DKDetailsParallaxCellDelegate.swift
//  DKDetailsParallax
//
//  Created by Pierre on 17/01/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import Foundation

@objc public protocol DKDetailsParallaxCellDelegate: NSObjectProtocol {
    
    // MARK: - Rounded Theme
    // MARK: RoundedDetailsProfileCell
    @objc optional func roundedDetailsProfileCellCallback(cell: RoundedDetailsProfileCell, forCircleButton: UIButton)
    @objc optional func roundedDetailsProfileCellCallback(cell: RoundedDetailsProfileCell, forOutlinedButton: UIButton)
    @objc optional func roundedDetailsProfileCellCallback(cell: RoundedDetailsProfileCell, forPlainButton: UIButton)
    
    // MARK: RoundedDetailsRectangleProfileCell
    @objc optional func roundedDetailsRectangleProfileCellCallback(cell: RoundedDetailsRectangleProfileCell, forCircleButton: UIButton)
    @objc optional func roundedDetailsRectangleProfileCellCallback(cell: RoundedDetailsRectangleProfileCell, forOutlinedButton: UIButton)
    @objc optional func roundedDetailsRectangleProfileCellCallback(cell: RoundedDetailsRectangleProfileCell, forPlainButton: UIButton)
    
    // MARK: RoundedButtonCell
    @objc optional func roundedButtonCellCallback(cell: RoundedButtonCell, forButton: UIButton)
    
    /* ------------------------------------------------------------------------------------------------------------------------------------------ */
    
    // MARK: - Flat Light Theme
    // FlatLightSwitchCell
    @objc optional func flatLightSwitchCellCallback(cell: FlatLightSwitchCell, onSwitchUpdate: Switch, toTheValue: String)
    
    /* ------------------------------------------------------------------------------------------------------------------------------------------ */
    
    // MARK: - Flat Light Theme
    // FlatDarkSwitchCell
    @objc optional func flatDarkSwitchCellCallback(cell: FlatDarkSwitchCell, onSwitchUpdate: Switch, toTheValue: String)
}
