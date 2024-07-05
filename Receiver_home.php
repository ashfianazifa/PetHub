<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Receiver_home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="bootstrap2.css">
  </head>
  <body>

    <!--header design-->

    <header>
      <nav class="navbar navbar-expand-lg navigation-wrap mb-5">
        <div class="container">
          <button class="btn btn-primary mb-3" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
            Menu
          </button>
          <a class="navbar-brand ms-3" href="#"><img src="cover logo2.png" style="width:20%" class="img-fluid mb-3"></a>
          <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="#home">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#Take adoption">Take adoption</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#Buy product">Buy product</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

<!-- Offcanvas Sidebar -->
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasExampleLabel">Menu</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="recProfile.php">Profile</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#About">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login.php">Sign out</a>
          </li>
        </ul>
      </div>
    </div>



    <!--home design-->

    <section id="home">
      <div id="carouselExampleControls" class="carousel slide me-5" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="fish.jpg" class="d-block w-100" alt="pic1">
          </div>
          <div class="carousel-item">
            <img src="dear.jpg" class="d-block w-100" alt="pic2">
          </div>
          <div class="carousel-item">
            <img src="cat.jpg" class="d-block w-100" alt="pic3">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </section>


    <!--Take adoption design-->
    
    <section id="Take adoption">
    <form method="POST" class="rounded bg-white shadow p-5">
    <div class="text-area">
                <div class="text mb-5">
                    <h3>Take adoption</h3>
                </div>
    </section>

    <!--Buy product design-->
    
    <section id="Buy product">
    <form method="POST" class="rounded bg-white shadow p-5">
    <div class="text-area">
                <div class="text mb-5">
                    <h3>Buy product</h3>
                </div>
    </section>
    
<!--about design-->

<section id="About">
<div class="text-area ms-5">
            <div class="text">
                <div class="text mb-3 mt-5"><h3>About PetHub</h3></div>
                <p>
                Welcome to PetHub, your ultimate destination for everything related to pets. At PetHub, we believe in creating a world where pets and humans live in harmony, fostering relationships filled with joy, compassion, and mutual understanding.
               </p>
               <div class="text"><h5>Our Mission</h5></div>
               <p>
                Our mission is to connect pet lovers with the resources, services, and communities they need to ensure their pets live happy and healthy lives. Whether you are looking to adopt a new furry friend, seeking expert advice on pet care, or wanting to shop for the best pet products, PetHub is here to support you every step of the way.
            </p>
            <div class="text"><h5>Why PetHub?</h5></div>
                      <p>
                        <li>Comprehensive Pet Care: We offer a wide range of services including adoption assistance, veterinary care, grooming, and training to ensure your pet receives the best care possible.</li>
                        <li>Quality Products: Our store features top-quality products for all types of pets, ensuring they have everything they need to thrive.</li>
                        <li>Expert Advice: Our team of pet care experts is always available to provide advice and support on any pet-related queries you might have.</li>
                      </p>
                  <div class="text"><h5>The Human-Pet Connection</h5></div>
                      <p>
                        At PetHub, we understand the deep bond between humans and their pets. This connection is beautifully encapsulated in several quotes that inspire us daily:

                          <li>"Until one has loved an animal, a part of one's soul remains unawakened." — Anatole France</li>
                          <li>"The greatness of a nation and its moral progress can be judged by the way its animals are treated." — Mahatma Gandhi</li>
                          <li>"Animals are such agreeable friends—they ask no questions; they pass no criticisms." — George Eliot</li>
                          <li>"Pets understand humans better than humans do." — Ruchi Prabhu</li>
                          <li>"A dog is the only thing on earth that loves you more than he loves himself." — Josh Billings</li>
                          <br>
                        These quotes reflect the profound impact pets have on our lives. They bring joy, offer unconditional love, and teach us valuable lessons about compassion and empathy. At PetHub, we celebrate this special bond and strive to enhance it through our services and community engagement.
                      </p>
                  <div class="text"><h5>Join Our Community</h5></div>
                    <P>
                      Become a part of the PetHub community and join us in celebrating the love and joy that pets bring into our lives. Follow us on social media, participate in our events, and share your pet stories with us. Together, we can make the world a better place for pets and their human companions.
                      </p>
                      <br>
                      <p>
                      Welcome to PetHub, where pets and humans come together in perfect harmony.
                    </p>
                </p>   
            </div>
        </div>
</section>




  </body>
</html>
