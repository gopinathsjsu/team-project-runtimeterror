import styles from '../styles/ListingsTable.module.css';

function ListingsTable({listings}) {
  return (
    <table className={styles.table}>
      <thead>
        <tr className={styles.headTr}>
          <th>Location</th>
          <th>Room Type</th>
          <th>Amenitites</th>
        </tr>
      </thead>
      <tbody>
        { listings?.map(listing =>
          <tr key={listing.hotelId + listing.roomTypeCode}>
            <td>{ listing.location }</td>
            <td>{ listing.roomTypeCode }</td>
            <td>{ listing.amenities?.reduce((result, amenity) => result + ' ' + amenity, '') }</td>
          </tr>
        ) }
      </tbody>
    </table>
  );
}

export default ListingsTable;
