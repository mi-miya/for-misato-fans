<template>
  <div class="wrapper">
    <div id="bg" @click="clickBg()" />
    <div id="menu" @click="clickMenu()">
      <p id="menu_text">
        MENU
      </p>
    </div>
    <div class="container">
      <div id="sidebar_wrapper">
        <SideNav />
      </div>
      <div class="main_wrapper">
        <nuxt />
      </div>
    </div>
  </div>
</template>

<style lang="scss">
@import '~/assets/stylesheets/common.scss';

* {
  margin: 0;
  padding: 0;
}
body {
  font-family: 'M PLUS Rounded 1c', sans-serif;
}
ul {
  list-style: none;
}
a {
  text-decoration: none;
  color: #000;
}
.wrapper {
  margin: 0 auto;
  position: relative;
}
#menu {
  position: fixed;
    bottom: 0;
    right: 0;
  z-index: 1000;
  width: $menu;
  height: $menu;
  background-color: #6969699f;
  &:hover {
    cursor: pointer;
  }
  @include media($pc) {
    display: none;
  }
  p {
    text-align: center;
    line-height: $menu;
    font-family: 'Coda Caption', sans-serif;
    font-size: 18px;
    color: #fff;
    user-select: none;
    transition: transform $sidebar_duration;
  }
}
#bg {
  position: fixed;
    top: 0;
    left: 0;
  z-index: 999;
  width: 100vw;
  height: 100vh;
  background-color: #000;
  opacity: 0;
  pointer-events: none;
  transition: opacity $sidebar_duration;
}
.container {
  position: relative;
  margin: 0 auto;
  max-width: 1000px;
  #sidebar_wrapper {
    position: fixed;
      top: -2px;
      left: -$spSidebarWidth;
    z-index: 1000;
    width: $spSidebarWidth;
    transition: left $sidebar_duration;
    @include media($pc) {
      width: $pcSidebarWidth;
      left: auto;
    }
  }
  .clickMenu {
    left: 0 !important;
  }
  .main_wrapper {
    width: 100%;
    @include media($pc) {
      padding-left: $pcSidebarWidth;
      box-sizing: border-box;
    }
  }
}
</style>

<script>
import SideNav from '~/components/SideNav.vue'

export default {
  components: {
    SideNav
  },
  data () {
    return {
      menuFlg: false
    }
  },
  methods: {
    clickMenu () {
      this.menuFlg = !this.menuFlg
      if (this.menuFlg) {
        this.openSidebar()
      } else {
        this.closeSidebar()
      }
    },
    clickBg () {
      this.menuFlg = false
      this.closeSidebar()
    },
    openSidebar () {
      document.getElementById('sidebar_wrapper').classList.add('clickMenu')
      document.getElementById('menu_text').innerHTML = 'CLOSE'
      document.getElementById('menu_text').style.transform = 'rotate(360deg)'
      document.getElementById('bg').style.opacity = 0.5
      document.getElementById('bg').style.pointerEvents = 'auto'
    },
    closeSidebar () {
      document.getElementById('sidebar_wrapper').classList.remove('clickMenu')
      document.getElementById('menu_text').innerHTML = 'MENU'
      document.getElementById('menu_text').style.transform = 'rotate(0deg)'
      document.getElementById('bg').style.opacity = 0
      document.getElementById('bg').style.pointerEvents = 'none'
    }
  },
  head () {
    return {
      link: [
        {
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/css?family=Coda+Caption:800|M+PLUS+Rounded+1c&display=swap'
        }
      ]
    }
  }
}
</script>
