//
//  ProductDetailVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 15/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ProductDetailVC: ProductSuperVC
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var btnMenu: UIButton!
    @IBOutlet fileprivate weak var btnColor: UIButton!
    @IBOutlet fileprivate weak var btnSize: UIButton!
    @IBOutlet fileprivate weak var btnBuyNow: UIButton!
    @IBOutlet fileprivate weak var viewBottomBar: UIView!

    @IBOutlet fileprivate weak var lblPrice: UILabel!
    @IBOutlet fileprivate weak var btnShare: UIButton!
    @IBOutlet fileprivate weak var pageControl: UIPageControl!
    
    @IBOutlet fileprivate weak var btnPlayVideo: UIButton!
    
    @IBOutlet weak var scrollView: ImageScrollView!
    
    @IBOutlet fileprivate weak var containerViewShare: UIView!
    @IBOutlet fileprivate weak var constraintproductInfoYPos: NSLayoutConstraint!
    @IBOutlet fileprivate weak var constraintproductColorYPos: NSLayoutConstraint!
    @IBOutlet fileprivate weak var constraintproductSizeYPos: NSLayoutConstraint!
    @IBOutlet fileprivate weak var constraintproductShareXPos: NSLayoutConstraint!
    
    @IBOutlet weak var constraintYPosNavigationBar: NSLayoutConstraint!
    @IBOutlet weak var constraintYPosBottomBar: NSLayoutConstraint!
    
    //MARK:- Public var
    var product:Product!
    
    //MARK:- Private var
    fileprivate var selctedProductOption:ProductOption = .None
    fileprivate var isShareMenuOpen = false
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pageAppearance()
        initialSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: SideMenuVC.NotificationCancelsTouchesInView), object: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: SideMenuVC.NotificationCancelsTouchesInView), object: true)
    }

    
    
    //MARK:- Private Methods
    fileprivate func pageAppearance()
    {
        btnBuyNow.backgroundColor = FootprintConstant.Color.FootprintBlueColor
        
        btnBuyNow.setTitleColor(WhiteColor, for: .normal)
        btnSize.setTitleColor(FootprintConstant.Color.FootprintGreenColor, for: .normal)
        btnMenu.setTitleColor(FootprintConstant.Color.FootprintGreenColor, for: .normal)
        btnPlayVideo.setTitleColor(FootprintConstant.Color.FootprintBlueColor, for: .normal)
        btnColor.setTitleColor(FootprintConstant.Color.FootprintGreenColor, for: .normal)
        
        btnColor.titleLabel?.font = UIFont(name: FootprintConstant.Font.BlackTie.Solid, size: 17.0)
        btnMenu.titleLabel?.font = UIFont(name: FootprintConstant.Font.BlackTie.Regular, size: 17.0)
        btnPlayVideo.titleLabel?.font = UIFont(name: FootprintConstant.Font.BlackTie.Regular, size: 15.0)
       
        lblPrice.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 17.0)
        lblPrice.textColor = FootprintConstant.Color.FootprintBlueColor
       
        btnMenu.setTitle(FootprintConstant.Font.BlackTie.Text.Menu, for: .normal)
        btnColor.setTitle(FootprintConstant.Font.BlackTie.Text.Square, for: .normal)
        btnPlayVideo.setTitle(FootprintConstant.Font.BlackTie.Text.Play, for: .normal)
        
        btnColor.drawBorder(cornerRadius: 0.0, borderWidth: 0.50, borderColor: FootprintConstant.Color.FootprintGreenColor, maskToBound: false)
        btnMenu.drawBorder (cornerRadius: 0.0, borderWidth: 0.50, borderColor: FootprintConstant.Color.FootprintGreenColor, maskToBound: false)
        btnSize.drawBorder (cornerRadius: 0.0, borderWidth: 0.50, borderColor: FootprintConstant.Color.FootprintGreenColor, maskToBound: false)
        btnBuyNow.drawBorder(cornerRadius: 0.0, borderWidth: 0.50, borderColor: FootprintConstant.Color.FootprintGreenColor, maskToBound: false)
        btnPlayVideo.drawBorder(cornerRadius: 0.0, borderWidth: 1, borderColor: FootprintConstant.Color.FootprintBlueColor, maskToBound: false)
        
        pageControl.currentPageIndicatorTintColor = FootprintConstant.Color.FootprintBlueColor
        
        containerViewShare.isHidden = true
        
    }
    
    fileprivate func  initialSetting()
    {
        scrollView.dataSource = [product, product, product]
        scrollView.dataSourceProductSuggestion = [product, product, product, product,product, product, product, product]
        
        pageTitle = product.productTitle.uppercased()
        lblPrice.text = "PRK." + product.productCost
        
        pageControl.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
    }
    
    fileprivate func colseIfAnyOtherInfoIsOpen()
    {
        switch selctedProductOption
        {
            case .Color:
                showProductColorAction()
                break
            case .Info:
                showProductInfoAction()
                break
            case .Size:
                showProductSizeAction()
                break
            case .Share:
                showShareAction()
                break
            case .None:
                break
        }
        selctedProductOption = .None
    }
    
    //MARK:- IBAction
    @IBAction fileprivate func showProductInfoAction ()
    {
        let productInfoYPos:CGFloat!
        
        if btnMenu.backgroundColor == FootprintConstant.Color.FootprintGreenColor
        {
            btnMenu.backgroundColor = WhiteColor
            btnMenu.setTitleColor(FootprintConstant.Color.FootprintGreenColor, for: .normal)
            productInfoYPos = 0
            selctedProductOption = .None
        }else{
            colseIfAnyOtherInfoIsOpen()
            selctedProductOption = .Info
            btnMenu.backgroundColor = FootprintConstant.Color.FootprintGreenColor
            btnMenu.setTitleColor(WhiteColor, for: .normal)
            productInfoYPos = -ProductInfoVC.Storyboard.Height
        }
        
        UIView.animate(withDuration: 0.33, animations: {[weak self] in
            self?.constraintproductInfoYPos.constant = productInfoYPos
            self?.view.layoutIfNeeded()
        })
        
    }
    
    
    @IBAction fileprivate func showProductColorAction ()
    {
        
        let productColorYPos:CGFloat!
        if btnColor.backgroundColor == FootprintConstant.Color.FootprintGreenColor
        {
            btnColor.backgroundColor = WhiteColor
            btnColor.setTitleColor(FootprintConstant.Color.FootprintGreenColor, for: .normal)
            productColorYPos = 0
            selctedProductOption = .None
        }else{
            colseIfAnyOtherInfoIsOpen()
            selctedProductOption = .Color
            btnColor.backgroundColor = FootprintConstant.Color.FootprintGreenColor
            btnColor.setTitleColor(WhiteColor, for: .normal)
            productColorYPos = -ProductColorVC.Storyboard.Height
        }
        
        UIView.animate(withDuration: 0.33, animations: {[weak self] in
            self?.constraintproductColorYPos.constant = productColorYPos
            self?.view.layoutIfNeeded()
        })
    }
    
    
    @IBAction fileprivate func showProductSizeAction ()
    {
        
        let productSizeYPos:CGFloat!
        if btnSize.backgroundColor == FootprintConstant.Color.FootprintGreenColor
        {
            btnSize.backgroundColor = WhiteColor
            btnSize.setTitleColor(FootprintConstant.Color.FootprintGreenColor, for: .normal)
            productSizeYPos = 0
            selctedProductOption = .None
        }else{
            colseIfAnyOtherInfoIsOpen()
            selctedProductOption = .Size
            btnSize.backgroundColor = FootprintConstant.Color.FootprintGreenColor
            btnSize.setTitleColor(WhiteColor, for: .normal)
            productSizeYPos = -ProductSizeVC.Storyboard.Height
        }
        
        UIView.animate(withDuration: 0.33, animations: {[weak self] in
            self?.constraintproductSizeYPos.constant = productSizeYPos
            self?.view.layoutIfNeeded()
        })
    }
    
    @IBAction fileprivate func showShareAction ()
    {
        
        let productShareXPos:CGFloat!
        if !isShareMenuOpen
        {
            containerViewShare.isHidden = false
            productShareXPos = 0
            colseIfAnyOtherInfoIsOpen()
            selctedProductOption = .Share
           
        }else{
            selctedProductOption = .None
            productShareXPos = -ProductShareVC.Storyboard.Width
        }
        
        UIView.animate(withDuration: 0.33, animations: {[weak self] in
            self?.constraintproductShareXPos.constant = productShareXPos
            self?.view.layoutIfNeeded()
        }, completion: {[weak self] selection in
            if productShareXPos != 0{
                self?.containerViewShare.isHidden = true
            }
            
        })
        isShareMenuOpen = !isShareMenuOpen
    }
    
    @IBAction fileprivate func tapActionOnView(){
        colseIfAnyOtherInfoIsOpen()
    }
    
    
    //MARK:-
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == ProductInfoVC.Storyboard.SegueID{
            let vc = segue.destination as! ProductInfoVC
            vc.delegate = self
        } else if segue.identifier == ProductColorVC.Storyboard.SegueID{
            let vc = segue.destination as! ProductColorVC
            vc.delegate = self
        }else if segue.identifier == ProductSizeVC.Storyboard.SegueID{
            let vc = segue.destination as! ProductSizeVC
            vc.delegate = self
        }else if segue.identifier == ProductShareVC.Storyboard.SegueID{
            let vc = segue.destination as! ProductShareVC
            vc.delegate = self
        }
    }
    
    


}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ProductDetailVC
{
    struct Storyboard{
        static let ControllerID = String(describing: ProductDetailVC.self)
        static let SegueID = "ProductDetailSegue"
    }
    
    //MARK:- Static Metod
    static func instantiate() -> ProductDetailVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Product, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ProductDetailVC
    }
    
}



extension ProductDetailVC:ProductInfoDelegate
{
    func selected(info:ProductInfo)
    {
        switch info
        {
            case .Information:
                break
            case .Share:
                break
            case .Shipping:
                break
            case .Wishlist:
                break
        }
        colseIfAnyOtherInfoIsOpen()
    }

}


extension ProductDetailVC:ProductColorDelegate
{
    func selected(colorInfo: ProductColorInfo){
        print(colorInfo.name)
        colseIfAnyOtherInfoIsOpen()
    }
}

extension ProductDetailVC:ProductSizeDelegate
{
    func selected(size: String) {
        colseIfAnyOtherInfoIsOpen()
    }
}

extension ProductDetailVC:ProductShareDelegate
{
    func share(media:String){
        colseIfAnyOtherInfoIsOpen()
    }
    
    func closeMediaView()
    {
        colseIfAnyOtherInfoIsOpen()
    }
}


