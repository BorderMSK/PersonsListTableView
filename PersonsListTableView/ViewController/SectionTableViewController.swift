//
//  SectionTableViewController.swift
//  PersonsListTableView
//
//  Created by Igor Makeev on 10.06.2021.
//

import UIKit

class SectionTableViewController: UITableViewController {

    let person = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 40
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return person.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = person[section]
        return person.name + " " + person.surname
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let person = person[indexPath.section]
        cell.textLabel?.text = indexPath.row == 0 ? person.email : person.phoneNumber
        return cell
    }
    

    
}
