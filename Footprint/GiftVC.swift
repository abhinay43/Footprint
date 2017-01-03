//
//  GiftVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 17/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class GiftVC: HeaderVC
{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension GiftVC
{
    struct Storyboard{
        static let ControllerID = String(describing: GiftVC.self)
    }
    
    //MARK:- Static Metod
    static func instantiate() -> GiftVC{
        let controller = GiftVC(nibName: "GiftVC", bundle: nil)
        return controller
    }
}

