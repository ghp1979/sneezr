import React from 'react'

const SignInTile = props => {
  if (props.signedIn === null){
    return (
    <div>
      <h3><a href='/users/sign_in'> Sign In </a> / 
      <a href ='/users/sign_up' id='sign_up'>Sign Up</a></h3>
    </div>
    )
  } else {
    return (
    <div>
      <h3><a href ='/users/sign_out' data-method='delete'> Sign Out</a></h3>
    </div>
    )
  }
}

export default SignInTile