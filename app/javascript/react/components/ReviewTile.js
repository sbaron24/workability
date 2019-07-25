import React from 'react'

const ReviewTile = (props) => {

  let max_capacity_message;

  if (props.group_max == 1) {
    max_capacity_message = "Seating good for 1 person"
  } else {
    max_capacity_message = `Seating good for groups of ${props.group_max}`
  }

  let date = props.created_at
  let stringDate = new Date(date).toString().slice(0,15)
  debugger
  return (
    <div className="review-tile panel">
      <h3>{props.title}</h3>
      <p><i>{stringDate}</i></p>
      <p>{max_capacity_message}</p>
      <div className='ratings-div'>
        <div className='wifi rating'>
          <p className="center">wifi: {props.wifi_rating}</p>
        </div>
        <div className='noise rating'>
          <p className="center">noise: {props.noise_rating}</p>
        </div>
        <div className='capacity rating'>
          <p className="center">capacity: {props.capacity_rating}</p>
        </div>
        <div className='outlet rating'>
          <p className="center">outlets: {props.outlet_rating}</p>
        </div>
      </div>
      <p id='body-text'> {props.body} </p>
    </div>
  )
}

export default ReviewTile
