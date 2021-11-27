import React, {useEffect} from "react";
import Box from '../../../assets/images/box.png'

const ReportAdded = props =>{

  useEffect(() => {
    window.setTimeout(() => {
      location.href = "/"
    }, 2500)
  })

  return(
    <div className="grid-container">
      <div className="grid-x grid-margin-x small-up-2 medium-up-3">
        <div className="cell">
          <div className="card">
            <div className="card-divider">
              <h4>Report Submitted</h4>
            </div>
            <img src={Box} />
          </div>
        </div>
      </div>
    </div>
  )
}


export default ReportAdded