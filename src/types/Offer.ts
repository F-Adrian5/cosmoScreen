// offers interface
export interface Offer {
  id: number
  name: string
  price: number
  type: string
  description: string
  img: string
}

// offer type
export interface OfferType {
  type: string
}