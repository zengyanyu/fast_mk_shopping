@Entry
@Component
struct Demo03 {
  @State rate: number = 200

  // 底部滑块，可以通过拖拽滑块改变容器尺寸
  @Builder
  slider() {
    Slider({
      value: $$this.rate,
      min: 200,
      max: 500,
      style: SliderStyle.OutSet
    })
      .blockColor(Color.White)
      .width('60%')
      .height(50)

      .position({ x: '20%', y: '80%' })
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      // 显示目前容器的宽度
      Text('宽度:' + this.rate.toFixed(0))
        .zIndex(2)
        .translate({ x: 20, y: 20 })
        .fontColor(Color.Orange)


      Column() {
        // 布局能力 3：占比能力
        // 子组件的宽高按照预设的比例，随父容器组件发生变化

        // 实现方式：
        // 1. 子组件的【宽高】设置为父组件宽高的【百分比】
        // 2. 通过 layoutWeight 属性设置主轴方向【布局权重】（比例）


        // 容器 主轴横向
        Row() {
          // 上一首
          Column() {
            Image($r("app.media.ic_public_play_last"))
              .width(50)
              .height(50)
              .border({ width: 2 })
              .borderRadius(30)
              .padding(10)
          }
          .height(96)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          // .width('33.3%')
          .layoutWeight(5) // 设置子组件在父容器主轴方向的布局权重


          // 播放&暂停
          Column() {
            Image($r("app.media.ic_public_pause"))
              .width(50)
              .height(50)
              .border({ width: 2 })
              .borderRadius(30)
              .padding(10)
          }
          .height(96)
          .backgroundColor(Color.Orange)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          // .width('33.4%')
          .layoutWeight(5) // 设置子组件在父容器主轴方向的布局权重


          // 下一首
          Column() {
            Image($r("app.media.ic_public_play_next"))
              .width(50)
              .height(50)
              .border({ width: 2 })
              .borderRadius(30)
              .padding(10)
          }
          .height(96)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          // .width('33.3%')
          .layoutWeight(5) // 设置子组件在父容器主轴方向的布局权重

        }
        .width(this.rate) // 绑定宽度给 容器
        .height(96)
        .borderRadius(16)
        .backgroundColor(Color.Pink)

        // 调整宽度的滑块
        this.slider()
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F1F3F5')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }

  }
}
