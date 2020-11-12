//
//  TripsDetailsViewController.swift
//  vmwareTravel
////
import UIKit

class TripsDetailsViewController: UIViewController {
    
    @IBOutlet var textDescription: UITextView!
    var trip: Trip!  // it's empty initially but we expect it to be there

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = trip.name
        self.textDescription.text = trip.description
    }

    @IBAction func deleteTrip(_ sender: Any) {
        let confirmDialog = UIAlertController(title: "Deleting this Trip", message: "Are you sure you want to delete this trip. This action can't be reversed", preferredStyle: .alert)
        confirmDialog.addAction(UIAlertAction(title: "No", style: .cancel))
        confirmDialog.addAction(UIAlertAction(title: "YES", style: .destructive, handler: { (action) in
            TripsStore.shared.delete(trip: self.trip)
            // we go bak to the list after it was deleted
            self.navigationController?.popViewController(animated: true)
            
        }))
        present(confirmDialog, animated: true)
    }
    
}
