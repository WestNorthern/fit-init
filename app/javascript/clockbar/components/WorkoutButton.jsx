import React from "react"

class WorkoutButton extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
    if(this.props.wav == "true"){
      return(
      	<div className="workout-button">
      		<button className="hollow button success" href="#" data-open="workout-modal">Work out!</button>
        </div>
      );
    } else {
      return(
        <div className="workout-button">
          <button className="hollow button success disabled" href="#">You rock!</button>
        </div>
      );
    }
  }
}

export default WorkoutButton