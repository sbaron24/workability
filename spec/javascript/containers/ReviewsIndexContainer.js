import ReviewsIndexContainer from '../../../app/javascript/react/containers/ReviewsIndexContainer.js'
import ReviewTile from '../../../app/javascript/react/components/ReviewTile.js'

describe('ReviewsIndexContainer', () => {
  let wrapper;
  let reviews = [
    {
      id: 1,
      title: "Very good",
      body: "nice place",
      overall_rating: 5,
      noise_rating: 5,
      wifi_rating: 5,
      capacity_rating: 5,
      outlet_rating: 5,
      group_max: 5,
      created_at: "January 10th, 2019"
    }
  ]
  beforeEach(() => {
    wrapper = shallow(<ReviewsIndexContainer />)
  })


  describe('should show an index of reviews', () => {

    it('should have the specified initial state', () => {
      expect(wrapper.state()).toEqual({ reviews: [] })
    })

    it('should have new state after fetch', () => {
      wrapper.setState({ reviews: reviews })
      expect(wrapper.state()).toEqual({ reviews: reviews })
    })
    it('should pass down props to ReviewTile component', () => {
      wrapper.setState({
        reviews: reviews
      })
      expect(wrapper.find(ReviewTile).props()).toEqual({
        id: 1,
        title: "Very good",
        body: "nice place",
        overall_rating: 5,
        noise_rating: 5,
        wifi_rating: 5,
        capacity_rating: 5,
        outlet_rating: 5,
        group_max: 5,
        created_at: "January 10th, 2019"
      })
    })
    
  })
})
