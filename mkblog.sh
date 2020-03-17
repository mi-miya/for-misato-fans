# 入力
number=$1
title=$2
description=$3

date=`date '+%F'`
today=`date "+%Y / %m / %d"`
filePath="./pages/blogs/$date-$number.vue"
jsonPath="./assets/json/blogs.json"

# ファイル作成
echo "ファイル作成 : $filePath"
touch $filePath

# 文字列追加
echo ファイルにテンプレート文を追加
echo -e "<template>
  <div class=\"ly_blog\">
    <header class=\"ly_header\">
      <p class=\"el_blogDate\">
        $today
      </p>
      <h1 class=\"el_blogHeader\">
        $title
      </h1>
    </header>
    <main class=\"ly_main\">
      <p>
        <span class=\"code\">text</span>
      </p>
      <pre class=\"code\">
        &lt;code>
      </pre>
    </main>
  </div>
</template>

<style lang=\"scss\" scoped>
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
      title: '$title',
      link: [
        {
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/***'
        }
      ]
    }
  }
}
</script>" > "$filePath"

# JSONに追加
sed -i -e "4a {\n\t\t\t\"id\":\"$date-$number\",\n\t\t\t\"title\":\"$title\",\n\t\t\t\"description\":\"$description\"\n\t\t}," $jsonPath
