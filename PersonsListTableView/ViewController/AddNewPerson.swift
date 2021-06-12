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
    
    var newPerson: Person?
    
    override func viewDidLoad() {
        super .viewDidLoad()
    
    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func saveNewPerson(){
        newPerson = Person(name: addNameTextField.text!, surname: addSurnameTextField.text!, phoneNumber: addPhoneNumberTextField.text!, email: addEmailTextField.text!)
    }
}
