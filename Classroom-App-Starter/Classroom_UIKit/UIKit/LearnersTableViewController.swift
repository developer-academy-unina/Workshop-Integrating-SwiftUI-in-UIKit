//
//  LearnersTableViewController.swift
//  Classroom_UIKit
//
//  Created by Giovanni Monaco on 31/01/22.
//

import UIKit

class LearnersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // Ask the data source to return the number of sections in the table view.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Tell the data source to return the number of rows in a given section of a table view.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return learners.count
        } else {
            return 0
        }
    }
    
    // Ask the data source for a cell to insert in a particular location of the table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "LearnerCell", for: indexPath) as! LearnersTableViewCell
        
        // Fetch model object to display
        let learner = learners[indexPath.row]
        
        // Configure cell
        cell.update(with: learner)
        cell.showsReorderControl = true
        
        // Return cell
        return cell
    }
    
    
    // Segue used when + is tapped
    
    @IBSegueAction func addLearnerSegue(_ coder: NSCoder) -> LearnerDetailViewController? {
        return LearnerDetailViewController(coder: coder, learner: nil)
    }
    
    // Segue used when a row is tapped
    
    @IBSegueAction func detailLearnerSegue(_ coder: NSCoder) -> LearnerDetailViewController? {
        let learnerToEdit = learners[tableView.indexPathForSelectedRow?.row ?? 0]
        return LearnerDetailViewController(coder: coder, learner: learnerToEdit)
    }
    
    // Unwind Segue ToLearnersTableView
    @IBAction func unwindToLearnersTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind",
              let sourceViewController = segue.source as? LearnerDetailViewController,
              let learner = sourceViewController.learner else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            learners[selectedIndexPath.row] = learner
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: learners.count, section: 0)
            learners.append(learner)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    // Ask the data source to commit the insertion or deletion of a specified row in the receiver.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            learners.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Tell the data source to move a row at a specific location in the table view to another location.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedLearner = learners.remove(at: fromIndexPath.row)
        learners.insert(movedLearner, at: to.row)
    }
    
    // Ask the delegate for the editing style of a row at a particular location in a table view.
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
}
