//
//  LearnerDetailViewController.swift
//  Classroom_UIKit
//
//  Created by Giovanni Monaco on 31/01/22.
//

import UIKit
import SwiftUI

class LearnerDetailViewController: UIViewController {
    
    var learner: Learner?
    var newColor: UIColor = .gray
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    
    required init?(coder: NSCoder, learner: Learner?) {
        self.learner = learner
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        if let learner = learner {
            nameTextField.text = learner.name
            surnameTextField.text = learner.surname
            descriptionTextField.text = learner.description
        } else {
            
        }
        updateSaveButtonState()
    }
    
    @IBSegueAction func toProfileView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: PresentMeView(passedInLearner: learner, updateColor: updateColor))
    }
    
    func updateColor(value: UIColor) {
        newColor = value
    }
    
    // Check if name and surname are empty to enable (or not) the save button
    func updateSaveButtonState() {
        let nameText = nameTextField.text ?? ""
        let surnameText = surnameTextField.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty && !surnameText.isEmpty
    }
    

    @IBAction func done(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
    // Call updateSaveButtonState everytime text change in TextFields
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    // Prepare for the Segue when save button is tapped
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else { return }
        let name = nameTextField.text?.capitalized ?? ""
        let surname = surnameTextField.text?.capitalized ?? ""
        let description = descriptionTextField.text
        learner = Learner(name: name, surname: surname, description: description, favouriteColor: newColor)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
}
