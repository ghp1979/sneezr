import React, { useState, useEffect } from 'react'
import { Switch, Link, Route } from 'react-router-dom'

const DataContainer = props =>{

  return(
    <div className="callout rounded">
      <p>Choose a way to see your data</p>
      <Switch>
        <Route>
           <Link to="/data/symptoms">Track symptoms over time</Link><br/>
           <Link to="/data/table">A full table of reports and allergen levels</Link>
        </Route>
      </Switch>
    </div>
  )
}
export default DataContainer