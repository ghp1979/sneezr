import React, { useState } from 'react'

const SymptomReportForm = props => {

  const [report, setReport] = useState([])

  let value = ""


  return(
   <div class="grid-container">
      <h3>Enter your symptoms</h3> <br/>
      <div class="cell grid-x margin-x">
        <form>
          <label>
            Sneezing:
            <select>
              <option selected value ="0">0</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </label>
          <label>
            Congestion:
            <select>
              <option selected value ="0">0</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </label>
          <label>
            Runny nose:
            <select>
              <option selected value ="0">0</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </label>
          <label>
            Itchy nose:
            <select>
              <option selected value ="0">0</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </label>
          <div className="button-group">
            <button className="button">Submit</button>
            <input className="button" type="submit" value="submit" />
          </div>
        </form>
       </div>
     </div>
    )
  }


export default SymptomReportForm