//
//  BookSplitVC.swift
//  TapaBook
//
//  Created by Alexander Scanlan on 10/10/2016.
//  Copyright © 2016 Alexander Scanlan. All rights reserved.
//

import UIKit

// this class is needed to stop UISplitView from loading the Detail screen first on Portrait devices, i hate iOS
class BookSplitVC: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        
        return true
    }
    
}
