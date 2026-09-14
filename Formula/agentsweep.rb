# Homebrew formula for AgentSweep.
# This is the source of truth: .github/workflows/release.yml regenerates
# version/url/sha256 on every v* tag (via scripts/update_homebrew_sha.py),
# commits the result here, and syncs a copy to Formula/agentsweep.rb in the
# Cosmos-0118/homebrew-agentsweep tap repo.
# Install with:
#   brew tap Cosmos-0118/agentsweep
#   brew install agentsweep
class Agentsweep < Formula
  desc "Understand and control what your coding agents store locally"
  homepage "https://github.com/Cosmos-0118/AgentSweep"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.1/agentsweep-aarch64-apple-darwin"
      sha256 "eb0f87286ba0a2f6fd22f4d5e81e138e1adfbee075bd688dfe0a9494941d8b87"
    else
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.1/agentsweep-x86_64-apple-darwin"
      sha256 "dfe8fe247cc0b2dd973cd2060e5b997903b0eeadbb003a9242ac96264b88ea6b"
    end
  end

  on_linux do
    url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.1/agentsweep-x86_64-unknown-linux-gnu"
    sha256 "dd6233ee09fe878071875765c63307d6f13ef3c822403544aff67b0cc6c8b30f"
  end

  def install
    bin.install "agentsweep-aarch64-apple-darwin" => "agentsweep" if OS.mac? && Hardware::CPU.arm?
    bin.install "agentsweep-x86_64-apple-darwin" => "agentsweep" if OS.mac? && Hardware::CPU.intel?
    bin.install "agentsweep-x86_64-unknown-linux-gnu" => "agentsweep" if OS.linux?
  end

  test do
    assert_match "agentsweep", shell_output("#{bin}/agentsweep --version")
  end
end
