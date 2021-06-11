//
//  AddNewPerson.swift
//  PersonsListTableView
//
//  Created by Igor Makeev on 11.06.2021.
//

import UIKit

class AddNewPerson: UIViewController{
    
    @IBOutlet weak var addNameTextField: UITextField!
    @IBOutlet weak var addSurnameTextField: UITextField!
    @IBOutlet weak var addPhoneNumberTextField: UITextField!
    @IBOutlet weak var addEmailTextField: UITextField!
    
    var person: Person!
    
    override func viewDidLoad() {
        super .viewDidLoad()
    
    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }

    
}
