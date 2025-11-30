//  

import Foundation

// MARK: - Builder 생각해보기

/*
 다음 코드의 ConstructorArg 클래스에서 isRef가 true이면 arg를 설정해야 하지만 type은 설정
 할 필요가 없고, 반대로 isRef가 false이면 arg와 type 모두 설정해야 하는데, 요구 사항에 따라
 ConstructorArg 클래스를 어떻게 개선해야 할지 생각해보자.
 */

class ConstructorArg: Equatable {
    private var isRef: Bool?
    private var type: Any.Type?
    private var arg: Any?
    
    public init(isRef: Bool?, type: Any.Type?, arg: Any?) {
        self.isRef = isRef
        self.type = type
        self.arg = arg
    }
    
    static func ==(lhs: ConstructorArg, rhs: ConstructorArg) -> Bool {
        lhs.isRef == rhs.isRef &&
        lhs.type == rhs.type &&
        lhs.arg as AnyObject === rhs.arg as AnyObject
    }
}

extension ConstructorArg {
    class Builder {
        private var isRef: Bool?
        private var type: Any.Type?
        private var arg: Any?
        
        func build() throws -> ConstructorArg {
            guard isRef != nil else {
                throw IllegalArgumentError()
            }
            
            if isRef == true && arg == nil {
                throw IllegalArgumentError()
            } else if isRef == false && (arg == nil || type == nil) {
                throw IllegalArgumentError()
            }
            
            return ConstructorArg(
                isRef: isRef, type: type, arg: arg
            )
        }
        
        func set(isRef: Bool) -> Self {
            self.isRef = isRef
            return self
        }
        
        func set(type: Any.Type) -> Self {
            self.type = type
            return self
        }
        
        func set(arg: Any) -> Self {
            self.arg = arg
            return self
        }
    }
}
