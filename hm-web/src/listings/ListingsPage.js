import styles from '../styles/ListingsPage.module.css';
import { useCallback, useEffect, useState } from "react";
import { useSearchParams } from 'react-router-dom';

import { GetListings } from "../helpers/API";

import ListingsSearchForm from "./ListingsSearchForm";
import ListingsTable from "./ListingsTable";

function ListingsPage() {
  const [listings, setListings] = useState([]);
  const [searchParams, setSearchParams] = useSearchParams();
  const [initSearchFormValues, setInitSearchFormValues] = useState(null);

  useEffect(() => {
    let values = {
      startDate: searchParams.get("startDate"),
      endDate: searchParams.get("endDate"),
      dest: searchParams.get("destination"),
    }

    setInitSearchFormValues(values);
    getListings(values.startDate, values.endDate, values.dest);
  }, []);

  const getListings = useCallback((startDate, endDate, destination) => {
    return GetListings(startDate, endDate, destination).then((obj) => {
      // TODO: replace with real stuff
      // Removes a random number of elements to simulate rerendering with different results
      let l = obj.listings;
      l.splice(Math.floor(Math.random() * (l.length - 1)), Math.random() * l.length);
      setListings(l);
    }).catch((e) => {
      console.error(e);
    });
  }, []);

  const resubmitListingsSearch = useCallback((startDateRef, endDateRef, destinationRef) => {
    const [sd, ed, dest] = [
      startDateRef.current?.value,
      endDateRef.current?.value,
      destinationRef.current?.value,
    ];

    setSearchParams({
      startDate: sd,
      endDate: ed,
      destination: dest,
    });

    getListings(sd, ed, dest);
  }, []);

  return (
    <section className={styles.section}>
      {initSearchFormValues && <ListingsSearchForm submitHandler={resubmitListingsSearch} initSearchFormValues={initSearchFormValues} />}
      <ListingsTable listings={listings} />
    </section>
  );
}

export default ListingsPage;
