import consumer from "./consumer";

const initFeedCable = () => {
  const postsContainer = document.getElementById('posts');
  if (postsContainer) {
    const id = postsContainer.dataset.feedId;

    consumer.subscriptions.create({ channel: "FeedChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        postsContainer.insertAdjacentHTML('afterbegin', data);
      },
    });
  }
}

export { initFeedCable };
