import React from 'react'  
import ReactDOM from 'react-dom'  
import App from './components/App'
import Hour from './components/Hour'



document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('clockbar')
  const data = JSON.parse(node.getAttribute('data'))

  ReactDOM.render(<App {...data} />, node)

})

