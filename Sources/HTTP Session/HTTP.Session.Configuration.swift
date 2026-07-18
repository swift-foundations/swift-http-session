extension HTTP.Session {
    /// Cookie and identity policy for a session.
    public struct Configuration: Sendable, Equatable {
        public var cookie: Cookie
        public var rotation: Rotation

        public init(
            cookie: Cookie = .init(),
            rotation: Rotation = .never
        ) {
            self.cookie = cookie
            self.rotation = rotation
        }
    }
}
