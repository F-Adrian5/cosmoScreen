
/** This function will fix the modal closing hide and hidden error
 * @param {string} modalId The id of the modal 
 */
export function attachModalFocusFix(modalId: string) {
  const modalEl = document.getElementById(modalId);

  if (!modalEl) return;

  const blurActive = () => {
    (document.activeElement as HTMLElement)?.blur();
  };

  modalEl.addEventListener('hide.bs.modal', blurActive);
  modalEl.addEventListener('hidden.bs.modal', blurActive);
}