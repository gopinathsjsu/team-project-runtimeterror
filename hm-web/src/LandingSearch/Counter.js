import React from "react";
import Button from "@mui/material/Button";
import { styled } from '@mui/material/styles';
import styles from '../styles/Counter.module.css'
import AddCircleOutlineRoundedIcon from '@mui/icons-material/AddCircleOutlineRounded';
import RemoveCircleOutlineRoundedIcon from '@mui/icons-material/RemoveCircleOutlineRounded';
import { Container } from "@mui/material";

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
    <span>
      <RemoveCircleOutlineRoundedIcon sx={{verticalAlign: 'middle'}} onClick={handleDecrement} />
      <label className={styles.counterValue}>{value}</label>
      <AddCircleOutlineRoundedIcon sx={{verticalAlign: 'middle'}} onClick={handleIncrement} />
    </span>
  );

}

