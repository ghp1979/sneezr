import React from 'react'
import { Link } from 'react-router-dom'
import New from '../../../assets/images/new.png'
import Show from '../../../assets/images/show.jpeg'
const Options = props =>{

return(
  <div class="grid-container">
    <div class="grid-x grid-margin-x small-up-2 medium-up-3">
      <div class="cell">
        <div class="card">
          <div class="card-divider">
            <h4>See Your Data</h4>
          </div>
          <img src={New} />
          <div class="card-section">
            <p>Visualize your data over time and compared to pollen counts</p>
          </div>
        </div>
      </div>
      <div class="cell">
        <div class="card">
          <div class="card-divider">
            <h4><Link to="/report">Enter Symptoms</Link></h4>
          </div>
          <img src={Show}/>
          <div class="card-section">
            <p>Enter today's symptoms</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  )
}

export default Options