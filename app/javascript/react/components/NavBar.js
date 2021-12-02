import React, { useState, useEffect } from 'react'
import  { Link, Switch, Route } from 'react-router-dom'
import Options from './Options'
import SymptomReportForm from './SymptomReportForm'
import ReportAdded from './ReportAdded'
import DataContainer from './DataContainer'
import SymptomsVDays from './SymptomsVDays'
import FullTable from './FullTable'
import SignInTile from './SignIn'
import Logo from '../../../assets/images/Logo.png'

const NavBar = props => {

  const [signedIn, setSignedIn] = useState(null)
  const fetchUser = async () => {
    try {
      const response = await fetch("/api/v1/users", {
        credentials: "same-origin"
      })
      if(!response.ok) {
        throw new Error (`${response.status}: ${response.statusText}`)
      }
      const responseBody = await response.json()
      setSignedIn(responseBody.users)
    } catch(err) {
      console.log(err)
    }
  }

  useEffect(() => {
    fetchUser()
  }, [])
  
  return(
  <div>
    <div className="top-bar rounded grid-container">
       <div className="grid-x margin-x">
        <div className="top-bar-left cell small-3">
          <h1><Link to="/">Sneezr</Link></h1>
          <nav aria-label="You are here:" role="navigation">
            <ul className="breadcrumbs">
              <li><Link to="/data">See Your Data</Link></li>
              <li><Link to="/report">Symptom Report</Link></li>
              <li><Link to="/report">More Information</Link></li>
            </ul>
          </nav>
        </div>        
        <div className="top-bar-right cell auto sign-in">
          <SignInTile signedIn={signedIn}/>
        </div>
      </div>
    </div>
    <div>
        <Switch>
          <Route exact path="/" component = {Options} />
          <Route exact path="/report" component = {SymptomReportForm} />
          <Route exact path="/reportadded" component = {ReportAdded} />
          <Route exact path="/data" component = {DataContainer} />
          <Route exact path="/data/symptoms" component = {SymptomsVDays} />
          <Route exact path="/data/table" component = {FullTable} />
         </Switch>
      </div>
      <footer>
        <div className="grid-container shrink margin-x">
          <div className="cell rounded footer">
            <div className="small-offset-2">
              <p>App Created by Geoffrey Pelton 2021</p>
              <p>Allergen data provided by AccuWeather API</p>
              <img src={Logo} width="150" height="30"/>
            </div>
          </div>
        </div>
      </footer>
    </div>
  )
}


export default NavBar