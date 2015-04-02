module JobsHelper
  def job_title(job)
    title = raw("#{job.title} - #{job.company.name}")

    if job.premium
      title + content_tag(:strong, " (premium) ")
    else
      title
    end
  end
end
