//
//  DetailViewController.swift
//  PersonsListTableView
//
//  Created by Igor Makeev on 10.06.2021.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var personData: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "userPic")
        nameLabel.text = personData.name
        surnameLabel.text = personData.surname
        phoneNumberLabel.text = personData.phoneNumber
        emailLabel.text = personData.email
    }
}
