let debounce = (fn, wait) => {
  let timeout = ref(None)

  arg => {
    switch timeout.contents {
    | Some(timerId) => Js.Global.clearTimeout(timerId)
    | None => ()
    }

    let timerId = Js.Global.setTimeout(() => fn(arg), wait)

    timeout := Some(timerId)
  }
}

/*
For reference

function debounce(func, wait) {
  var timeout
  return function (args) {   
    
    clearTimeout(timeout)
    timeout = setTimeout(()=>{
    // ??  timeout = null
      func(args)
    }, wait)
  }
}
 */
