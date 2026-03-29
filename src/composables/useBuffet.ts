import { ref } from "vue";
import type { Offer, OfferType } from "@/types/Offer";
import { buffetServices } from "@/services/buffetServices";

export function useBuffet() {

  // setting up the variables
  const offers = ref<Offer[]>([]),
        offerType = ref<OfferType[]>([]),
        defaultBuffetType = ref<string>("Popcorn"),
        displayedOffers = ref<Offer[]>([]);

  // buffet click logic
  function buffetClick(buffetType: string) {
    defaultBuffetType.value = buffetType;
    displayedOffers.value = [];

    for (let i = 0; i < offers.value.length; i++) {
      let offer = offers.value[i];
      if (offer && offer.type === buffetType) {
        displayedOffers.value.push(offer);
      };
    };
  }

  // loading all the buffet data
  const loadBuffetData = async () => {
    const buffetItem = await buffetServices.getBuffetItem(),
          buffetTypes = await buffetServices.getBuffetTypes();
    
    // giving the data to the reactive elements
    offers.value = buffetItem;
    offerType.value = buffetTypes;

    // calling the function with a default value
    buffetClick(defaultBuffetType.value);
  };

  // exporting what the buffet.vue will use
  return {
    offers,
    offerType,
    defaultBuffetType,
    displayedOffers,
    buffetClick,
    loadBuffetData
  };
}