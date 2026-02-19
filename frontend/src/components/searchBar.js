import React, { useEffect, useState } from 'react';
import useDebounce from './useDebounce';


const data = [
    { id: 1, title: 'Spaghetti Carbonara' },
    { id: 2, title: 'Chicken Alfredo' },]

/**
@param {string} data_source - The URL of the data source to fetch data from
@returns {JSX.Element} The SearchBar component
*/
function SearchBar({ data_source }) {
    const [search, setSearch] = useState('');
    const [filteredTitle, setFilteredTitle] = useState([]);

    // DeBounce Function
    useDebounce(() => {
        setFilteredTitle(
            data.filter((d) => d.title.toLowerCase().includes(search.toLowerCase()))
        );
    }, [data, search], 800
    );

    const handleSearch = (e) => setSearch(e.target.value);

    return (
        <>
            <input
                id="search"
                type="text"
                spellCheck="false"
                placeholder="Find a recipe"
                value={search || ''}
                onChange={handleSearch}
            />
            <div>
                {filteredTitle.map((f) => (
                    <p key={f.id}>{f.title}</p>
                ))}
            </div>
        </>
    );
}

export default SearchBar;