import React from 'react'

const ShowDetails = (props) => {

  return (
    <div>
      <p> Name: {props.place.name} </p>
      <p> Neighborhood: {props.place.neighborhood} </p>
      <p> Type: {props.place.place_type} </p>
      <p> Descripton: {props.place.description} </p>
    </div>
  )
}

export default ShowDetails
