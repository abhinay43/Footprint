//
//  BlogVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 03/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class BlogVC: HeaderVC
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var tableView:UITableView!
    
    //MARK:- Private Vars
    fileprivate var dataSource = BlogHelper.dataSource

    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
        pageAppearance()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Private Methods
    fileprivate func initialSetting()
    {
        pageTitle = "BLOG"
        tableView.delegate = self
        tableView.dataSource = self
        BlogCell.registerNib(tableView: tableView)
    }
    
    fileprivate func pageAppearance()
    {
        isHideBackgroundImage = true
        tableView.backgroundColor = ClearColor
    }
    
    //MARK:-
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == BlogDetailVC.Storyboard.SegueID
        {
            let indexPath = sender as! IndexPath
            let vc =  segue.destination as! BlogDetailVC
            vc.data = dataSource[indexPath.row]
        }
    }
    

}
/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension BlogVC
{
    struct Storyboard{
        static let ControllerID = String(describing: BlogVC.self)
    }
    
    //MARK:- Static Metod
    static func instantiate() -> BlogVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Blog, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! BlogVC
    }
    
}
extension BlogVC:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BlogCell.Constant.Height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: BlogCell.Constant.Identifier) as! BlogCell
        return cell
    }
}

extension BlogVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        (cell as! BlogCell).data = dataSource[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: BlogDetailVC.Storyboard.SegueID, sender: indexPath)
    }
}
