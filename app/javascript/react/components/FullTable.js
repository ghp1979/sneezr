import * as React from "react";
import { useEffect, useState } from "react"
import { Chart } from "react-google-charts"
import PrepareTable from "./PrepareTable"

const FullTable = props =>{
  const [tableData, setTableData] = useState(["table"])
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
debugger
  const prepareData = () =>{
    return(
    <div>
    <PrepareTable dataObject={dataObject} setDataObject={setDataObject}/>
    </div>)
  }
 
  if((dataFetched == true) && (tableData[0] === "table")){
    prepareData()
  }

  // return(
  //   <div>
  //     <PrepareTable dataObject={dataObject} setDataObject={setDataObject}/>
  //     <h1>Test</h1>
  //     <Chart
  //     width={'auto'}
  //     height={'auto'}
  //     chartType="Table"
  //     loader={<div>Loading Chart</div>}
  //     data={tableData}
  //     options={{
  //       showRowNumber: false,
  //     }}
  //     rootProps={{ 'data-testid': '1' }}
  //   />
  // </div>
  // )
}
export default FullTable