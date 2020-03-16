<template>
  <div class="sidebar">
    <ul class="sidebar_nav">
      <li>
        <a @click="clickNav('about')">
          自分のこと<br><span>About</span>
        </a>
      </li>
      <li>
        <a @click="clickNav('created')">
          作ったもの<br><span>Created</span>
        </a>
      </li>
      <li>
        <a @click="clickNav('wrote')">
          書いたもの<br><span>Wrote</span>
        </a>
      </li>
      <li>
        <nuxt-link
          to="/blogs"
          class="check_scroll"
        >
          ブログ<br><span>Blogs</span>
        </nuxt-link>
      </li>
      <li>
        <a href="https://photos.google.com/share/AF1QipPAoIKtwqe_8j6fva4MRHqh46gYhFXpJA6y3yT6AVi_XUAScU4j96fFJGEB9_-c8g?hl=ja&key=T2x0NmJVV1RRQmlmZXd5YWtfTmd1TUlzdnJ2THp3">
          写真<br><span>Photos</span>
        </a>
      </li>
      <li>
        <a href="https://docs.google.com/forms/d/1BTCd_FQW4d5ZC_b4Su7_pAZqLvG5eaB5eDTUCPze2Nk">
          ご連絡<br><span>Contact</span>
        </a>
      </li>
    </ul>
    <p class="copyright">
      &copy; 2020 Misato Miyahara
    </p>
  </div>
</template>

<script>
export default {
  mounted () {
    if (this.$route.path === '/') {
      const docs = document.getElementsByClassName('check_scroll')
      for (let i = 0; i < docs.length; i++) {
        docs[i].removeAttribute('href')
      }
    }
  },
  methods: {
    clickNav (anchor) {
      if (this.$route.path === '/') {
        window.scrollBy({
          top: document.getElementById(anchor).getBoundingClientRect().top,
          behavior: 'smooth'
        })
      } else {
        this.$router.push(`/#${anchor}`)
      }
      document.getElementById('sidebar_wrapper').classList.remove('clickMenu')
      document.getElementById('menu_text').innerHTML = 'MENU'
      document.getElementById('menu_text').style.transform = 'rotate(0deg)'
      document.getElementById('bg').style.opacity = 0
      document.getElementById('bg').style.pointerEvents = 'none'
      this.$emit('changeFlg', false)
    }
  }
}
</script>

<style lang="scss" scoped>
@import '~/assets/stylesheets/common.scss';

.sidebar {
  display: flex;
    flex-direction: column;
    justify-content: center;
  width: 100%;
  min-height: 100vh;
  background-color: #f1f1f1;
  border-right: 2px solid #c5c5c5;
  box-sizing: border-box;
  @include media($pc) {
    border-right: none;
    background-color: transparent;
  }
  .sidebar_nav {
    li {
      width: 98%;
      margin: 2px auto;
      text-align: center;
      a {
        display: inline-block;
        width: 100%;
        height: 100%;
        padding: 18px 0 10px;
        font-size: 16px;
        line-height: 18px;
        text-decoration: none;
        color: #1f1f1f;
        cursor: pointer;
        @include media($pc) {
          font-size: 14px;
        }
        span {
          font-size: 14px;
          color: #535353;
          @include media($pc) {
            font-size: 12px;
          }
        }
      }
    }
  }
  .copyright {
    margin-top: 10px;
    text-align: center;
    font-size: 10px;
    color: #808080;
  }
}
</style>
