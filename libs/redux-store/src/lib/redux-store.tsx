import styled from 'tailwind';

const StyledReduxStore = styled.div`
  color: pink;
`;

export function ReduxStore() {
  return (
    <StyledReduxStore>
      <h1>Welcome to ReduxStore!</h1>
    </StyledReduxStore>
  );
}

export default ReduxStore;
