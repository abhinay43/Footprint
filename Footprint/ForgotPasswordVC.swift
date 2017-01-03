//
//  ForgotPasswordVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 03/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var txtEmail: UITextField!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetting()
        pageAppearace()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- Private Methods
    fileprivate func initialSetting(){
        txtEmail.delegate = self
    }
    
    fileprivate func pageAppearace(){
        
    }
    
    fileprivate func forgotPasswordAction()
    {
        self.showLoadIndicator(title: "Processing...")
        ForgotPasswordPageHelper.forgotPasswordAction(email: txtEmail.text!) {[weak self] (status, message) in
            
            if status{
                self?.showAlert(title: FootprintConstant.Alert.Success, message: message)
            }else{
               self?.showAlert(title: FootprintConstant.Alert.Error, message: message)
            }
            
            self?.hideLoadIndicator()
        }
    }

    //MARK:- IBAction
    @IBAction func goAction() {
        if txtEmail.text == ""{
            self.showAlert(title: FootprintConstant.Alert.Warning, message: "Please provide email id")
        }else{
            txtEmail.endEditing(true)
            forgotPasswordAction()
        }
    }
    @IBAction func backAction() {
        let _ = navigationController?.popViewController(animated: true)
    }
    
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ForgotPasswordVC
{
    struct Storyboard{
        static let ControllerID = "ForgotPasswordVC"
        static let SegueID = "ForgotPasswordSegue"
    }
    
    //MARK:- Static Method
    static func instantiate() -> ForgotPasswordVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Login, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ForgotPasswordVC
    }
    
}

extension ForgotPasswordVC:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

