//
//  DKScrollingHeaderView.swift
//  DKDetailsParallax
//
//  Created by Pierre on 12/01/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import UIKit

// Scrolling HeaderView
open class DKScrollingHeaderView: UIView, UIScrollViewDelegate {
    
    // Constants
    static let kDefaultImagePagerHeight: CGFloat = 375
    static let kDefaultTableViewHeaderMargin: CGFloat = 95
    static let kDefaultImageScalingFactor: CGFloat = 450
    
    // Variables
    var headerImageViewHeight: CGFloat = 0
    var headerImageViewScalingFactor: CGFloat = 0
    var navbarViewFadingOffset: CGFloat = 0
    public var tableView: UITableView!
    var navBarView: UIView = UIView()
    var headerImageViewContentMode: UIViewContentMode = .scaleAspectFit
    public var delegate: DKScrollingHeaderViewDelegate?
    
    var imageView: UIImageView?
    var imageButton: UIButton?
    
    // Constructors
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Call initialize function
        self.initialize()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Call initialize function
        self.initialize()
        
    }
    
    func initialize() {
        // Set headerImageView
        self.headerImageViewHeight = DKScrollingHeaderView.kDefaultImagePagerHeight
        self.headerImageViewScalingFactor = DKScrollingHeaderView.kDefaultImageScalingFactor;
        self.headerImageViewContentMode = .scaleAspectFit
        
        // Call all the setup functions
        self.setupTableView()
        self.setupTableHeaderView()
        self.setupImageView()
        
        // Add some properties to the variables
        self.autoresizesSubviews = true
        self.tableView?.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleLeftMargin, .flexibleTopMargin]
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleLeftMargin, .flexibleTopMargin]
    }
    
    open func reloadScrollingHeader() {
        // Reload scrolling header and tableview
        if let d = self.delegate {
            DispatchQueue.main.async { // Need to execute in main thread
                d.detailsPage(scrollingHeaderView: self, headerImageView: self.imageView!)
            }
        }
        
        self.tableView?.reloadData()
    }
}

// MARK: - Extension for view layout
extension DKScrollingHeaderView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        // Set properties for the headerView
        self.navbarViewFadingOffset = self.headerImageViewHeight - (self.navBarView.frame.height + DKScrollingHeaderView.kDefaultTableViewHeaderMargin)
        
        // Check for tableView and imageView and set up
        if self.tableView == nil {
            self.setupTableView()
        }
        if self.tableView?.tableHeaderView == nil {
            self.setupTableHeaderView()
        }
        if self.imageView == nil {
            self.setupImageView()
        }
        
        // Call other setup functions
        self.setupBackgroundColor()
        self.setupImageButton()
    }
}

// MARK: - Extension for setup methods
extension DKScrollingHeaderView {
    func setupTableView() {
        // Setup properties for the tableView
        self.tableView = UITableView(frame: self.bounds)
        
        self.tableView?.backgroundColor = UIColor.clear
        self.tableView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.tableView?.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
        
        self.addSubview(self.tableView!)
    }
    
    func setupTableHeaderView() {
        // Setup properties for the tableHeaderView
        let tableHeaderViewFrame = CGRect(x: 0, y: 0, width: self.tableView!.frame.size.width, height: self.headerImageViewHeight - DKScrollingHeaderView.kDefaultTableViewHeaderMargin)
        let tableHeaderView = UIView(frame: tableHeaderViewFrame)
        tableHeaderView.backgroundColor = UIColor.clear
        self.tableView?.tableHeaderView = tableHeaderView
    }
    
    func setupImageButton() {
        // Setup Image Button
        if self.imageButton == nil {
            self.imageButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.tableView!.frame.size.width, height: self.headerImageViewHeight))
        }
        
        self.imageButton?.addTarget(self, action: #selector(DKScrollingHeaderView.imageButtonPressed(button:)), for: .touchUpInside)
    }
    
    func setupImageView() {
        // Setup properties for ImageView
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.tableView!.frame.size.width, height: self.headerImageViewHeight))
        self.imageView?.backgroundColor = UIColor.black
        self.imageView?.autoresizingMask = .flexibleWidth
        self.imageView?.clipsToBounds = true
        self.imageView?.contentMode = self.headerImageViewContentMode
        
        self.insertSubview(self.imageView!, belowSubview: self.tableView!)
        
        if let d = self.delegate {
            d.detailsPage(scrollingHeaderView: self, headerImageView: self.imageView!)
        }
    }
    
    func setupBackgroundColor() {
        // Setup the backgrounds colors
        self.backgroundColor = UIColor.clear
        self.tableView?.backgroundColor = UIColor.clear
    }
    
    func setupImageViewGradient() {
        // Setup the image view gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.imageView!.bounds
        gradientLayer.colors = [(UIColor(red: CGFloat(0), green: CGFloat(0), blue: CGFloat(0), alpha: CGFloat(1)).cgColor as Any), (UIColor(red: CGFloat(0), green: CGFloat(0), blue: CGFloat(0), alpha: CGFloat(0)) as Any)]
        
        gradientLayer.startPoint = CGPoint(x: 0.6, y: 0.6)
        gradientLayer.endPoint = CGPoint(x: 0.6, y: 1)
        
        self.imageView?.layer.mask = gradientLayer
    }
}

// MARK: - Extension for personal methods
extension DKScrollingHeaderView {
    func imageButtonPressed(button: UIButton) {
        // Delegate for header image view tapped
        if let d = self.delegate {
            d.detailsPage!(scrollingHeaderView: self, headerImageWasSelected: self.imageView!)
        }
    }
}

// MARK: - Extension for setters
extension DKScrollingHeaderView {
    func setNavbarView(navbarView: UIView) {
        // Setup properties for navBarView
        if self.navBarView == navbarView {
            return
        }
        
        self.navBarView = navbarView
        
        self.navBarView.alpha = 0
        self.navBarView.isHidden = true
    }
    
    func setHeaderImageViewContentMode(headerImageViewContentMode: UIViewContentMode) {
        // Set header image view content mode
        if self.headerImageViewContentMode == headerImageViewContentMode {
            return
        }
        
        self.headerImageViewContentMode = headerImageViewContentMode
        self.imageView!.contentMode = self.headerImageViewContentMode
    }
}

// MARK: - Extension for KVO methods
extension DKScrollingHeaderView {
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        // Observe value for scrolling
        if (object as! UITableView == self.tableView) && ((keyPath == "contentOffset") == true) {
            self.scrollViewDidScroll(withOffset: self.tableView.contentOffset.y)
            return
        }
    }
}

// MARK: - Extension for ScrollView methods
extension DKScrollingHeaderView {
    func scrollViewDidScroll(withOffset scrollOffset: CGFloat) {
        // Execute when scrolling
        let scrollViewDragPoint = self.tableView?.contentOffset
        if scrollOffset < 0 {
            self.imageView!.transform = CGAffineTransform(scaleX: 1 - (scrollOffset / self.headerImageViewScalingFactor), y: 1 - (scrollOffset / self.headerImageViewScalingFactor))
        }
        else {
            self.imageView?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        
        // Call animateNavigation to Show / Hide navbar
        self.animateNavigationBar(scrollOffset, dragging: scrollViewDragPoint!)
    }
    
    func animateNavigationBar(_ scrollOffset: CGFloat, dragging scrollViewDragPoint: CGPoint) {
        // Hide / Show navigation bar when scrolling
        if scrollOffset > navbarViewFadingOffset && self.navBarView.alpha == 0.0 {
            // Show the navbar
            self.navBarView.alpha = 0
            self.navBarView.isHidden = false
            UIView.animate(withDuration: 0.3, animations: {() -> Void in
                self.navBarView.alpha = 1
            })
        }
        else if scrollOffset < navbarViewFadingOffset && self.navBarView.alpha == 1.0 {
            // Hide the navbar
            UIView.animate(withDuration: 0.3, animations: {() -> Void in
                self.navBarView.alpha = 0
            }, completion: {(_ finished: Bool) -> Void in
                self.navBarView.isHidden = true
            })
        }
        
    }
}
