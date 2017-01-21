//
//  Bundle.swift
//  DKDetailsParallax
//
//  Created by Pierre on 12/01/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import Foundation

public class DKDetailsParallax {
    // Return DKDetailsParallax Bundle
    public static func bundle() -> Bundle? {
        // Retrieve Bundle for the current class
        let frameworkBundle = Bundle(for: DKDetailsParallax.self)
        
        // Retrieve Bundle URL
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("DKDetailsParallax.bundle", isDirectory: true)
        
        // Create Bundle for Bundle URL and return it
        let resourceBundle = Bundle(url: bundleURL!)
        return resourceBundle
    }
}
