//
//  TangramKit+vert.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)
import TangramKit

// MARK: 垂直
public extension MyLayoutDSL {
    
    ///【Tangram: 上下边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func vertical(_ offset: CombinedLiteral = .default) -> Self {
        return self.top(offset)
            .bottom(offset)
    }
    
    ///【Tangram: 上下边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func verticalSafe(_ offset: CombinedLiteral = .default) -> Self {
        return topSafe(offset)
            .bottomSafe(offset)
    }
    
    ///【Tangram: 左右边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func vertical(_ top: CombinedLiteral,
              _ bottom: CombinedLiteral) -> Self {
        return self.top(top)
            .bottom(bottom)
    }
    
    ///【Tangram: 左右安全边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func verticalSafe(_ top: CombinedLiteral,
                      _ bottom: CombinedLiteral) -> Self {
        return topSafe(top)
            .bottomSafe(bottom)
    }
    
    ///【Tangram: 左右边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func vertical(by sizeClass: TGViewSizeClass,
              top: CombinedLiteral = .zero,
              bottom: CombinedLiteral = .zero) -> Self {
        return self.top(by:sizeClass, offset: top)
            .bottom(by:sizeClass, offset: bottom)
    }
}

#endif
