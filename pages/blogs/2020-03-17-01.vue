<template>
  <div class="ly_blog">
    <header class="ly_header">
      <p class="el_blogDate">
        2020 / 03 / 17
      </p>
      <h1 class="el_blogHeader">
        お風呂で記事を書いてみました。
      </h1>
    </header>
    <main class="ly_main">
      <p>
        みなさんこんにちは。<br>
        前回の記事を作成してから、はや1ヶ月が経ってしまいました。
      </p>
      <p>
        そろそろ次の記事を書こうと思ったのですが、なかなかいいアイデアは湧きませんね。
      </p>
      <p>
        そこで、気晴らしにお風呂に浸かりながら、ゆったりと記事を書いてみることにしました&#x2668;
      </p>
      <img src="/images/blogs/2020-03-17/furo.jpg" alt="風呂で記事を書く私">
      <p>
        <br>
        うむ、なかなか良い湯加減。<br>
        コレはかなり捗りそう&#x2757;
      </p>
      <br>
      <p>
        が、一つ欠点が。<br>
        画面がめちゃくちゃ曇る！これでは記事を書くどころではありません。
      </p>
      <p>
        皆さんの画面では、きちんと記事が読めているでしょうか&#x2753;<br>
        もし見づらい場合は、画面を拭いてみていただけると幸いです...
      </p>
      <br>
      <img src="/images/blogs/2020-03-17/furo2.jpg" alt="風呂で記事を書く私">
      <p>
        <br>
        でもやっぱり、お風呂での記事執筆は難しいですね。<br>
        このノートPC、防水じゃないし&#x1F92F;<br>
        充電もほとんどないし&#x1F50B;
      </p>
      <p>
        ノートPCが壊れる前に、早めの退散をします...
      </p>
      <br>
      <br>
      <p>
        最後に、この記事を書くにあたってインスピレーションを得たページのご紹介もしておきます。<br>
        面白法人カヤックさんが制作された『<a href="http://ui.kayac.com/event/onsen2015/">UI温泉</a>』<br>
        現在は独立されている『佐藤ねじ』さんのデザインです。
      </p>
      <p>
        佐藤ねじさんの企画は本当に面白いものばかりで、感服しきりですね。<br>
        私もあのような面白いサイトをどんどん作りたいものです&#x1F609;
      </p>
    </main>
  </div>
</template>

<style lang="scss" scoped>
@import "~/assets/stylesheets/blog.scss";

p, img, br, h1, h2 {
  user-select: none;
  -moz-user-select: none;
  -webkit-user-select: none;
  -ms-user-select: none;
}
</style>

<script>
export default {
  data: () => {
    return {
      cnavas: null,
      context: null,
      timer: null,
      drawFlg: false,
      LINE_WIDTH: 80,
      oldPathX: 0,
      oldPathY: 0,
      style: {
        position: 'fixed',
        top: 0,
        left: 0,
        zIndex: 1005,
        backgroundImage: 'url(/images/blogs/2020-03-17/water-drop.png)',
        backgroundRepeat: 'repeat',
        pointerEvents: 'none'
      }
    }
  },
  mounted () {
    document.getElementById('__layout').style.backgroundColor = '#f2f2f2'
    this.canvas = document.createElement('canvas')
    this.context = this.canvas.getContext('2d')
    this.canvas.width = window.parent.screen.width
    this.canvas.height = window.parent.screen.height
    for (const key in this.style) {
      this.canvas.style[key] = this.style[key]
    }
    document.body.appendChild(this.canvas)
    this.timer = setInterval(this.updateOpacity, 100)
    window.addEventListener('mousedown', this.mousedownOrTouchstart)
    window.addEventListener('touchstart', this.mousedownOrTouchstart)
    window.addEventListener('mousemove', this.mousemoveOrTouchmove)
    window.addEventListener('touchmove', this.mousemoveOrTouchmove)
    window.addEventListener('mouseup', this.mouseupOrTouchend)
    window.addEventListener('touchend', this.mouseupOrTouchend)
    window.addEventListener('resize', this.resizeWindow)
  },
  destroyed () {
    document.getElementById('__layout').style.backgroundColor = '#ffffff'
    clearInterval(this.timer)
    this.canvas.remove()
    window.removeEventListener('mousedown', this.mousedownOrTouchstart)
    window.removeEventListener('touchstart', this.mousedownOrTouchstart)
    window.removeEventListener('mousemove', this.mousemoveOrTouchmove)
    window.removeEventListener('touchmove', this.mousemoveOrTouchmove)
    window.removeEventListener('mouseup', this.mouseupOrTouchend)
    window.removeEventListener('touchend', this.mouseupOrTouchend)
    window.removeEventListener('resize', this.resizeWindow)
  },
  methods: {
    resizeWindow () {
      this.canvas.width = window.parent.screen.width
      this.canvas.height = window.parent.screen.height
    },
    updateOpacity () {
      this.context.globalCompositeOperation = 'source-over'
      this.context.beginPath()
      this.context.fillStyle = 'rgba(255, 255, 255, 0.02)'
      this.context.fillRect(0, 0, this.canvas.width, this.canvas.height)
    },
    mousedownOrTouchstart (e) {
      this.drawFlg = true
      if (e.type === 'mousedown') {
        this.oldPathX = e.clientX
        this.oldPathY = e.clientY
      } else {
        this.oldPathX = e.touches[0].clientX
        this.oldPathY = e.touches[0].clientY
      }
    },
    mousemoveOrTouchmove (e) {
      if (this.drawFlg) {
        this.context.globalCompositeOperation = 'destination-out'
        this.context.lineCap = 'round'
        this.context.lineWidth = this.LINE_WIDTH
        this.context.beginPath()
        this.context.moveTo(this.oldPathX, this.oldPathY)
        if (e.type === 'mousemove') {
          this.context.lineTo(e.clientX, e.clientY)
          this.context.stroke()
          this.context.closePath()
          this.oldPathX = e.clientX
          this.oldPathY = e.clientY
        } else {
          this.context.lineTo(e.touches[0].clientX, e.touches[0].clientY)
          this.context.stroke()
          this.context.closePath()
          this.oldPathX = e.touches[0].clientX
          this.oldPathY = e.touches[0].clientY
        }
      }
    },
    mouseupOrTouchend () {
      this.drawFlg = false
    }
  },
  head () {
    return {
      title: 'お風呂で記事を書いてみました。'//,
      // link: [
      //   {
      //     rel: 'stylesheet',
      //     href: 'https://fonts.googleapis.com/***'
      //   }
      // ]
    }
  }
}
</script>
