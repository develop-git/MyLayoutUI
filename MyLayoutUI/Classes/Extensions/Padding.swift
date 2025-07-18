//
//  TangramKit+Padding.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)
import TangramKit

public extension MyLayoutDSL {
    /// 【TangramKit】视图内部边距一致 对内部子视图有效
    @discardableResult
    func padding(_ len: CGFloat) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_padding = UIEdgeInsets(top: len, left: len, bottom: len, right: len)
        return self
    }
    
    /// 【TangramKit】视图内部边距自定义 上下左右不同边距 对内部子视图有效
    @discardableResult
    func padding(_ insets: UIEdgeInsets) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_padding = insets
        return self
    }
    
    /// 【TangramKit】视图内部边距自定义 上下左右可选 对内部子视图有效
    @discardableResult
    func padding(_ edges: UIRectEdge, _ len: CGFloat) -> Self {
        guard let view = (sizeClass as? TGBaseLayout) else { return self }
        
        if edges.contains(.all) {
            view.tg_padding = UIEdgeInsets(top: len, left: len, bottom: len, right: len)
            return self
        }
        let val = len
        /// top
        if edges.contains(.top) {
            view.tg_topPadding = val
        }
        /// left
        if edges.contains(.left) {
            view.tg_leadingPadding = val
        }
        /// right
        if edges.contains(.right) {
            view.tg_trailingPadding = val
        }
        /// bottom
        if edges.contains(.bottom) {
            view.tg_bottomPadding = val
        }
        return self
    }
}

#endif
