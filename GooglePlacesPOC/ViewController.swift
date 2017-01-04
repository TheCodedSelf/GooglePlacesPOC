//
//  ViewController.swift
//  GooglePlacesPOC
//
//  Created by Keegan Rush on 2017/01/03.
//  Copyright © 2017 thecodedself. All rights reserved.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController {
    
    var southAfricanRegionAutocompleteFilter: GMSAutocompleteFilter {
        let autocompleteFilter = GMSAutocompleteFilter()
        autocompleteFilter.type = .region
        autocompleteFilter.country = "ZA"
        return autocompleteFilter
    }
    
    override func viewDidLoad() {
        GMSPlacesClient.provideAPIKey(<#Key goes here#>)
    }

    // Present the Autocomplete view controller when the button is pressed.
    @IBAction func autocompleteClicked(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        autocompleteController.autocompleteFilter = southAfricanRegionAutocompleteFilter
        present(autocompleteController, animated: true, completion: nil)
    }
    
}

extension ViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
