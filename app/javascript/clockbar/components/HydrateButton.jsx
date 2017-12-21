import React from "react"

class HydrateButton extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
    if(this.props.hydrated == false){
      return(
      	<div className="hydrate-button">
      		<button className="hollow button success" href="#" data-open="hydrate-modal">Drink water!</button>
        </div>
      );
    } else {
      return(
        <div className="hydrate-button">
          <button className="hollow button alert disabled" href="#">Hydrated!</button>
        </div>
      );
    }
  }
}

export default HydrateButton