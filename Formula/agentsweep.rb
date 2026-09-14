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
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.3/agentsweep-aarch64-apple-darwin"
      sha256 "1b54ca0a3d64fba81c0896134bb8907c9c3f8349c56a9a45f58af22bb8d76abd"
    else
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.3/agentsweep-x86_64-apple-darwin"
      sha256 "6df90c44e79bf09b0b4d136d0fbd765f19c3c3dbd5b904a40a960bdaeb896c52"
    end
  end

  on_linux do
    url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.3/agentsweep-x86_64-unknown-linux-gnu"
    sha256 "7dd3839a2ed23721eec2bb1e51a6e9b33f3838c64ac34d847d467432fa5ed63e"
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
