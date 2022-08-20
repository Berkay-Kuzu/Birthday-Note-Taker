//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Berkay Kuzu on 19.08.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //UserDefaults'u viewDidLoad'da çekiyorum.
        
        let storedName = UserDefaults.standard.object(forKey: "name")// Any? object verdi optional olmasa uygulama çökerdi.
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String {
            nameLabel.text = "Name: \(newName)"
        }
        
        if let newBirthday =  storedBirthday as? String {
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
        
    }

    @IBAction func saveClicked(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name:"
        }

        if let newBirthday = storedBirthday as? String {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday:"
        }

        // "" = Boş demektir, değer vardır.
        // nil = değer yoktur, tanımlanmış ama init edilmemiş gibi.

        
        
        
    }
    
    
}

