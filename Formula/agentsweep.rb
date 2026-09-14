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
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v0.1.0/agentsweep-aarch64-apple-darwin"
      sha256 "7376d455c77a5e94d37a5a3f1dbcb4970f0f36783888f5838d3685fec115111b"
    else
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v0.1.0/agentsweep-x86_64-apple-darwin"
      sha256 "a41bcd68db998b584a8da48ab8987035287877ece3497139a5be91830172e8f0"
    end
  end

  on_linux do
    url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v0.1.0/agentsweep-x86_64-unknown-linux-gnu"
    sha256 "47fba889735c4cffc519340b058618c0640a4feaa6830f89a28755d13d3fd133"
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
