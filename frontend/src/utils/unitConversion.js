const UNIT_ALIASES = {
    g: 'g',
    gram: 'g',
    grams: 'g',
    kg: 'kg',
    kilogram: 'kg',
    kilograms: 'kg',
    ml: 'ml',
    milliliter: 'ml',
    milliliters: 'ml',
    l: 'l',
    liter: 'l',
    liters: 'l',
    oz: 'oz',
    ounce: 'oz',
    ounces: 'oz',
    lb: 'lb',
    lbs: 'lb',
    pound: 'lb',
    pounds: 'lb',
    'fl oz': 'fl oz',
    floz: 'fl oz',
    cup: 'cup',
    cups: 'cup',
    tsp: 'tsp',
    tbsp: 'tbsp',
    pc: 'pc',
    pcs: 'pc'
};

const METRIC_TO_IMPERIAL = {
    g: { unit: 'oz', factor: 0.0352739619 },
    kg: { unit: 'lb', factor: 2.2046226218 },
    ml: { unit: 'fl oz', factor: 0.0338140227 },
    l: { unit: 'cup', factor: 4.2267528377 }
};

const IMPERIAL_TO_METRIC = {
    oz: { unit: 'g', factor: 28.349523125 },
    lb: { unit: 'kg', factor: 0.45359237 },
    'fl oz': { unit: 'ml', factor: 29.5735295625 },
    cup: { unit: 'l', factor: 0.2365882365 }
};

const roundAmount = (value) => {
    const rounded = Math.round(value * 100) / 100;
    return Number.isInteger(rounded) ? String(rounded) : rounded.toFixed(2).replace(/\.0+$/, '').replace(/(\.\d*[1-9])0+$/, '$1');
};

const normalizeUnit = (unit) => {
    if (!unit) return '';
    const normalized = String(unit).trim().toLowerCase();
    return UNIT_ALIASES[normalized] || normalized;
};

export const convertUnit = (quantity, unit, targetSystem = 'metric') => {
    const numericQuantity = Number(quantity);
    if (!Number.isFinite(numericQuantity)) {
        return { quantity: quantity ?? 0, unit: unit || '' };
    }

    const normalizedUnit = normalizeUnit(unit);

    if (targetSystem === 'imperial') {
        const mapping = METRIC_TO_IMPERIAL[normalizedUnit];
        if (mapping) {
            return {
                quantity: roundAmount(numericQuantity * mapping.factor),
                unit: mapping.unit
            };
        }
    }

    if (targetSystem === 'metric') {
        const mapping = IMPERIAL_TO_METRIC[normalizedUnit];
        if (mapping) {
            return {
                quantity: roundAmount(numericQuantity * mapping.factor),
                unit: mapping.unit
            };
        }
    }

    return {
        quantity: roundAmount(numericQuantity),
        unit: normalizedUnit || unit || ''
    };
};

export const scaleAndConvertIngredient = (
    quantity,
    unit,
    baseServings,
    selectedServings,
    targetSystem = 'metric'
) => {
    const base = Number(baseServings) > 0 ? Number(baseServings) : 1;
    const selected = Number(selectedServings) > 0 ? Number(selectedServings) : 1;
    const scaledQuantity = (Number(quantity) || 0) * (selected / base);

    return convertUnit(scaledQuantity, unit, targetSystem);
};
