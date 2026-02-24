import { useEffect, useCallback } from 'react';

// Custom hook to search for recipes after stopping typing for a specified delay
export default function useDebounce(effect, dependencies, delay) {
    const callback = useCallback(effect, dependencies);

    useEffect(() => {
        const timeout = setTimeout(callback, delay);
        return () => clearTimeout(timeout);
    }, [callback, delay]);
}