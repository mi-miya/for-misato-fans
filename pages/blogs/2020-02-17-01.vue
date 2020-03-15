<template>
  <div class="blog">
    <header>
      <p class="date">
        2020 / 02 / 17
      </p>
      <h1>タイピング or タップ で読むブログ</h1>
    </header>
    <main>
      <pre id="typing_area"><span id="code">// Typing か ココを Tap で、Blog が読めます.</span><span id="cursor">|</span></pre>
    </main>
  </div>
</template>

<style lang="scss" scoped>
@import '~/assets/stylesheets/blog.scss';

.hidden {
  opacity: 0;
}

#typing_area {
  width: 100% !important;
  padding-bottom: 10px;
  font-family: 'Courier Prime', monospace;
  box-sizing: border-box;
  background-color: #000200 !important;
  color: #23d400;
  line-height: 20px;
  font-size: 14px;
}

#cursor {
  margin-left: -1px;
  font-size: 16px;
  vertical-align: top;
}
</style>

<script>
const CODE = `

let Keii = (e) => {
  return \`
    男の子なら誰もが一度はハマったであろうサイト + 'Hacker Typer'
    少し前にそれを Trace してみたので
    "Blog の記事に組み込んだらどんな感じだろう" と思って
    試してみました
  \`;
}

let Doudesyo_ka = () => {
  return \`
    Hacker Typerは簡単に見えて、こだわられたデザインをしています
    なので、Blog に組み込んでみても
    イマイチ世界観が演出できないような気はします
  \`;
}

function tada () {
  return "Typing || Tap すると文字が入力されるというのは" +
    'ユーザ体験として面白いのかも' ?
      'なんて思っています' : '';
  \`;
}

// Hacker Typer は
// 次のURLからご覧いただけます。
// https://hackertyper.net/

function end () {
  console.info('お読みいただき' + \`ありがとう\${"ございました"}\`);
  return '終わり';
}

end();
`
const TEXT_COUNT = CODE.length

export default {
  data: () => {
    return {
      textNumber: 0
    }
  },
  mounted () {
    const el = document.getElementById('typing_area')
    window.addEventListener('keydown', this.keyEvent, false)
    window.addEventListener('keyup', this.keyEvent, false)
    window.addEventListener('keypress', this.keyEvent, false)
    el.addEventListener('touchstart', this.keyEvent, false)
    el.addEventListener('touchend', this.keyEvent, false)
    setInterval(() => {
      document.getElementById('cursor').classList.toggle('hidden')
    }, 700)
  },
  methods: {
    keyEvent () {
      if (TEXT_COUNT <= this.textNumber) {
        return
      }
      document.getElementById('code').append(CODE[this.textNumber])
      this.textNumber += 1
      window.scrollTo({
        top: document.body.clientHeight
      })
    }
  },
  head () {
    return {
      link: [
        {
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/css?family=Courier+Prime|Noto+Serif+JP&display=swap'
        }
      ]
    }
  }
}
</script>
