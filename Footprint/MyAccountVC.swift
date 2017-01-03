//
//  MyAccountVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 15/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class MyAccountVC: HeaderVC
{

    //MARK:- IBOutelt
    @IBOutlet fileprivate weak var lblUserName: UILabel!
    @IBOutlet fileprivate weak var tableView:UITableView!
    
    //MARK:- Private Vars
    fileprivate let dataSource = MyAccountHelper.dataSource
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageAppearance()
        initialSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lblUserName.text = UserRecordHelper.sharedInstance.userRecord?.userEmail!
        
        if let name = UserRecordHelper.sharedInstance.userRecord?.userFirstName{
            if name != ""{
                lblUserName.text = name
            }
        }
    }
    
    //MARK:- Private Methods
    fileprivate func pageAppearance(){
        self.isHideBackgroundImage = true
        self.view.backgroundColor = FootprintConstant.Color.FootprintBlueColor
    }
    
    fileprivate func  initialSetting()
    {
        pageTitle = "MY ACCOUNT"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        
        MyAccountCell.registerNib(tableView: tableView)
    }
    
    //MARK:- Other
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let segueIdentifier = segue.identifier
        if segueIdentifier == CustomerInfoVC.Storyboard.SegueID
        {
            
        }else{
            
        }
    }
    
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension MyAccountVC
{
    struct Storyboard{
        static let ControllerID = String(describing: MyAccountVC.self)
    }
    
    //MARK:- Static Metod
    static func instantiate() -> MyAccountVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.MyAccount, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! MyAccountVC
    }
    
}

extension MyAccountVC:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyAccountCell.Constant.Identifier) as! MyAccountCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.size.height / CGFloat(dataSource.count)
    }
}

extension MyAccountVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! MyAccountCell).data = dataSource[indexPath.row]
        if indexPath.row == dataSource.count - 1{
            (cell as! MyAccountCell).isHideSeperator = true
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = MYAccountSection(rawValue: indexPath.row)!
        
        switch section
        {
            case .ChangePassword:
                self.performSegue(withIdentifier: ChangePasswordVC.Storyboard.SegueID, sender: nil)
                break
            case .Orders:
                self.performSegue(withIdentifier: MyOrdersVC.Storyboard.SegueID, sender: nil)
                break
            case .SignOut:
                break
            case .GiftBalance:
                self.performSegue(withIdentifier: GiftCardBalanceVC.Storyboard.SegueID, sender: nil)
                break
            case .RewardPoints:
                self.performSegue(withIdentifier: RewardPointsVC.Storyboard.SegueID, sender: nil)
                break
            case .Info:
                self.performSegue(withIdentifier: CustomerInfoVC.Storyboard.SegueID, sender: nil)
                break
        }
        
      tableView.deselectRow(at: indexPath, animated: true)
    }
}

