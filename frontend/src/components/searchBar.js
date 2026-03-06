import React, { useEffect, useState } from 'react';
import useDebounce from './useDebounce';


const data = [
    { id: 1, title: 'Spaghetti Carbonara' },
    { id: 2, title: 'Chicken Alfredo' },
    { id: 3, title: 'Chicken Noodle Soup' },
    { id: 4, title: 'Pad Krapow' },
]


/**
@param {string} data_source - The URL of the data source to fetch data from
@returns {JSX.Element} The SearchBar component
*/
function SearchBar({ data_source }) {
    const [search, setSearch] = useState('');
    const [filteredTitle, setFilteredTitle] = useState([]);
    const [isFilterOpen, setIsFilterOpen] = useState(false);

    //start searching after user stops typing for 800ms
    useDebounce(() => {
        setFilteredTitle(
            data.filter((d) => d.title.toLowerCase().includes(search.toLowerCase()))
        );
    }, [data, search], 800
    );

    const handleSearch = (e) => setSearch(e.target.value);

    return (
        <div className="flex border-black border-2 max-w-screen-sm">
            <input
                id="search"
                className="w-full p-2 focus:outline-none"
                type="text"
                spellCheck="false"
                placeholder="Find a recipe"
                value={search || ''}
                onChange={handleSearch}
            />
            <div className="relative h-full">
                <button
                    className="border-black border-l-2 px-5 py-2 bg-[#a4a507] hover:bg-[#8a8b06] h-full"
                    onClick={() => setIsFilterOpen(!isFilterOpen)}
                >
                    Filter
                </button>
                {isFilterOpen && (
                    <ul className="absolute top-full left-0 w-max border-black border-2 bg-white">
                        {filteredTitle.map((item) => (
                            <li key={item.id} className="p-2 hover:bg-gray-200">
                                {item.title}
                            </li>
                        ))}
                    </ul>
                )}
            </div>
            <button className="border-black border-l-2 px-5 py-2 bg-[#a4a507] hover:bg-[#8a8b06]">Search</button>
        </div>
    );
}

export default SearchBar;