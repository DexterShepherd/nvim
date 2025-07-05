import { isNil } from "lodash";
import { useEffect, useState } from "react";

export function Test() {
  const [a, setA] = useState(false);
  useEffect(() => {}, []);

  if (isNil(a)) {
    return null;
  }

  return (
    <div>
      <p>something else</p>
      hello
    </div>
  );
}
