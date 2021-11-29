import * as React from "react";
import { useEffect, useState } from "react";
import { Chart } from "react-google-charts";

const SymptomsVDays = props => {
  const [chartData, setChartData] = useState(["chart"])
  const [dataObject, setDataObject] = useState({})
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
    setDataObject(responseBody)
    setDataFetched(true)
    } catch(err) {
    console.log(err)
    }
  }

  useEffect(() => {
    fetchDataObject()
  }, [])

  const prepareData = (data) =>{
    const days = data["date"]
    const tnss = data["tnss"]
    let mappedData = days.map((date) =>{
      return [date, ""]
    })
    let i = 0
    mappedData.forEach((array) =>{
      if(i <= mappedData.length){
        array[1] = tnss[i]
        i += 1
      } else {
        return(mappedData)
      }
    })
    setChartData(mappedData)
  }

    if((dataFetched == true) && (chartData[0] === "chart")){
      prepareData(dataObject)
    }

return(  
<Chart
  width={'100%'}
  height={'75%'}
  chartType="ScatterChart"
  loader={<div>Loading Chart</div>}
  data={[
    ["Date", "TNSS"],
    chartData,
  ]}
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
/>
  );
};
export default SymptomsVDays;