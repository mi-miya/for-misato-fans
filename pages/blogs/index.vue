<template>
  <div id="blogs">
    <ul class="blog_list">
      <li v-for="blog in blogs" :key="blog.id">
        <p class="date">
          {{ idToDate(blog.id) }}
        </p>
        <a :href="'/blogs/' + blog.id">
          <div class="blog_header">
            <h2>{{ blog.title }}</h2>
            <p>
              {{ blog.description }}
            </p>
          </div>
        </a>
        <ul class="tags">
          <li v-for="(tag, index) in blog.tag" :key="index">
            <a href="#">
              {{ tag }}
            </a>
          </li>
        </ul>
      </li>
    </ul>
    <div class="pagination">
      <a v-if="1 < query" :href="prevQuery()">PREV</a>
      <a v-if="query < maxQuery" :href="nextQuery()">NEXT</a>
    </div>
  </div>
</template>

<style lang="scss" scoped>
@import '~/assets/stylesheets/common.scss';

#blogs {
  .blog_list {
    width: 90%;
    margin: 0 auto;
    li {
      padding: 50px 0;
      border-bottom: 1px solid #b4b4b4;
      .date {
        margin: 0 0 20px;
        font-family: 'Anton', sans-serif;
        text-align: center;
        font-size: 20px;
        color: $blog_theme;
        @include media($pc) {
          font-size: 26px;
        }
      }
      a {
        display: inline-block;
          width: 100%;
          height: 100%;
        .blog_header {
          h2 {
            margin: 0 0 20px;
            text-align: center;
            font-size: 30px;
          }
          p {
            margin: 0 0 20px;
            font-size: 18px;
            color: #333333;
            @include media($pc) {
              font-size: 16px;
            }
          }
        }
      }
      .tags {
        display: flex;
          justify-content: flex-start;
          align-items: center;
          flex-wrap: wrap;
        li {
          margin: 2px 4px;
          padding: 0;
          border-bottom: none;
          a {
            display: inline-block;
              width: 100%;
              height: 100%;
            padding: 4px 10px;
            font-size: 14px;
            border-radius: 4px;
            box-sizing: border-box;
            border: 1px solid $blog_theme;
            color: $blog_theme;
            transition: border-color 200ms, color 200ms;
            &:hover {
              border-color: #b65e6d;
              color: #b65e6d;
            }
          }
        }
      }
    }
  }
  .pagination {
    display: flex;
      justify-content: center;
      align-items: center;
    padding: 20px 0;
    font-family: 'Anton', sans-serif;
    a {
      margin: 0 10px;
      font-size: 24px;
      color: $blog_theme;
    }
  }
}
</style>

<script>
import blogData from '~/assets/json/blogs.json'

export default {
  data () {
    const pageView = 5
    const q = this.$route.query.page || 1
    const rangS = (q - 1) * pageView
    const rangE = (q - 1) * pageView + pageView
    return {
      query: Number(q),
      maxQuery: blogData.blogs.length / pageView,
      blogs: blogData.blogs.slice(rangS, rangE)
    }
  },
  methods: {
    prevQuery () {
      return `/blogs/?page=${this.query - 1}`
    },
    nextQuery () {
      return `/blogs/?page=${this.query + 1}`
    },
    idToDate (id) {
      const date = id.substr(0, 10).split('-')
      return date.join(' / ')
    }
  },
  head () {
    return {
      link: [
        {
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/css?family=Anton&display=swap'
        }
      ]
    }
  }
}
</script>
