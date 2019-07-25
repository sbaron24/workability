import React from 'react';

const RatingField = (props) => {
  return (
    <label>{props.label}
      <input
        name={props.name}
        type='number'
        min='1'
        max='5'
        value={props.content}
        onChange={props.handleInputChange}
      />
    </label>
  );
}

export default RatingField;
