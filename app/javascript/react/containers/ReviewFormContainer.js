import React, { Component } from 'react';

import TitleField from '../components/TitleField';
import BodyField from '../components/BodyField';

class ReviewFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      reviewTitle: '',
      reviewBody: '',
      reviewOverallRating: '',
      reviewNoiseRating: '',
      reviewWifiRating: '',
      reviewCapacityRating: '',
      reviewOutletRating: '',
      reviewGroupMax: '',
      reviewVoteCount: '',
      errors: {}
    }
  this.handleFormSubmit = this.handleFormSubmit.bind(this)
  this.handleReviewTitleChange = this.handleReviewTitleChange.bind(this)
  this.handleReviewBodyChange = this.handleReviewBodyChange.bind(this)
  this.handleClearForm = this.handleClearForm.bind(this)
  this.validateReviewTitleInput = this.validateReviewTitleInput.bind(this)
  this.validateReviewBodyInput = this.validateReviewBodyInput.bind(this)
  }

  handleFormSubmit(event) {
    event.preventDefault();
    if (this.validateReviewTitleInput(this.state.reviewTitle) &&
    this.validateReviewBodyInput(this.state.reviewBody)) {
      let formPayload = {
        title: this.state.reviewTitle,
        body: this.state.reviewBody
      }
      this.props.addNewReview(formPayload)
      this.handleClearForm(event)
    }
  }

  handleReviewTitleChange(event) {
    this.validateReviewTitleInput(event.target.value)
    this.setState({ reviewTitle: event.target.value })
  }

  handleReviewBodyChange(event) {
    this.validateReviewBodyInput(event.target.value)
    this.setState({ reviewBody: event.target.value })
  }

  handleClearForm(event) {
    event.preventDefault();
    this.setState({ reviewTitle: '', reviewBody: '', errors: {} })
  }

  validateReviewTitleInput(input) {
    if (input.trim() === '') {
      let newError = { reviewTitle: 'You must enter an review title.' }
      this.setState({ errors: Object.assign({}, this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.reviewTitle
      this.setState({ errors: errorState })
      return true
    }
  }

  validateReviewBodyInput(input) {
    if (input.trim() === '') {
      let newError = { reviewBody: 'You must enter an review body.' }
      this.setState({ errors: Object.assign({}, this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.reviewBody
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
      <form className="new-review-form callout" onSubmit={this.handleFormSubmit}>
        {errorDiv}
        <TitleField
          content={this.state.reviewTitle}
          handleInputChange={this.handleReviewTitleChange}
          label="Review Title"
          name="review-title"
        />
        <BodyField
          content={this.state.reviewBody}
          handleInputChange={this.handleReviewBodyChange}
          label="Review Body"
          name="review-body"
        />

        <div className="button-group">
          <button className="button" onClick={this.handleClearForm}>Clear</button>
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
    )
  }
}

export default ReviewFormContainer;
