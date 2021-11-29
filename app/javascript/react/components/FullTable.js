import * as React from "react";
import { useEffect, useState } from "react"
import { Chart } from "react-google-charts"

const FullTable = props =>{

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
debugger
  return(
    <div>

    <h1>Test</h1>
   <Chart
  width={'auto'}
  height={'auto'}
  chartType="Table"
  loader={<div>Loading Chart</div>}
  data={[
    [
      { type: 'string', label: 'Date' },
      { type: 'string', label: 'TNSS' },
      { type: 'string', label: 'Tree Pollen Level' },
      { type: 'string', label: 'Tree Pollen Intensity'},
      { type: 'string', label: 'Grass Pollen Level' },
      { type: 'string', label: 'Grass Pollen Intensity'},
      { type: 'string', label: 'Ragweed Pollen Level' },
      { type: 'string', label: 'Ragweed Pollen Intensity'},
      { type: 'string', label: 'Mold Level' },
      { type: 'string', label: 'Mold Intensity'},
      { type: 'string', label: 'Dust and Dander Level' },
      { type: 'string', label: 'Dust and Dander Intensity'},
    ],
    dataObject["date"],
    dataObject["tnss"],
    dataObject["tree_value"],
    dataObject["tree_category"],
    dataObject["grass_value"],
    dataObject["grass_category"],
    dataObject["ragweed_value"],
    dataObject["ragweed_category"],
    dataObject["mold_value"],
    dataObject["mold_category"],
    dataObject["dust_dander_value"],
    dataObject["dust_dander_category"],
  ]}
  options={{
    showRowNumber: false,
  }}
/>
  </div>
  )
}
export default FullTable