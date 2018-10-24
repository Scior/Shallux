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
       Returns the result which has type `T` if itself is `.ok`. Otherwise, returns `nil`.
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
     Returns the error which has type `E` if itself is `.error`. Otherwise, returns `nil`.
     */
    func error() -> E? {
        switch self {
        case .ok:
            return nil
        case .error(let error):
            return error
        }
    }
    
    /**
     Consumes the result value if itself is `.Ok`.
     
     - Parameters:
       - handler: A handler to consume a `T` value.
    */
    func ifOk(_ handler: @escaping (T) -> Void) {
        guard let result = ok() else { return }
        
        handler(result)
    }
    
    /**
     Applies the function to convert the result type from `T` to `U`.
     
     - Parameters:
       - transform: A mapper function which maps `T` to `U`.
     
     - returns:
     - `.ok` with type `Result<U, E>`, if its original state was `.ok`.
     - `.error` with type `Result<U, E>`, if its original state was `.error`.
     */
    func map<U>(_ transform: ((T) -> U)) -> Result<U, E> {
        switch self {
        case .ok(let result):
            return .ok(transform(result)) as Result<U, E>
        case .error(let error):
            return .error(error) as Result<U, E>
        }
    }
    
}
