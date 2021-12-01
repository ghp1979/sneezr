import React, { useEffect } from "react";

const symptomFetch = props =>{

  const fetchData = async () => {
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
    setSymptomData(responseBody.data)
    } catch(err) {
    console.log(err)
    }
  }

  useEffect(() => {
    fetchData()
  }, [])
}
export default symptomFetch