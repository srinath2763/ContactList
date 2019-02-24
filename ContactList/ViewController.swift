//
//  ViewController.swift
//  ContactList
//
//  Created by IMCS2 on 2/24/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit
import Contacts
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    //Contact Store                             ???
    var contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let contactToDisplay = contacts[indexPath.row]
        cell.textLabel?.text = contactToDisplay.givenName + contactToDisplay.familyName
        cell.detailTextLabel?.text = contactToDisplay.number
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contactStore.requestAccess(for: .contacts){(success,error) in
            if success{
                print("autorZATION SUCCESSFUL")
            }
        }
        fetchContacts()
    }
    
    
    
    
    //Fetch Contacts
    func fetchContacts(){
        let key = [CNContactGivenNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        try! contactStore.enumerateContacts(with: request){(contact,stoppingPointer) in
        
            let givenName = contact.givenName
            let familyName = contact.familyName
            let number = contact.phoneNumbers.first?.value.stringValue
            let contactToAppend = ContactStruct(givenName: givenName,familyName: familyName,number:number ?? "0")
            self.contacts.append(contactToAppend)
            
        }
        tableView.reloadData()
        
    }

}

