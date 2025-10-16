(API) Posts endpoints
--------------------

- GET /api/posts
	- Params: q, address, rentalType, minPrice, maxPrice, page, size, sort
	- Returns: Page<PostDto>

- GET /api/posts/{id}
	- Returns: full post details (includes images, viewsCount, latitude, longitude)
	- Side-effect: increments view count and writes a view log (viewer IP + timestamp)

- POST /api/posts
	- multipart/form-data, fields for RoomListing plus files under `images`
	- Requires user (Principal or email param). New posts are set to PENDING and will consume a free-post quota if available.

- PUT /api/posts/{id}
	- Update existing post, images optional. Updated posts are set back to PENDING.

- DELETE /api/posts/{id}
	- Deletes the post record.

Notes:
- Images are stored via `UploadService` in server filesystem by default (resources/images/roomImages).
- Database migrations are in `src/main/resources/db/migration` (Flyway). Ensure your DB is running before starting the app so migrations can apply.

