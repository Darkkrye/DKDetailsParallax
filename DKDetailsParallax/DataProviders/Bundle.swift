//
//  Bundle.swift
//  DKDetailsParallax
//
//  Created by Pierre on 12/01/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import Foundation

public class DKDetailsParallax {
    public static func bundle() -> Bundle? {
        let frameworkBundle = Bundle(for: DKDetailsParallax.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("DKDetailsParallax.bundle", isDirectory: true)
        let resourceBundle = Bundle(url: bundleURL!)
        return resourceBundle
        
        /*let podBundle = Bundle(for: DKDetailsParallax.self)
         let bundleURL = podBundle.url(forResource: "DKDetailsParallax", withExtension: "bundle")
         return Bundle(url: bundleURL!)!*/
    }
}
