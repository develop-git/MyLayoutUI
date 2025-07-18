//
//  TangramKit+Trailing.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)
import TangramKit

// MARK: trailing
public extension MyLayoutDSL {
    
    ///【Tangram: 右边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min/.in
    @discardableResult
    func trailing(_ offset: CombinedLiteral = .default) -> Self {
        return offsetBy(offset, for:.trailing)
    }
    
    ///【Tangram: 右安全边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min/.in
    @discardableResult
    func trailingSafe(_ offset: CombinedLiteral = .default) -> Self {
        return offsetBy(offset, for:.trailing, inSafe: true)
    }
    
    ///【Tangram: 右边距，默认 10 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func trailing(by anchor: ViewXaxisAnchor?, offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(anchor, for:.trailing, extra:offset)
    }
    
    ///【Tangram: 右边距，默认 10 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func trailing(by sizeClass: TGViewSizeClass, offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(sizeClass.lyt.trailing, for:.trailing, extra:offset)
    }
}

// MARK: 右上 右下(done)
public extension MyLayoutDSL {
    
    ///【Tangram: 右上边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func trailingTop(_ offset: CombinedLiteral = .default) -> Self {
        return self.trailing(offset)
            .top(offset)
    }
    
    ///【Tangram: 右上边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func trailingTop(_ trailing: CombinedLiteral,
                     _ top: CombinedLiteral) -> Self {
        return self.trailing(trailing)
            .top(top)
    }
    
    ///【Tangram: 右下边距，默认 10 】
    @discardableResult
    func trailingBottom(_ offset: CombinedLiteral = .default) -> Self {
        return self.trailing(offset)
            .bottom(offset)
    }
    
    ///【Tangram: 右下边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func trailingBottom(_ trailing: CombinedLiteral,
                        _ bottom: CombinedLiteral) -> Self {
        return self.trailing(trailing)
            .bottom(bottom)
    }
}

#endif
