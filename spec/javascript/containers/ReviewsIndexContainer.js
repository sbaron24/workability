import ReviewsIndexContainer from '../../../app/javascript/react/containers/ReviewsIndexContainer.js'
import ReviewTile from '../../../app/javascript/react/components/ReviewTile.js'
import fetchMock from 'fetch-mock'

describe('ReviewsIndexContainer', () => {
  let wrapper;
  let reviews;

  beforeEach(() => {
    reviews = [
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
        vote_count: 1
      }
    ]
    fetchMock.get(`/api/v1/places/1/reviews`, {
      status: 200,
      body: reviews
    })
    wrapper = mount(<ReviewsIndexContainer id={1}/>)
  })

  afterEach(() => fetchMock.restore)

  describe('should show an index of reviews', () => {
    it('should have the specified initial state', () => {
      expect(wrapper.state()).toEqual({ reviews: [] })
    })
  })
})
