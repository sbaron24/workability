import React from 'react'

const ShowDetails = (props) => {
  debugger
  return (
    <div>
      <h1>{props.place.name}</h1>
      <p>{props.place.address} {props.place.city}, {props.place.state} {props.place.zip}</p>
      <p>{props.place.neighborhood}</p>
      <p>{props.place.place_type}</p>
      <p> Descripton: {props.place.description} </p>
    </div>
  )
}

export default ShowDetails
