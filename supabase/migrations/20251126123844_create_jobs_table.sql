/*
  # Create jobs table for AgroJobs platform

  1. New Tables
    - `jobs`
      - `id` (uuid, primary key) - Unique identifier for each job posting
      - `name` (text) - Name of person or company posting the job
      - `region` (text) - Geographic region/area where work is needed
      - `type` (text) - Type of agricultural work (e.g., tractor operator, harvester)
      - `pay` (text) - Compensation details (e.g., daily rate)
      - `contact` (text) - Contact information (phone, Telegram)
      - `created_at` (timestamptz) - Timestamp when job was posted
      - `updated_at` (timestamptz) - Timestamp when job was last updated

  2. Security
    - Enable RLS on `jobs` table
    - Add policy for anyone to read all jobs (public access for viewing)
    - Add policy for anyone to create jobs (open posting)
    - Add policy for anyone to delete jobs (simplified for demo)

  3. Indexes
    - Index on `created_at` for efficient sorting of recent jobs
    - Index on `region` for filtering by location
*/

CREATE TABLE IF NOT EXISTS jobs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  region text NOT NULL,
  type text NOT NULL,
  pay text DEFAULT '',
  contact text DEFAULT '',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE jobs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view jobs"
  ON jobs
  FOR SELECT
  USING (true);

CREATE POLICY "Anyone can create jobs"
  ON jobs
  FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Anyone can delete jobs"
  ON jobs
  FOR DELETE
  USING (true);

CREATE INDEX IF NOT EXISTS idx_jobs_created_at ON jobs(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_jobs_region ON jobs(region);