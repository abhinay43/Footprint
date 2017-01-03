//
//  LeftManuVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 05/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class LeftMenuVC: UIViewController
{
    //MARK:- Private Vars
    fileprivate let dataSource = LeftMenuHelper.dataSource
    fileprivate var dashboardVC = DashboardVC.instantiate()
    fileprivate lazy var giftVC = GiftVC.instantiate()
    fileprivate lazy var plusVC = PlusVC.instantiate()
    fileprivate lazy var blogVC = BlogVC.instantiate()
    fileprivate lazy var myJourneyVC = MyJourneyVC.instantiate()
    fileprivate lazy var loyaltyProgramVC = LoyaltyProgramVC.instantiate()
    fileprivate lazy var myAccountVC = MyAccountVC.instantiate()
    
    
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet fileprivate weak var viewFooter: UIView!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
        pageAppearance()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Private Apis
    fileprivate func initialSetting(){
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    fileprivate func pageAppearance (){
        view.backgroundColor = FootprintConstant.Color.FootprintBlueColor
        viewFooter.backgroundColor = FootprintConstant.Color.FootprintBlueColor
    }
    
    
//    fileprivate func changeViewController(_ menu: Menu)
//    {
////        guard let mainNavigationVC = _sideMenuController()
////        else {
////            <#statements#>
////        }
//        
//        
//        guard let mainNavigationVC = self.slideMenuController()?.mainViewController as? MainNavigationVC else{
//            return
//        }
//        
//        switch menu
//        {
//            case .Dashboard:
//                mainNavigationVC.viewControllers = [dashboardVC]
//                break
//            case .Shoes:
//                mainNavigationVC.viewControllers = [self.shoeBrandVC]
//                break
//            case .ShopTheLook:
//                break
//            case .Bespoke:
//                break
//            case .Instagram:
//                break
//            case .Plus:
//                mainNavigationVC.viewControllers = [self.plusVC]
//                break
//        }
//        
//        self.slideMenuController()?.closeLeft()
//    }
    
    
    fileprivate func changeViewController(_ menu: Menu)
    {
        guard let mainVC = _sideMenuController() as? SideMenuVC
        else {
            return
        }
        
        let mainNavigationVC = mainVC.rootViewController as! MainNavigationVC
        
        switch menu
        {
            case .Dashboard:
                mainNavigationVC.viewControllers = [dashboardVC]
                break
            case .Gift:
                mainNavigationVC.viewControllers = [self.giftVC]
                break
            case .MyAccount:
                mainNavigationVC.viewControllers = [self.myAccountVC]
                break
            case .LoyaltyProgram:
                mainNavigationVC.viewControllers = [self.loyaltyProgramVC]
                break
            case .Blog:
                mainNavigationVC.viewControllers = [self.blogVC]
                break
            case .MyJourney:
                mainNavigationVC.viewControllers = [self.myJourneyVC]
                break
            case .ShoeRack:
                mainNavigationVC.viewControllers = [self.giftVC]
                break
        }
        
        mainVC.hideLeftView(animated: true, completionHandler: nil)
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
    @IBAction func logoutAction(_ sender: AnyObject)
    {
        UserRecordHelper.sharedInstance.isLogin = false
        //Fb Logout
        FBLoginHelper.logout()
        
        //LinkedIn Logout
        LinkedInHelper.logOut()
        switchToStoryboard(name: FootprintConstant.Storyboard.Login)
    }

}
/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension LeftMenuVC
{
    struct Storyboard{
        static let ControllerID = String(describing: LeftMenuVC.self)
    }
    
    //MARK:- Static Metod
    static func instantiate() -> LeftMenuVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Main, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! LeftMenuVC
    }
    
}

//MARK:- Extension DataSource
extension LeftMenuVC:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.Constant.Identifier) as! MenuCell
        return cell
    }
}

//MARK:- Extension Delegate
extension LeftMenuVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let category = dataSource[indexPath.row]
        (cell as! MenuCell).data = category
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        changeViewController(Menu(rawValue: indexPath.row)!)
    }
    
}

