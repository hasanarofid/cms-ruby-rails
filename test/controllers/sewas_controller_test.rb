require "test_helper"

class SewasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sewa = sewas(:one)
  end

  test "should get index" do
    get sewas_url
    assert_response :success
  end

  test "should get new" do
    get new_sewa_url
    assert_response :success
  end

  test "should create sewa" do
    assert_difference("Sewa.count") do
      post sewas_url, params: { sewa: { kasur_id: @sewa.kasur_id, penyewa_id: @sewa.penyewa_id, status: @sewa.status, tanggal_mulai: @sewa.tanggal_mulai, tanggal_selesai: @sewa.tanggal_selesai, total_harga: @sewa.total_harga } }
    end

    assert_redirected_to sewa_url(Sewa.last)
  end

  test "should show sewa" do
    get sewa_url(@sewa)
    assert_response :success
  end

  test "should get edit" do
    get edit_sewa_url(@sewa)
    assert_response :success
  end

  test "should update sewa" do
    patch sewa_url(@sewa), params: { sewa: { kasur_id: @sewa.kasur_id, penyewa_id: @sewa.penyewa_id, status: @sewa.status, tanggal_mulai: @sewa.tanggal_mulai, tanggal_selesai: @sewa.tanggal_selesai, total_harga: @sewa.total_harga } }
    assert_redirected_to sewa_url(@sewa)
  end

  test "should destroy sewa" do
    assert_difference("Sewa.count", -1) do
      delete sewa_url(@sewa)
    end

    assert_redirected_to sewas_url
  end
end
