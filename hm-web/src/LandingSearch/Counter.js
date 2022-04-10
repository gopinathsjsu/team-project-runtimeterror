import React from "react";
import Button from "@mui/material/Button";
import { styled } from '@mui/material/styles';
import styles from '../styles/Counter.module.css'

const CircularButton = styled(Button)(() => ({
  borderRadius: 100,
  paddingLeft: 0,
  paddingRight: 0
}));
export default function Counter(props) {
  const [value, setValue] = React.useState(props.value)
  const handleDecrement = () => {
    if (value === 1) return
    const newValue = value - 1
    setValue(newValue)
    props.handleChange(newValue)
  }
  const handleIncrement = () => {
    const newValue = value + 1
    setValue(newValue)
    props.handleChange(newValue)
  }
  return (
    <>
      <CircularButton variant="outlined" onClick={handleDecrement}>-</CircularButton>
      <label className={styles.counterValue}>{value}</label>
      <CircularButton variant="outlined" onClick={handleIncrement}>+</CircularButton>

    </>
  );

}

