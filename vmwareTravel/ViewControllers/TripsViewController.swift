//
//  TripsViewController.swift
//  vmwareTravel
////
import UIKit

class TripsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // We register a listener to updates in the datastore
        // so we can reload the table
        TripsStore.shared.registerUpdatesObserver {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            // It's about to do a transition to details
            // we need to pass the current selected note
            // "details" is registered in the segue (transition arrow) in the Storyboard
            
            let details = segue.destination as! TripsDetailsViewController
            let currentSelectedIndex = tableView.indexPathForSelectedRow!.row
            let trip = TripsStore.shared.trips[currentSelectedIndex]

            details.trip = trip
            
        }
    }

    
    // MARK: - TableView functions

    override func numberOfSections(in tableView: UITableView) -> Int {
        1 // there is an implicit return
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TripsStore.shared.trips.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell")
        let trip = TripsStore.shared.trips[indexPath.row]
        cell?.textLabel?.text = trip.name
        return cell!
    }
    
    
  

}
