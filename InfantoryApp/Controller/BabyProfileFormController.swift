//
//  BabyProfileFormController.swift
//  InfantoryApp
//
//  Created by Gilbert Nicholas on 05/04/21.
//

import UIKit
import CoreData

class BabyProfileFormController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let genders = ["Boy", "Girl"]

    var pickerView = UIPickerView()
    
    var items:[Baby]?
    
    // Navigation Bar Outlets
        @IBOutlet weak var addChildNavBar: UINavigationBar!
        
    // Add Photo Outlets
        @IBOutlet weak var imageAddChild: UIImageView!
        @IBOutlet weak var addPhotoButton: UIButton!
        
    // Label Outlets
        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var birthdayLabel: UILabel!
        @IBOutlet weak var genderLabel: UILabel!
        
    // Text Field Outlets
        @IBOutlet weak var nameField: UITextField!
        @IBOutlet weak var birthdayField: UITextField!
        @IBOutlet weak var genderField: UITextField!
    
    var imagePicker = UIImagePickerController()
    let datePicker = UIDatePicker()
    
    var dateOfBirth:Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.mediaTypes = ["public.image"]
        
        makeImageRound()
        
        createDatePicker()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        genderField.inputView = pickerView
    }
    
    func makeImageRound() {
        imageAddChild.layer.masksToBounds = false
        imageAddChild.layer.borderColor = UIColor.black.cgColor
        imageAddChild.layer.cornerRadius = imageAddChild.frame.height/2
        imageAddChild.clipsToBounds = true
    }
    
// Text Field Actions
    @IBAction func addBabyName(_ sender: Any) {
        
    }
    
    @IBAction func birthdayField(_ sender: Any) {
        
    }
    
    @IBAction func genderPicker(_ sender: Any) {
        
    }
    
// Navigation Bar Actions
    @IBAction func cancelButton(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)

        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        if nameField.text == "" || birthdayField.text == "" || genderField.text == "" {
            let alert = UIAlertController(title: "Add Baby Data", message: "Add missing data!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }else{
            do{
                let request = Baby.fetchRequest() as NSFetchRequest<Baby>
                let pred = NSPredicate(format: "isActive = true")
                request.predicate = pred
                
                self.items = try context.fetch(request)
                
                if self.items?.count != 0 {
                    print(self.items?.count)
                    let baby = self.items![0]
                    baby.isActive = false
                }
            } catch{
                
            }
            
            let newBaby = Baby(context: self.context)
            newBaby.name = nameField.text
            newBaby.dateOfBirth = dateOfBirth
            newBaby.gender = genderField.text
            newBaby.isActive = true
            
            do{
                try self.context.save()
            }catch{
                print("error saving data")
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)

            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    
//    Add Photo Actions
//    ==================================================================
    
    @IBAction func addPhotoButton(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let imageSelected = info[.editedImage] as? UIImage else {
            return
        }
        
        imageAddChild.image = imageSelected
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        
        toolbar.setItems([doneBtn], animated: true)
        
        birthdayField.inputAccessoryView = toolbar
        
        birthdayField.inputView = datePicker
        
        datePicker.datePickerMode = .date
        
        datePicker.preferredDatePickerStyle = .wheels
        
    }
    
    @objc func donePressed() {
        dateOfBirth = datePicker.date
        
        print(datePicker.date)
        print(dateOfBirth)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        birthdayField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}

extension BabyProfileFormController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderField.text = genders[row]
        genderField.resignFirstResponder()
    }
}
