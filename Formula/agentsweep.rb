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
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.0/agentsweep-aarch64-apple-darwin"
      sha256 "2846aa39fc3764e73b2dd375d0a92d02d6bd58bc09f4097b8fea1bcf96bb4898"
    else
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.0/agentsweep-x86_64-apple-darwin"
      sha256 "9b6370f9e5b82d30f589bfbaea3607162229d8dd172d8999ba332c78566ace75"
    end
  end

  on_linux do
    url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.0.0/agentsweep-x86_64-unknown-linux-gnu"
    sha256 "56057ec6c8da10ec9c8930963b29b2ee267fc3b2c686bdc6ff0bcfa8b894bb10"
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
