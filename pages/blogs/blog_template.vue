<!-- 2022-12-02-01.vue => year/month/day/number -->
<template>
  <div class="ly_blog">
    <header class="ly_header">
      <p class="el_blogDate">
        year / month / day
      </p>
      <h1 class="el_blogHeader">
        title
      </h1>
    </header>
    <main class="ly_main">
      <p>
        <span class="code">text</span>
      </p>
      <pre class="code">
        &lt;code>
      </pre>
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
  head () {
    return {
      title: 'title',
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
