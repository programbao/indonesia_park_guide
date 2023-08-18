import request from './request';

export function apiGet(url, params,token) {
  return request(url, params, 'GET',token);
}
export function apiPost(url, params,token) {
  return request(url, params, 'POST',token);
}
export function apiDelete(url, params,token) {
  return request(url, params, 'DELETE',token);
}
export function apiPut(url, params,token) {
  return request(url, params, 'PUT',token);
}
