//
//  UsersViewModel.swift
//  SmallDemo
//
//  Created by Amin  on 11/07/2021.
//

import Foundation
import RxSwift
import RxCocoa

class UsersViewModel {
    
    // MARK: - Properties
    
    private var idLabelBehavior = BehaviorRelay<String>(value: "")
    private var titleLabelBehavior = BehaviorRelay<String>(value: "")
    private var bodyLabelBehavior = BehaviorRelay<String>(value: "")
    private var usersModelSubject = PublishSubject<[UsersModel]>()
    
    
    // MARK: - getter
    var idlabelObserver: Observable<String> {
        return idLabelBehavior.asObservable()
    }
    
    var titleLabelObserver: Observable<String> {
        return titleLabelBehavior.asObservable()
    }
    
    var bodyLabelObserver: Observable<String> {
        return bodyLabelBehavior.asObservable()
    }
    
    var userModelObserver: Observable<[UsersModel]> {
        return usersModelSubject
    }
    
    
    // MARK: - Methods
    
    func getData() {
        
        UserService.getDataUser().done { users in
            self.usersModelSubject.onNext(users)
        }.catch { error in
            print(error.localizedDescription)
        }
       
    }
}
