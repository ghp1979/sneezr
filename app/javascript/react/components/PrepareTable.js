import React from 'react'

const PrepareTable = props =>{
  debugger
  const dataHeads = [
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
  ]
  const dataObjects = [
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
  ]
  // const prepareData = (sData) =>{
  //   const days = sData["date"]
  //   const tnss = sData["tnss"]
  //   let mappedData = days.map((date) =>{
  //     return [date, ""]
  //   })
  //   let i = 0
  //   mappedData.forEach((array) =>{
  //     if(i < mappedData.length){
  //       array[1] = tnss[i]
  //       i += 1
  //     } else if(i = mappedData.length){
  //     } else {
  //       return(mappedData)
  //     }
  //   })
  //   mappedData.unshift(["Date", "TNSS"])
  //   setChartData(mappedData)
  // }
  return(
  <div>
    <p>1</p>
  </div>)
}



export default PrepareTable