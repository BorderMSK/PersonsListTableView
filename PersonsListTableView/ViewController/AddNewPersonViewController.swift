//
//  AddNewPerson.swift
//  PersonsListTableView
//
//  Created by Igor Makeev on 11.06.2021.
//

import UIKit

class AddNewPersonViewController: UIViewController{
    
    @IBOutlet weak var addNameTextField: UITextField!
    @IBOutlet weak var addSurnameTextField: UITextField!
    @IBOutlet weak var addPhoneNumberTextField: UITextField!
    @IBOutlet weak var addEmailTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var newPerson: Person?
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        saveButton.isEnabled = false
    
        addNameTextField.addTarget(self, action: #selector(textFieldChaged), for: .editingChanged)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func saveNewPerson(){
        newPerson = Person(name: addNameTextField.text!, surname: addSurnameTextField.text!, phoneNumber: addPhoneNumberTextField.text!, email: addEmailTextField.text!)
    }
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    @objc private func textFieldChaged(){
        if addNameTextField.text?.isEmpty == false{
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}
