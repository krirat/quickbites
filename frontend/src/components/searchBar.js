import React, { useEffect, useState } from 'react';
import { useNavigate, createSearchParams } from 'react-router';
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
    const [filteredTags, setFilteredTags] = useState([]);
    const [isFilterOpen, setIsFilterOpen] = useState(false);
    const navigate = useNavigate();

    useEffect(() => {
        setFilteredTags(data_source);
    }, [data_source]);

    //start searching after user stops typing for 800ms
    // useDebounce(() => {
    //     setFilteredTags(
    //         data_source.filter((d) => d.tag_name.toLowerCase().includes(search.toLowerCase()))
    //     );
    // }, [data_source, search], 800
    // );

    const toggleTag = (id) => {
        setFilteredTags((prev) =>
            prev.map((tag) => ({
                ...tag,
                selected: tag.id === id ? !tag.selected : tag.selected
            }))
        );
    };



    const handleSearchInput = (e) => setSearch(e.target.value);

    const handleSearch = () => {
        const selectedTags = filteredTags.filter(tag => tag.selected).map(tag => tag.id);
        const params = createSearchParams({
            q: search,
            tags: selectedTags.join(',')
        });
        navigate({
            pathname: '/recipes',
            search: `?${params.toString()}`
        });
    };

    return (
        <div className="flex border-black border-2 max-w-screen-sm">
            <input
                id="search"
                className="w-full p-2 focus:outline-none"
                type="text"
                spellCheck="false"
                placeholder="Find a recipe"
                value={search || ''}
                onChange={handleSearchInput}
            />
            <div className="relative h-full">
                <button
                    className="border-black border-l-2 px-5 py-2 bg-[#a4a507] hover:bg-[#8a8b06] h-full"
                    onClick={() => setIsFilterOpen(!isFilterOpen)}
                    onBlur={() => setIsFilterOpen(false)}
                >
                    Filter
                </button>
                {console.log(filteredTags)}
                {isFilterOpen && (
                    <ul className="absolute top-full left-0 w-max border-black border-2 bg-white max-h-40 overflow-y-scroll">
                        {data_source.map((item) => (
                            <li key={item.id} className="p-2 hover:bg-gray-200" onMouseDown={(e) => e.preventDefault()}>
                                <input
                                    type="checkbox"
                                    className="mr-2"
                                    checked={item.selected}
                                    onChange={() => toggleTag(item.id)}
                                />
                                {item.tag_name}
                            </li>
                        ))}
                    </ul>
                )}
            </div>
            <button className="border-black border-l-2 px-5 py-2 bg-[#a4a507] hover:bg-[#8a8b06]" onClick={() => handleSearch()}>
                Search
            </button>
        </div>
    );
}

export default SearchBar;