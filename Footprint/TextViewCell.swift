//
//  TextViewCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 29/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

protocol TextViewCellDelegate {
    func set(value:String?, forKey:String)
}

class TextViewCell: UITableViewCell
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var textView:UITextView!
    @IBOutlet fileprivate weak var viewBackground:UIView!
    
    //MARK:- Public
    var delegate:TextViewCellDelegate?
    
    //MARK:- Public
    var contactRecord:ContactUsRecord!{
        didSet{
            textView.text = contactRecord.title.uppercased()
            viewBackground.drawBorder(cornerRadius: 0.0, borderWidth: 1.0, borderColor: LightGray, maskToBound: false)
            
            textView.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 13.0)
            self.backgroundColor = ClearColor
        }
    }
    
    //MARK:-
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.delegate = self
    }
    
}
/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension TextViewCell
{
    struct Constant {
        static let Identifier = String(describing: TextViewCell.self)
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
    
}

extension TextViewCell:UITextViewDelegate
{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n"{
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        delegate?.set(value: textView.text, forKey: contactRecord.key)
    }
}

