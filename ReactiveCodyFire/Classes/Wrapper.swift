@_exported import CodyFire
import ReactiveSwift

public extension APIRequest {
    public var signalProducer: SignalProducer<ResultType, KnownNetworkError> {
        return SignalProducer { observer, disposable in
            disposable.observeEnded(self.cancel)
            self.onKnownError { error in
                observer.send(error: error)
                observer.sendCompleted()
            }.onSuccess { result in
                observer.send(value: result)
                observer.sendCompleted()
            }
        }
    }
}
