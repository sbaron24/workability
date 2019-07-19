import PlacesShowContainer from '../../../app/javascript/react/containers/PlacesShowContainer.js'
import ShowDetails from '../../../app/javascript/react/components/ShowDetails.js'
import fetchMock from 'fetch-mock'

describe('PlacesShowContainer', () => {
  let wrapper;
  let places;

  beforeEach(() => {
    const routerParams = { params : {id: 1} }
    places = {
      place: {
        id: 1,
        name: "Starbucks",
        place_type: "tea",
        location: "Boston",
        description: "description text"
      }
    }
    fetchMock.get(`/api/v1/places/${routerParams.params.id}`, {
      status: 200,
      body: places
    })
    wrapper = mount(<PlacesShowContainer match={routerParams} />)
  })

  afterEach(fetchMock.restore)

  describe('listing', () => {
    it('should have the specified initial state', () => {
      expect(wrapper.state()).toEqual({ place: {} })
    })

    it('should have new state after fetch', (done) => {
      setTimeout(() => {
        expect(wrapper.state()).toEqual({ place: places.place })
        done()
      }, 0)
    })

    it('should pass down props to ShowDetails component', (done) => {
      setTimeout(() => {
        expect(wrapper.find(ShowDetails).props()).toEqual({
          place: places.place
        })
        done()
      }, 0)
    })
  })
})
