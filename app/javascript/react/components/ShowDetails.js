import React from 'react'

const ShowDetails = (props) => {
  return (
    <div className='place-details'>
      <h1 className='place-name'>{props.place.name}</h1>
      <p className='place-type'>{props.place.place_type}</p>
      <p className='place-address'><b>Address:</b> {props.place.address}, {props.place.city}, {props.place.state} {props.place.zip}</p>
      <p className='place-neighborhood'><b>Neighborhood:</b> {props.place.neighborhood}</p>
      <p className='place-description'><b>Description:</b> {props.place.description}</p>
    </div>
  )
}

export default ShowDetails
