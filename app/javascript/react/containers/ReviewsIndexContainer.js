import React, { Component } from "react"
import ReviewTile from "../components/ReviewTile"
import ReviewFormContainer from "./ReviewFormContainer"

class ReviewsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    }
  }

  componentDidMount(){
    fetch(`/api/v1/places/${this.props.place.id}/reviews`)
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
      console.log(body)
      this.setState( { reviews: body } )
    })
    .catch(error => console.error(error.message))
  }

  render() {
    console.log(this.state.reviews)
    let reviews = this.state.reviews.map(review => {
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
    <div className="row">
      <div className="small-8 small-centered columns">
        <h1>Reviews</h1>
        {reviews}
      </div>
    </div>
    )
  }
}

export default ReviewsIndexContainer;
