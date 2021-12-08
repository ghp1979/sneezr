import * as React from "react";
import { useEffect, useState } from "react";
import { Chart } from "react-google-charts";

const SymptomsVDays = props => {
  const [dataObject, setDataObject] = useState([])
  const [dataFetched, setDataFetched] = useState(false)

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
    debugger
    setDataObject(responseBody)
    setDataFetched(true)
    } catch(err) {
    console.log(err)
    }
  }
  const dataHeads = [["Date", "TNSS"]]
  useEffect(() => {
    fetchDataObject()
  }, [])

  let dataTable = dataHeads.concat(dataObject)
  if(dataTable){
  return(  
  <Chart
    width={'100%'}
    height={'75%'}
    chartType="ScatterChart"
    loader={<div>Loading Chart</div>}
    data={dataTable}
    options={{
      chart: {
        title:
          'Total Nasal Symptom Score',
          title: 'Age vs. Weight comparison',
          hAxis: { title: 'Date' },
          vAxis: { title: 'TNSS', minValue: 0, maxValue: 12 },
          legend: 'none',
        }}
    }
    rootProps={{ 'data-testid': '1' }}
  />)
    }
  }
export default SymptomsVDays;