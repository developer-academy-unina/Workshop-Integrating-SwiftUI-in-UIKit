//
//  ViewController.swift
//  Demo
//
//  Created by Giovanni Monaco on 10/02/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func segueToSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView())
    }
    
    
    @IBSegueAction func segueToSwiftUIViewUsingContainerView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView())
    }
    
}

