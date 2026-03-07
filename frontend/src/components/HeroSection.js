import { useEffect, useState } from "react";
import SearchBar from "./searchBar";
export default function HeroSection() {
    const API_URL = "http://localhost:5003/api/tags";
    const [data, setData] = useState([]);

    useEffect(() => {
        fetch(API_URL)
            .then((response) => response.json())
            .then((data) => {
                setData(data);
            })
            .catch((error) => {
                console.error("Error fetching data:", error);
            });
    }, []);


    return (
        <div className="flex flex-col items-center justify-center text-center gap-4 py-20 bg-[#ffd470]">
            <h1 className="text-5xl font-bold">QuickBites</h1>
            <p className="">Delicious food under 60 minutes</p>
            <div>
                <div className="flex items-center justify-center gap-4">

                    <img src="/hero_pic.jpg" alt="Hero" className="w-1/2 h-auto" />
                </div>
                <div className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2">
                    <SearchBar data_source={data} />
                </div>
            </div>
        </div>
    );
}