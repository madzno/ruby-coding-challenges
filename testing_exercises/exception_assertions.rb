def test_noexperience_error
  assert_raises(NoExperienceError) do
    employee.hire
  end
end
