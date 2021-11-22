import React from 'react'
import  {Link } from 'react-router-dom'

const NavBar = props => {
  return(
    <div>
      <div class="title-bar rounded">
          <h1>Sneezr</h1>
      </div>
      <div class="top-bar rounded">
        <div class="top-bar-left">
          <h4><Link to="/">Main</Link></h4>
        </div>
        <div class="top-bar-right">
          <h5><a href='/users/sign_in'> Sign In </a> / <a href ='/users/sign_up' >Sign Up</a></h5>
          <a href ='/users/sign_out' data-method='delete'> Sign Out</a>
        </div>
      </div>
    </div>
      
  )
}


export default NavBar