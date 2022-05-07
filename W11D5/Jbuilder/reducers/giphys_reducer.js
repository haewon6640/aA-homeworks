import { RECEIVE_SEARCH_GIPHYS } from '../actions/giphy_actions';

const giphysReducer = (state={}, action) => {
    Object.freeze(state);
    const nextState = Object.assign({},state);

    switch (action.type) {
        case RECEIVE_SEARCH_GIPHYS:
            Object.values(action.giphys)
                .forEach(tea=>nextState[tea.id]=tea);
            return nextState;
        default:
            return nextState;
    }
}
export default giphysReducer;