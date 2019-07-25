import ReviewTile from '../../../app/javascript/react/components/ReviewTile.js'

describe('ReviewTile', () => {

  describe('should display different details of the review', () => {

    let wrapper = shallow(<ReviewTile
      id={1}
      title={"Very good"}
      body={"nice place"}
      overall_rating={5}
      noise_rating={4}
      wifi_rating={3}
      capacity_rating={2}
      outlet_rating={1}
      group_max={3}
      created_at={"2019-07-22T19:20:23.784Z"}
      />)

    it('should display the title', () => {
      expect(wrapper.text().includes('Very good')).toBe(true)
    })

    it('should display the date', () => {
      expect(wrapper.text()).toContain("Mon Jul 22 2019")
    })
    it('should display the wifi rating', () => {
      expect(wrapper.text().includes('wifi: 3')).toBe(true)
    })
    it('should display the noise rating', () => {
      expect(wrapper.text().includes('noise: 4')).toBe(true)
    })
    it('should display the capacity rating', () => {
      expect(wrapper.text().includes('capacity: 2')).toBe(true)
    })
    it('should display the outlet rating', () => {
      expect(wrapper.text().includes('outlets: 1')).toBe(true)
    })
    it('if max capacity is 3, message should mention good for groups', () => {
      expect(wrapper.text().includes('Seating good for groups of 3')).toBe(true)
    })
  })

  describe('if max capacity is 1, message should mention 1 person', () => {

    let wrapper = shallow(<ReviewTile
      id={1}
      title={"Very good"}
      body={"nice place"}
      overall_rating={5}
      noise_rating={4}
      wifi_rating={3}
      capacity_rating={2}
      outlet_rating={1}
      group_max={1}
      created_at={"2019-07-22T19:20:23.784Z"}
      />)

    it('if max capacity is 1, message should mention 1 person', () => {
      expect(wrapper.text().includes('Seating good for 1 person')).toBe(true)
    })
  })
})
