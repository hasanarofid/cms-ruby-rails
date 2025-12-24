require "test_helper"

class PenyewasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @penyewa = penyewas(:one)
  end

  test "should get index" do
    get penyewas_url
    assert_response :success
  end

  test "should get new" do
    get new_penyewa_url
    assert_response :success
  end

  test "should create penyewa" do
    assert_difference("Penyewa.count") do
      post penyewas_url, params: { penyewa: { alamat: @penyewa.alamat, identitas: @penyewa.identitas, nama: @penyewa.nama, nomor_telepon: @penyewa.nomor_telepon } }
    end

    assert_redirected_to penyewa_url(Penyewa.last)
  end

  test "should show penyewa" do
    get penyewa_url(@penyewa)
    assert_response :success
  end

  test "should get edit" do
    get edit_penyewa_url(@penyewa)
    assert_response :success
  end

  test "should update penyewa" do
    patch penyewa_url(@penyewa), params: { penyewa: { alamat: @penyewa.alamat, identitas: @penyewa.identitas, nama: @penyewa.nama, nomor_telepon: @penyewa.nomor_telepon } }
    assert_redirected_to penyewa_url(@penyewa)
  end

  test "should destroy penyewa" do
    assert_difference("Penyewa.count", -1) do
      delete penyewa_url(@penyewa)
    end

    assert_redirected_to penyewas_url
  end
end
