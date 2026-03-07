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
        <div className="flex flex-col items-center justify-center text-center gap-4 py-10 bg-[#ffd470]">

            {/* Title with tape behind it */}
            <div className="relative inline-block">

                <img
                    src="/Yellowtape.png"
                    alt="tape"
                    className="absolute top-1/2 left-1/2"
                    style={{
                        zIndex: 0,
                        transform: "translate(-50%, -30%) scaleX(2) scaleY(2)",  // ← ปรับตัวเลขได้
                    }}
                />

                <h1
                    className="text-5xl font-bold relative"
                    style={{ fontFamily: "Georgia, serif", zIndex: 1 }}
                >
                    QuickBites
                </h1>
                <p style={{ fontFamily: "Georgia, serif", zIndex: 1, position: "relative" }}>
                    Delicious food under 60 minutes
                </p>
            </div>




            <div className="relative w-3/4">
                <img
                    src="/hero_pic.jpg"
                    alt="Hero"
                    className="w-full h-auto rounded-2xl"
                />

                <div className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-3/4">
                    <SearchBar data_source={data} />
                </div>
            </div>
        </div>
    );
}