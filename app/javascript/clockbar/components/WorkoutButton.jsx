import React from "react"

class WorkoutButton extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
    if(this.props.wav == true){
      return(
      	<button className="hollow button success" href="#" data-open="workout-modal">Work out!</button>
      );
    } else {
      return(
        <button className="hollow button alert disabled" href="#">You rock!</button>
      );
    }
  }
}

export default WorkoutButton