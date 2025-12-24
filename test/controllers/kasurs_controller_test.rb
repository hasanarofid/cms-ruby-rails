require "test_helper"

class KasursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kasur = kasurs(:one)
  end

  test "should get index" do
    get kasurs_url
    assert_response :success
  end

  test "should get new" do
    get new_kasur_url
    assert_response :success
  end

  test "should create kasur" do
    assert_difference("Kasur.count") do
      post kasurs_url, params: { kasur: { deskripsi: @kasur.deskripsi, harga_per_hari: @kasur.harga_per_hari, nama: @kasur.nama, status: @kasur.status } }
    end

    assert_redirected_to kasur_url(Kasur.last)
  end

  test "should show kasur" do
    get kasur_url(@kasur)
    assert_response :success
  end

  test "should get edit" do
    get edit_kasur_url(@kasur)
    assert_response :success
  end

  test "should update kasur" do
    patch kasur_url(@kasur), params: { kasur: { deskripsi: @kasur.deskripsi, harga_per_hari: @kasur.harga_per_hari, nama: @kasur.nama, status: @kasur.status } }
    assert_redirected_to kasur_url(@kasur)
  end

  test "should destroy kasur" do
    assert_difference("Kasur.count", -1) do
      delete kasur_url(@kasur)
    end

    assert_redirected_to kasurs_url
  end
end
