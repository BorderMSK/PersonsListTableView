//
//  MainTableViewController.swift
//  PersonsListTableView
//
//  Created by Igor Makeev on 09.06.2021.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let person = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return person.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let data = person[indexPath.row]
        
        cell.textLabel?.text = data.name + " " + data.surname
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? DetailViewController,
              let indexPath = tableView.indexPathForSelectedRow
        else { return }
        
        let data = person[indexPath.row]
        
        vc.personData = data
        
    }
}
