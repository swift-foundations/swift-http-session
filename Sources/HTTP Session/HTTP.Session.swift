extension HTTP {
    /// Session identity and lifecycle policy for HTTP clients.
    public struct Session: Sendable, Equatable {
        public private(set) var id: ID?
        public var data: Data
        public internal(set) var lifecycle: Lifecycle

        public init(id: ID? = nil, data: Data = .init()) {
            self.id = id
            self.data = data
            lifecycle = .active
        }
    }
}
