//
//  TripsStore.swift
//  vmwareTravel
//
//

import Foundation

class TripsStore {
    // Singleton instance
    public static let shared = TripsStore()
    var trips : [Trip] = []   // It's a mutable collection (var)
    var observers: [()->Void] = []
    
    func registerUpdatesObserver(obs: @escaping ()->Void) {
        observers.append(obs)
    }
        
    func add(trip: Trip) {
        trips.append(trip)
        save()
    }
    
    func delete(trip: Trip) {
        if let index = findIndex(trip) {
            trips.remove(at: index)
            save()
        }
    }
    
    func findIndex(_ trip: Trip) -> Int? {
        for (index, current) in trips.enumerated() {
            if (trip === current) {
                return index
            }
        }
        return nil
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let json = try? encoder.encode(trips) {
            UserDefaults.standard.setValue(json, forKey: "trips")
        } // it saves the data if it can be converted into JSON
        
        // Executes all observers
        observers.forEach { (observer) in
            observer()
        }
    }
    
    func load() {
        if let data = UserDefaults.standard.data(forKey: "trips") {
            let decoder = JSONDecoder()
            if let savedTrips = try? decoder.decode([Trip].self, from: data) {
                trips = savedTrips
            } // it loads data and convert from JSON into the array
        }
    }
    
    // We put the initializer private to avoid creating more stores
    private init() {
        load()
    }
}
