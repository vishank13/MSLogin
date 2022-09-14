//
//  HomeViewController.swift
//  MSDemo
//
//  Created by Vishank Raghav on 9/14/22.
//

import UIKit

class HomeViewController: UIViewController {

    // ------------------------------
    // MARK: Outlets
    // ------------------------------
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    // ------------------------------
    // MARK: Properties
    // ------------------------------
    var user: LoginAPIResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // ------------------------------
    // MARK: Setup
    // ------------------------------
    func setUp() {
        titleLabel.text = "Welcome"
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.layer.cornerRadius = 10
        
        if let user = user, let name = user.name, let email = user.email, let contactNumber = user.contactNumber {
            titleLabel.text = "Welcome, \(name)"
            emailLabel.text = "Email: \(email)"
            contactNumberLabel.text = "Contact Number: \(contactNumber)"
        } else {
            emailLabel.text = ""
            contactNumberLabel.text = ""
        }
    }
    
    // ------------------------------
    // MARK: Action Outlets
    // ------------------------------
    @IBAction func logoutPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
