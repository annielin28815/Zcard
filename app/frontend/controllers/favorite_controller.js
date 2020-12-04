import { Controller } from "stimulus"
import ax from 'axios'
// const ax = require('axios')
import Rails from '@rails/ujs'


export default class extends Controller {
  static targets = [ "icon" ]

  go(e){
    e.preventDefault();
    const id = this.data.get('id');
    
    // 方法三 + 第4行
    Rails.ajax({
      url: `/posts/${id}/favorite`,
      type: 'post',
      success: (resp) => {
        if (resp.status == "added") {
          this.iconTarget.classList.remove("far")
          this.iconTarget.classList.add("fas")
        } else {
          this.iconTarget.classList.remove("fas")
          this.iconTarget.classList.add("far")
        }
      },
      error: function(err) {
        console.log(err);
      }
    })
    

    // 方法二 + 第2行
    // console.log(id);

    // const ax = require('axios')
    // const token = document.querySelector('[name=csrf-token]').content
    // ax.defaults.headers.common['X-CSRF-TOKEN'] = token

    // // 下行id 是第17行給的
    // ax.post(`/posts/${id}/favorite`, {})
    //   .then((resp) => {
    //     console.log(resp);
    //     if (resp.data.status == "added") {
    //       this.iconTarget.classList.remove("far")
    //       this.iconTarget.classList.add("fas")
    //     } else {
    //       this.iconTarget.classList.remove("fas")
    //       this.iconTarget.classList.add("far")
    //     }
    //   })
    //   .catch(function(err) {
    //     console.log(err);
    //   })

  }
}

