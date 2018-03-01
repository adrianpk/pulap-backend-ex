defmodule Pulap.BizTest do
  use Pulap.DataCase

  alias Pulap.Biz

  describe "plans" do
    alias Pulap.Biz.Plan

    @valid_attrs %{description: "some description", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def plan_fixture(attrs \\ %{}) do
      {:ok, plan} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Biz.create_plan()

      plan
    end

    test "list_plans/0 returns all plans" do
      plan = plan_fixture()
      assert Biz.list_plans() == [plan]
    end

    test "get_plan!/1 returns the plan with given id" do
      plan = plan_fixture()
      assert Biz.get_plan!(plan.id) == plan
    end

    test "create_plan/1 with valid data creates a plan" do
      assert {:ok, %Plan{} = plan} = Biz.create_plan(@valid_attrs)
      assert plan.description == "some description"
      assert plan.ends_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert plan.id == "7488a646-e31f-11e4-aace-600308960662"
      assert plan.is_active == true
      assert plan.is_logical_deleted == true
      assert plan.name == "some name"
      assert plan.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Biz.create_plan(@invalid_attrs)
    end

    test "update_plan/2 with valid data updates the plan" do
      plan = plan_fixture()
      assert {:ok, plan} = Biz.update_plan(plan, @update_attrs)
      assert %Plan{} = plan
      assert plan.description == "some updated description"
      assert plan.ends_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert plan.id == "7488a646-e31f-11e4-aace-600308960668"
      assert plan.is_active == false
      assert plan.is_logical_deleted == false
      assert plan.name == "some updated name"
      assert plan.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_plan/2 with invalid data returns error changeset" do
      plan = plan_fixture()
      assert {:error, %Ecto.Changeset{}} = Biz.update_plan(plan, @invalid_attrs)
      assert plan == Biz.get_plan!(plan.id)
    end

    test "delete_plan/1 deletes the plan" do
      plan = plan_fixture()
      assert {:ok, %Plan{}} = Biz.delete_plan(plan)
      assert_raise Ecto.NoResultsError, fn -> Biz.get_plan!(plan.id) end
    end

    test "change_plan/1 returns a plan changeset" do
      plan = plan_fixture()
      assert %Ecto.Changeset{} = Biz.change_plan(plan)
    end
  end

  describe "plan_subscriptions" do
    alias Pulap.Biz.PlanSubscription

    @valid_attrs %{description: "some description", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def plan_subscription_fixture(attrs \\ %{}) do
      {:ok, plan_subscription} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Biz.create_plan_subscription()

      plan_subscription
    end

    test "list_plan_subscriptions/0 returns all plan_subscriptions" do
      plan_subscription = plan_subscription_fixture()
      assert Biz.list_plan_subscriptions() == [plan_subscription]
    end

    test "get_plan_subscription!/1 returns the plan_subscription with given id" do
      plan_subscription = plan_subscription_fixture()
      assert Biz.get_plan_subscription!(plan_subscription.id) == plan_subscription
    end

    test "create_plan_subscription/1 with valid data creates a plan_subscription" do
      assert {:ok, %PlanSubscription{} = plan_subscription} = Biz.create_plan_subscription(@valid_attrs)
      assert plan_subscription.description == "some description"
      assert plan_subscription.ends_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert plan_subscription.id == "7488a646-e31f-11e4-aace-600308960662"
      assert plan_subscription.is_active == true
      assert plan_subscription.is_logical_deleted == true
      assert plan_subscription.name == "some name"
      assert plan_subscription.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_plan_subscription/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Biz.create_plan_subscription(@invalid_attrs)
    end

    test "update_plan_subscription/2 with valid data updates the plan_subscription" do
      plan_subscription = plan_subscription_fixture()
      assert {:ok, plan_subscription} = Biz.update_plan_subscription(plan_subscription, @update_attrs)
      assert %PlanSubscription{} = plan_subscription
      assert plan_subscription.description == "some updated description"
      assert plan_subscription.ends_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert plan_subscription.id == "7488a646-e31f-11e4-aace-600308960668"
      assert plan_subscription.is_active == false
      assert plan_subscription.is_logical_deleted == false
      assert plan_subscription.name == "some updated name"
      assert plan_subscription.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_plan_subscription/2 with invalid data returns error changeset" do
      plan_subscription = plan_subscription_fixture()
      assert {:error, %Ecto.Changeset{}} = Biz.update_plan_subscription(plan_subscription, @invalid_attrs)
      assert plan_subscription == Biz.get_plan_subscription!(plan_subscription.id)
    end

    test "delete_plan_subscription/1 deletes the plan_subscription" do
      plan_subscription = plan_subscription_fixture()
      assert {:ok, %PlanSubscription{}} = Biz.delete_plan_subscription(plan_subscription)
      assert_raise Ecto.NoResultsError, fn -> Biz.get_plan_subscription!(plan_subscription.id) end
    end

    test "change_plan_subscription/1 returns a plan_subscription changeset" do
      plan_subscription = plan_subscription_fixture()
      assert %Ecto.Changeset{} = Biz.change_plan_subscription(plan_subscription)
    end
  end

  describe "currencies" do
    alias Pulap.Biz.Currency

    @valid_attrs %{code: "some code", icon: "some icon", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, minor_unit: "some minor_unit", name: "some name", num_code: "some num_code"}
    @update_attrs %{code: "some updated code", icon: "some updated icon", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, minor_unit: "some updated minor_unit", name: "some updated name", num_code: "some updated num_code"}
    @invalid_attrs %{code: nil, icon: nil, id: nil, is_active: nil, is_logical_deleted: nil, minor_unit: nil, name: nil, num_code: nil}

    def currency_fixture(attrs \\ %{}) do
      {:ok, currency} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Biz.create_currency()

      currency
    end

    test "list_currencies/0 returns all currencies" do
      currency = currency_fixture()
      assert Biz.list_currencies() == [currency]
    end

    test "get_currency!/1 returns the currency with given id" do
      currency = currency_fixture()
      assert Biz.get_currency!(currency.id) == currency
    end

    test "create_currency/1 with valid data creates a currency" do
      assert {:ok, %Currency{} = currency} = Biz.create_currency(@valid_attrs)
      assert currency.code == "some code"
      assert currency.icon == "some icon"
      assert currency.id == "7488a646-e31f-11e4-aace-600308960662"
      assert currency.is_active == true
      assert currency.is_logical_deleted == true
      assert currency.minor_unit == "some minor_unit"
      assert currency.name == "some name"
      assert currency.num_code == "some num_code"
    end

    test "create_currency/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Biz.create_currency(@invalid_attrs)
    end

    test "update_currency/2 with valid data updates the currency" do
      currency = currency_fixture()
      assert {:ok, currency} = Biz.update_currency(currency, @update_attrs)
      assert %Currency{} = currency
      assert currency.code == "some updated code"
      assert currency.icon == "some updated icon"
      assert currency.id == "7488a646-e31f-11e4-aace-600308960668"
      assert currency.is_active == false
      assert currency.is_logical_deleted == false
      assert currency.minor_unit == "some updated minor_unit"
      assert currency.name == "some updated name"
      assert currency.num_code == "some updated num_code"
    end

    test "update_currency/2 with invalid data returns error changeset" do
      currency = currency_fixture()
      assert {:error, %Ecto.Changeset{}} = Biz.update_currency(currency, @invalid_attrs)
      assert currency == Biz.get_currency!(currency.id)
    end

    test "delete_currency/1 deletes the currency" do
      currency = currency_fixture()
      assert {:ok, %Currency{}} = Biz.delete_currency(currency)
      assert_raise Ecto.NoResultsError, fn -> Biz.get_currency!(currency.id) end
    end

    test "change_currency/1 returns a currency changeset" do
      currency = currency_fixture()
      assert %Ecto.Changeset{} = Biz.change_currency(currency)
    end
  end

  describe "real_estate" do
    alias Pulap.Biz.RealEstate

    @valid_attrs %{room_height_cm: 42, number_of_rooms: 42, backyard: true, kitchen_type_val_en: "some kitchen_type_val_en", currency_code: "some currency_code", type_of_building_val_en: "some type_of_building_val_en", id: "7488a646-e31f-11e4-aace-600308960662", price: 120.5, terrace: true, kitchen_type_val_loc: "some kitchen_type_val_loc", geolocation: 120.5, furniture_set: true, street_number: "some street_number", number_of_bathrooms: 42, geo_area_canonical_name: "some geo_area_canonical_name", short_description: "some short_description", house_equipment_description: "some house_equipment_description", bathroom_area_m2: 120.5, suggested_installment_loan: 120.5, property_type_val_en: "some property_type_val_en", locale: "some locale", geo_area_name_loc: "some geo_area_name_loc", balcony: true, accessible_without_stairs: true, number_of_balconies: 42, house_equipment: true, street: "some street", heating_type_val_en: "some heating_type_val_en", geo_area_name: "some geo_area_name", year_of_construction: 42, indoor_area_m2: 120.5, block: "some block", total_area_m2: 120.5, heating_type_val_loc: "some heating_type_val_loc", currency_symbol: "some currency_symbol", apartment: "some apartment", property_type_val_loc: "some property_type_val_loc", price_per_square_meter: 120.5, description: "some description", active: true, number_of_bedroms: 42, cards: "some cards", position: 42, geo_area_canonical_name_loc: "some geo_area_canonical_name_loc", is_logical_deleted: true, is_active: true, type_of_building_val_loc: "some type_of_building_val_loc", name: "some name", logical_deleted: true, elevator: true}
    @update_attrs %{room_height_cm: 43, number_of_rooms: 43, backyard: false, kitchen_type_val_en: "some updated kitchen_type_val_en", currency_code: "some updated currency_code", type_of_building_val_en: "some updated type_of_building_val_en", id: "7488a646-e31f-11e4-aace-600308960668", price: 456.7, terrace: false, kitchen_type_val_loc: "some updated kitchen_type_val_loc", geolocation: 456.7, furniture_set: false, street_number: "some updated street_number", number_of_bathrooms: 43, geo_area_canonical_name: "some updated geo_area_canonical_name", short_description: "some updated short_description", house_equipment_description: "some updated house_equipment_description", bathroom_area_m2: 456.7, suggested_installment_loan: 456.7, property_type_val_en: "some updated property_type_val_en", locale: "some updated locale", geo_area_name_loc: "some updated geo_area_name_loc", balcony: false, accessible_without_stairs: false, number_of_balconies: 43, house_equipment: false, street: "some updated street", heating_type_val_en: "some updated heating_type_val_en", geo_area_name: "some updated geo_area_name", year_of_construction: 43, indoor_area_m2: 456.7, block: "some updated block", total_area_m2: 456.7, heating_type_val_loc: "some updated heating_type_val_loc", currency_symbol: "some updated currency_symbol", apartment: "some updated apartment", property_type_val_loc: "some updated property_type_val_loc", price_per_square_meter: 456.7, description: "some updated description", active: false, number_of_bedroms: 43, cards: "some updated cards", position: 43, geo_area_canonical_name_loc: "some updated geo_area_canonical_name_loc", is_logical_deleted: false, is_active: false, type_of_building_val_loc: "some updated type_of_building_val_loc", name: "some updated name", logical_deleted: false, elevator: false}
    @invalid_attrs %{room_height_cm: nil, number_of_rooms: nil, backyard: nil, kitchen_type_val_en: nil, currency_code: nil, type_of_building_val_en: nil, id: nil, price: nil, terrace: nil, kitchen_type_val_loc: nil, geolocation: nil, furniture_set: nil, street_number: nil, number_of_bathrooms: nil, geo_area_canonical_name: nil, short_description: nil, house_equipment_description: nil, bathroom_area_m2: nil, suggested_installment_loan: nil, property_type_val_en: nil, locale: nil, geo_area_name_loc: nil, balcony: nil, accessible_without_stairs: nil, number_of_balconies: nil, house_equipment: nil, street: nil, heating_type_val_en: nil, geo_area_name: nil, year_of_construction: nil, indoor_area_m2: nil, block: nil, total_area_m2: nil, heating_type_val_loc: nil, currency_symbol: nil, apartment: nil, property_type_val_loc: nil, price_per_square_meter: nil, description: nil, active: nil, number_of_bedroms: nil, cards: nil, position: nil, geo_area_canonical_name_loc: nil, is_logical_deleted: nil, is_active: nil, type_of_building_val_loc: nil, name: nil, logical_deleted: nil, elevator: nil}

    def real_estate_fixture(attrs \\ %{}) do
      {:ok, real_estate} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Biz.create_real_estate()

      real_estate
    end

    test "list_real_estate/0 returns all real_estate" do
      real_estate = real_estate_fixture()
      assert Biz.list_real_estate() == [real_estate]
    end

    test "get_real_estate!/1 returns the real_estate with given id" do
      real_estate = real_estate_fixture()
      assert Biz.get_real_estate!(real_estate.id) == real_estate
    end

    test "create_real_estate/1 with valid data creates a real_estate" do
      assert {:ok, %RealEstate{} = real_estate} = Biz.create_real_estate(@valid_attrs)
      assert real_estate.room_height_cm == 42
      assert real_estate.number_of_rooms == 42
      assert real_estate.backyard == true
      assert real_estate.kitchen_type_val_en == "some kitchen_type_val_en"
      assert real_estate.currency_code == "some currency_code"
      assert real_estate.type_of_building_val_en == "some type_of_building_val_en"
      assert real_estate.id == "7488a646-e31f-11e4-aace-600308960662"
      assert real_estate.price == 120.5
      assert real_estate.terrace == true
      assert real_estate.kitchen_type_val_loc == "some kitchen_type_val_loc"
      assert real_estate.geolocation == 120.5
      assert real_estate.furniture_set == true
      assert real_estate.street_number == "some street_number"
      assert real_estate.number_of_bathrooms == 42
      assert real_estate.geo_area_canonical_name == "some geo_area_canonical_name"
      assert real_estate.short_description == "some short_description"
      assert real_estate.house_equipment_description == "some house_equipment_description"
      assert real_estate.bathroom_area_m2 == 120.5
      assert real_estate.suggested_installment_loan == 120.5
      assert real_estate.property_type_val_en == "some property_type_val_en"
      assert real_estate.locale == "some locale"
      assert real_estate.geo_area_name_loc == "some geo_area_name_loc"
      assert real_estate.balcony == true
      assert real_estate.accessible_without_stairs == true
      assert real_estate.number_of_balconies == 42
      assert real_estate.house_equipment == true
      assert real_estate.street == "some street"
      assert real_estate.heating_type_val_en == "some heating_type_val_en"
      assert real_estate.geo_area_name == "some geo_area_name"
      assert real_estate.year_of_construction == 42
      assert real_estate.indoor_area_m2 == 120.5
      assert real_estate.block == "some block"
      assert real_estate.total_area_m2 == 120.5
      assert real_estate.heating_type_val_loc == "some heating_type_val_loc"
      assert real_estate.currency_symbol == "some currency_symbol"
      assert real_estate.apartment == "some apartment"
      assert real_estate.property_type_val_loc == "some property_type_val_loc"
      assert real_estate.price_per_square_meter == 120.5
      assert real_estate.description == "some description"
      assert real_estate.active == true
      assert real_estate.number_of_bedroms == 42
      assert real_estate.cards == "some cards"
      assert real_estate.position == 42
      assert real_estate.geo_area_canonical_name_loc == "some geo_area_canonical_name_loc"
      assert real_estate.is_logical_deleted == true
      assert real_estate.is_active == true
      assert real_estate.type_of_building_val_loc == "some type_of_building_val_loc"
      assert real_estate.name == "some name"
      assert real_estate.logical_deleted == true
      assert real_estate.elevator == true
      assert real_estate.floor == "some floor"
    end

    test "create_real_estate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Biz.create_real_estate(@invalid_attrs)
    end

    test "update_real_estate/2 with valid data updates the real_estate" do
      real_estate = real_estate_fixture()
      assert {:ok, real_estate} = Biz.update_real_estate(real_estate, @update_attrs)
      assert %RealEstate{} = real_estate
      assert real_estate.room_height_cm == 43
      assert real_estate.number_of_rooms == 43
      assert real_estate.backyard == false
      assert real_estate.kitchen_type_val_en == "some updated kitchen_type_val_en"
      assert real_estate.currency_code == "some updated currency_code"
      assert real_estate.type_of_building_val_en == "some updated type_of_building_val_en"
      assert real_estate.id == "7488a646-e31f-11e4-aace-600308960668"
      assert real_estate.price == 456.7
      assert real_estate.terrace == false
      assert real_estate.kitchen_type_val_loc == "some updated kitchen_type_val_loc"
      assert real_estate.geolocation == 456.7
      assert real_estate.furniture_set == false
      assert real_estate.street_number == "some updated street_number"
      assert real_estate.number_of_bathrooms == 43
      assert real_estate.geo_area_canonical_name == "some updated geo_area_canonical_name"
      assert real_estate.short_description == "some updated short_description"
      assert real_estate.house_equipment_description == "some updated house_equipment_description"
      assert real_estate.bathroom_area_m2 == 456.7
      assert real_estate.suggested_installment_loan == 456.7
      assert real_estate.property_type_val_en == "some updated property_type_val_en"
      assert real_estate.locale == "some updated locale"
      assert real_estate.geo_area_name_loc == "some updated geo_area_name_loc"
      assert real_estate.balcony == false
      assert real_estate.accessible_without_stairs == false
      assert real_estate.number_of_balconies == 43
      assert real_estate.house_equipment == false
      assert real_estate.street == "some updated street"
      assert real_estate.heating_type_val_en == "some updated heating_type_val_en"
      assert real_estate.geo_area_name == "some updated geo_area_name"
      assert real_estate.year_of_construction == 43
      assert real_estate.indoor_area_m2 == 456.7
      assert real_estate.block == "some updated block"
      assert real_estate.total_area_m2 == 456.7
      assert real_estate.heating_type_val_loc == "some updated heating_type_val_loc"
      assert real_estate.currency_symbol == "some updated currency_symbol"
      assert real_estate.apartment == "some updated apartment"
      assert real_estate.property_type_val_loc == "some updated property_type_val_loc"
      assert real_estate.price_per_square_meter == 456.7
      assert real_estate.description == "some updated description"
      assert real_estate.active == false
      assert real_estate.number_of_bedroms == 43
      assert real_estate.cards == "some updated cards"
      assert real_estate.position == 43
      assert real_estate.geo_area_canonical_name_loc == "some updated geo_area_canonical_name_loc"
      assert real_estate.is_logical_deleted == false
      assert real_estate.is_active == false
      assert real_estate.type_of_building_val_loc == "some updated type_of_building_val_loc"
      assert real_estate.name == "some updated name"
      assert real_estate.logical_deleted == false
      assert real_estate.elevator == false
      assert real_estate.floor == "some updated floor"
    end

    test "update_real_estate/2 with invalid data returns error changeset" do
      real_estate = real_estate_fixture()
      assert {:error, %Ecto.Changeset{}} = Biz.update_real_estate(real_estate, @invalid_attrs)
      assert real_estate == Biz.get_real_estate!(real_estate.id)
    end

    test "delete_real_estate/1 deletes the real_estate" do
      real_estate = real_estate_fixture()
      assert {:ok, %RealEstate{}} = Biz.delete_real_estate(real_estate)
      assert_raise Ecto.NoResultsError, fn -> Biz.get_real_estate!(real_estate.id) end
    end

    test "change_real_estate/1 returns a real_estate changeset" do
      real_estate = real_estate_fixture()
      assert %Ecto.Changeset{} = Biz.change_real_estate(real_estate)
    end
  end

  describe "tenures" do
    alias Pulap.Biz.Tenure

    @valid_attrs %{ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, job_description: "some job_description", job_title: "some job_title", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, job_description: "some updated job_description", job_title: "some updated job_title", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, job_description: nil, job_title: nil, started_at: nil}

    def tenure_fixture(attrs \\ %{}) do
      {:ok, tenure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Biz.create_tenure()

      tenure
    end

    test "list_tenures/0 returns all tenures" do
      tenure = tenure_fixture()
      assert Biz.list_tenures() == [tenure]
    end

    test "get_tenure!/1 returns the tenure with given id" do
      tenure = tenure_fixture()
      assert Biz.get_tenure!(tenure.id) == tenure
    end

    test "create_tenure/1 with valid data creates a tenure" do
      assert {:ok, %Tenure{} = tenure} = Biz.create_tenure(@valid_attrs)
      assert tenure.ends_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert tenure.id == "7488a646-e31f-11e4-aace-600308960662"
      assert tenure.is_active == true
      assert tenure.is_logical_deleted == true
      assert tenure.job_description == "some job_description"
      assert tenure.job_title == "some job_title"
      assert tenure.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_tenure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Biz.create_tenure(@invalid_attrs)
    end

    test "update_tenure/2 with valid data updates the tenure" do
      tenure = tenure_fixture()
      assert {:ok, tenure} = Biz.update_tenure(tenure, @update_attrs)
      assert %Tenure{} = tenure
      assert tenure.ends_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert tenure.id == "7488a646-e31f-11e4-aace-600308960668"
      assert tenure.is_active == false
      assert tenure.is_logical_deleted == false
      assert tenure.job_description == "some updated job_description"
      assert tenure.job_title == "some updated job_title"
      assert tenure.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_tenure/2 with invalid data returns error changeset" do
      tenure = tenure_fixture()
      assert {:error, %Ecto.Changeset{}} = Biz.update_tenure(tenure, @invalid_attrs)
      assert tenure == Biz.get_tenure!(tenure.id)
    end

    test "delete_tenure/1 deletes the tenure" do
      tenure = tenure_fixture()
      assert {:ok, %Tenure{}} = Biz.delete_tenure(tenure)
      assert_raise Ecto.NoResultsError, fn -> Biz.get_tenure!(tenure.id) end
    end

    test "change_tenure/1 returns a tenure changeset" do
      tenure = tenure_fixture()
      assert %Ecto.Changeset{} = Biz.change_tenure(tenure)
    end
  end

  describe "administratorship" do
    alias Pulap.Biz.Administratorship

    @valid_attrs %{default: "some default", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{default: "some updated default", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{default: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, started_at: nil}

    def administratorship_fixture(attrs \\ %{}) do
      {:ok, administratorship} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Biz.create_administratorship()

      administratorship
    end

    test "list_administratorship/0 returns all administratorship" do
      administratorship = administratorship_fixture()
      assert Biz.list_administratorship() == [administratorship]
    end

    test "get_administratorship!/1 returns the administratorship with given id" do
      administratorship = administratorship_fixture()
      assert Biz.get_administratorship!(administratorship.id) == administratorship
    end

    test "create_administratorship/1 with valid data creates a administratorship" do
      assert {:ok, %Administratorship{} = administratorship} = Biz.create_administratorship(@valid_attrs)
      assert administratorship.default == "some default"
      assert administratorship.ends_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert administratorship.id == "7488a646-e31f-11e4-aace-600308960662"
      assert administratorship.is_active == true
      assert administratorship.is_logical_deleted == true
      assert administratorship.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_administratorship/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Biz.create_administratorship(@invalid_attrs)
    end

    test "update_administratorship/2 with valid data updates the administratorship" do
      administratorship = administratorship_fixture()
      assert {:ok, administratorship} = Biz.update_administratorship(administratorship, @update_attrs)
      assert %Administratorship{} = administratorship
      assert administratorship.default == "some updated default"
      assert administratorship.ends_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert administratorship.id == "7488a646-e31f-11e4-aace-600308960668"
      assert administratorship.is_active == false
      assert administratorship.is_logical_deleted == false
      assert administratorship.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_administratorship/2 with invalid data returns error changeset" do
      administratorship = administratorship_fixture()
      assert {:error, %Ecto.Changeset{}} = Biz.update_administratorship(administratorship, @invalid_attrs)
      assert administratorship == Biz.get_administratorship!(administratorship.id)
    end

    test "delete_administratorship/1 deletes the administratorship" do
      administratorship = administratorship_fixture()
      assert {:ok, %Administratorship{}} = Biz.delete_administratorship(administratorship)
      assert_raise Ecto.NoResultsError, fn -> Biz.get_administratorship!(administratorship.id) end
    end

    test "change_administratorship/1 returns a administratorship changeset" do
      administratorship = administratorship_fixture()
      assert %Ecto.Changeset{} = Biz.change_administratorship(administratorship)
    end
  end
end
