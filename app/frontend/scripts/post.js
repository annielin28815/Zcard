// 方法一


document.addEventListener("DOMContentLoaded", function() {
  const favorite_btn = document.querySelector('#favorite_btn')
  if (favorite_btn) {
    favorite_btn.addEventListener("click", function(e) {
      e.preventDefault()

      // 打api送資料（ajax）-> post/posts/10/favorite
      const ax = require('axios')
      
      // https://medium.com/@zayneabraham/ruby-on-rails-csrf-protection-with-react-js-65dd84b8edad
      // 在layouts/application.html.erb裡有這段<%= csrf_meta_tags %>
      const token = document.querySelector('[name=csrf-token]').content
      ax.defaults.headers.common['X-CSRF-TOKEN'] = token

      const postId = e.currentTarget.dataset.id
      const icon = e.target
      // 將axios這個套件對某個url打，無論成功或失敗都印出回應->response->resp（非同步處理）
      ax.post(`/posts/${postId}/favorite`, {})
        .then(function(resp){
          if (resp.data.status == "added") {
            icon.classList.remove("far")
            icon.classList.add("fas")
          } else {
            icon.classList.remove("fas")
            icon.classList.add("far")
          }
        })
        .catch(function(err) {
          console.log(err);
        })

    })
  }

})
