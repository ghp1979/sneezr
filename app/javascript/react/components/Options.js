import React from 'react'
import { Link } from 'react-router-dom'
import New from '../../../assets/images/new.png'
import Show from '../../../assets/images/show.jpeg'
const Options = props =>{

return(
  <div className="grid-container">
    <div className="grid-x grid-margin-x small-up-2 medium-up-3">
      <div className="cell">
        <div className="card">
          <div className="card-divider">
            <h4><Link to="/data">See Your Data</Link></h4>
          </div>
          <img src={New} />
          <div className="card-section">
            <p>Visualize your data over time and compared to pollen counts</p>
          </div>
        </div>
      </div>
      <div className="cell">
        <div className="card">
          <div className="card-divider">
            <h4><Link to="/report">Enter Symptoms</Link></h4>
          </div>
          <img src={Show}/>
          <div className="card-section">
            <p>Enter today's symptoms</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  )
}

export default Options