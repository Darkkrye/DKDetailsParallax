//
//  DKScrollingHeaderView.swift
//  DKDetailsParallax
//
//  Created by Pierre on 12/01/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import UIKit

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
    var delegate: DKScrollingHeaderViewDelegate?
    
    var imageView: UIImageView?
    var imageButton: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initialize()
        
    }
    
    func initialize() {
        self.headerImageViewHeight = DKScrollingHeaderView.kDefaultImagePagerHeight
        self.headerImageViewScalingFactor = DKScrollingHeaderView.kDefaultImageScalingFactor;
        self.headerImageViewContentMode = .scaleAspectFit
        
        self.setupTableView()
        self.setupTableViewHeader()
        self.setupImageView()
        
        self.autoresizesSubviews = true
        self.tableView?.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleLeftMargin, .flexibleTopMargin]
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleLeftMargin, .flexibleTopMargin]
    }
    
    open func reloadScrollingHeader() {
        if let d = self.delegate {
            DispatchQueue.main.async {
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
        
        self.navbarViewFadingOffset = self.headerImageViewHeight - (self.navBarView.frame.height + DKScrollingHeaderView.kDefaultTableViewHeaderMargin)
        
        if self.tableView == nil {
            self.setupTableView()
        }
        if self.tableView?.tableHeaderView == nil {
            self.setupTableViewHeader()
        }
        if self.imageView == nil {
            self.setupImageView()
        }
        
        self.setupBackgroundColor()
        self.setupImageButton()
    }
}

// MARK: - Extension for setup methods
extension DKScrollingHeaderView {
    func setupTableView() {
        self.tableView = UITableView(frame: self.bounds)
        
        self.tableView?.backgroundColor = UIColor.clear
        self.tableView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.tableView?.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
        
        self.addSubview(self.tableView!)
    }
    
    func setupTableViewHeader() {
        let tableHeaderViewFrame = CGRect(x: 0, y: 0, width: self.tableView!.frame.size.width, height: self.headerImageViewHeight - DKScrollingHeaderView.kDefaultTableViewHeaderMargin)
        let tableHeaderView = UIView(frame: tableHeaderViewFrame)
        tableHeaderView.backgroundColor = UIColor.clear
        self.tableView?.tableHeaderView = tableHeaderView
    }
    
    func setupImageButton() {
        if self.imageButton == nil {
            self.imageButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.tableView!.frame.size.width, height: self.headerImageViewHeight))
        }
        
        self.imageButton?.addTarget(self, action: #selector(DKScrollingHeaderView.imageButtonPressed(button:)), for: .touchUpInside)
    }
    
    func setupImageView() {
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
        self.backgroundColor = UIColor.clear
        self.tableView?.backgroundColor = UIColor.clear
    }
    
    func setupImageViewGradient() {
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
        if let d = self.delegate {
            d.detailsPage!(scrollingHeaderView: self, headerImageWasSelected: self.imageView!)
        }
    }
}

// MARK: - Extension for setters
extension DKScrollingHeaderView {
    func setNavbarView(navbarView: UIView) {
        if self.navBarView == navbarView {
            return
        }
        
        self.navBarView = navbarView
        
        self.navBarView.alpha = 0
        self.navBarView.isHidden = true
    }
    
    func setHeaderImageViewContentMode(headerImageViewContentMode: UIViewContentMode) {
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
        if (object as! UITableView == self.tableView) && ((keyPath == "contentOffset") == true) {
            self.scrollViewDidScroll(withOffset: self.tableView.contentOffset.y)
            return
        }
    }
}

// MARK: - Extension for ScrollView methods
extension DKScrollingHeaderView {
    func scrollViewDidScroll(withOffset scrollOffset: CGFloat) {
        let scrollViewDragPoint = self.tableView?.contentOffset
        if scrollOffset < 0 {
            self.imageView!.transform = CGAffineTransform(scaleX: 1 - (scrollOffset / self.headerImageViewScalingFactor), y: 1 - (scrollOffset / self.headerImageViewScalingFactor))
        }
        else {
            self.imageView?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        self.animateNavigationBar(scrollOffset, dragging: scrollViewDragPoint!)
    }
    
    func animateNavigationBar(_ scrollOffset: CGFloat, dragging scrollViewDragPoint: CGPoint) {
        if scrollOffset > navbarViewFadingOffset && self.navBarView.alpha == 0.0 {
            self.navBarView.alpha = 0
            self.navBarView.isHidden = false
            UIView.animate(withDuration: 0.3, animations: {() -> Void in
                self.navBarView.alpha = 1
            })
        }
        else if scrollOffset < navbarViewFadingOffset && self.navBarView.alpha == 1.0 {
            UIView.animate(withDuration: 0.3, animations: {() -> Void in
                self.navBarView.alpha = 0
            }, completion: {(_ finished: Bool) -> Void in
                self.navBarView.isHidden = true
            })
        }
        
    }
}
