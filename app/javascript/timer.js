  const max = 60
  let to_timeup = 60
  let intervalid
  let start_flag = false

  function count_start() {
    if (start_flag === false) {
      intervalid = setInterval(count_down,1000)
      start_flag = true;
    }
  }

  function count_down() {
    let timer = document.getElementById("timer")
    if (to_timeup <= 20 ) timer.style.color = "orange"
    if (to_timeup === 0) {
      timer.innerHTML = 'Time up!'
      timer.style.color = "red"
      const_stop()
    } else {
      to_timeup--
      padding()
    }
  }

  function padding() {
    let timer = document.getElementById("timer")
    let min = 0
    let sec = 0
    min = Math.floor(to_timeup / 60)
    sec = (to_timeup%60)
    min = ("0" + min).slice(-2)
    sec = ("0" + sec).slice(-2)
    timer.innerHTML = min + ":" + sec
  }

  function count_stop() {
    clearInterval(intervalid)
    start_flag = false;
  }

  function count_reset() {
    let timer = document.getElementById("timer")
    clearInterval(intervalid)
    start_flag = false
    to_timeup = max
    padding()
    timer.style.color = "black"
  }

if (document.URL.match( /about/ )) {
  window.onload = function() {
    padding()
    const startbutton = document.getElementById("startbutton")
    startbutton.addEventListener("click",count_start,false)

    const stopbutton = document.getElementById("stopbutton")
    stopbutton.addEventListener("click",count_stop,false)

    const resetbutton = document.getElementById("resetbutton")
    resetbutton.addEventListener("click",count_reset,false)
  }
}