extension HTTP.Session {
    /// The identity policy applied when an existing session is committed.
    public enum Rotation: Sendable, Equatable, Hashable {
        case never
        case onRestore
    }
}
