//
//  DKDetailsParallaxViewController.swift
//  DKDetailsParallax
//
//  Created by Pierre on 11/01/2017.
//  Copyright © 2017 Pierre Boudon. All rights reserved.
//

import UIKit

/// DKDetailsParallaxViewController class
open class DKDetailsParallaxViewController: UIViewController {
    
    /* MARK: - IBOutlets */
    @IBOutlet public weak var scrollingHeaderView: DKScrollingHeaderView!
    @IBOutlet public weak var navBar: UIView!
    @IBOutlet public weak var navBarTitleLabel: UILabel!
    
    /* MARK: - Constants */
    public let buttonBack = UIButton(type: .custom)
    
    /* MARK: - Variables */
    public var primaryColor = UIColor.black
    public var secondaryColor = UIColor.gray
    
    public var statusBarHidden = true
    public var loadingView = UIView()
    
    public var navbarTitle = "Title"
    public var headerImage = UIImage(named: "defaultProfile")
    
    public var idObject: Int?
    
    public var object: Any?
    
    public var wantsConfettiDismiss: Bool!
    
    /* MARK: - Constructors */
    /// Constructor for the controller
    ///
    /// - Parameters:
    ///   - primaryColor: UIColor? - The primary color
    ///   - secondaryColor: UIColor? - The secondary color
    ///   - title: String - The title of the controller
    ///   - headerImage: UIImage? - The header image
    ///   - idObject: Int? - The id of the object (You could need it for some reasons)
    ///   - object: Any? - The object you want to details in case you already have it. You have to cast it in your subclass
    ///   - withConfettiDismiss: Bool - If you want the confetti dismiss
    public init(primaryColor: UIColor?, secondaryColor: UIColor?, title: String, headerImage: UIImage?, idObject: Int?, object: Any?, withConfettiDismiss: Bool) {
        /* Super init with the DKDetailsParallaxViewController xib */
        super.init(nibName: "DKDetailsParallaxViewController", bundle: DKDetailsParallax.bundle())
        
        /* Set colors */
        if let p = primaryColor {
            self.primaryColor = p
        }
        if let s = secondaryColor {
            self.secondaryColor = s
        }
        /* Set header image view */
        if let h = headerImage {
            self.headerImage = h
        }
        
        /* Set other properties */
        self.navbarTitle = title
        self.idObject = idObject
        self.object = object
        self.wantsConfettiDismiss = withConfettiDismiss
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        /* Init coder */
    }

    /// Override function viewDidLoad
    override open func viewDidLoad() {
        super.viewDidLoad()

        /* Do any additional setup after loading the view. */
        self.setupLoadingView()
    }

    /// Override function didReceiveMemoryWarning
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        /* Dispose of any resources that can be recreated. */
    }
}

/* MARK: - Extension for UITableViewDelegate */
extension DKDetailsParallaxViewController: UITableViewDelegate {
    
}


/* MARK: - Extension for UITableViewDataSource */
extension DKDetailsParallaxViewController: UITableViewDataSource {
    /// Number of sections for UITableViewDataSource
    /// You don't need to override it.
    ///
    /// - Parameter tableView: UITableView - The table view
    /// - Returns: Int - Number of section you want
    open func numberOfSections(in tableView: UITableView) -> Int {
        /* Return default section number - Not need to be overriden */
        return 1
    }
    
    /// Number of rows in section for UITableViewDataSource
    /// You NEED to override this function
    ///
    /// - Parameters:
    ///   - tableView: UITableView - The table view
    ///   - section: Int - The section
    /// - Returns: Int - Number of rows you want
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /* Return 100 cells by default - Needs to be overriden */
        return 100
    }
    
    /// Cell for row for UITableViewDataSource
    /// You NEED to override it
    /// You have to setup all of the cells you want in it
    ///
    /// - Parameters:
    ///   - tableView: UITableView - The table view
    ///   - indexPath: IndexPath - The current index path
    /// - Returns: UITableViewCell - The cell you've just created
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* Return empty cell by default - Need to be overriden */
        return UITableViewCell()
    }
}


/* MARK: - Extension for DKScrollingHeaderViewDelegate  */
extension DKDetailsParallaxViewController: DKScrollingHeaderViewDelegate {
    /// Details page for DKScrollingHeaderView Delegate
    ///
    /// - Parameters:
    ///   - scrollingHeaderView: DKScrollingHeaderView - The scrolling header
    ///   - imageView: UIImageView - The header image
    ///   - blurredImageView: UIImageView - The blurred image
    public func detailsPage(scrollingHeaderView: DKScrollingHeaderView, headerImageView imageView: UIImageView, blurredImageView: UIImageView) {
        /* Delegate to set header image view - (Datasource) */
        imageView.image = self.headerImage
        imageView.contentMode = .scaleAspectFill
        blurredImageView.image = self.headerImage
        blurredImageView.contentMode = .scaleAspectFill
    }
}


/* MARK: - Extension for DKDetailsParallaxCellsDelegate */



/* MARK: - Extension for setup methods */
extension DKDetailsParallaxViewController {
    /// Function for setup the Controller
    public func setupController() {
        /* Call other setup functions that are privates. Allows to have only this function to public. */
        self.setupDetailsPageView()
        self.setupNavbarButtons()
    }
    
    /// Function for setup the Loading View
    func setupLoadingView() {
        /* Setup loading view information */
        self.navBar.alpha = 0
        self.statusBarHidden = true
        self.navBar.backgroundColor = self.primaryColor
        
        self.loadingView.frame = UIScreen.main.bounds
        self.loadingView.backgroundColor = self.primaryColor
        
        /* Create activity indicator */
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activity.center = self.loadingView.center
        activity.isHidden = false
        activity.startAnimating()
        self.loadingView.insertSubview(activity, aboveSubview: self.loadingView)
        
        /* Create label */
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: self.view.frame.width, height: 20))
        label.textAlignment = .center
        label.center = self.loadingView.center
        label.frame.origin.y -= 50
        label.text = "Chargement"
        label.textColor = UIColor.white
        self.loadingView.insertSubview(label, aboveSubview: self.loadingView)
        
        /* Add to subview */
        self.view.addSubview(self.loadingView)
    }
    
    /// Function for setup the Details Page View
    func setupDetailsPageView() {
        /* Setup scrolling header view properties */
        self.scrollingHeaderView.tableView.dataSource = self
        self.scrollingHeaderView.tableView.delegate = self
        self.scrollingHeaderView.delegate = self
        self.scrollingHeaderView.headerImageViewContentMode = .top
        
        self.navBarTitleLabel.text = self.navbarTitle
        
        /* Remove Loading view */
        UIView.animate(withDuration: 1, animations: {() -> Void in
            self.loadingView.alpha = 0
        }, completion: { (boolean) -> Void in
            self.loadingView.removeFromSuperview()
        })
        
        /* Reload scrolling header in case of modification. */
        self.scrollingHeaderView.reloadScrollingHeader()
    }
    
    /// Function for setup the Navbar buttons
    func setupNavbarButtons() {
        /* Setup the cross back button */
        let buttonBack = UIButton(type: .custom)
        
        buttonBack.frame = CGRect(x: 20, y: 31, width: 22, height: 22)
        buttonBack.setImage(UIImage(named: "multiply"), for: UIControlState.normal)
        buttonBack.addTarget(self, action: #selector(DKDetailsParallaxViewController.backButton), for: .touchUpInside)
        
        self.view.addSubview(buttonBack)
    }
}

/* MARK: - Extension for personal methods */
extension DKDetailsParallaxViewController {
    /// Function for dismiss the Controller
    func backButton() {
        /* Dismiss the view controller */
        self.dismiss(animated: true, completion: nil)
    }
    
    /// Personal function to know if the first a cell is visible
    ///
    /// - Returns: Bool - If the first cell is visible or not
    func isRowVisible() -> Bool {
        /* Personal method to check is a row is currently visible */
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
    
    /// Function executed when the user's scrolling through the table view
    ///
    /// - Parameter scrollView: UIScrollView - The scroll view
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        /* Personal method to do things when the view did scroll. */
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
