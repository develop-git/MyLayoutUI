//
//  TangramKit+Top.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)
import TangramKit

// MARK: top
public extension MyLayoutDSL {
    
    ///【Tangram: 上边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min/.in
    @discardableResult
    func top(_ offset: CombinedLiteral = .default) -> Self {
        return offsetBy(offset, for:.top)
    }
    
    ///【Tangram: 上安全边距，默认 10 】
    @discardableResult
    func topSafe(_ offset: CombinedLiteral = .default) -> Self {
        return offsetBy(offset, for:.top, inSafe: true)
    }
    
    ///【Tangram: 上边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min/.in
    @discardableResult
    func top(by anchor: ViewYaxisAnchor?, offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(anchor, for:.top, extra:offset)
    }
    
    ///【Tangram: 以传入视图的视图顶部为起始点设置当前对象的边距值 上边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min/.in
    @discardableResult
    func top(by sizeClass: TGViewSizeClass, offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(sizeClass.lyt.top, for:.top, extra:offset)
    }
}
#endif
