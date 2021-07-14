//
//  UsersState.swift
//  SmallDemo
//
//  Created by Amin  on 13/07/2021.
//

import Foundation
import ReSwift


struct UsersState {

    enum State {
        case initial
        case getUsers
        case NewUser
    }
    
    var usersStat: State = .initial
}

