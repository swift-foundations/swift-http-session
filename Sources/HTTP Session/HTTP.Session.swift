extension HTTP {
    /// Session identity and lifecycle policy for HTTP clients.
    public struct Session: Sendable, Equatable {
        public private(set) var id: ID?
        public var data: Data
        public private(set) var lifecycle: Lifecycle

        public var isValid: Bool { lifecycle == .active }

        public init(id: ID? = nil, data: Data = .init()) {
            self.id = id
            self.data = data
            lifecycle = .active
        }

        public mutating func destroy() {
            lifecycle = .destroyed
        }
    }
}
