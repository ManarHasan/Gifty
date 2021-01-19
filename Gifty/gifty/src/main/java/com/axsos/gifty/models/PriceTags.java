package com.axsos.gifty.models;


public enum PriceTags {
	TEN(10),
    TWENTY(20),
    FIFTY(50),
    ONE_HUNDRED(100);

    private final int value;

    private PriceTags (final int newValue) {
        value = newValue;
    }

    public int getValue() { return value; }

}
