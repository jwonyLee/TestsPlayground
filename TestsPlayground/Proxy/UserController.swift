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

class UserControllerImpl: UserController {
    func login(
        telephone: String,
        password: String
    ) -> UserVO {
        UserVO()
    }
    
    func register(
        telephone: String,
        password: String
    ) -> UserVO {
        UserVO()
    }
}

class UserControllerProxy: UserController {
    private let userController: UserController // 근데 왜 인터페이스로 안 받지
    
    init(userController: UserController) {
        self.userController = userController
    }
    
    func login(
        telephone: String,
        password: String
    ) -> UserVO {
        let startTime = DispatchTime.now()
        let userVo = userController.login(telephone: telephone, password: password)
        let endTime = DispatchTime.now()
        let elapsedTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        print("elapsedTime: \(elapsedTime)") // 여기서는 그냥 프린트문으로 출력하자.
        return userVo
    }
    
    func register(
        telephone: String,
        password: String
    ) -> UserVO {
        let startTime = DispatchTime.now()
        let userVo = userController.register(telephone: telephone, password: password)
        let endTime = DispatchTime.now()
        let elapsedTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        print("elapsedTime: \(elapsedTime)") // 여기서는 그냥 프린트문으로 출력하자.
        return userVo
    }
}
