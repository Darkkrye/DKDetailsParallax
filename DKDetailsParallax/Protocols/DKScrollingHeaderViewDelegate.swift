//
//  DKScrollingHeaderViewDelegate.swift
//  DKDetailsParallax
//
//  Created by Pierre on 12/01/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import UIKit

@objc public protocol DKScrollingHeaderViewDelegate: NSObjectProtocol {
    func detailsPage(scrollingHeaderView: DKScrollingHeaderView, headerImageView imageView: UIImageView)
    @objc optional func detailsPage(scrollingHeaderView: DKScrollingHeaderView, headerImageWasSelected imageView: UIImageView)
}
