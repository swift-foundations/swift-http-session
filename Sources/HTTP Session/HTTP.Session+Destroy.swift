extension HTTP.Session {
    public mutating func destroy() {
        lifecycle = .destroyed
    }
}
