import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from "./store/store"
import { fetchSearchGiphys } from "./util/api_util"
document.addEventListener('DOMContentLoaded',()=>{
    const root = document.getElementById('root');
    const store = configureStore();
    window.store = store;
    window.fetchSearchGiphys = fetchSearchGiphys;
    ReactDOM.render(<Root store={store}/>,root)
})