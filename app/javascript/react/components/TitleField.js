import React from 'react';

const TitleField = (props) => {
  return (
    <label>{props.label}
      <input
        name={props.name}
        type='text'
        value={props.content}
        onChange={props.handleInputChange}
      />
    </label>
  );
}

export default TitleField;
