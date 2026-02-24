function IntroSection() {
    return (
        <div className="bg-yellow-100 w-full">
            <div className="flex space-between w-full">
                <img src="/assets/intro.png" alt="Intro Image" className="intro-image" />
                <div className="flex flex-col divide-solid divide-y">
                    <h1 className="font-bold text-3xl">Chicken Alfredo</h1>
                    <div className="flex gap-4 bg-white p-4 m-2 rounded-lg">
                        <div>
                            <h2 className="font-bold">Difficulty</h2>
                            <p>Easy</p>
                        </div>
                        <div>
                            <h2 className="font-bold">Preparation</h2>
                            <p>45 minutes</p>
                        </div>
                        <div>
                            <h2 className="font-bold">Cooking</h2>
                            <p>0 minutes</p>
                        </div>
                    </div>
                    <div className="flex gap-4">
                        <p>Has Lactose</p>
                        <p>Beef</p>
                        <p>Garlic</p>
                    </div>
                </div>
            </div>

        </div>
    );
}

export default IntroSection;