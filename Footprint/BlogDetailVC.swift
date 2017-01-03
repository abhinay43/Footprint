//
//  BlogDetailVCViewController.swift
//  Footprint
//
//  Created by Abhinay Maurya on 03/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class BlogDetailVC: HeaderVC
{

    //MARK:- Public Variables
    var data:Blog!
    
    //MARK:- IBOutler
    @IBOutlet private weak var imgBlog: UIImageView!
    
    @IBOutlet private weak var lblBlogTitle: UILabel!
    @IBOutlet private weak var lblTime: UILabel!
    @IBOutlet private weak var lblCategory: UILabel!
    @IBOutlet private weak var lblComment: UILabel!
    
    @IBOutlet private weak var txtComment: UITextView!
    @IBOutlet private weak var txtBlogDescription: UITextView!
    
    @IBOutlet private weak var btnMail: UIButton!
    @IBOutlet private weak var btnPinterest: UIButton!
    @IBOutlet private weak var btnLinkedIn: UIButton!
    @IBOutlet private weak var btnTwitter: UIButton!
    @IBOutlet private weak var btnFb: UIButton!
    @IBOutlet private weak var btnPost: UIButton!
    
    @IBOutlet private weak var viewCategory: UIView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var layoutHeightConstraintDescription: NSLayoutConstraint!
    @IBOutlet private weak var layoutHeightConstraintContainer: NSLayoutConstraint!
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
    
    //MARK:- Private Methods
    fileprivate func initialSetting()
    {
        pageTitle = "BLOG"
        lblComment.text = "LEAVE YOUR COMMENTS"
        lblTime.text = data.time.uppercased()
        lblCategory.text = data.category
        lblBlogTitle.text = data.title.uppercased()
        
        txtBlogDescription.text = data.blogDescription
        
        if let imageName = data.imageUrl{
            imgBlog.image = UIImage(named:imageName)
        }
        
        txtComment.delegate = self
        txtComment.text = Constant.Comment
        
    }
    
    fileprivate func pageAppearance()
    {
        isHideBackgroundImage = true
        scrollView.backgroundColor = ClearColor
        containerView.backgroundColor = ClearColor
        
        let font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 14.0)
        
        lblBlogTitle.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 17.0)
        lblTime.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 11.0)
        
        lblComment.font = font
        txtBlogDescription.font = font
        txtComment.font = font
        txtBlogDescription.isEditable = false
        txtBlogDescription.isScrollEnabled = false
        
        btnPost.titleLabel?.font = font
        btnPost.setTitleColor(WhiteColor, for: .normal)
        btnPost.backgroundColor = FootprintConstant.Color.FootprintGreenColor
        
        lblComment.textColor = FootprintConstant.Color.FootprintGreenColor
        
        btnFb.backgroundColor        = FootprintConstant.Color.FootprintBlueColor
        btnTwitter.backgroundColor   = FootprintConstant.Color.FootprintBlueColor
        btnLinkedIn.backgroundColor  = FootprintConstant.Color.FootprintBlueColor
        btnMail.backgroundColor      = FootprintConstant.Color.FootprintBlueColor
        btnPinterest.backgroundColor = FootprintConstant.Color.FootprintBlueColor
        
        lblBlogTitle.textColor       = DarkGray
        txtBlogDescription.textColor = DarkGray
        lblTime.textColor = Gray
        
        let category = "Categories: \(data.category!)"
        let categorySring = NSMutableAttributedString(string: category, attributes: [NSFontAttributeName:font!])
        categorySring.addAttribute(NSForegroundColorAttributeName, value: DarkGray, range: NSRange(location:0, length:11))
        
        lblCategory.attributedText = categorySring
        viewCategory.backgroundColor = UIColor(red: 208.0/255.0, green: 208.0/255.0, blue: 208.0/255.0, alpha: 1.0)
        txtBlogDescription.backgroundColor = ClearColor
        txtComment.backgroundColor = ClearColor
       
        let startingHeightOfDescription = layoutHeightConstraintDescription.constant
        let newHeightOfDescription = data.blogDescription.heightWithConstrainedWidth(width: txtBlogDescription.bounds.size.width, font: font!) + 60
        layoutHeightConstraintDescription.constant = newHeightOfDescription
        
        layoutHeightConstraintContainer.constant = layoutHeightConstraintContainer.constant - startingHeightOfDescription + newHeightOfDescription
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: layoutHeightConstraintContainer.constant)
         
        txtBlogDescription.contentInset = UIEdgeInsets(top: -10, left: -5, bottom: 0, right: 0)
       // txtComment.contentInset = UIEdgeInsets(top: -10, left: -5, bottom: 0, right: 0)
        
        txtComment.drawBorder(cornerRadius: 0.0, borderWidth: 0.50, borderColor: FootprintConstant.Color.FootprintGreenColor, maskToBound: true)
        
    }
    
    

}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension BlogDetailVC
{
    struct Storyboard{
        static let ControllerID = String(describing: BlogDetailVC.self)
        static let SegueID = "BlogDetailSegue"
    }
    
    struct Constant {
        static let Comment = "COMMENT"
    }
    
    //MARK:- Static Metod
    static func instantiate() -> BlogDetailVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Blog, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! BlogDetailVC
    }
    
}

extension BlogDetailVC:UITextViewDelegate
{
    func textViewDidEndEditing(_ textView: UITextView){
        let trimmedString = textView.text.trimmingCharacters(in: .whitespaces)
        if trimmedString == ""{
            textView.text = Constant.Comment
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView){
        if textView.text == Constant.Comment{
            textView.text = ""
        }
    }
    
}
