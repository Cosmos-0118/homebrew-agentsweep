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
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.1.1/agentsweep-aarch64-apple-darwin"
      sha256 "d0b215551a7a9e56152968276c04e48557d0207c49773d896830b40b06085608"
    else
      url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.1.1/agentsweep-x86_64-apple-darwin"
      sha256 "da65d16548d2c4def74fbd9fef7d58757c33cdecfccdd56f45fc8cd2a8090d82"
    end
  end

  on_linux do
    url "https://github.com/Cosmos-0118/AgentSweep/releases/download/v1.1.1/agentsweep-x86_64-unknown-linux-gnu"
    sha256 "79e2f3ccbac90bfa820de80d30bac5ccb322c99aae2cf7a87fc81b14e85ce3f4"
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
