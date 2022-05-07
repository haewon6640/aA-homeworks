import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from "./store/store"
import { fetchSearchGiphys } from "./util/api_util"
import {receiveSearchGiphys} from "./actions/giphy_actions"
document.addEventListener('DOMContentLoaded',()=>{
    const root = document.getElementById('root');
    const store = configureStore();
    window.store = store;
    window.receiveSearchGiphys = receiveSearchGiphys;
    window.fetchSearchGiphys = fetchSearchGiphys;
    ReactDOM.render(<Root store={store}/>,root)
})