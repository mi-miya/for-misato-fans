<template>
  <div class="ly_blog">
    <header class="ly_header">
      <p class="el_blogDate">
        2020 / 03 / 17
      </p>
      <h1 class="el_blogHeader">
        温泉で記事を書いてみました。
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
        とても画面が曇る！これでは記事を書くどころではありません。
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
@import '~/assets/stylesheets/blog.scss';
</style>

<script>
export default {
  data: () => {
    return {
    }
  },
  mounted () {
    document.getElementById('__layout').style.backgroundColor = '#f2f2f2'
  },
  destroyed () {
    document.getElementById('__layout').style.backgroundColor = '#ffffff'
  },
  head () {
    return {
      title: '温泉で記事を書いてみました。',
      link: [
        {
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/***'
        }
      ]
    }
  }
}
</script>
