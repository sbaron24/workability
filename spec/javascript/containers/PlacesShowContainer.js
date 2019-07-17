import PlacesShowContainer from '../../../app/javascript/react/containers/PlacesShowContainer.js'
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
  // it('renders an h2', () => {
  //   expect(wrapper.find('h2')).toBePresent()
  //   expect(wrapper.find('h2').text()).toEqual('Winter Todo List')
  // })
  //
  // it('should have the specified initial state', () => {
  //   expect(wrapper.state()).toEqual({ places: {} })
  // })

    it('should have name on the page', (done) => {
      setTimeout(() => {
        expect(wrapper.find("h1")).toBePresent()
        expect(wrapper.find("h1").text()).toEqual(places.place.name)
        done()
      }, 0)
    })
  })
})
