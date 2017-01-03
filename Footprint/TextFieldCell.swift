//
//  TextFieldCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 29/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

protocol TextFieldCellDelegate {
    func set(value:String?, forKey:String)
}


class TextFieldCell: UITableViewCell
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var textField:UITextField!
    @IBOutlet fileprivate weak var viewBackground:UIView!
    
    //MARK:- Public
    var delegate:TextFieldCellDelegate?
    
    var contactRecord:ContactUsRecord!{
        didSet{
            textField.placeholder = contactRecord.title.uppercased()
            viewBackground.drawBorder(cornerRadius: 0.0, borderWidth: 0.50, borderColor: LightGray, maskToBound: false)
            
            textField.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 13.0)
            self.backgroundColor = ClearColor
            
            
        }
    }
    
    //MARK:-
    override func awakeFromNib()
    {
        super.awakeFromNib()
        textField.delegate = self
    }

   
    
}
/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension TextFieldCell
{
    struct Constant {
        static let Identifier = String(describing: TextFieldCell.self)
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
    
}

extension TextFieldCell:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        delegate?.set(value: textField.text, forKey: contactRecord.key)
    }
}

