import React from 'react';

const BodyField = (props) => {
  return (
    <label>{props.label}
      <textarea
        name={props.name}
        value={props.content}
        onChange={props.handleInputChange}
      />
    </label>
  );
}

export default BodyField;
