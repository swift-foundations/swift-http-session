extension HTTP.Session.Data {
    public subscript(_ key: String) -> String? {
        get { storage[key] }
        set { storage[key] = newValue }
    }
}
