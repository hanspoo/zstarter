import { render } from '@testing-library/react';

import ReduxStore from './redux-store';

describe('ReduxStore', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<ReduxStore />);
    expect(baseElement).toBeTruthy();
  });
});
