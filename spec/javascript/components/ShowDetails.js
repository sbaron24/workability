import ShowDetails from '../../../app/javascript/react/components/ShowDetails.js'

describe('ShowDetails', () => {
  let wrapper;
  let places;

  beforeEach(() => {
    places = {
      id:1,
      name: "Starbucks",
      place_type: "tea",
      neighborhood: "Boston",
      description: "description text"
    }
    wrapper = mount(
      <ShowDetails
        place = {places}
      />
    )
  })
  describe('listing', () => {
    it('component should display the name', () => {
      expect(wrapper.text().includes('Starbucks')).toBe(true)
    })

    it('component should display the place_type', () => {
      expect(wrapper.text().includes('tea')).toBe(true)
    })

    it('component should display the neighborhood', () => {
      expect(wrapper.text().includes('Boston')).toBe(true)
    })

    it('component should display the description', () => {
      expect(wrapper.text().includes('description text')).toBe(true)
    })
  })
})
