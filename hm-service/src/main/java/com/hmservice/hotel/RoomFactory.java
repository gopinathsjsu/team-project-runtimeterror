package com.hmservice.hotel;

public class RoomFactory {

    public static Hotel GetRoom( String roomType, int gc) {
        return switch (roomType) {
            case "DBL" -> new RoomTypeDBL(gc);
            case "QN" -> new RoomTypeQueen(gc);
            case "KNG" -> new RoomTypeKing(gc);
            default -> new RoomTypeSingle(gc);
        };
    }
}
