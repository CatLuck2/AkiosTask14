//
//  AddCheckItem.swift
//  AkiosTask14
//
//  Created by Nekokichi on 2020/08/21.
//  Copyright © 2020 Nekokichi. All rights reserved.
//

import UIKit

class AddCheckItem: UIViewController {
    
    @IBOutlet private weak var checkItemTextField: UITextField!
    
    private(set) var checkItem:(text:String, keyCheck:Bool)!
    
    @IBAction private func addCheckItemToVC(_ sender: Any) {
        //checkItemTextFieldに文字が入力されてるか
        if checkItemTextField.text == "" {
            let alertController  = UIAlertController(title: "エラー", message: "1文字以上の文字を入力してください", preferredStyle: .alert)
            let cancelAction     = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        } else {
            checkItem = (text:checkItemTextField.text!, keyCheck:false)
            performSegue(withIdentifier: "addItem", sender: nil)
        }
    }
    
}
