//

import Testing

struct BuilderTests {

    @Test
    func test_isRef가_true_이면서_arg를_설정하면_객체를_생성할_수_있다() async throws {
        // 준비
        let builder = ConstructorArg.Builder()
        let expectedResult = ConstructorArg(
            isRef: true,
            type: nil,
            arg: "value"
        )
        
        // 실행
        let result = try builder
            .set(isRef: true)
            .set(arg: "value")
            .build()
        
        // 검증
        #expect(result == expectedResult)
    }
    
    @Test
    func test_isRef가_false_이면서_arg_와_type_모두_설정하지_않으면_객체를_생성할_수_없다()
    async throws
    {
        // 준비
        let builder = ConstructorArg.Builder()
        
        // 검증
        #expect(throws: Error.self) {
            // 실행
            try builder
                .set(isRef: false)
                .build()
        }
    }
    
    @Test
    func test_isRef가_false_이면서_arg_만_설정하면_객체를_생성할_수_없다() async throws {
        // 준비
        let builder = ConstructorArg.Builder()
        
        // 검증
        #expect(throws: Error.self) {
            // 실행
            try builder
                .set(isRef: false)
                .set(arg: "value")
                .build()
        }
    }
    
    @Test
    func test_isRef가_false_이면서_type_만_설정하면_객체를_생성할_수_없다() async throws {
        // 준비
        let builder = ConstructorArg.Builder()
        
        // 검증
        #expect(throws: Error.self) {
            // 실행
            try builder
                .set(isRef: false)
                .set(type: String.self)
                .build()
        }
    }
    
    @Test
    func test_isRef가_false_이면서_arg_와_type_을_설정하면_객체를_생성할_수_있다() async throws {
        // 준비
        let builder = ConstructorArg.Builder()
        let expectedResult = ConstructorArg(
            isRef: false,
            type: String.self,
            arg: "value"
        )
        
        // 실행
        let result = try builder
            .set(isRef: false)
            .set(type: String.self)
            .set(arg: "value")
            .build()
        
        // 검증
        #expect(result == expectedResult)
    }
}
