//
//  MainTableViewController.swift
//  PersonsListTableView
//
//  Created by Igor Makeev on 09.06.2021.
//

import UIKit

class MainTableViewController: UITableViewController {
    var data: Person!
    var person = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
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
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        person.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
    }
    
    @IBAction func editButton(_ sender: Any) {
        if tableView.isEditing {
            tableView.isEditing = false
        }
        else{
            tableView.isEditing = true
        }
    }
}
