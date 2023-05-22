
    <!-- Blog Details Hero Begin -->
    <section class="blog-hero spad">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-10 text-center">
                    <div class="blog__hero__text">
                        <h2>Review Form</h2>
                        <div class="blog__details__comment">
                            <form action="/reviewimpl" method="post" name="review_form" id="review_form">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <input type="text" placeholder="userId(Number..)" id="userId" name="userId" value="${loginmember.id}" style="color: black">
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                        <input type="text" placeholder="itemId(Number..)" id="itemId" name="itemId" style="color: black">
                                    </div>
                                    <div class="col-lg-8 col-md-8">
                                        <input type="text" placeholder="title" id="title" name="title" style="color: black">
                                    </div>
                                    <div class="col-lg-8 text-center">
                                        <textarea type="text" placeholder="review" id="review" name="review" style="color: black"></textarea>
                                    </div>
                                    </br>
                                    <div class="col-lg-4 col-md-4">
                                        <input type="number" placeholder="Rate from 1 to 10" id="rate" name="rate" style="color: black">
                                    </div>
                                    <button type="submit" class="review_btn">Post Review</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Hero End -->