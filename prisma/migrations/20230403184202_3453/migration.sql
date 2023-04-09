-- CreateTable
CREATE TABLE "Roles" (
    "id" SERIAL NOT NULL,
    "description" TEXT,
    "priviligiles" SMALLINT NOT NULL DEFAULT 0,
    "metadata" BYTEA,

    CONSTRAINT "Roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Countries" (
    "id" BIGSERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Countries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cities" (
    "id" BIGSERIAL NOT NULL,
    "countryId" BIGINT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Cities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" BIGINT NOT NULL,
    "reg_timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "email" TEXT NOT NULL,
    "user_name" VARCHAR(256) NOT NULL,
    "phone_number" VARCHAR(16) NOT NULL,
    "birthday" TIMESTAMP(3) NOT NULL,
    "first_name" VARCHAR(256),
    "last_name" VARCHAR(256),
    "middle_name" VARCHAR(256),
    "hash" TEXT NOT NULL,
    "hashedRt" TEXT,
    "roleId" INTEGER,
    "is_subscribed" BOOLEAN NOT NULL DEFAULT false,
    "score" INTEGER NOT NULL DEFAULT 0,
    "bio" VARCHAR(4056),
    "preferred_country_id" BIGINT,
    "preferred_city_id" BIGINT,
    "current_country_id" BIGINT,
    "current_city_id" BIGINT,
    "public_fields" INTEGER NOT NULL DEFAULT 0,
    "metadata" BYTEA,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_user_name_key" ON "User"("user_name");

-- CreateIndex
CREATE UNIQUE INDEX "User_phone_number_key" ON "User"("phone_number");

-- AddForeignKey
ALTER TABLE "Cities" ADD CONSTRAINT "Cities_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Countries"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Roles"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_preferred_country_id_fkey" FOREIGN KEY ("preferred_country_id") REFERENCES "Countries"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_preferred_city_id_fkey" FOREIGN KEY ("preferred_city_id") REFERENCES "Cities"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_current_country_id_fkey" FOREIGN KEY ("current_country_id") REFERENCES "Countries"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_current_city_id_fkey" FOREIGN KEY ("current_city_id") REFERENCES "Cities"("id") ON DELETE SET NULL ON UPDATE CASCADE;
