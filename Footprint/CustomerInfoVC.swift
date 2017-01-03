//
//  CustomerInfoVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 14/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class CustomerInfoVC: HeaderVC
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var txtFirstName: UITextField!
    @IBOutlet fileprivate weak var txtLastName: UITextField!
    @IBOutlet fileprivate weak var txtDob: UITextField!
    @IBOutlet fileprivate weak var txtEmail: UITextField!
    @IBOutlet fileprivate weak var txtAddress: UITextField!
    @IBOutlet fileprivate weak var btnMale: UIButton!
    @IBOutlet fileprivate weak var btnFemale: UIButton!
    @IBOutlet fileprivate weak var btnNewsLetter: UIButton!
    
    //MARK:- Private Var
    fileprivate let datePicker = UIDatePicker()
    fileprivate var isNewsLetterEnabled = false
    fileprivate var isMale = true
    fileprivate var date:String!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetting()
        self.pageAppearance()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Private Methods
    fileprivate func initialSetting()
    {
        pageTitle = "CUSTOMER INFO"
        
        txtFirstName.delegate = self
        txtLastName.delegate = self
        txtEmail.delegate = self
        txtAddress.delegate = self
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(CustomerInfoVC.datePicked(sender:)), for: .valueChanged)
        txtDob.inputView = datePicker
        
        let userRecord = UserRecordHelper.sharedInstance.userRecord
        txtEmail.text = userRecord?.userEmail
        txtFirstName.text = userRecord?.userFirstName
        txtLastName.text = userRecord?.userLastName
        txtAddress.text = userRecord?.userAddress
        txtDob.text = userRecord?.userDOB
        isNewsLetterEnabled = userRecord?.isAcceptNewsLetter ?? false
        isMale = userRecord?.isMale ?? true
        
        isMale ? maleAction() : femaleAction()
        newsLetterAction(status: isNewsLetterEnabled)
    }
    
    fileprivate func pageAppearance(){
        btnNewsLetter.drawBorder(cornerRadius: 3.0, borderWidth: 1.0, borderColor: WhiteColor, maskToBound: true)
        btnMale.drawBorder(cornerRadius: 3.0, borderWidth: 1.0, borderColor: WhiteColor, maskToBound: true)
        btnFemale.drawBorder(cornerRadius: 3.0, borderWidth: 1.0, borderColor: WhiteColor, maskToBound: true)
    }
    
    fileprivate func newsLetterAction(status:Bool)
    {
        if isNewsLetterEnabled{
            btnNewsLetter.setTitle(FootprintConstant.Font.BlackTie.Text.Check, for: .normal)
        }else{
            btnNewsLetter.setTitle("", for: .normal)
        }
    }
    
    @objc fileprivate func datePicked (sender:UIDatePicker){
        date = sender.date.stringInServerFormat()
        txtDob.text = date
    }
    
    
    fileprivate func saveRecord()
    {
        let email = txtEmail.text!
        let fn = txtFirstName.text!
        let ln = txtLastName.text!
        let address = txtAddress.text!
        let gender = isMale ? "male" : "female"
        
        let dateOfBirth = txtDob.text!
        let dayMonthYear = dateOfBirth.getDayMonthYear()
        
        let day   = dayMonthYear.0
        let month = dayMonthYear.1
        let year  = dayMonthYear.2
        
        self.showLoadIndicator(title: "Updating...")
        
        MyAccountHelper.updateUserInfo(email: email, firstName: fn, lastName: ln, gender: gender, dob:dateOfBirth, dateOfBirthDay: day, dateOfBirthMonth: month, dateOfBirthYear: year, company: "company", complitionHandler: {[weak self] (status, message) in
            
            if status{
                self?.showAlert(title: FootprintConstant.Alert.Success, message: message)
                
                let userGUID = UserRecordHelper.sharedInstance.userRecord?.userGUID
                let userRecord = UserRecord(userEmail: email, userLastName: ln, userFirstName: fn, userGUID: userGUID, userAddress: address, isMale: self?.isMale, isAcceptNewsLetter: self?.isNewsLetterEnabled, userDOB: dateOfBirth)
                UserRecordHelper.sharedInstance.userRecord = userRecord
                
            }else{
                self?.showAlert(title: FootprintConstant.Alert.Success, message: message)
            }
            
            self?.hideLoadIndicator()
        })
    }
    
    

    //MARK:- IBAction
    @IBAction func saveAction()
    {
        if txtDob.text == "" || txtEmail.text == "" || txtFirstName.text == "" || txtLastName.text == "" || txtAddress.text == ""{
            self.showAlert(title: FootprintConstant.Alert.Warning, message: "Kindly fill all the fields")
        }else{
            saveRecord()
        }
        
    }
    
    @IBAction func maleAction()
    {
        btnMale.setTitle(FootprintConstant.Font.BlackTie.Text.Check, for: .normal)
        btnFemale.setTitle("", for: .normal)
        isMale = true
    }

    @IBAction func femaleAction() {
        btnFemale.setTitle(FootprintConstant.Font.BlackTie.Text.Check, for: .normal)
        btnMale.setTitle("", for: .normal)
        isMale = false
    }
    @IBAction func newsLetterAction(){
        isNewsLetterEnabled = !isNewsLetterEnabled
        newsLetterAction(status: isNewsLetterEnabled)
    }
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension CustomerInfoVC
{
    struct Storyboard{
        static let ControllerID = String(describing: CustomerInfoVC.self)
        static let SegueID = "CustomerInfoSegue"
    }
    
    //MARK:- Static Metod
    static func instantiate() -> CustomerInfoVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.MyAccount, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! CustomerInfoVC
    }
}

extension CustomerInfoVC:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


