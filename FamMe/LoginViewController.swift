//
//  LoginViewController.swift
//  FamMe
//
//  Created by C4Q on 1/7/19.
//  Copyright © 2019 C4Q. All rights reserved.
//

import UIKit
import RealmSwift
class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    var userName: String?
    var password: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        self.userName = userNameTF.text
        self.password = passwordTF.text
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
