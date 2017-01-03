//
//  RegistrationVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 03/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var txtConfirmPassword: UITextField!
    @IBOutlet fileprivate weak var txtPassword: UITextField!
    @IBOutlet fileprivate weak var txtEmail: UITextField!
    @IBOutlet fileprivate weak var txtName: UITextField!
    @IBOutlet fileprivate weak var txtLastName: UITextField!
    @IBOutlet fileprivate weak var txtDob: UITextField!
    
    //MARK:- Private Var
    fileprivate let datePicker = UIDatePicker()
    fileprivate var date:Date!
    
    //MARK:- View Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initialSetting()
        pageAppearace()
    }
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Private Methods
    fileprivate func initialSetting()
    {
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(RegistrationVC.datePicked(sender:)), for: .valueChanged)
        txtDob.inputView = datePicker
    }
    
    fileprivate func pageAppearace(){
        self.view.backgroundColor = FootprintConstant.Color.FootprintBlueColor
    }
    
    @objc fileprivate func datePicked (sender:UIDatePicker){
        txtDob.text = sender.date.string()
        date = sender.date
    }
    
    fileprivate func switchToStoryboard(name: String)
    {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        let controller = storyboard.instantiateInitialViewController()
        let vindow = UIApplication.shared.windows.first
        
        if let mainVindow = vindow {
            UIView.transition(with: mainVindow, duration: 0.3, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { () -> Void in
                mainVindow.rootViewController = controller
                }, completion: nil)
        }
    }

    
    //MARK:- IBAction
    @IBAction func registrartionAction()
    {
        if (txtConfirmPassword.text?.characters.count)! > 0 && (txtPassword.text?.characters.count)! > 0 && (txtEmail.text?.characters.count)! > 0 && (txtName.text?.characters.count)! > 0 && (txtLastName.text?.characters.count)! > 0 && (txtDob.text?.characters.count)! > 0
        {
            if txtPassword.text! != txtConfirmPassword.text!{
                self.showAlert(title: FootprintConstant.Alert.Warning, message: "Password and confirm password did not match")
                return
            }
            
            self.showLoadIndicator(title: "Registration...")
            RegistrationPageHelper.registrationWith(email: txtEmail.text!, password: txtPassword.text!, lastName: txtLastName.text!, firstName: txtName.text!, dob: date.stringInServerFormat() , complitionHandler: {[weak self] success, message in
               
                if success {
                    self?.switchToStoryboard(name: FootprintConstant.Storyboard.Main)
                }else{
                    self?.showAlert(title: FootprintConstant.Alert.Error, message: message)
                }
                self?.hideLoadIndicator()
            })
        }
        else{
            self.showAlert(title: FootprintConstant.Alert.Warning, message: "Please fill all the fields!")
        }

    }
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension RegistrationVC
{
    struct Storyboard{
        static let ControllerID = "RegistrationVC"
        static let SegueID = "RegistrationSegue"
    }
    
    //MARK:- Static Method
    static func instantiate() -> RegistrationVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Login, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! RegistrationVC
    }
    
}


