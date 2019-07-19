import React, { Component } from "react"
import ShowDetails from "../components/ShowDetails"
import ReviewsIndexContainer from "./ReviewsIndexContainer"

class PlacesShowContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      place: {}
    }
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
    return(
      <div>
        <ShowDetails
          place= {this.state.place}
        />
        <ReviewsIndexContainer
          place= {this.state.place}
          id= {this.props.match.params.id}
        />
      </div>
    )
  }
}

export default PlacesShowContainer;
