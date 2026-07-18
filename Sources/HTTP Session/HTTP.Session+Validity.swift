extension HTTP.Session {
    public var isValid: Bool { lifecycle == .active }
}
