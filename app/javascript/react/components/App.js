import React from 'react'
import { BrowserRouter, Route } from "react-router-dom"
import PlacesShowContainer from "./PlacesShowContainer"

export const App = (props) => {
  return (
    <BrowserRouter>
      <Route path='/places/:id' component={PlacesShowContainer}/>
    </BrowserRouter>
  )
}

export default App
