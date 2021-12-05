import React from 'react'
import { Link } from 'react-router-dom'
import New from '../../../assets/images/new1.png'
import Show from '../../../assets/images/show.jpeg'
import Folder from '../../../assets/images/folder.png'

const Options = props =>{

return(
  <div className="grid-container">
    <div className="grid-x grid-margin-x small-up-2 medium-up-3" data-equalizer>
      <div className="cell" data-equalizer-watch>
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
      <div className="cell" data-equalizer-watch>
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
      <div className="cell" data-equalizer-watch>
        <div className="card">
          <div className="card-divider">
            <h4><Link to="/info">Further Information</Link></h4>
          </div>
          <img src={Folder}/>
          <div className="card-section">
            <p>Links to further information</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  )
}

export default Options