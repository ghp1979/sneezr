import React from 'react'
import NavBar from './NavBar'
import { BrowserRouter, Route } from 'react-router-dom'

const App = (props) => {
  return (
    <BrowserRouter>
      <Route path="/" component={NavBar} />
    </BrowserRouter>
  )
}
export default App
