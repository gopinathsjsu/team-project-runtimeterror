import styles from '../styles/EmptySearchPage.module.css';
import { useNavigate } from 'react-router-dom';
import { useCallback } from 'react';
import ListingsSearchForm from './ListingsSearchForm';

function EmptySearchPage() {
  const navigate = useNavigate();

  const submitHandler = useCallback((startDateRef, endDateRef, destinationRef) => {
    const [sd, ed, dest] = [
      startDateRef.current?.value,
      endDateRef.current?.value,
      destinationRef.current?.value,
    ];

    navigate(`/listings?${'startDate='+sd}${'&endDate='+ed}${'&destination='+dest}`);
  }, []);

  return (
    <section className={styles.section}>
      <ListingsSearchForm submitHandler={submitHandler} />
    </section>
  );
}

export default EmptySearchPage;
