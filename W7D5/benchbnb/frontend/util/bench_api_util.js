export const fetchBenches = () => {
  return $.ajax({
    method: 'GET',
    url: 'api/benches',
    error: error => console.log(error)
  })
}

export const createBench = bench => {
  return $.ajax({
    method: 'POST',
    url: 'api/benches',
    data: {bench},
  })
}