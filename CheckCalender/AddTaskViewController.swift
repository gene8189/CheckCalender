//
//  AddTaskViewController.swift
//  CheckCalender
//
//  Created by Tan Yee Gene on 29/12/2019.
//  Copyright © 2019 Tan Yee Gene. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var setDateTextField: UITextField!
    @IBOutlet weak var setTimeTextField: UITextField!
    let timePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let hudView = HudView.hud(inView: navigationController!.view, animated: true)
        do {
            afterDelay(0.6) {
                hudView.hide()
                self.navigationController?.popViewController(animated: true)
            }
        } catch {
            fatalError()
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == setTimeTextField {
           showTimePicker()
        } else if textField == setDateTextField {
            performSegue(withIdentifier: "selectDateSegue", sender: nil)
            disablesAutomaticKeyboardDismissal
        } else {
//            textField.resignFirstResponder()
            print("close keyboard")
        }
    }
    
    @objc func test() {
        print("it work")
    }
    
    func showTimePicker() {
        timePicker.datePickerMode = .time
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTimePicker))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTimePicker))
        
        toolbar.setItems([doneButton,cancelButton], animated: false)
        
        setTimeTextField.inputAccessoryView = toolbar
        setTimeTextField.inputView = timePicker
    }
    
    
    @objc func doneTimePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let time = timePicker.date
        setTimeTextField.text = formatter.string(from: time)
        view.endEditing(true)
    }
    
    @objc func cancelTimePicker() {
        self.view.endEditing(true)
    }
    

}
