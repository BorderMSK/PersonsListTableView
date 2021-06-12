//
//  MainTableViewController.swift
//  PersonsListTableView
//
//  Created by Igor Makeev on 09.06.2021.
//

import UIKit

class MainTableViewController: UITableViewController {
   
    var person = Person.getPerson()
    
    @IBOutlet weak var editButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        navigationController?.navigationBar.prefersLargeTitles = true
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
        let selectedItem = person[sourceIndexPath.row]
        person.remove(at: sourceIndexPath.row)
        person.insert(selectedItem, at: destinationIndexPath.row)
        person.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            person.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        
        if tableView.isEditing{
            tableView.setEditing(false, animated: true)
            sender.title = "Edit"
        }
        else{
            tableView.setEditing(true, animated: true)
            sender.title = "Done"
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        guard let newPersonVC = segue.source as? AddNewPersonViewController else { return }
        newPersonVC.saveNewPerson()
        person.append(newPersonVC.newPerson!)
        tableView.reloadData()
    }
}
