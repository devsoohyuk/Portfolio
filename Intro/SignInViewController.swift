//
//  SignInViewController.swift
//  Portfolio
//
//  Created by 홍수혁 on 2020/04/02.
//  Copyright © 2020 홍수혁. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let real = RealmDB()
        real.self
        
        self.idTextField.delegate = self
        self.pwTextField.delegate = self
        
        navigationController?.isNavigationBarHidden = true
        textFieldAttribute(idTextField)
        textFieldAttribute(pwTextField)
        
//        setGradientBackground()
        
        let common = Common()
        if let items = common.loadJson(filename: "Login") {
            print(items[0].id)
            
            //            if items[0].id == idTextField.text {
            //                print("값 찾음")
            //
            //            } else {
            //                return
            //
            //            }
            
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MainVC")
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
        
    }
    
    func textFieldAttribute(_ textField:UITextField) {
        
        if textField == idTextField {
            textField.placeholder = "아이디를 입력하세요."
            
        } else if textField == pwTextField {
            textField.placeholder = "패스워드를 입력하세요."
            textField.isSecureTextEntry = true
            
        }
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
    }
}

extension SignInViewController: UITextFieldDelegate {
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        idTextField.resignFirstResponder()
        pwTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        idTextField.resignFirstResponder()
        pwTextField.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        return true
    }
    
}

extension SignInViewController {
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 200.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.5, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
}
