<template>
  <div id="home">
    <section id="about">
      <h2>自分のこと</h2>
      <div class="about_text">
        <p>
          東京のSES系企業にてテレビ系システムの運用・修正業務を経験。<br>
          現在は、大阪府でフリーランスエンジニアとして、<br>
          Flutterアプリの開発やWebサイト制作をお手伝いしています。<br>
          <a href="https://docs.google.com/forms/d/1BTCd_FQW4d5ZC_b4Su7_pAZqLvG5eaB5eDTUCPze2Nk">
            お仕事のご依頼、ご相談はお気軽にどうぞ!
          </a>
        </p>
        <p>
          アニメが好きです＼(^o^)／<br>
          一番好きなアニメは『Re:ゼロ』ですが、他にもいろいろ見てます。<br>
          <a href="https://docs.google.com/forms/d/1BTCd_FQW4d5ZC_b4Su7_pAZqLvG5eaB5eDTUCPze2Nk">
            アニメが好きな方は、私と一緒にアニメ鑑賞しませんか!?
          </a>
        </p>
        <p>
          FPSゲームも好きです＼(^o^)／<br>
          今はPCでBattle Field Vをしています。他にはCSGOやCoD:MWも。<br>
          <a href="https://docs.google.com/forms/d/1BTCd_FQW4d5ZC_b4Su7_pAZqLvG5eaB5eDTUCPze2Nk">
            FPSが好きな方は、一緒に戦場にダイブしませんか!?
          </a>
        </p>
        <p>
          旅やアウトドアも好きです＼(^o^)／<br>
          以前、自転車で日本一周の旅を達成したこともあります。<br>
          <a href="https://docs.google.com/forms/d/1BTCd_FQW4d5ZC_b4Su7_pAZqLvG5eaB5eDTUCPze2Nk">
            アウトドア好きの方は、一緒にキャンプファイヤーを囲みませんか!?
          </a>
        </p>
      </div>
    </section>
    <section id="created">
      <h2>
        作ったもの
      </h2>
      <div class="created_div">
        <div class="created_description">
          <h3>Github</h3>
        </div>
        <ul class="scrolljs">
          <li v-for="repo in repos" :key="repo.url">
            <a :href="repo.url">
              <img :src="require('~/assets/images/repos/' + repo.img)" :alt="repo.title">
              <p>{{ repo.title }}</p>
            </a>
          </li>
          <li class="created_readmore">
            <a href="https://github.com/mi-miya?tab=repositories">
              <p>もっと見る</p>
            </a>
          </li>
        </ul>
      </div>
      <div class="created_div traces">
        <div class="created_description">
          <h3>Traces</h3>
          <p>
            デザインを学ぶために、色々なWebサイトのトレースを行っています。
          </p>
        </div>
        <ul class="scrolljs">
          <li v-for="trace in traces" :key="trace.url">
            <a :href="'https://mi-miya.github.io/traces/' + trace.url + '/'">
              <img :src="require('~/assets/images/traces/' + trace.url + '.png')" :alt="trace.title">
              <p>{{ trace.title }}</p>
            </a>
          </li>
          <li class="created_readmore">
            <a href="https://mi-miya.github.io/traces/">
              <p>もっと見る</p>
            </a>
          </li>
        </ul>
      </div>
    </section>
    <section id="wrote">
      <h2>
        書いたもの
      </h2>
      <div class="wrote_div">
        <div class="wrote_description">
          <h3>変なブログ</h3>
          <p>
            それまではJekyllとGithubPagesで書いていましたが、株式会社ブルーパドルさんの『変なWEBメディア』に触発されて作り直しました。<br>
            読んでいる記事に、読者がドキドキするような仕掛けが出来たらいいなと、企んでいます。
          </p>
          <a href="https://for-misato-fans.ml/blogs/">
            https://for-misato-fans.ml/blogs/
          </a>
        </div>
        <div class="wrote_description">
          <h3>Qiita</h3>
          <a href="https://qiita.com/mi-miya">
            https://qiita.com/mi-miya
          </a>
        </div>
        <div class="wrote_description">
          <h3>旅ブログ</h3>
          <p>
            思い立って出発した自転車日本一周中に書いていたブログです。<br>
            今となっては、なんだかこそばゆくて恥ずかしいのです。
          </p>
          <a href="https://jibun-journey.hateblo.jp/">
            https://jibun-journey.hateblo.jp/
          </a>
        </div>
      </div>
    </section>
  </div>
</template>

<style lang="scss" scoped>
@import '~/assets/stylesheets/common.scss';

#home {
  section {
    display: flex;
      flex-direction: column;
      justify-content: center;
    width: 90%;
    min-height: 100vh;
    margin: 0 auto;
    border-bottom: 1px dotted $themeColor;
    @include media($pc) {
      width: 95%;
    }
    &:last-child {
      border: none;
    }
    h2 {
      margin: 0 0 24px;
      font-size: 24px;
      letter-spacing: 5px;
      font-weight: normal;
    }
  }
  #about {
    .about_text {
      p {
        margin: 0 0 26px;
        font-size: 14px;
        line-height: 24px;
      }
      a {
        color: $themeColor;
      }
    }
  }
  #created {
    .created_div {
      margin: 0 0 15px;
      @include media($pc) {
      margin: 0 0 20px;
      }
      .created_description {
        h3 {
          font-size: 20px;
          font-weight: normal;
        }
        p {
          font-size: 14px;
        }
      }
      ul {
        width: 90vw;
        padding: 25px 20px 10px;
        box-sizing: border-box;
        display: flex;
        overflow-y: hidden;
        @include media($pc) {
          width: 100%;
          padding: 25px 15px 20px;
        }
        li {
          margin-right: 20px;
          @include media($pc) {
            margin-right: 14px;
          }
          a {
            display: inline-block;
            width: 100%;
            height: 100%;
            text-decoration: none;
            img {
              width: 30vw;
              height: 30vw;
              border-radius: 23vw;
              object-fit: cover;
              @include media($pc) {
                width: 110px;
                height: 110px;
              }
            }
            p {
              text-align: center;
              color: #2f2f2f;
              font-size: 14px;
              @include media($pc) {
                font-size: 12px;
              }
            }
          }
        }
        .created_readmore {
          a {
            width: 35vw;
            height: 35vw;
            line-height: 35vw;
            @include media($pc) {
              width: 120px;
              height: 120px;
              line-height: 120px;
            }
            p {
              color: $themeColor;
            }
          }
        }
      }
    }
  }
  #wrote {
    .wrote_div {
      .wrote_description {
        margin: 0 0 40px;
        h3 {
          font-size: 18px;
          font-weight: normal;
        }
        p {
          font-size: 14px;
        }
        a {
          color: $themeColor;
        }
      }
    }
  }
}
</style>

<script>
export default {
  data () {
    return {
      traces: [
        {
          title: 'NIGHT-WAVE',
          url: 'night-wave'
        },
        {
          title: 'TOYOTAリクルートサイト',
          url: 'toyota-monozukuri'
        },
        {
          title: 'UI温泉',
          url: 'ui-onsen'
        },
        {
          title: 'Hacker Typer',
          url: 'hacker-typer'
        }
      ],
      repos: [
        {
          title: 'Traces',
          url: 'https://mi-miya.github.io/traces/index.html',
          img: 'traces.png'
        },
        {
          title: 'Mecha Better',
          url: 'https://github.com/mi-miya/mecha-better',
          img: 'mecha_better.jpg'
        },
        {
          title: 'Nogishot',
          url: 'https://github.com/mi-miya/nogishot',
          img: 'nogishot.png'
        },
        {
          title: 'DEMデータ画像変換',
          url: 'https://gist.github.com/mi-miya/b02fcb6962325d02f4cec395d13547f8',
          img: 'dem.png'
        },
        {
          title: '最小経路探索',
          url: 'https://gist.github.com/mi-miya/28f6f96af6808e5dc84575b16f3d00f6',
          img: 'keiro.png'
        }
      ]
    }
  }
}
</script>
