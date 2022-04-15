package com.hmservice.hotel;

public class RoomFactory {

    public static Hotel GetRoom( String roomType, int gc , int rc) {
        return switch (roomType) {
            case "DBL" -> new RoomTypeDBL(gc , rc);
            case "QN" -> new RoomTypeQueen(gc , rc);
            case "KNG" -> new RoomTypeKing(gc, rc);
            default -> new RoomTypeSingle(gc, rc);
        };
    }
}
