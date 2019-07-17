import React, { Component } from "react"
import ShowDetails from "../components/ShowDetails"

class PlacesShowContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      place: {}
    }
    // bind
  }

  componentDidMount(){
    let place_id = this.props.match.params.id
    fetch(`/api/v1/places/${place_id}`)
    .then(response => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = 'Something went wrong!'
        let error = new Error(errorMessage)
        throw(error)
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState( {place: body.place} )
    })
    .catch(error => console.error(error.message))
  }

  render(){
    debugger

    return(
      <div>
      <h1>{this.state.place.name}</h1>
        <ShowDetails
          place= {this.state.place}
        />
      </div>
    )
  }
}

export default PlacesShowContainer;
