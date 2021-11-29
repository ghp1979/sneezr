import React, { useState, useEffect } from 'react'
import { Switch, Link, Route } from 'react-router-dom'
import SymptomsVDays from './SymptomsVDays'

const DataContainer = props =>{

  const [dataObject, setDataObject] = useState({})

  const fetchDataObject = async () => {
    try { 
      const response = await fetch(`/api/v1/symptom_reports`, {
        credentials: 'same-origin'
      })
     if(!response.ok) {
      const errorMessage = `${response.status}: (${response.statusText})`
      const error = new Error(errorMessage)
      throw(error)
    }    
    const responseBody = await response.json()
    setDataObject(responseBody)
    } catch(err) {
    console.log(err)
    }
  }
  useEffect(() => {
    fetchDataObject()
  }, [])

  return(
    <div className="callout">
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