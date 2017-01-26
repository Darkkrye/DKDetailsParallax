//
//  DKScrollingHeaderViewDelegate.swift
//  DKDetailsParallax
//
//  Created by Pierre on 12/01/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import UIKit

/// DKScrollingHeaderView Delegate
@objc public protocol DKScrollingHeaderViewDelegate: NSObjectProtocol {
    /* Callback function for DKScrollingHeaderView */
    /// Callback / Datasource for the headerView
    ///
    /// - Parameters:
    ///   - scrollingHeaderView: DKScrollingHeaderView - The scrolling header view
    ///   - imageView: UIImageView - Header image view
    ///   - blurredImageView: UIImageView - Blurred header image view
    func detailsPage(scrollingHeaderView: DKScrollingHeaderView, headerImageView imageView: UIImageView, blurredImageView: UIImageView)
    /// Callback when header image view is selected
    ///
    /// - Parameters:
    ///   - scrollingHeaderView: DKScrollingHeaderView - The scrolling header view
    ///   - imageView: UIImageView - The selected image view
    @objc optional func detailsPage(scrollingHeaderView: DKScrollingHeaderView, headerImageWasSelected imageView: UIImageView)
}
