import React from 'react'

const ShowDetails = (props) => {

  return (
    <div>
      <p> Location: {props.place.location} </p>
      <p> Type: {props.place.place_type} </p>
      <p> Descripton: {props.place.description} </p>
    </div>
  )
}
export default ShowDetails
