import { NavItem } from './Page02'

@Entry
@Component
struct Page07 {
  @State rate: number = 0.7
  readonly imageList: NavItem [] = [
    { id: 1, icon: $r('app.media.ic_nav_01'), title: '淘金币' },
    { id: 2, icon: $r('app.media.ic_nav_02'), title: '摇现金' },
    { id: 3, icon: $r('app.media.ic_nav_03'), title: '闲鱼' },
    { id: 4, icon: $r('app.media.ic_nav_04'), title: '中通快递' },
    { id: 5, icon: $r('app.media.ic_nav_05'), title: '芭芭农场' },
    { id: 6, icon: $r('app.media.ic_nav_06'), title: '淘宝珍库' },
  ]

  // 底部滑块，可以通过拖拽滑块改变容器尺寸
  @Builder
  slider() {
    Slider({
      value: this.rate * 100,
      min: 10,
      max: 100,
      style: SliderStyle.OutSet
    })
      .blockColor(Color.White)
      .width('60%')
      .position({ x: '20%', y: '87%' })
      .onChange((value: number) => {
        this.rate = value / 100
      })
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Text('宽度:' + (this.rate * 100).toFixed(0) + '%')
        .zIndex(2)
        .translate({ x: 20, y: 20 })
        .fontColor(Color.Orange)
      Flex({ justifyContent: FlexAlign.Center, direction: FlexDirection.Column }) {
        Column() {
          // 布局能力 7：折行能力
          // 容器组件尺寸发生变化，当布局方向尺寸不足以显示完整内容时自动换行

          // 实现方式：
          // Flex组件将 wrp 设置为FlexWrap.Wrap即可


          // 通过Flex组件warp参数实现自适应折行
          Flex({
            direction: FlexDirection.Row,
            alignItems: ItemAlign.Center,
            justifyContent: FlexAlign.Center,
            wrap: FlexWrap.Wrap // 是否换行：  FlexWrap.Wrap 开启换行
          }) {
            ForEach(this.imageList, (item: NavItem) => {
              Column() {
                Image(item.icon)
                  .width(80)
                  .height(80)
                Text(item.title)
              }
              .margin(10)

            })
          }
          .backgroundColor('#FFFFFF')
          .padding(20)
          .width(this.rate * 100 + '%')
          .borderRadius(16)

        }
        .width('100%')
        this.slider()
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Pink)
    }

  }
}