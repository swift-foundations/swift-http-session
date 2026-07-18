extension HTTP.Session.Policy {
    /// The result of interpreting the configured session cookie.
    public enum Lookup: Sendable, Equatable {
        case new
        case existing(HTTP.Session.ID)
    }
}
