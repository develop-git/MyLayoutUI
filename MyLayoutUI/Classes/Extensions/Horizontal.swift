//
//  TangramKit+horz.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)
import TangramKit

// MARK: 水平
public extension MyLayoutDSL {
    ///【Tangram: 左右边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func horizontal(_ offset: CombinedLiteral = .default) -> Self {
        return self.leading(offset)
            .trailing(offset)
    }
    
    ///【Tangram: 左右安全边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func horizontalSafe(_ offset: CombinedLiteral = .default) -> Self {
        return self.leadingSafe(offset)
            .trailingSafe(offset)
    }
    
    ///【Tangram: 左右边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func horizontal(_ leading: CombinedLiteral,
                    _ trailing: CombinedLiteral) -> Self {
        return self.leading(leading)
            .trailing(trailing)
    }
    
    ///【Tangram: 左右安全边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func horizontalSafe(_ leading: CombinedLiteral,
                        _ trailing: CombinedLiteral) -> Self {
        return self.leadingSafe(leading)
            .trailingSafe(trailing)
    }
    
    @discardableResult
    func horizontal(by sizeClass: TGViewSizeClass,
              leading: CombinedLiteral = .zero,
              trailing: CombinedLiteral = .zero) -> Self {
        return self.leading(by: sizeClass, offset: leading)
            .trailing(by: sizeClass, offset: trailing)
    }
}

#endif
