//
//  TangramKit+UIView.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)
import TangramKit

public extension MyLayoutDSL {
    
    /** 监听布局变化
      - layout: 父布局视图
      - view:   视图本身
     */
    @discardableResult
    func completedLayout(action: @escaping(_ layout: TGBaseLayout, _ view: UIView)->Void) -> Self {
        (sizeClass as? UIView)?.tg_layoutCompletedDo { layout, view in
            action(layout, view)
        }
        return self
    }
    
    /// 【TangramKit】获取布局视图 布局类
    /// - Parameters:
    ///   - type: 布局类型
    @discardableResult
    func layoutClass(for type: DeviceScreenType) -> TGViewSizeClass? {
        return (sizeClass as? UIView)!.tg_fetchSizeClass(with: type.rawValue)
    }
}
#endif
