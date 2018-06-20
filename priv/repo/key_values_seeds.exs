# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pulap.Repo.insert!(%Pulap.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
require Logger
alias Pulap.Repo
alias Pulap.App.KeyValue
alias Pulap.App.KeyValue.Context, as: KeyValueContext
alias PulapWeb.ControllersHelpers, as: Helper

## Start and end datetimes
start_date = Pulap.Util.Time.now_timestamp(:micro_seconds)
valid_until_date = Pulap.Util.Time.sample_date_timestamp()

# KeyValues--------------------------------------------------------------------------------------------------------------
## Locales --------------------------------------------------------------------------------------------------------------
data = %{set: "locales", key: "af", value: "Afrikaans", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "af_NA", value: "Afrikaans (Namibia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "af_ZA", value: "Afrikaans (South Africa)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "agq", value: "Aghem", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "agq_CM", value: "Aghem (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ak", value: "Akan", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ak_GH", value: "Akan (Ghana)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "am", value: "Amharic", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "am_ET", value: "Amharic (Ethiopia)" , key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar", value: "Arabic", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_001", value: "Arabic (World)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_AE", value: "Arabic (United Arab Emirates)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_BH", value: "Arabic (Bahrain)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_DJ", value: "Arabic (Djibouti)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_DZ", value: "Arabic (Algeria)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_EG", value: "Arabic (Egypt)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_EH", value: "Arabic (Western Sahara)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_ER", value: "Arabic (Eritrea)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_IL", value: "Arabic (Israel)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_IQ", value: "Arabic (Iraq)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_JO", value: "Arabic (Jordan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_KM", value: "Arabic (Comoros)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_KW", value: "Arabic (Kuwait)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_LB", value: "Arabic (Lebanon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_LY", value: "Arabic (Libya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_MA", value: "Arabic (Morocco)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_MR", value: "Arabic (Mauritania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_OM", value: "Arabic (Oman)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_PS", value: "Arabic (Palestinian Territories)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_QA", value: "Arabic (Qatar)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_SA", value: "Arabic (Saudi Arabia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_SD", value: "Arabic (Sudan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_SO", value: "Arabic (Somalia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_SS", value: "Arabic (South Sudan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_SY", value: "Arabic (Syria)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_TD", value: "Arabic (Chad)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_TN", value: "Arabic (Tunisia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ar_YE", value: "Arabic (Yemen)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "as", value: "Assamese", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "as_IN", value: "Assamese (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "asa", value: "Asu", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "asa_TZ", value: "Asu (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "az", value: "Azerbaijani", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "az_Cyrl", value: "Azerbaijani (Cyrillic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "az_Cyrl_AZ", value: "Azerbaijani (Cyrillic, Azerbaijan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "az_Latn", value: "Azerbaijani (Latin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "az_Latn_AZ", value: "Azerbaijani (Latin, Azerbaijan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bas", value: "Basaa", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bas_CM", value: "Basaa (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "be", value: "Belarusian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "be_BY", value: "Belarusian (Belarus)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bem", value: "Bemba", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bem_ZM", value: "Bemba (Zambia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bez", value: "Bena", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bez_TZ", value: "Bena (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bg", value: "Bulgarian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bg_BG", value: "Bulgarian (Bulgaria)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bm", value: "Bambara", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bm_Latn", value: "Bambara (Latin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bm_Latn_ML", value: "Bambara (Latin, Mali)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bn", value: "Bengali", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bn_BD", value: "Bengali (Bangladesh)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bn_IN", value: "Bengali (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bo", value: "Tibetan", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bo_CN", value: "Tibetan (China)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bo_IN", value: "Tibetan (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "br", value: "Breton", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "br_FR", value: "Breton (France)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "brx", value: "Bodo", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "brx_IN", value: "Bodo (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bs", value: "Bosnian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bs_Cyrl", value: "Bosnian (Cyrillic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bs_Cyrl_BA", value: "Bosnian (Cyrillic, Bosnia & Herzegovina)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bs_Latn", value: "Bosnian (Latin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "bs_Latn_BA", value: "Bosnian (Latin, Bosnia & Herzegovina)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ca", value: "Catalan", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ca_AD", value: "Catalan (Andorra)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ca_ES", value: "Catalan (Spain)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ca_FR", value: "Catalan (France)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ca_IT", value: "Catalan (Italy)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "cgg", value: "Chiga", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "cgg_UG", value: "Chiga (Uganda)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "chr", value: "Cherokee", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "chr_US", value: "Cherokee (United States)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ckb", value: "Central Kurdish", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ckb_IQ", value: "Central Kurdish (Iraq)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ckb_IR", value: "Central Kurdish (Iran)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "cs", value: "Czech", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "cs_CZ", value: "Czech (Czech Republic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "cy", value: "Welsh", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "cy_GB", value: "Welsh (United Kingdom)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "da", value: "Danish", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "da_DK", value: "Danish (Denmark)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "da_GL", value: "Danish (Greenland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "dav", value: "Taita", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "dav_KE", value: "Taita (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "de", value: "German", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "de_AT", value: "German (Austria)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "de_BE", value: "German (Belgium)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "de_CH", value: "German (Switzerland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "de_DE", value: "German (Germany)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "de_LI", value: "German (Liechtenstein)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "de_LU", value: "German (Luxembourg)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "dje", value: "Zarma", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "dje_NE", value: "Zarma (Niger)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "dsb", value: "Lower Sorbian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "dsb_DE", value: "Lower Sorbian (Germany)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "dua", value: "Duala", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "dua_CM", value: "Duala (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "dyo", value: "Jola-Fonyi", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "dyo_SN", value: "Jola-Fonyi (Senegal)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "dz", value: "Dzongkha", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "dz_BT", value: "Dzongkha (Bhutan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ebu", value: "Embu", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ebu_KE", value: "Embu (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ee", value: "Ewe", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ee_GH", value: "Ewe (Ghana)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ee_TG", value: "Ewe (Togo)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "el", value: "Greek", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "el_CY", value: "Greek (Cyprus)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "el_GR", value: "Greek (Greece)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en", value: "English", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_001", value: "English (World)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_150", value: "English (Europe)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_AD", value: "English (Andorra)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_AG", value: "English (Antigua & Barbuda)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_AI", value: "English (Anguilla)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_AL", value: "English (Albania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_AS", value: "English (American Samoa)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_AT", value: "English (Austria)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_AU", value: "English (Australia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_BA", value: "English (Bosnia & Herzegovina)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_BB", value: "English (Barbados)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_BE", value: "English (Belgium)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_BM", value: "English (Bermuda)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_BS", value: "English (Bahamas)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_BW", value: "English (Botswana)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_BZ", value: "English (Belize)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_CA", value: "English (Canada)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_CC", value: "English (Cocos [Keeling] Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_CH", value: "English (Switzerland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_CK", value: "English (Cook Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_CM", value: "English (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_CX", value: "English (Christmas Island)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_CY", value: "English (Cyprus)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_CZ", value: "English (Czech Republic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_DE", value: "English (Germany)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_DG", value: "English (Diego Garcia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_DK", value: "English (Denmark)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_DM", value: "English (Dominica)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_EE", value: "English (Estonia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_ER", value: "English (Eritrea)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_ES", value: "English (Spain)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_FI", value: "English (Finland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_FJ", value: "English (Fiji)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_FK", value: "English (Falkland Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_FM", value: "English (Micronesia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_FR", value: "English (France)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_GB", value: "English (United Kingdom)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_GD", value: "English (Grenada)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_GG", value: "English (Guernsey)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_GH", value: "English (Ghana)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_GI", value: "English (Gibraltar)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_GM", value: "English (Gambia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_GR", value: "English (Greece)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_GU", value: "English (Guam)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_GY", value: "English (Guyana)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_HK", value: "English (Hong Kong SAR China)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_HR", value: "English (Croatia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_HU", value: "English (Hungary)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_IE", value: "English (Ireland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_IL", value: "English (Israel)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_IM", value: "English (Isle of Man)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_IN", value: "English (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_IO", value: "English (British Indian Ocean Territory)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_IS", value: "English (Iceland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_IT", value: "English (Italy)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_JE", value: "English (Jersey)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_JM", value: "English (Jamaica)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_KE", value: "English (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_KI", value: "English (Kiribati)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_KN", value: "English (St. Kitts & Nevis)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_KY", value: "English (Cayman Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_LC", value: "English (St. Lucia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_LR", value: "English (Liberia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_LS", value: "English (Lesotho)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_LT", value: "English (Lithuania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_LU", value: "English (Luxembourg)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_LV", value: "English (Latvia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_ME", value: "English (Montenegro)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_MG", value: "English (Madagascar)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_MH", value: "English (Marshall Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_MO", value: "English (Macau SAR China)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_MP", value: "English (Northern Mariana Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_MS", value: "English (Montserrat)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_MT", value: "English (Malta)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_MU", value: "English (Mauritius)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_MW", value: "English (Malawi)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_MY", value: "English (Malaysia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_NA", value: "English (Namibia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_NF", value: "English (Norfolk Island)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_NG", value: "English (Nigeria)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_NL", value: "English (Netherlands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_NO", value: "English (Norway)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_NR", value: "English (Nauru)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_NU", value: "English (Niue)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_NZ", value: "English (New Zealand)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_PG", value: "English (Papua New Guinea)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_PH", value: "English (Philippines)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_PK", value: "English (Pakistan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_PL", value: "English (Poland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_PN", value: "English (Pitcairn Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_PR", value: "English (Puerto Rico)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_PT", value: "English (Portugal)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_PW", value: "English (Palau)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_RO", value: "English (Romania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_RU", value: "English (Russia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_RW", value: "English (Rwanda)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_SB", value: "English (Solomon Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_SC", value: "English (Seychelles)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_SD", value: "English (Sudan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_SE", value: "English (Sweden)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_SG", value: "English (Singapore)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_SH", value: "English (St. Helena)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_SI", value: "English (Slovenia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_SK", value: "English (Slovakia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_SL", value: "English (Sierra Leone)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_SS", value: "English (South Sudan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_SX", value: "English (Sint Maarten)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_SZ", value: "English (Swaziland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_TC", value: "English (Turks & Caicos Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_TK", value: "English (Tokelau)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_TO", value: "English (Tonga)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_TR", value: "English (Turkey)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_TT", value: "English (Trinidad & Tobago)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_TV", value: "English (Tuvalu)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_TZ", value: "English (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_UG", value: "English (Uganda)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_UM", value: "English (U.S. Outlying Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_US", value: "English (United States)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_US_POSIX", value: "English (United States, Computer)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_VC", value: "English (St. Vincent & Grenadines)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_VG", value: "English (British Virgin Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_VI", value: "English (U.S. Virgin Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_VU", value: "English (Vanuatu)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_WS", value: "English (Samoa)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_ZA", value: "English (South Africa)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_ZM", value: "English (Zambia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "en_ZW", value: "English (Zimbabwe)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "eo", value: "Esperanto", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es", value: "Spanish", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_419", value: "Spanish (Latin America)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_AR", value: "Spanish (Argentina)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_BO", value: "Spanish (Bolivia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_CL", value: "Spanish (Chile)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_CO", value: "Spanish (Colombia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_CR", value: "Spanish (Costa Rica)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_CU", value: "Spanish (Cuba)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_DO", value: "Spanish (Dominican Republic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_EA", value: "Spanish (Ceuta & Melilla)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_EC", value: "Spanish (Ecuador)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_ES", value: "Spanish (Spain)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_GQ", value: "Spanish (Equatorial Guinea)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_GT", value: "Spanish (Guatemala)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_HN", value: "Spanish (Honduras)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_IC", value: "Spanish (Canary Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_MX", value: "Spanish (Mexico)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_NI", value: "Spanish (Nicaragua)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_PA", value: "Spanish (Panama)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_PE", value: "Spanish (Peru)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_PH", value: "Spanish (Philippines)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_PR", value: "Spanish (Puerto Rico)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_PY", value: "Spanish (Paraguay)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_SV", value: "Spanish (El Salvador)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_US", value: "Spanish (United States)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_UY", value: "Spanish (Uruguay)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "es_VE", value: "Spanish (Venezuela)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "et", value: "Estonian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "et_EE", value: "Estonian (Estonia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "eu", value: "Basque", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "eu_ES", value: "Basque (Spain)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ewo", value: "Ewondo", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ewo_CM", value: "Ewondo (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fa", value: "Persian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fa_AF", value: "Persian (Afghanistan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fa_IR", value: "Persian (Iran)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ff", value: "Fulah", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ff_CM", value: "Fulah (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ff_GN", value: "Fulah (Guinea)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ff_MR", value: "Fulah (Mauritania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ff_SN", value: "Fulah (Senegal)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fi", value: "Finnish", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fi_FI", value: "Finnish (Finland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fil", value: "Filipino", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fil_PH", value: "Filipino (Philippines)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fo", value: "Faroese", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fo_FO", value: "Faroese (Faroe Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr", value: "French", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_BE", value: "French (Belgium)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_BF", value: "French (Burkina Faso)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_BI", value: "French (Burundi)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_BJ", value: "French (Benin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_BL", value: "French (St. Barthélemy)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_CA", value: "French (Canada)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_CD", value: "French (Congo - Kinshasa)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_CF", value: "French (Central African Republic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_CG", value: "French (Congo - Brazzaville)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_CH", value: "French (Switzerland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_CI", value: "French (Côte d’Ivoire)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_CM", value: "French (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_DJ", value: "French (Djibouti)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_DZ", value: "French (Algeria)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_FR", value: "French (France)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_GA", value: "French (Gabon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_GF", value: "French (French Guiana)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_GN", value: "French (Guinea)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_GP", value: "French (Guadeloupe)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_GQ", value: "French (Equatorial Guinea)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_HT", value: "French (Haiti)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_KM", value: "French (Comoros)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_LU", value: "French (Luxembourg)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_MA", value: "French (Morocco)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_MC", value: "French (Monaco)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_MF", value: "French (St. Martin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_MG", value: "French (Madagascar)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_ML", value: "French (Mali)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_MQ", value: "French (Martinique)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_MR", value: "French (Mauritania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_MU", value: "French (Mauritius)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_NC", value: "French (New Caledonia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_NE", value: "French (Niger)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_PF", value: "French (French Polynesia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_PM", value: "French (St. Pierre & Miquelon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_RE", value: "French (Réunion)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_RW", value: "French (Rwanda)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_SC", value: "French (Seychelles)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_SN", value: "French (Senegal)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_SY", value: "French (Syria)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_TD", value: "French (Chad)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_TG", value: "French (Togo)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_TN", value: "French (Tunisia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_VU", value: "French (Vanuatu)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_WF", value: "French (Wallis & Futuna)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fr_YT", value: "French (Mayotte)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fur", value: "Friulian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fur_IT", value: "Friulian (Italy)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fy", value: "Western Frisian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "fy_NL", value: "Western Frisian (Netherlands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ga", value: "Irish", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ga_IE", value: "Irish (Ireland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "gd", value: "Scottish Gaelic", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "gd_GB", value: "Scottish Gaelic (United Kingdom)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "gl", value: "Galician", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "gl_ES", value: "Galician (Spain)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "gsw", value: "Swiss German", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "gsw_CH", value: "Swiss German (Switzerland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "gsw_FR", value: "Swiss German (France)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "gsw_LI", value: "Swiss German (Liechtenstein)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "gu", value: "Gujarati", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "gu_IN", value: "Gujarati (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "guz", value: "Gusii", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "guz_KE", value: "Gusii (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "gv", value: "Manx", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "gv_IM", value: "Manx (Isle of Man)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ha", value: "Hausa", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ha_Latn", value: "Hausa (Latin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ha_Latn_GH", value: "Hausa (Latin, Ghana)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ha_Latn_NE", value: "Hausa (Latin, Niger)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ha_Latn_NG", value: "Hausa (Latin, Nigeria)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "haw", value: "Hawaiian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "haw_US", value: "Hawaiian (United States)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "he", value: "Hebrew", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "he_IL", value: "Hebrew (Israel)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "hi", value: "Hindi", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "hi_IN", value: "Hindi (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "hr", value: "Croatian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "hr_BA", value: "Croatian (Bosnia & Herzegovina)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "hr_HR", value: "Croatian (Croatia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "hsb", value: "Upper Sorbian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "hsb_DE", value: "Upper Sorbian (Germany)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "hu", value: "Hungarian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "hu_HU", value: "Hungarian (Hungary)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "hy", value: "Armenian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "hy_AM", value: "Armenian (Armenia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "id", value: "Indonesian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "id_ID", value: "Indonesian (Indonesia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ig", value: "Igbo", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ig_NG", value: "Igbo (Nigeria)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ii", value: "Sichuan Yi", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ii_CN", value: "Sichuan Yi (China)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "is", value: "Icelandic", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "is_IS", value: "Icelandic (Iceland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "it", value: "Italian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "it_CH", value: "Italian (Switzerland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "it_IT", value: "Italian (Italy)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "it_SM", value: "Ialian (San Marino)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "iu", value: "Inutitut", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "iu_Cans", value: "Inuktitut (Unified Canadian Aboriginal Syllabics)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "iu_Cans_CA", value: "Inuktitut (Unified Canadian Aboriginal Syllabics, Canada)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ja", value: "Japanese", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ja_JP", value: "Japanese (Japan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "jgo", value: "Ngomba", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "jgo_CM", value: "Ngomba (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "jmc", value: "Machame", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "jmc_TZ", value: "Machame (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ka", value: "Georgian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ka_GE", value: "Georgian (Georgia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kab", value: "Kabyle", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kab_DZ", value: "Kabyle (Algeria)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kam", value: "Kamba", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kam_KE", value: "Kamba (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kde", value: "Makonde", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kde_TZ", value: "Makonde (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kea", value: "Kabuverdianu", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kea_CV", value: "Kabuverdianu (Cape Verde)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "khq", value: "Koyra Chiini", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "khq_ML", value: "Koyra Chiini (Mali)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ki", value: "Kikuyu", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ki_KE", value: "Kikuyu (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kk", value: "Kazakh", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kk_Cyrl", value: "Kazakh (Cyrillic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kk_Cyrl_KZ", value: "Kazakh (Cyrillic, Kazakhstan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kkj", value: "Kako", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kkj_CM", value: "Kako (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kl", value: "Kalaallisut", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kl_GL", value: "Kalaallisut (Greenland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kln", value: "Kalenjin", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kln_KE", value: "Kalenjin (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "km", value: "Khmer", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "km_KH", value: "Khmer (Cambodia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kn", value: "Kannada", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kn_IN", value: "Kannada (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ko", value: "Korean", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ko_KP", value: "Korean (North Korea)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ko_KR", value: "Korean (South Korea)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kok", value: "Konkani", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kok_IN", value: "Konkani (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ks", value: "Kashmiri", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ks_Arab", value: "Kashmiri (Arabic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ks_Arab_IN", value: "Kashmiri (Arabic, India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ksb", value: "Shambala", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ksb_TZ", value: "Shambala (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ksf", value: "Bafia", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ksf_CM", value: "Bafia (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ksh", value: "Colognian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ksh_DE", value: "Colognian (Germany)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kw", value: "Cornish", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "kw_GB", value: "Cornish (United Kingdom)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ky", value: "Kyrgyz", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ky_Cyrl", value: "Kyrgyz (Cyrillic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ky_Cyrl_KG", value: "Kyrgyz (Cyrillic, Kyrgyzstan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lag", value: "Langi", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lag_TZ", value: "Langi (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lb", value: "Luxembourgish", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lb_LU", value: "Luxembourgish (Luxembourg)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lg", value: "Ganda", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lg_UG", value: "Ganda (Uganda)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lkt", value: "Lakota", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lkt_US", value: "Lakota (United States)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ln", value: "Lingala", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ln_AO", value: "Lingala (Angola)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ln_CD", value: "Lingala (Congo - Kinshasa)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ln_CF", value: "Lingala (Central African Republic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ln_CG", value: "Lingala (Congo - Brazzaville)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lo", value: "Lao", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lo_LA", value: "Lao (Laos)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lt", value: "Lithuanian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lt_LT", value: "Lithuanian (Lithuania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lu", value: "Luba-Katanga", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lu_CD", value: "Luba-Katanga (Congo - Kinshasa)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "luo", value: "Luo", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "luo_KE", value: "Luo (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "luy", value: "Luyia", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "luy_KE", value: "Luyia (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lv", value: "Latvian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "lv_LV", value: "Latvian (Latvia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mas", value: "Masai", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mas_KE", value: "Masai (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mas_TZ", value: "Masai (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mer", value: "Meru", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mer_KE", value: "Meru (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mfe", value: "Morisyen", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mfe_MU", value: "Morisyen (Mauritius)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mg", value: "Malagasy", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mg_MG", value: "Malagasy (Madagascar)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mgh", value: "Makhuwa-Meetto", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mgh_MZ", value: "Makhuwa-Meetto (Mozambique)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mgo", value: "Metaʼ", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mgo_CM", value: "Metaʼ (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mk", value: "Macedonian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mk_MK", value: "Macedonian (Macedonia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ml", value: "Malayalam", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ml_IN", value: "Malayalam (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mn", value: "Mongolian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mn_Cyrl", value: "Mongolian (Cyrillic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mn_Cyrl_MN", value: "Mongolian (Cyrillic, Mongolia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mr", value: "Marathi", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mr_IN", value: "Marathi (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ms", value: "Malay", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ms_Arab", value: "Malay (Arabic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ms_Arab_BN", value: "Malay (Arabic, Brunei)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ms_Arab_MY", value: "Malay (Arabic, Malaysia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ms_Latn", value: "Malay (Latin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ms_Latn_BN", value: "Malay (Latin, Brunei)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ms_Latn_MY", value: "Malay (Latin, Malaysia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ms_Latn_SG", value: "Malay (Latin, Singapore)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mt", value: "Maltese", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mt_MT", value: "Maltese (Malta)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mua", value: "Mundang", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "mua_CM", value: "Mundang (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "my", value: "Burmese", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "my_MM", value: "Burmese (Myanmar [Burma])", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "naq", value: "Nama", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "naq_NA", value: "Nama (Namibia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nb", value: "Norwegian Bokmål", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nb_NO", value: "Norwegian Bokmål (Norway)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nb_SJ", value: "Norwegian Bokmål (Svalbard & Jan Mayen)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nd", value: "North Ndebele", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nd_ZW", value: "North Ndebele (Zimbabwe)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ne", value: "Nepali", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ne_IN", value: "Nepali (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ne_NP", value: "Nepali (Nepal)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nl", value: "Dutch", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nl_AW", value: "Dutch (Aruba)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nl_BE", value: "Dutch (Belgium)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nl_BQ", value: "Dutch (Caribbean Netherlands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nl_CW", value: "Dutch (Curaçao)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nl_NL", value: "Dutch (Netherlands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nl_SR", value: "Dutch (Suriname)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nl_SX", value: "Dutch (Sint Maarten)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nmg", value: "Kwasio", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nmg_CM", value: "Kwasio (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nn", value: "Norwegian Nynorsk", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nn_NO", value: "Norwegian Nynorsk (Norway)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nnh", value: "Ngiemboon", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nnh_CM", value: "Ngiemboon (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nus", value: "Nuer", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nus_SD", value: "Nuer (Sudan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nyn", value: "Nyankole", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "nyn_UG ", value: "Nyankole (Uganda)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "om", value: "Oromo", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "om_ET", value: "Oromo (Ethiopia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "om_KE", value: "Oromo (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "or", value: "Oriya", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "or_IN", value: "Oriya (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "os", value: "Ossetic", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "os_GE", value: "Ossetic (Georgia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "os_RU", value: "Ossetic (Russia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pa", value: "Punjabi", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pa_Arab", value: "Punjabi (Arabic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pa_Arab_PK", value: "Punjabi (Arabic, Pakistan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pa_Guru", value: "Punjabi (Gurmukhi)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pa_Guru_IN", value: "Punjabi (Gurmukhi, India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pl", value: "Polish", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pl_PL", value: "Polish (Poland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ps", value: "Pashto", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ps_AF", value: "Pashto (Afghanistan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pt", value: "Portuguese", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pt_AO", value: "Portuguese (Angola)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pt_BR", value: "Portuguese (Brazil)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pt_CV", value: "Portuguese (Cape Verde)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pt_GW", value: "Portuguese (Guinea-Bissau)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pt_MO", value: "Portuguese (Macau SAR China)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pt_MZ", value: "Portuguese (Mozambique)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pt_PT", value: "Portuguese (Portugal)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pt_ST", value: "Portuguese (São Tomé & Príncipe)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "pt_TL", value: "Portuguese (Timor-Leste)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "qu", value: "Quechua", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "qu_BO", value: "Quechua (Bolivia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "qu_EC", value: "Quechua (Ecuador)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "qu_PE", value: "Quechua (Peru)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "rm", value: "Romansh", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "rm_CH", value: "Romansh (Switzerland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "rn", value: "Rundi", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "rn_BI", value: "Rundi (Burundi)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ro", value: "Romanian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ro_MD", value: "Romanian (Moldova)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ro_RO", value: "Romanian (Romania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "rof", value: "Rombo", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "rof_TZ", value: "Rombo (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ru", value: "Russian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ru_BY", value: "Russian (Belarus)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ru_KG", value: "Russian (Kyrgyzstan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ru_KZ", value: "Russian (Kazakhstan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ru_MD", value: "Russian (Moldova)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ru_RU", value: "Russian (Russia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ru_UA", value: "Russian (Ukraine)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "rw", value: "Kinyarwanda", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "rw_RW", value: "Kinyarwanda (Rwanda)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "rwk", value: "Rwa", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "rwk_TZ", value: "Rwa (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sah", value: "Sakha", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sah_RU", value: "Sakha (Russia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "saq", value: "Samburu", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "saq_KE", value: "Samburu (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sbp", value: "Sangu", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sbp_TZ", value: "Sangu (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "se", value: "Northern Sami", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "se_FI", value: "Northern Sami (Finland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "se_NO", value: "Northern Sami (Norway)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "se_SE", value: "Northern Sami (Sweden)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "seh", value: "Sena", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "seh_MZ", value: "Sena (Mozambique)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ses", value: "Koyraboro Senni", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ses_ML", value: "Koyraboro Senni (Mali)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sg", value: "Sango", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sg_CF", value: "Sango (Central African Republic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "shi", value: "Tachelhit", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "shi_Latn", value: "Tachelhit (Latin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "shi_Latn_MA", value: "Tachelhit (Latin, Morocco)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "shi_Tfng", value: "Tachelhit (Tifinagh)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "shi_Tfng_MA", value: "Tachelhit (Tifinagh, Morocco)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "si", value: "Sinhala", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "si_LK", value: "Sinhala (Sri Lanka)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sk", value: "Slovak", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sk_SK", value: "Slovak (Slovakia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sl", value: "Slovenian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sl_SI", value: "Slovenian (Slovenia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "smn", value: "Inari Sami", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "smn_FI ", value: "Inari Sami (Finland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sn", value: "Shona", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sn_ZW", value: "Shona (Zimbabwe)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "so", value: "Somali", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "so_DJ", value: "Somali (Djibouti)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "so_ET", value: "Somali (Ethiopia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "so_KE", value: "Somali (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "so_SO", value: "Somali (Somalia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sq", value: "Albanian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sq_AL", value: "Albanian (Albania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sq_MK", value: "Albanian (Macedonia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sq_XK", value: "Albanian (Kosovo)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sr", value: "Serbian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sr_Cyrl", value: "Serbian (Cyrillic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sr_Cyrl_BA", value: "Serbian (Cyrillic, Bosnia & Herzegovina)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sr_Cyrl_ME", value: "Serbian (Cyrillic, Montenegro)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sr_Cyrl_RS", value: "Serbian (Cyrillic, Serbia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sr_Cyrl_XK", value: "Serbian (Cyrillic, Kosovo)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sr_Latn", value: "Serbian (Latin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sr_Latn_BA", value: "Serbian (Latin, Bosnia & Herzegovina)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sr_Latn_ME", value: "Serbian (Latin, Montenegro)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sr_Latn_RS", value: "Serbian (Latin, Serbia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sr_Latn_XK", value: "Serbian (Latin, Kosovo)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sv", value: "Swedish", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sv_AX", value: "Swedish (Åland Islands)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sv_FI", value: "Swedish (Finland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sv_SE", value: "Swedish (Sweden)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sw", value: "Swahili", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sw_CD", value: "Swahili (Congo - Kinshasa)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sw_KE", value: "Swahili (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sw_TZ", value: "Swahili (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "sw_UG", value: "Swahili (Uganda)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ta", value: "Tamil", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ta_IN", value: "Tamil (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ta_LK", value: "Tamil (Sri Lanka)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ta_MY", value: "Tamil (Malaysia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ta_SG", value: "Tamil (Singapore)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "te", value: "Telugu", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "te_IN", value: "Telugu (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "teo", value: "Teso", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "teo_KE", value: "Teso (Kenya)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "teo_UG", value: "Teso (Uganda)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "tg", value: "Tajik", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "tg_Cyrl", value: "Tajik (Cyrillic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "tg_Cyrl_TJ", value: "Tajik (Cyrillic, Tajikistan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "th", value: "Thai", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "th_TH", value: "Thai (Thailand)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ti", value: "Tigrinya", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ti_ER", value: "Tigrinya (Eritrea)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ti_ET", value: "Tigrinya (Ethiopia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "tk", value: "Turkmen", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "tk_Latn", value: "Turkmen (Latin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "tk_Latn_TM", value: "Turkmen (Latin, Turkmenistan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "to", value: "Tongan", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "to_TO", value: "Tongan (Tonga)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "tr", value: "Turkish", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "tr_CY", value: "Turkish (Cyprus)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "tr_TR", value: "Turkish (Turkey)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "twq", value: "Tasawaq", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "twq_NE", value: "Tasawaq (Niger)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "tzm", value: "Central Atlas Tamazight", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "tzm_Latn", value: "Central Atlas Tamazight (Latin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "tzm_Latn_MA", value: "Central Atlas Tamazight (Latin, Morocco)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ug", value: "Uyghur", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ug_Arab", value: "Uyghur (Arabic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ug_Arab_CN", value: "Uyghur (Arabic, China)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "uk", value: "Ukrainian", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "uk_UA", value: "Ukrainian (Ukraine)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ur", value: "Urdu", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ur_IN", value: "Urdu (India)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "ur_PK", value: "Urdu (Pakistan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "uz", value: "Uzbek", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "uz_Arab", value: "Uzbek (Arabic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "uz_Arab_AF", value: "Uzbek (Arabic, Afghanistan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "uz_Cyrl", value: "Uzbek (Cyrillic)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "uz_Cyrl_UZ", value: "Uzbek (Cyrillic, Uzbekistan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "uz_Latn", value: "Uzbek (Latin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "uz_Latn_UZ", value: "Uzbek (Latin, Uzbekistan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "vai", value: "Vai", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "vai_Latn", value: "Vai (Latin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "vai_Latn_LR", value: "Vai (Latin, Liberia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "vai_Vaii", value: "Vai (Vai)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "vai_Vaii_LR", value: "Vai (Vai, Liberia)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "vi", value: "Vietnamese", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "vi_VN", value: "Vietnamese (Vietnam)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "vun", value: "Vunjo", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "vun_TZ", value: "Vunjo (Tanzania)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "wae", value: "Walser", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "wae_CH", value: "Walser (Switzerland)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "xog", value: "Soga", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "xog_UG", value: "Soga (Uganda)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "yav", value: "Yangben", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "yav_CM", value: "Yangben (Cameroon)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "yi", value: "Yiddish", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "yi_001", value: "Yiddish (World)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "yo", value: "Yoruba", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "yo_BJ", value: "Yoruba (Benin)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "yo_NG", value: "Yoruba (Nigeria)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zgh", value: "Standard Moroccan Tamazight", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zgh_MA ", value: "Standard Moroccan Tamazight (Morocco)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zh", value: "Chinese", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zh_Hans", value: "Chinese (Simplified)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zh_Hans_CN", value: "Chinese (Simplified, China)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zh_Hans_HK", value: "Chinese (Simplified, Hong Kong SAR China)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zh_Hans_MO", value: "Chinese (Simplified, Macau SAR China)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zh_Hans_SG", value: "Chinese (Simplified, Singapore)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zh_Hant", value: "Chinese (Traditional)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zh_Hant_HK", value: "Chinese (Traditional, Hong Kong SAR China)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zh_Hant_MO", value: "Chinese (Traditional, Macau SAR China)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zh_Hant_TW", value: "Chinese (Traditional, Taiwan)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zu", value: "Zulu", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

data = %{set: "locales", key: "zu_ZA", value: "Zulu (South Africa)", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)


## Property types - English --------------------------------------------------------------------------------------------------------------

data = %{set: "property-types", key: "apartment", value: "Apartment", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)


data = %{set: "property-types", key: "house", value: "House", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)


## Property types - Polish --------------------------------------------------------------------------------------------------------------

data = %{set: "property-types", key: "apartment", value: "Mieszkanie", key_group: "", key_subgroup: "", locale: "pl_PL", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)


data = %{set: "property-types", key: "house", value: "Dom", key_group: "", key_subgroup: "", locale: "pl_PL", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)


## Building types - English --------------------------------------------------------------------------------------------------------------

data = %{set: "building-types", key: "traditional", value: "Traditional", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)


data = %{set: "building-types", key: "modern", value: "Modern", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

## Building types - Polish --------------------------------------------------------------------------------------------------------------

data = %{set: "building-types", key: "traditional", value: "Tradycyjny", key_group: "", key_subgroup: "", locale: "pl_PL", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)


data = %{set: "building-types", key: "modern", value: "Nowoczesny", key_group: "", key_subgroup: "", locale: "pl_PL", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

## Kitchen types - English --------------------------------------------------------------------------------------------------------------

data = %{set: "kitchen-types", key: "one-wall", value: "One-wall", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)


data = %{set: "kitchen-types", key: "island", value: "Galley", key_group: "", key_subgroup: "", locale: "en_US", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)

## Kitchen types - Polish --------------------------------------------------------------------------------------------------------------

data = %{set: "kitchen-types", key: "one-wall", value: "Jedna ściana", key_group: "", key_subgroup: "", locale: "pl_PL", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)


data = %{set: "kitchen-types", key: "island", value: "Wyspa", key_group: "", key_subgroup: "", locale: "pl_PL", position: 0, is_active: true, is_logical_deleted: false}
changeset = KeyValue.changeset(%KeyValue{}, data)
Repo.insert!(changeset)
