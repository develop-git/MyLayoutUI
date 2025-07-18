//
//  ConstraintAnchor.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)
import TangramKit

public protocol TangramConstraintAnchor {
}

public class ConstraintAnchor<T> : TangramConstraintAnchor {
    
    public typealias Origin = T
    public typealias View = TGViewSizeClass
    
    public var origin: Origin
    public var sizeClass: View
    
    required public init(origin: Origin, sizeClass: View) {
        self.origin = origin
        self.sizeClass = sizeClass
    }
}

public final class ViewXaxisAnchor: ConstraintAnchor<TGLayoutPos> {
}

public final class ViewYaxisAnchor: ConstraintAnchor<TGLayoutPos> {
}

public final class ViewSizeAnchor: ConstraintAnchor<TGLayoutSize> {
}
#endif
