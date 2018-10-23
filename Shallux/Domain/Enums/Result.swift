//
//  Result.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/23.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 A class represents the direct sum of the result `T` and the error `E`.
*/
enum Result<T, E> {
    case Ok(T)
    case Error(E)
    
    /**
     Returns whether the result is OK.
     
     - returns:
       - `true` OK
       - `false` Error
    */
    func isOk() -> Bool {
        switch self {
        case .Ok:
            return true
        case .Error:
            return false
        }
    }
    
    /**
     Returns whether the result has some error.
     
     - returns:
       - `true` Error
       - `false` OK
     */
    func isError() -> Bool {
        return !isOk()
    }
    
    /**
     Returns the result which is wrapped by `Optional`.
     
     - returns:
       Returns the result which has type `T` if it is `.Ok`. Otherwise, returns `nil`.
    */
    func ok() -> T? {
        switch self {
        case .Ok(let result):
            return result
        case .Error:
            return nil
        }
    }
    
    /**
     Returns the error which is wrapped by `Optional`.
     
     - returns:
     Returns the error which has type `E` if it is `.Error`. Otherwise, returns `nil`.
     */
    func error() -> E? {
        switch self {
        case .Ok:
            return nil
        case .Error(let error):
            return error
        }
    }
}
