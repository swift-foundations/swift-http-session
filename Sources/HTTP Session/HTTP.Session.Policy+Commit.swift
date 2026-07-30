extension HTTP.Session.Policy {
  public func commit(_ session: HTTP.Session, incoming: HTTP.Session.ID? = nil) -> Commit {
    guard session.isValid else {
      guard let id = session.id ?? incoming else { return .none }
      return .destroy(id)
    }

    guard let id = session.id else { return .create(session.data) }
    switch configuration.rotation {
    case .never: return .update(id, session.data)
    case .onRestore: return .rotate(id, session.data)
    }
  }
}
