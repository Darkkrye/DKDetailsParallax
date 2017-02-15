//
//  DKDetailsParallaxCellDelegate.swift
//  DKDetailsParallax
//
//  Created by Pierre on 17/01/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import Foundation
/// DKDetailsParallaxCell Delegate
@objc public protocol DKDetailsParallaxCellDelegate: NSObjectProtocol {
    
    /* MARK: - TopImage Theme */
    /// MARK: TopImageProfileCell
    /// Callback when outlined button is selected
    ///
    /// - Parameters:
    ///   - cell: CenterImageDetailsProfileCell - The cell
    ///   - forOutlinedButton: UIButton - The button
    @objc optional func topImageDetailsTextProfileCellCallback(cell: TopImageDetailsTextProfileCell, forLeftButton: UIButton)
    /// Callback when plain button is selected
    ///
    /// - Parameters:
    ///   - cell: CenterImageDetailsProfileCell - The cell
    ///   - forPlainButton: UIButton - The button
    @objc optional func topImageDetailsTextProfileCellCallback(cell: TopImageDetailsTextProfileCell, forRightButton: UIButton)
    
    /* MARK: - TopImage Theme */
    /// MARK: TopImageProfileCell
    /// Callback when outlined button is selected
    ///
    /// - Parameters:
    ///   - cell: CenterImageDetailsProfileCell - The cell
    ///   - forOutlinedButton: UIButton - The button
    @objc optional func topImageDetailsProfileCellCallback(cell: TopImageDetailsProfileCell, forRightButton: UIButton)
    /// Callback when plain button is selected
    ///
    /// - Parameters:
    ///   - cell: CenterImageDetailsProfileCell - The cell
    ///   - forPlainButton: UIButton - The button
    @objc optional func topImageDetailsProfileCellCallback(cell: TopImageDetailsProfileCell, forLeftButton: UIButton)
    
    /* MARK: - CenterImage Theme */
    /// MARK: CenterImageProfileCell
    /// Callback when outlined button is selected
    ///
    /// - Parameters:
    ///   - cell: CenterImageDetailsProfileCell - The cell
    ///   - forOutlinedButton: UIButton - The button
    @objc optional func centerImageDetailsProfileCellCallback(cell: CenterImageDetailsProfileCell, forLeftButton: UIButton)
    /// Callback when plain button is selected
    ///
    /// - Parameters:
    ///   - cell: CenterImageDetailsProfileCell - The cell
    ///   - forPlainButton: UIButton - The button
    @objc optional func centerImageDetailsProfileCellCallback(cell: CenterImageDetailsProfileCell, forRightButton: UIButton)
    
    /* MARK: - Rounded Theme */
    /// MARK: RoundedDetailsProfileCell
    /// Callback when circle button is selected
    ///
    /// - Parameters:
    ///   - cell: RoundedDetailsProfileCell - The cell
    ///   - forCircleButton: UIButton - The button
    @objc optional func roundedDetailsProfileCellCallback(cell: RoundedDetailsProfileCell, forCircleButton: UIButton)
    /// Callback when outlined button is selected
    ///
    /// - Parameters:
    ///   - cell: RoundedDetailsProfileCell - The cell
    ///   - forOutlinedButton: UIButton - The button
    @objc optional func roundedDetailsProfileCellCallback(cell: RoundedDetailsProfileCell, forOutlinedButton: UIButton)
    /// Callback when plain button is selected
    ///
    /// - Parameters:
    ///   - cell: RoundedDetailsProfileCell - The cell
    ///   - forPlainButton: UIButton - The button
    @objc optional func roundedDetailsProfileCellCallback(cell: RoundedDetailsProfileCell, forPlainButton: UIButton)
    
    /// MARK: RoundedDetailsRectangleProfileCell
    /// Callback when circle button is selected
    ///
    /// - Parameters:
    ///   - cell: RoundedDetailsRectangleProfileCell - The cell
    ///   - forCircleButton: UIButton - The button
    @objc optional func roundedDetailsRectangleProfileCellCallback(cell: RoundedDetailsRectangleProfileCell, forCircleButton: UIButton)
    /// Callback when outlined button is selected
    ///
    /// - Parameters:
    ///   - cell: RoundedDetailsRectangleProfileCell - The cell
    ///   - forOutlinedButton: UIButton - The button
    @objc optional func roundedDetailsRectangleProfileCellCallback(cell: RoundedDetailsRectangleProfileCell, forOutlinedButton: UIButton)
    /// Callback when plain button is selected
    ///
    /// - Parameters:
    ///   - cell: RoundedDetailsRectangleProfileCell - The cell
    ///   - forPlainButton: UIButton - The button
    @objc optional func roundedDetailsRectangleProfileCellCallback(cell: RoundedDetailsRectangleProfileCell, forPlainButton: UIButton)
    
    /// MARK: RoundedButtonCell
    /// Callback when the button is selected
    ///
    /// - Parameters:
    ///   - cell: RoundedButtonCell - The cell
    ///   - forButton: UIButton - The button
    @objc optional func roundedButtonCellCallback(cell: RoundedButtonCell, forButton: UIButton)
    
    /* ------------------------------------------------------------------------------------------------------------------------------------------ */
    
    /* MARK: - Flat Light Theme */
    /// FlatLightSwitchCell
    /// Callback when the switch value changed
    ///
    /// - Parameters:
    ///   - cell: FlatLightSwitchCell - The cell
    ///   - onSwitchUpdate: Switch - The switch
    ///   - toTheValue: String - The value
    @objc optional func flatLightSwitchCellCallback(cell: FlatLightSwitchCell, onSwitchUpdate: Switch, toTheValue: String)
    
    /* ------------------------------------------------------------------------------------------------------------------------------------------ */
    
    /* MARK: - Flat Light Theme */
    /// FlatDarkSwitchCell
    /// Callback when the switch value changed
    ///
    /// - Parameters:
    ///   - cell: FlatLightSwitchCell - The cell
    ///   - onSwitchUpdate: Switch - The switch
    ///   - toTheValue: String - The value
    @objc optional func flatDarkSwitchCellCallback(cell: FlatDarkSwitchCell, onSwitchUpdate: Switch, toTheValue: String)
}
