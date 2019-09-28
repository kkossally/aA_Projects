import React from 'react';
import { Link } from 'react-router-dom';


const PokemonIndextItem = ({ pokemon }) => {
  return (
  <li>
    <Link to="/pokemon/:pokemonId" >
      {pokemon.name}
      <img className="small" src={`${pokemon.image_url}`} alt="pokemon image" />
    </Link>
  </li>
  )
}

export default PokemonIndextItem;