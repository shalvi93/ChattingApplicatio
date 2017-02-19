//
//  FavoriteViewController.swift
//  ChattingApplication
//
//  Created by Aseem 14 on 18/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import ContactsUI

class FavoriteViewController: UIViewController,CNContactPickerDelegate
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cnPicker = CNContactPickerViewController()
        cnPicker.delegate = self
        self.present(cnPicker, animated: true, completion: nil)
        
        
    }
    
    
    
    let contacts: [CNContact] = {
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactEmailAddressesKey,
            CNContactPhoneNumbersKey,
            CNContactImageDataAvailableKey,
            CNContactThumbnailImageDataKey] as [Any]
        
        // Get all the containers
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            print("Error fetching containers")
        }
        
        var results: [CNContact] = []
        
        // Iterate all containers and append their contacts to our results array
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                results.append(contentsOf: containerResults)
                //myContacts.append(contentsOf: containerResults)
            } catch {
                print("Error fetching results for container")
            }
        }
        return results
        
    }()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
}
