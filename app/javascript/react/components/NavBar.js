import React from 'react'
import  { Link, Switch, Route } from 'react-router-dom'
import Options from './Options'
import SymptomReportForm from './SymptomReportForm'
import ReportAdded from './ReportAdded'
import DataContainer from './DataContainer'
import SymptomsVDays from './SymptomsVDays'
import FullTable from './FullTable'

const NavBar = props => {
  return(
    <div>
      <div className="title-bar rounded">
          <h1>Sneezr</h1>
      </div>
      <div className="top-bar rounded">
        <div className="top-bar-left">
          <h4><Link to="/">Main</Link></h4>
        </div>
        <div className="top-bar-right">
          <h5><a href='/users/sign_in'> Sign In </a> / <a href ='/users/sign_up' >Sign Up</a></h5>
          <a href ='/users/sign_out' data-method='delete'> Sign Out</a>
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
    </div>
  )
}


export default NavBar