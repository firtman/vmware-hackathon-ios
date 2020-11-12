//
//  HomeViewController.swift
//  vmwareTravel
//
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logout(_ sender: Any) {
        // We remove current view controller from the stack
        self.dismiss(animated: true)
    }
    
}
