import Foundation

class ResourcePoolConfig {
    private var name: String
    private var maxTotal: Int
    private var maxIdle: Int
    private var minIdle: Int
    
    private init(builder: Builder) {
        self.name = builder.name
        self.maxTotal = builder.maxTotal
        self.maxIdle = builder.maxIdle
        self.minIdle = builder.minIdle
    }
}

extension ResourcePoolConfig {
    
    class Builder {
        private static let defaultMaxTotal = 8
        private static let defaultMaxIdle = 8
        private static let defaultMinIdle = 0
        
        fileprivate var name: String
        fileprivate var maxTotal: Int = Builder.defaultMaxTotal
        fileprivate var maxIdle: Int = Builder.defaultMaxIdle
        fileprivate var minIdle: Int = Builder.defaultMinIdle
        
        init(name: String) {
            self.name = name
        }
        
        func build() throws -> ResourcePoolConfig {
            if name.isEmpty {
                throw IllegalArgumentError()
            }
            if maxIdle > maxTotal {
                throw IllegalArgumentError()
            }
            if minIdle > maxTotal || minIdle > maxIdle {
                throw IllegalArgumentError()
            }
            return ResourcePoolConfig(builder: self)
        }
        
        func set(name: String) throws -> Builder {
            if name.isEmpty {
                throw IllegalArgumentError()
            }
            self.name = name
            return self
        }
        
        func set(maxTotal: Int) throws -> Builder {
            if maxTotal <= 0 {
                throw IllegalArgumentError()
            }
            self.maxTotal = maxTotal
            return self
        }
        
        func set(maxIdle: Int) throws -> Builder {
            if maxIdle <= 0 {
                throw IllegalArgumentError()
            }
            self.maxIdle = maxIdle
            return self
        }
        
        func set(minIdle: Int) throws -> Builder {
            if minIdle <= 0 {
                throw IllegalArgumentError()
            }
            self.minIdle = minIdle
            return self
        }
    }
}

