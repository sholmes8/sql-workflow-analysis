-- Total filings
SELECT COUNT(*) AS total_filings
FROM business_filings;

-- Filings by type
SELECT filing_type, COUNT(*) AS total_filings
FROM business_filings
GROUP BY filing_type
ORDER BY total_filings DESC;

-- Filings by entity type
SELECT entity_type, COUNT(*) AS total_filings
FROM business_filings
GROUP BY entity_type
ORDER BY total_filings DESC;

-- Filings by jurisdiction
SELECT jurisdiction, COUNT(*) AS total_filings
FROM business_filings
GROUP BY jurisdiction
ORDER BY total_filings DESC;

-- Status distribution
SELECT status, COUNT(*) AS total_status
FROM business_filings
GROUP BY status
ORDER BY total_status DESC;

-- Priority breakdown
SELECT priority, COUNT(*) AS total_priority
FROM business_filings
GROUP BY priority
ORDER BY total_priority DESC;

-- Average processing time by filing type
SELECT filing_type, AVG(processing_days) AS avg_processing_days
FROM business_filings
GROUP BY filing_type
ORDER BY avg_processing_days DESC;

-- Average processing time by jurisdiction
SELECT jurisdiction, AVG(processing_days) AS avg_processing_days
FROM business_filings
GROUP BY jurisdiction
ORDER BY avg_processing_days DESC;

-- Average processing time by assigned team
SELECT assigned_team, AVG(processing_days) AS avg_processing_days
FROM business_filings
GROUP BY assigned_team
ORDER BY avg_processing_days DESC;

-- Delayed filings by type
SELECT filing_type, COUNT(*) AS delayed_filings
FROM business_filings
WHERE status = 'Delayed'
GROUP BY filing_type
ORDER BY delayed_filings DESC;

-- Delayed filings by jurisdiction
SELECT jurisdiction, COUNT(*) AS delayed_filings
FROM business_filings
WHERE status = 'Delayed'
GROUP BY jurisdiction
ORDER BY delayed_filings DESC;

-- Delayed filings by team
SELECT assigned_team, COUNT(*) AS delayed_filings
FROM business_filings
WHERE status = 'Delayed'
GROUP BY assigned_team
ORDER BY delayed_filings DESC;

-- Rejection reasons
SELECT rejection_reason, COUNT(*) AS total_rejections
FROM business_filings
WHERE rejection_reason <> 'None'
GROUP BY rejection_reason
ORDER BY total_rejections DESC;

-- Filing volume over time
SELECT submission_date, COUNT(*) AS total_filings
FROM business_filings
GROUP BY submission_date
ORDER BY submission_date;

-- Completion volume over time
SELECT completion_date, COUNT(*) AS completed_filings
FROM business_filings
WHERE status = 'Completed'
GROUP BY completion_date
ORDER BY completion_date;

-- Filings by source channel
SELECT source_channel, COUNT(*) AS total_filings
FROM business_filings
GROUP BY source_channel
ORDER BY total_filings DESC;

-- High-priority delayed filings
SELECT filing_id, filing_type, jurisdiction, processing_days, assigned_team
FROM business_filings
WHERE priority = 'High'
  AND status = 'Delayed'
ORDER BY processing_days DESC;

-- Fastest filing types
SELECT filing_type, AVG(processing_days) AS avg_processing_days
FROM business_filings
GROUP BY filing_type
ORDER BY avg_processing_days ASC;

-- Team workload
SELECT assigned_team, COUNT(*) AS total_filings
FROM business_filings
GROUP BY assigned_team
ORDER BY total_filings DESC;

-- Jurisdiction and filing type mix
SELECT jurisdiction, filing_type, COUNT(*) AS total_filings
FROM business_filings
GROUP BY jurisdiction, filing_type
ORDER BY jurisdiction, total_filings DESC;
