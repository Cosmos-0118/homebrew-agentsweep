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
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.2/agentsweep-aarch64-apple-darwin"
      sha256 "7e5ec792d68e716725303a6c7eed74aed11a3095fe901ebceeb7b2ed4b3bec53"
    else
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.2/agentsweep-x86_64-apple-darwin"
      sha256 "f772fb3b0c7a5515c4ffe2a87293ce6ac143e1124a27951333ed3b54a9655725"
    end
  end

  on_linux do
    url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.2/agentsweep-x86_64-unknown-linux-gnu"
    sha256 "6edd4f81279c38ec408c3abe3f954217a1ae8849c6081ef8b1a6bbf72b97fddc"
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
