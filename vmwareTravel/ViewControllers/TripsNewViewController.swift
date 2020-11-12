//
//  TripsNewViewController.swift
//  vmwareTravel
//
/////

import UIKit

class TripsNewViewController: UIViewController {
    @IBOutlet var textName: UITextField!
    @IBOutlet var textDescription: UITextView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func save(_ sender: Any) {
        let trip = Trip(fromName: textName.text!,
                        andDescription: textDescription.text!)
        TripsStore.shared.add(trip: trip)
        dismiss(animated: true) // we close the view controller
                
    }
    
}
