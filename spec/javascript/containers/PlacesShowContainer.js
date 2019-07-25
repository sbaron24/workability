import PlacesShowContainer from '../../../app/javascript/react/containers/PlacesShowContainer.js'
import ShowDetails from '../../../app/javascript/react/components/ShowDetails.js'
import ReviewTile from '../../../app/javascript/react/components/ReviewTile.js'

describe('PlacesShowContainer', () => {
 let wrapper;
 let place = {
   id: 1,
   name: "Starbucks",
   place_type: "tea",
   neighborhood: "Boston",
   description: "description text",
   reviews: [
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
}

 beforeEach(() => {
   let place = {
     id: 1,
     name: "Starbucks",
     place_type: "tea",
     neighborhood: "Boston",
     description: "description text",
     reviews: [
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
  }

  let reviews =
   wrapper = shallow(<PlacesShowContainer />)
 })

 describe('container state and props passed to ShowDetails and ReviewTile', () => {

   it('should have the specified initial state', () => {
     expect(wrapper.state()).toEqual({ place: { reviews: [] } })
   })
   it('should have new state after fetch', () => {
     wrapper.setState({ place: place })
     expect(wrapper.state()).toEqual({ place: place })
   })
   it('should pass down props to ShowDetails component', () => {
     wrapper.setState({ place: place })
     expect(wrapper.find(ShowDetails).props()).toEqual({ place: place })
   })
   it('should pass down props to ReviewTile component', () => {
     wrapper.setState({ place: place })
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
