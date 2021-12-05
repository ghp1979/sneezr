import * as React from "react";
import { useEffect, useState } from "react"
import { Chart } from "react-google-charts"

const FullTable = props =>{
  const [dataObject, setDataObject] = useState([])
  const dataHeads = [[
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
  ]]
  const fetchDataObject = async () => {
    try { 
      const response = await fetch(`/api/v1/full_tables`, {
        credentials: 'same-origin',
      })
     if(!response.ok) {
      const errorMessage = `${response.status}: (${response.statusText})`
      const error = new Error(errorMessage)
      throw(error)
    }    
    const responseBody = await response.json()
    debugger
    setDataObject(responseBody)    
    } catch(err) {
    console.log(err)
    }
  }
  useEffect(() => {
    fetchDataObject()
  }, [])
  
  let dataTable = dataHeads.concat(dataObject)

debugger
  return(
    <div>
      <Chart
      width={'auto'}
      height={'auto'}
      chartType="Table"
      loader={<div>Loading Chart</div>}
      data={
        dataTable
       }
      options={{
        showRowNumber: false,
        frozenColumns: 2
      }}
      rootProps={{ 'data-testid': '1' }}
    />
  </div>
  )
}
export default FullTable