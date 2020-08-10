//
//  LoginViewModel.swift
//  LoginRxSwift
//
//  Created by Andrew on 8/10/20.
//  Copyright © 2020 Andrii Halabuda. All rights reserved.
//

import RxSwift
import RxCocoa

struct LoginViewModel {
    let usernameTextPublishSubject = PublishSubject<String>()
    let passwordTextPublishSubject = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(usernameTextPublishSubject.asObservable().startWith(""), passwordTextPublishSubject.asObservable().startWith("")).map { username, pass in
            return username.count > 3 && pass.count > 3
        }.startWith(false)
    }
}
