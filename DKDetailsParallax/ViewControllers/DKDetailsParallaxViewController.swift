//
//  DKDetailsParallaxViewController.swift
//  DKDetailsParallax
//
//  Created by Pierre on 11/01/2017.
//  Copyright © 2017 Pierre Boudon. All rights reserved.
//

import UIKit

open class DKDetailsParallaxViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet public weak var scrollingHeaderView: DKScrollingHeaderView!
    @IBOutlet public weak var navBar: UIView!
    @IBOutlet public weak var navBarTitleLabel: UILabel!
    
    // MARK: - Constants
    public let buttonBack = UIButton(type: .custom)
    
    // MARK: - Variables
    public var primaryColor = UIColor.black
    public var secondaryColor = UIColor.gray
    
    public var statusBarHidden = true
    public var loadingView = UIView()
    
    public var navbarTitle = "Title"
    public var headerImage = UIImage(named: "defaultProfile")
    
    public var idObject: Int?
    
    public var object: Any?
    
    public var wantsConfettiDismiss: Bool!
    
    public init(primaryColor: UIColor?, secondaryColor: UIColor?, title: String, headerImage: UIImage?, idObject: Int?, object: Any?, withConfettiDismiss: Bool) {
        super.init(nibName: "DKDetailsParallaxViewController", bundle: DataBundle.bundle)
        
        if let p = primaryColor {
            self.primaryColor = p
        }
        if let s = secondaryColor {
            self.secondaryColor = s
        }
        if let h = headerImage {
            self.headerImage = h
        }
        
        self.navbarTitle = title
        self.idObject = idObject
        self.object = object
        self.wantsConfettiDismiss = withConfettiDismiss
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupLoadingView()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Extension for UITableViewDelegate
extension DKDetailsParallaxViewController: UITableViewDelegate {
    
}


// MARK: - Extension for UITableViewDataSource
extension DKDetailsParallaxViewController: UITableViewDataSource {
    open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


// MARK: - Extension for DKScrollingHeaderViewDelegate
extension DKDetailsParallaxViewController: DKScrollingHeaderViewDelegate {
    open func detailsPage(scrollingHeaderView: DKScrollingHeaderView, headerImageView imageView: UIImageView) {
        imageView.image = self.headerImage
        imageView.contentMode = .scaleAspectFill
    }
}


// MARK: - Extension for DKDetailsParallaxCellsDelegate



// MARK: - Extension for setup methods
extension DKDetailsParallaxViewController {
    public func setupController() {
        self.setupDetailsPageView()
        self.setupNavbarButtons()
    }
    
    func setupLoadingView() {
        self.navBar.alpha = 0
        self.statusBarHidden = true
        self.navBar.backgroundColor = self.primaryColor
        
        self.loadingView.frame = UIScreen.main.bounds
        self.loadingView.backgroundColor = self.primaryColor
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activity.center = self.loadingView.center
        activity.isHidden = false
        activity.startAnimating()
        self.loadingView.insertSubview(activity, aboveSubview: self.loadingView)
        
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: self.view.frame.width, height: 20))
        label.textAlignment = .center
        label.center = self.loadingView.center
        label.frame.origin.y -= 50
        label.text = "Chargement"
        label.textColor = UIColor.white
        self.loadingView.insertSubview(label, aboveSubview: self.loadingView)
        
        self.view.addSubview(self.loadingView)
    }
    
    func setupDetailsPageView() {
        self.scrollingHeaderView.tableView.dataSource = self
        self.scrollingHeaderView.tableView.delegate = self
        self.scrollingHeaderView.delegate = self
        self.scrollingHeaderView.headerImageViewContentMode = .top
        
        self.navBarTitleLabel.text = self.navbarTitle
        
        UIView.animate(withDuration: 1, animations: {() -> Void in
            self.loadingView.alpha = 0
        }, completion: { (boolean) -> Void in
            self.loadingView.removeFromSuperview()
        })
        
        self.scrollingHeaderView.reloadScrollingHeader()
    }
    
    func setupNavbarButtons() {
        let buttonBack = UIButton(type: .custom)
        
        buttonBack.frame = CGRect(x: 20, y: 31, width: 22, height: 22)
        buttonBack.setImage(UIImage(named: "multiply"), for: UIControlState.normal)
        buttonBack.addTarget(self, action: #selector(DKDetailsParallaxViewController.backButton), for: .touchUpInside)
        
        self.view.addSubview(buttonBack)
    }
}

// MARK: - Extension for personal methods
extension DKDetailsParallaxViewController {
    func backButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func isRowVisible() -> Bool {
        guard let indexes = self.scrollingHeaderView.tableView.indexPathsForVisibleRows else {
            return false
        }
        
        for index in indexes {
            if index.row == 0 {
                return true
            }
        }
        
        return false
    }
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !isRowVisible() {
            UIView.animate(withDuration: 0.2, animations: {() -> Void in
                self.navBar.alpha = 1
                self.statusBarHidden = false
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.2, animations: {() -> Void in
                self.navBar.alpha = 0
                self.statusBarHidden = true
            }, completion: nil)
        }
        
        var fixedButtonFrame = self.buttonBack.frame
        fixedButtonFrame.origin.y = 31 + scrollView.contentOffset.y
        self.buttonBack.frame = fixedButtonFrame
    }
}