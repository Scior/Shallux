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
    /// OK status which has the result value.
    case ok(T)
    /// Error status which has the value describing the occured error.
    case error(E)
    
    /**
     Returns whether the result is OK.
     
     - returns:
       - `true` OK
       - `false` Error
    */
    func isOk() -> Bool {
        switch self {
        case .ok:
            return true
        case .error:
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
        case .ok(let result):
            return result
        case .error:
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
        case .ok:
            return nil
        case .error(let error):
            return error
        }
    }
}
