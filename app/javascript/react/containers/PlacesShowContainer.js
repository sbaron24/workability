import React, { Component } from "react"
import ShowDetails from "../components/ShowDetails"
import ReviewsIndexContainer from "./ReviewsIndexContainer"
import ReviewFormContainer  from "./ReviewFormContainer"
class PlacesShowContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      place: {}
    }
    this.addNewReview = this.addNewReview.bind(this)
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

  addNewReview(formPayload) {
    fetch(`/api/v1/places/${this.state.place.id}/reviews`, {
      credentials: 'same-origin',
      method: "POST",
      body: JSON.stringify(formPayload),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      let allReviews = this.state.reviews
      this.setState({ reviews: allReviews.concat(body) })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
}

  render(){
    return(
      <div>
        <ShowDetails
          place= {this.state.place}
        />
        <ReviewFormContainer
          addNewReview={this.addNewReview}
        />
        <ReviewsIndexContainer
          place= {this.state.place}
        />
      </div>
    )
  }
}

export default PlacesShowContainer;
