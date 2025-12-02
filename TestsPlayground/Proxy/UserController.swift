import Foundation

struct UserVO {
}

protocol UserController {
    func login(
        telephone: String,
        password: String
    ) -> UserVO
    
    func register(
        telephone: String,
        password: String
    ) -> UserVO
}
