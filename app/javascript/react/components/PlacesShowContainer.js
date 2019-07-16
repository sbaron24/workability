import React, { Component } from "react"

class PlacesShowContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      place: {}
    }
    // bind
  }

  componentDidMount(){
    debugger
    id = this.props.match.params.id
    debugger
    fetch(`/api/v1/places/${id}`)
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
      debugger
    })
    .catch(error => console.error(error.message))
  }

  render(){

    return(
      <div>

      </div>
    )
  }
}

export default PlacesShowContainer;
