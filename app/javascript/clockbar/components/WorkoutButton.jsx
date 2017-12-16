import React from "react"

class WorkoutButton extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
    return(
    	<div className="workout-button">
    		<button className="hollow button success" href="#">Work out!</button>
      </div>
    );
  }
}

export default WorkoutButton