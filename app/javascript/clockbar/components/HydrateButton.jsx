import React from "react"

class HydrateButton extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
    if(this.props.hydrated == false){
      return(
      		<button className="hollow button success" href="#" data-open="hydrate-modal">Drink water!</button>
      );
    } else {
      return(
          <button className="hollow button alert disabled" href="#">Hydrated!</button>
      );
    }
  }
}

export default HydrateButton