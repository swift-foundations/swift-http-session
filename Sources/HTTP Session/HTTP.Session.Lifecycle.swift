extension HTTP.Session {
    /// The lifecycle state of a session.
    public enum Lifecycle: Sendable, Equatable, Hashable {
        case active
        case destroyed
    }
}
