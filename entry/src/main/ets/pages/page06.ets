@Entry
@Component
struct Demo06 {
  @State rate: number = 48

  // 底部滑块，可以通过拖拽滑块改变容器尺寸
  @Builder
  slider() {
    Slider({
      value: $$this.rate,
      min: 0,
      max: 400,
      style: SliderStyle.OutSet
    })
      .blockColor(Color.White)
      .width('60%')
      .height(50)

      .position({ x: '20%', y: '80%' })
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Text('宽度:' + this.rate.toFixed(0))
        .zIndex(2)
        .translate({ x: 20, y: 20 })
        .fontColor(Color.Orange)

      Column() {
        // 布局能力 6：隐藏能力
        // 容器组件内的子组件，按照其预设的显示优先级，随容器组件尺寸变化显示或隐藏


        // 实现方式：
        // displayPriority属性：设置布局优先级来控制显隐
        // 当主轴方向剩余尺寸不足以满足全部元素时，按照布局优先级，从[小到大]依次隐藏


        Row({ space: 10 }) {
          Image($r("app.media.ic_public_favor"))
            .width(48)
            .height(48)
            .displayPriority(1) // 布局优先级

          Image($r("app.media.ic_public_play_last"))
            .width(48)
            .height(48)
            .displayPriority(2) // 布局优先级

          Image($r("app.media.ic_public_pause"))
            .width(48)
            .height(48)
            .displayPriority(3) // 布局优先级

          Image($r("app.media.ic_public_play_next"))
            .width(48)
            .height(48)
            .objectFit(ImageFit.Contain)
            .displayPriority(2) // 布局优先级

          Image($r("app.media.ic_public_view_list"))
            .width(48)
            .height(48)
            .objectFit(ImageFit.Contain)
            .displayPriority(2) // 布局优先级
          son()
            .displayPriority(1) // 布局优先级


        }
        .width(this.rate)
        .height(96)
        .borderRadius(16)
        .backgroundColor('#FFFFFF')
        .justifyContent(FlexAlign.Center)
        .padding(10)

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

@Component
struct  son{
  aboutToAppear(): void {
    console.log('aboutToAppear')
  }
  aboutToDisappear(): void {
    console.log('aboutToDisappear')
  }
  build() {
    Text('123')
  }
}