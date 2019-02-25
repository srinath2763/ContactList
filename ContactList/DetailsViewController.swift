//
//  DetailsViewController.swift
//  ContactList
//
//  Created by IMCS2 on 2/24/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var firstName:String?
    @IBOutlet weak var firstNameLabel: UILabel!
    
    var lastName:String?
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    var number:String?
    
    var email:String?
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        firstNameLabel.text = firstName
        lastNameLabel.text = lastName
        numberLabel.text = number
        emailLabel.text = email
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
