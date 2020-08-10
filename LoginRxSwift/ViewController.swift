//
//  ViewController.swift
//  LoginRxSwift
//
//  Created by Andrew on 8/10/20.
//  Copyright © 2020 Andrii Halabuda. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.becomeFirstResponder()
        username.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.usernameTextPublishSubject).disposed(by: disposeBag)
        password.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordTextPublishSubject).disposed(by: disposeBag)
        loginViewModel.isValid().bind(to: loginBtn.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.isValid().map{ $0 ? 1 : 0.5 }.bind(to: loginBtn.rx.alpha).disposed(by: disposeBag)
    }

    @IBAction func loginTapped(_ sender: Any) {
        print("Login btn tapped!")
    }

}

