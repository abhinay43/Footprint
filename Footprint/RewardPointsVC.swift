//
//  RewardPointsVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 16/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class RewardPointsVC: HeaderVC
{
    //MARK:- Private Vars
    let dataSourceTiltes = MyRewardHelper.dataSourceTitles
    let dataSource = MyRewardHelper.dataSource
    let dataSourceLoyltyProgram = LoyaltyRecord()
    
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var tableView:UITableView!
    
    @IBOutlet fileprivate weak var lblAnswer2: UILabel!
    @IBOutlet fileprivate weak var lblAnswer1: UILabel!
    @IBOutlet fileprivate weak var lblQuestion2: UILabel!
    @IBOutlet fileprivate weak var lblQuestion1: UILabel!
    
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
        pageTitle = "REWARD POINTS"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        lblAnswer1.text = dataSourceLoyltyProgram.answer1
        lblAnswer2.text = dataSourceLoyltyProgram.answer2
        lblQuestion1.text = dataSourceLoyltyProgram.question1
        lblQuestion2.text = dataSourceLoyltyProgram.question2
    }
    
    fileprivate func pageAppearance(){
        isHideBackgroundImage = true
        self.view.backgroundColor = FootprintConstant.Color.FootprintBlueColor
    }

}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension RewardPointsVC
{
    struct Storyboard
    {
        static let ControllerID = String(describing: RewardPointsVC.self)
        static let SegueID = "RewardPointsSegue"
    }
    
    
    //MARK:- Static Metod
    static func instantiate() -> RewardPointsVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.MyAccount, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! RewardPointsVC
    }
    
}

extension RewardPointsVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! MyRewardCell).title = dataSourceTiltes[indexPath.row]
        (cell as! MyRewardCell).data = "\(dataSource.getValueAt(index: indexPath.row))"
        
        if indexPath.row == dataSourceTiltes.count - 1
        {
            cell.backgroundColor = FootprintConstant.Color.FootprintGreenColor
            cell.textLabel?.textColor = WhiteColor
            cell.detailTextLabel?.textColor = WhiteColor
        }
    }
}

extension RewardPointsVC:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceTiltes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: MyRewardCell.Constant.Identifier) as! MyRewardCell
        return cell
    }
}


