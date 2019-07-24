import React, { Component } from 'react';
import TextField from '../components/TextField';
import RatingField from '../components/RatingField';
import NumberField from '../components/NumberField';

class ReviewFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      title: '',
      body: '',
      noiseRating: '',
      wifiRating: '',
      capacityRating: '',
      outletRating: '',
      groupMax: '',
      errors: {}
    }

  this.handleFormSubmit = this.handleFormSubmit.bind(this)

  this.handleChange = this.handleChange.bind(this)

  this.handleClearForm = this.handleClearForm.bind(this)

  this.validateTitleInput = this.validateTitleInput.bind(this)
  this.validateBodyInput = this.validateBodyInput.bind(this)
  this.validateNoiseRatingInput = this.validateNoiseRatingInput.bind(this)
  this.validateWifiRatingInput = this.validateWifiRatingInput.bind(this)
  this.validateCapacityRatingInput = this.validateCapacityRatingInput.bind(this)
  this.validateOutletRatingInput = this.validateOutletRatingInput.bind(this)
  this.validateGroupMaxInput = this.validateGroupMaxInput.bind(this)
  }

  handleFormSubmit(event) {
    event.preventDefault();
    if (
      this.validateTitleInput(this.state.title) &&
      this.validateBodyInput(this.state.body) &&
      this.validateNoiseRatingInput(this.state.noiseRating) &&
      this.validateWifiRatingInput(this.state.wifiRating) &&
      this.validateCapacityRatingInput(this.state.capacityRating) &&
      this.validateOutletRatingInput(this.state.outletRating) &&
      this.validateGroupMaxInput(this.state.groupMax)
  ) {
    let noiseRating = parseInt(this.state.noiseRating)
    let wifiRating = parseInt(this.state.wifiRating)
    let capacityRating = parseInt(this.state.capacityRating)
    let outletRating = parseInt(this.state.outletRating)
    let groupMax = parseInt(this.state.groupMax)
    let overallRating = (noiseRating + wifiRating + capacityRating + outletRating) / 4
    let formPayload = {
      title: this.state.title,
      body: this.state.body,
      overallRating: overallRating,
      noiseRating: noiseRating,
      wifiRating: wifiRating,
      capacityRating: capacityRating,
      outletRating: outletRating,
      groupMax: groupMax

    }
    this.props.addNewReview(formPayload)
    this.handleClearForm(event)
  }
}

  handleChange(event) {
    // this.validateTitleInput(event.target.value)
    this.setState({ [event.target.name]: event.target.value })
  }

  handleClearForm(event) {
    event.preventDefault();
    this.setState({
      title: '',
      body: '',
      overallRating: '',
      noiseRating: '',
      wifiRating: '',
      capacityRating: '',
      outletRating: '',
      groupMax: '',
      errors: {} })
  }

  validateTitleInput(input) {
    if (input.trim() === '') {
      let newError = { title: 'You must enter a title.' }
      this.setState({ errors: Object.assign({}, this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.title
      this.setState({ errors: errorState })
      return true
    }
  }

  validateBodyInput(input) {
    if (input.trim() === '') {
      let newError = { body: 'You must enter a body.' }
      this.setState({ errors: Object.assign({}, this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.body
      this.setState({ errors: errorState })
      return true
    }
  }

  validateNoiseRatingInput(input) {
    if (input.trim() === '') {
      let newError = { noiseRating: `You must enter a noise rating (1-5).` }
      this.setState({ errors: Object.assign({}, this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.noiseRating
      this.setState({ errors: errorState })
      return true
    }
  }

  validateWifiRatingInput(input) {
    if (input.trim() === '') {
      let newError = { wifiRating: `You must enter a wifi rating (1-5).` }
      this.setState({ errors: Object.assign({}, this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.wifiRating
      this.setState({ errors: errorState })
      return true
    }
  }

  validateCapacityRatingInput(input) {
    if (input.trim() === '') {
      let newError = { capacityRating: `You must enter a capacity rating (1-5).` }
      this.setState({ errors: Object.assign({}, this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.capacityRating
      this.setState({ errors: errorState })
      return true
    }
  }

  validateOutletRatingInput(input) {
    if (input.trim() === '') {
      let newError = { outletRating: `You must enter a outlet rating (1-5).` }
      this.setState({ errors: Object.assign({}, this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.outletRating
      this.setState({ errors: errorState })
      return true
    }
  }

  validateGroupMaxInput(input) {
    if (input.trim() === '') {
      let newError = { groupMax: `You must enter a group max (1-15).` }
      this.setState({ errors: Object.assign({}, this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.groupMax
      this.setState({ errors: errorState })
      return true
    }
  }

  render() {
    let errorDiv;
    let errorItems;
    if (Object.keys(this.state.errors).length > 0) {
      errorItems = Object.values(this.state.errors).map(error => {
        return(<li key={error}>{error}</li>)
      })
      errorDiv = <div className="callout alert">{errorItems}</div>
    }
    return(
      <div>
      <form className="new-review-form callout" onSubmit={this.handleFormSubmit}>
        {errorDiv}
        <TextField
          content={this.state.title}
          handleInputChange={this.handleChange}
          label="Review Title"
          name="title"
        />

        <TextField
          content={this.state.body}
          handleInputChange={this.handleChange}
          label="Review Body"
          name="body"
        />

        <RatingField
          content={this.state.noiseRating}
          handleInputChange={this.handleChange}
          label="Noise Rating"
          name="noiseRating"
        />
        <RatingField
          content={this.state.wifiRating}
          handleInputChange={this.handleChange}
          label="Wifi Rating"
          name="wifiRating"
        />
        <RatingField
          content={this.state.capacityRating}
          handleInputChange={this.handleChange}
          label="Capacity Rating"
          name="capacityRating"
        />
        <RatingField
          content={this.state.outletRating}
          handleInputChange={this.handleChange}
          label="Outlet Rating"
          name="outletRating"
        />
        <NumberField
          content={this.state.groupMax}
          handleInputChange={this.handleChange}
          label="Group Max"
          name="groupMax"
        />

        <div className="button-group">
          <button className="button" onClick={this.handleClearForm}>Clear</button>
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
      </div>
    )
  }
}

export default ReviewFormContainer;
