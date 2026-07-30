extension HTTP.Session.Policy {
  /// The persistence decision for a session after application work completes.
  public enum Commit: Sendable, Equatable {
    case create(HTTP.Session.Data)
    case update(HTTP.Session.ID, HTTP.Session.Data)
    case rotate(HTTP.Session.ID, HTTP.Session.Data)
    case destroy(HTTP.Session.ID)
    case none
  }
}
