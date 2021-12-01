import React, { useState } from 'react'
import { Redirect } from 'react-router-dom'

const SymptomReportForm = props => {

  const [report, setReport] = useState({
    sneezing: 0,
    congestion: 0,
    runny_nose: 0,
    itchy_nose: 0
  })

  const [shouldRedirect, setShouldRedirect] = useState(false)

  const [response, setResponse] = useState("")

  const handleInputChange = event =>{
    setReport({
      ...report,
      [event.currentTarget.name]: event.currentTarget.value
    })
  }
  const handleSubmit = (event) => {
    event.preventDefault()
    postSymptomReport()
   }
  
  const postSymptomReport = async () => {
    try { 
      const response = await fetch("/api/v1/symptom_reports", {
        method: "POST",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        credentials: 'same-origin',
        body: JSON.stringify({report: report})
      })
     if(!response.ok) {
      const errorMessage = `${response.status}: (${response.statusText})`
      const error = new Error(errorMessage)
      throw(error)
    }    
    const parsedResponse = await response.json()
    if(parsedResponse.response === "Report already created for today"){
      setResponse(parsedResponse.response)
    } else {
    setShouldRedirect(true) }
  } catch (error) {
      console.error(error)
      if(error.message === "401: (Unauthorized)"){
        setResponse("You must log in before submitting report")
      }
    }
  }

  if(shouldRedirect) {
    return(<div>
            <Redirect to="/reportadded" />
          </div>)
  }

  return(
   <div className="grid-container">
      <h3>Enter your symptoms<br/>
      {response}</h3>
      <div className="cell grid-x margin-x">
        <form onSubmit={handleSubmit}>
          <label>
            Sneezing:
            <select name="sneezing" value={report.sneezing} 
            onChange={handleInputChange}>
              <option value ="0">0</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </label>
          <label>
            Congestion:
            <select name="congestion" value={report.congestion} 
            onChange={handleInputChange}>
              <option value ="0">0</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </label>
          <label>
            Runny nose:
            <select name="runny_nose" value={report.runny_nose} 
            onChange={handleInputChange}>
              <option value ="0">0</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </label>
          <label>
            Itchy nose:
            <select name="itchy_nose" value={report.itchy_nose} 
            onChange={handleInputChange}>
              <option value ="0">0</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </label>
          <div className="button-group">
            <button className="button rounded">Submit</button>
          </div>
        </form>
       </div>
     </div>
    )
  }


export default SymptomReportForm