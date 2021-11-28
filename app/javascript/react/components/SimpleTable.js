import * as React from "react";
import { useEffect, useState } from "react"
import { Chart } from "react-google-charts"
import FetchTool from "./FetchTool";

const SimpleTable = props =>{

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
    <h1>Test</h1>
//    <Chart
//   width={'500px'}
//   height={'300px'}
//   chartType="Table"
//   loader={<div>Loading Chart</div>}
//   data={[
//     [
//       { type: 'date', label: 'Date' },
//       { type: 'number', label: 'TNSS' },
//       { type: 'number', label: 'Tree Pollen Level' },
//       { type: 'string', label: 'Tree Pollen Intensity'},
//       { type: 'nubmer', label: 'Grass Pollen Level' },
//       { type: 'string', label: 'Grass Pollen Intensity'},
//       { type: 'number', label: 'Ragweed Pollen Level' },
//       { type: 'string', label: 'Ragweed Pollen Intensity'},
//       { type: 'number', label: 'Mold Level' },
//       { type: 'string', label: 'Mold Intensity'},
//       { type: 'number', label: 'Dust and Dander Level' },
//       { type: 'string', label: 'Dust and Dander Intensity'},
//     ],
//     []
//   ]}
//   options={{
//     showRowNumber: true,
//   }}
//   rootProps={{ 'data-testid': '1' }}
// />
  )
}
export default SimpleTable