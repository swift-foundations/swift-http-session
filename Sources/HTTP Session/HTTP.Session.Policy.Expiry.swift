extension HTTP.Session.Policy {
    /// The lifecycle state represented by a session cookie.
    public enum Expiry: Sendable, Equatable, Hashable {
        case active
        case expired
    }
}
