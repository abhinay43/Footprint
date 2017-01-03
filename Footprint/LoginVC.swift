//
//  Login.swift
//  Footprint
//
//  Created by Abhinay Maurya on 03/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

//https://developer.linkedin.com/docs/ios-sdk#!
//

import UIKit
import FacebookCore
import FacebookLogin

class LoginVC: UIViewController
{
    //MARK:- IBOutlets
    @IBOutlet fileprivate weak var txtUserName: UITextField!
    @IBOutlet fileprivate weak var txtPassword: UITextField!
    @IBOutlet fileprivate weak var credentialsStackView: UIStackView!
    
    //MARK:- ViewC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
        pageAppearace()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Private Methods
    fileprivate func initialSetting(){
    }
    
    fileprivate func pageAppearace(){
        self.view.backgroundColor = FootprintConstant.Color.FootprintBlueColor
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
    @IBAction fileprivate func logInAction()
    {
        self.view.endEditing(true)
        
        if (txtPassword.text?.characters.count)! > 0 && (txtUserName.text?.characters.count)! > 0
        {
            self.showLoadIndicator(title: "Login...")
            LoginPageHelper.loginWith(email: txtUserName.text!, password: txtPassword.text!, complitionHandler: {[weak self] success, message in
                
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
    
    @IBAction fileprivate func fbAction()
    {
        self.showLoadIndicator(title: "FB Login...")
        FBLoginHelper.login(completionHandler: { [weak self] (success, message) in
        
            self?.hideLoadIndicator()
            if success {
                self?.switchToStoryboard(name: FootprintConstant.Storyboard.Main)
            }else{
                self?.showAlert(title: FootprintConstant.Alert.Error, message: message)
            }
        })
    }
    
    @IBAction fileprivate func linkedInAction()
    {
        self.showLoadIndicator(title: "LinkedIn Login...")
        LinkedInHelper.login(completionHandler: { [weak self] (success, message) in
            
            self?.hideLoadIndicator()
            if success {
                DispatchQueue.main.async {
                    self?.switchToStoryboard(name: FootprintConstant.Storyboard.Main)
                }
            }else{
                self?.showAlert(title: FootprintConstant.Alert.Error, message: message)
            }
        })
    }
    
    @IBAction fileprivate func registrationAction()
    {
    }
    
    @IBAction fileprivate func forgotPasswordAction() {
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension LoginVC
{
    struct Storyboard{
        static let ControllerID = "LoginVC"
    }
    
    //MARK:- Static Method
    static func instantiate() -> LoginVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Login, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! LoginVC
    }
    
}

