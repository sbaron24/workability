import React, { Component } from "react"
import ShowDetails from "../components/ShowDetails"
import ReviewFormContainer  from "./ReviewFormContainer"
import ReviewTile from "../components/ReviewTile"

class PlacesShowContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      place: {
        reviews: []
      }
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
    .then(review => {
      let allReviews = this.state.place.reviews
      let place = this.state.place
      place.reviews = allReviews.concat(review)
      this.setState({ place: place })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
}

  render(){
    let reviews = this.state.place.reviews.map(review => {
      return(
        <ReviewTile
          key={review.id}
          id={review.id}
          title={review.title}
          body={review.body}
          overall_rating={review.overall_rating}
          noise_rating={review.noise_rating}
          wifi_rating={review.wifi_rating}
          capacity_rating={review.capacity_rating}
          outlet_rating={review.outlet_rating}
          group_max={review.group_max}
          created_at={review.created_at}
        />
      )
    })

    return(
      <div className = "show-page row">
        <ShowDetails
          place= {this.state.place}
        />
          <div className="review-index columns large-8">
            {reviews}
          </div>
          <div className="review-form sticky columns large-4 panel">
             <h3>Add a Review</h3>
            <ReviewFormContainer
              addNewReview={this.addNewReview}
            />
        </div>
      </div>
    )
  }
}

export default PlacesShowContainer;
