import styles from '../styles/ListingsSearchForm.module.css';
import { useRef, useCallback } from 'react';
import Paper from '@mui/material/Paper';

function ListingsSearchForm({ submitHandler, initSearchFormValues }) {
  const startDateRef = useRef();
  const endDateRef = useRef();
  const destinationRef = useRef();

  const submitHandlerWithEventHandle = useCallback(() => (event) => {
    event.preventDefault();
    submitHandler(startDateRef, endDateRef, destinationRef);
  }, []);

  return (
    <Paper elevation={6}>
      <div className={styles.searchFormWrapper}>
        <form className={styles.searchForm} onSubmit={submitHandlerWithEventHandle()}>
          <label className={styles.formElement} htmlFor="dateStart">Start Date</label>
          <input className={styles.formElement} ref={startDateRef} type="date" id="dateStart" defaultValue={initSearchFormValues?.startDate} />
          <label className={styles.formElement} htmlFor="dateEnd">End Date</label>
          <input className={styles.formElement} ref={endDateRef} type="date" id="dateEnd" defaultValue={initSearchFormValues?.endDate} />
          <label className={styles.formElement} htmlFor="destination">Destination</label>
          <input className={styles.formElement} ref={destinationRef} type="text" id="destination" defaultValue={initSearchFormValues?.destination} />
          <input className={styles.formElement} type="submit" value="Submit" />
        </form>
      </div>
    </Paper>
  );
}

export default ListingsSearchForm;
