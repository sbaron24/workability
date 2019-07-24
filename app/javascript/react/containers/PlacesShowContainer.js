import React, { Component } from "react"
import ShowDetails from "../components/ShowDetails"
import ReviewTile from "../components/ReviewTile"

class PlacesShowContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      place: {},
      reviews: []
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
      this.setState( {place: body.place, reviews: body.place.reviews} )
    })
    .catch(error => console.error(error.message))
  }

  render(){
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
      <div>
        <ShowDetails
          place= {this.state.place}
        />
        {reviews}
      </div>
    )
  }
}

export default PlacesShowContainer;
